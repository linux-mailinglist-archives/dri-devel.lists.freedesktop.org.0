Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CBCA9A921
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A710E287;
	Thu, 24 Apr 2025 09:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KYA2Pua8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5610E287;
 Thu, 24 Apr 2025 09:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A752A4BD90;
 Thu, 24 Apr 2025 09:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03DBC4CEE3;
 Thu, 24 Apr 2025 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745488559;
 bh=bay2xchNRFyfp7oetgVtXOwvsAMngeXT4vNYGMmRJgI=;
 h=From:To:Cc:Subject:Date:From;
 b=KYA2Pua8qsvBqIRg1cPi8DdReKdqfQBza0aJ9uxVKRw2C+/HE813JEH1ZFwckH2KW
 iJObHPqaV76oVDNFtTVeyiiRQkUMQ8XIm/FMeppPXQav0Wup4ZvIyIHUAZUl9tCZ9M
 5NqF7D+l5A4BO6gBH0MAWog4LEv65i0ow9gMJ8Hf7PK8D1WMsY+4Gx+PTf51uefM+Z
 g5uwBhj1C6m7QT7Q/0gZsQUZHOl+m7+ypjqTiRUlMfDl3JAz04bLGnnUtjTvdgZQ9c
 K6uEb+r5jmJocYjk70PROO0DqYWKh82yPlZsLiaYvWAOZPs2XN/yhDXh1fqFXyDq7s
 XBfkg08upokXg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] drm/sched: Fix memory leaks in drm_sched_fini()
Date: Thu, 24 Apr 2025 11:55:30 +0200
Message-ID: <20250424095535.26119-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
  - Port kunit tests to new cleanup approach (Tvrtko), however so far
    still with the fence context-kill approach (Me. to be discussed.)
  - Improve len(pending_list) > 0 warning print. (Me)
  - Remove forgotten RFC comments. (Me)
  - Remove timeout boolean, since it's surplus. (Me)
  - Fix misunderstandings in the cover letter. (Tvrtko)

Changes since the RFC:
  - (None)

Howdy,

as many of you know, we have potential memory leaks in drm_sched_fini()
which have been tried to be solved by various parties with various
methods in the past.

In our past discussions, we came to the conclusion, that the simplest
solution, blocking in drm_sched_fini(), is not possible because it could
cause processes ignoring SIGKILL and blocking for too long (which could
turn out to be an effective way to generate a funny email from Linus,
though :) )

Another idea was to have submitted jobs refcount the scheduler. I
investigated this and we found that this then *additionally* would
require us to have *the scheduler* refcount everything *in the driver*
that is accessed through the still running callbacks; since the driver
would want to unload possibly after a non-blocking drm_sched_fini()
call. So that's also no solution.

This RFC here is a new approach, somewhat based on the original
waitque-idea. It looks as follows:

1. Have drm_sched_fini() block until the pending_list becomes empty with
   a waitque, as a first step.
2. Provide the scheduler with a callback with which it can instruct the
   driver to kill the associated fence context. This will cause all
   pending hardware fences to get signalled. (Credit to Danilo, whose
   idea this was)
3. In drm_sched_fini(), first switch off submission of new jobs and
   timeouts (the latter might not be strictly necessary, but is probably
   cleaner).
4. Then, call the aformentioned callback, ensuring that free_job() will
   be called for all remaining jobs relatively quickly. This has the
   great advantage that the jobs get cleaned up through the standard
   mechanism.
5. Once all jobs are gone, also switch off the free_job() work item and
   then proceed as usual.

Furthermore, since there is now such a callback, we can provide an
if-branch checking for its existence. If the driver doesn't provide it,
drm_sched_fini() operates in "legacy mode". So none of the existing
drivers should notice a difference and we remain fully backwards
compatible.

Our glorious beta-tester is Nouveau, which so far had its own waitque
solution, which is now obsolete.

The scheduler's unit tests are also ported to the new method.

I've tested this on a desktop environment with Nouveau. Works fine and
solves the problem (though we did discover an unrelated problem inside
Nouveau in the process).

It also works with the unit tests.

I'm looking forward to your input and feedback. I really hope we can
work this RFC into something that can provide users with a more
reliable, clean scheduler API.

Philipp

Philipp Stanner (6):
  drm/sched: Fix teardown leaks with waitqueue
  drm/sched: Prevent teardown waitque from blocking too long
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown
  drm/sched: Port unit tests to new cleanup design

 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 39 +++++---
 drivers/gpu/drm/nouveau/nouveau_sched.h       | 12 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 98 +++++++++++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34 ++++---
 include/drm/gpu_scheduler.h                   | 17 ++++
 8 files changed, 154 insertions(+), 60 deletions(-)

-- 
2.48.1


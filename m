Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70201ACC30F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F110E6EB;
	Tue,  3 Jun 2025 09:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h3OdthMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BCE10E6E7;
 Tue,  3 Jun 2025 09:31:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E48E44D62;
 Tue,  3 Jun 2025 09:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA01C4CEED;
 Tue,  3 Jun 2025 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748943115;
 bh=NeI11bo1EpvzZ96f+dx/8BGkkc1I9vz5CC22goQdva4=;
 h=From:To:Cc:Subject:Date:From;
 b=h3OdthMYGcN65/9QIDtIr68la5NKp/xISlIPDjcRADB4wcBcYrMurYTauqIL6pYns
 KfvfgGNsxWv9Ju/0R7JPEWM05zIin43eIol6obEUp5R8B2CPuPPoBLzADHSAxLVL5P
 Q7SHVC5BOe8MRnsPLSPdcmSA0950HI4Plkj5j9891hI3wn5bfPzLeU9Ktle3dTz9Xm
 ZHAMrNS6jvA/hVti4bU2AUZ5+K9pKZp0CZfgnCeww9pU7kUWVSoTVqC5cLp+rQe3QU
 C6iSfeVdHPG00ReajIphii6S9cPj/npVzE4GE0FEuh/dkUBuc5bpm5hoJSCgMfgViI
 bPbolon0JprqA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling job-by-job
Date: Tue,  3 Jun 2025 11:31:25 +0200
Message-ID: <20250603093130.100159-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

An alternative version to [1], based on Tvrtko's suggestion from [2].

I tested this for Nouveau. Works.

I'm having, however, bigger problems properly porting the unit tests and
have seen various explosions. In the process I noticed that some things
in the unit tests aren't right and a bit of a larger rework will be
necessary (for example, the timedout job callback must signal the
timedout fence, remove it from the list and so on).

Anyways. Please comment on the general idea.

@Tvrtko: As briefly brainstormed about on IRC, if you'd be willing to
take care of the unit tests patch, I could remove that one (and,
maaaaybe, the warning print patch) from the series and we could merge
this RFC's successor version %N once it's ready. What do you think?

P.

[1] https://lore.kernel.org/dri-devel/20250522082742.148191-2-phasta@kernel.org/
[2] https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/

Philipp Stanner (6):
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Implement cancel_job()
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 +++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 +++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 71 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  4 +-
 include/drm/gpu_scheduler.h                   |  9 +++
 9 files changed, 115 insertions(+), 100 deletions(-)

-- 
2.49.0


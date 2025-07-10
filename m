Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B071B00282
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFF810E8BB;
	Thu, 10 Jul 2025 12:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bGF6/V4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25510E37B;
 Thu, 10 Jul 2025 12:54:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DC0F5C6D7A;
 Thu, 10 Jul 2025 12:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28B5C4CEE3;
 Thu, 10 Jul 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152063;
 bh=u74M1EW5VU19MnDPuvCa6vHxBhmEOdY3hdgjpiY39AM=;
 h=From:To:Cc:Subject:Date:From;
 b=bGF6/V4O+tpNGko7XNwOq2zFo/JXkKkGGlryqxq1f0VgJ5zXzfsnQMhuWJTiMqa8D
 8YfoE7NDTrdw6GRHlkYNZRYmUf5YVTnSw7II5pdJ3+INflsNlpHC+d72Sdkqb5P+up
 9AhKDzmkAruXHLTwcjimh02fp1AKgM8ZzUsOr2xIDSqzzem3H4z/OSl06lntEoWf8+
 kHgH8jKAwfzENzyAu6ICdLvYApGcFFZA/J1ATqSXp/cIF5K5+4fDFcvBY50mGgAyK9
 N9mzyGlxNbJchAWXU5LHdDqZF5E27MD1KY/hwllnkt00pVBsdCX+iQmEkeG7cjedb+
 puK2JwdKBRvpg==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 0/8] drm/sched: Fix memory leaks with cancel_job() callback
Date: Thu, 10 Jul 2025 14:54:04 +0200
Message-ID: <20250710125412.128476-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v4:
  - Change dev_err() to dev_warn() in pending_list emptyness check.

Changes in v3:
  - Remove forgotten copy-past artifacts. (Tvrtko)
  - Remove forgotten done_list struct member. (Tvrtko)
  - Slightly adjust commit message of patch 7.
  - Add RBs. (Maira, Danilo, Tvrtko)

Changes in v2:
  - Add new unit test to test cancel_job()'s behavior. (Tvrtko)
  - Add RB from Maíra

Changes since the RFC:
  - Rename helper function for drm_sched_fini(). (Tvrtko)
  - Add Link to Tvrtko's RFC patch to patch 1.


Since a long time, drm_sched_fini() can leak jobs that are still in
drm_sched.pending_list.

This series solves the leaks in a backwards-compatible manner by adding
a new, optional callback. If that callback is implemented, the scheduler
uses it to cancel all jobs from pending_list and then frees them.

Philipp Stanner (8):
  drm/panfrost: Fix scheduler workqueue bug
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Implement cancel_job() callback
  drm/sched/tests: Add unit test for cancel_job()
  drm/sched: Warn if pending_list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 68 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  1 -
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 ++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++++
 11 files changed, 167 insertions(+), 95 deletions(-)

-- 
2.49.0


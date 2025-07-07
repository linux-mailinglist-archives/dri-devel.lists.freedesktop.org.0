Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0649AFB4D1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD1210E479;
	Mon,  7 Jul 2025 13:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lcHylehk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BD110E467;
 Mon,  7 Jul 2025 13:42:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C65A3A53FBA;
 Mon,  7 Jul 2025 13:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B102C4CEE3;
 Mon,  7 Jul 2025 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751895750;
 bh=VIeOoT9ZnXv6E2NaHqTSzrn3b9DbwMxUShiN0VuJpJE=;
 h=From:To:Cc:Subject:Date:From;
 b=lcHylehkHJjr5c1vgbo3YTN4xBnKvAGa4BBMPUVQ4fKap0/8mD8B33OsKaOnkjBCN
 ESGJsNcY5MR3zS/xbQCaGchtsFkGNJ5wip62OS29+yWkaAehGt+dGOqJUreqVIFahv
 8T0FeFSvJxUYR66mdPC45kqUA2+EA8GwMCICd/uWVL8/qbdU9p4YoIQ/Ill/gjL8rF
 gqxUrcwtMIFanLeRibaGKPW5OflTTQWDE7hx8YUhm2x7BUG4PcV7GdN9+w0/aVk0Pl
 m/l9/uD16HM9TrDfff+RXNz68TZuPX5FWiqIA44DnncYOJ12GuW0nKy10Epd02YQQ5
 DJM5FNEnhnBOQ==
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
Subject: [PATCH v2 0/7] drm/sched: Fix memory leaks with cancel_job() callback
Date: Mon,  7 Jul 2025 15:42:13 +0200
Message-ID: <20250707134221.34291-2-phasta@kernel.org>
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

Philipp Stanner (7):
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Implement cancel_job() callback
  drm/sched/tests: Add unit test for cancel_job()
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/scheduler/sched_main.c        | 37 +++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 43 ++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++++
 9 files changed, 165 insertions(+), 93 deletions(-)

-- 
2.49.0


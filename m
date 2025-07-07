Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EBBAFB656
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910A110E4BA;
	Mon,  7 Jul 2025 14:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C4qhFnDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC0B10E4B6;
 Mon,  7 Jul 2025 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vm4cjo6VSCZC/fBpikfwauwj9657psOaKIQ/dia6urQ=; b=C4qhFnDpScRF5fc6DjUqu9Lr2N
 DMrMGwNd5HPPup4KTujmBngAuVsE3EdMhwxSlPVv+tp7hUGt8AX+qBOyLjZn+IZk7mr6p8LJTg7ap
 WWksRMTb+Nid7WF/sNQTHWw1GLD/YWiQpvrirBebos1AzWHJltzQbsRPasYZCaQgnMzDaWqzoq/r6
 ckrO/PDx6w1XOsOYUldfd0S109478fK3AHODxoGwdmL1orTnTd0NtsgVstXGlQHlGgD1y+zqhXNhL
 ijZU/p18uhTBrBOQ2YxxSEa8TsHYqv28ub+GOWVJFnmd32Mh+IOuDpQNMk1QZAGI62BhtI58iqksy
 JoXDRVIQ==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYn7S-00DaQv-Kr; Mon, 07 Jul 2025 16:46:58 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 0/8] drm/sched: Allow drivers to skip the reset with
 DRM_GPU_SCHED_STAT_NO_HANG
Date: Mon, 07 Jul 2025 11:46:29 -0300
Message-Id: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMXda2gC/23NywrCMBCF4VeRrI0kk95w5XuIi2lm2g5eKokUp
 fTdTQuiosv/wHwzqshBOKrtalSBB4nSX1Jk65XyHV5a1kKpFRjITW5AR98x6XiUqw4c+abrpvS
 2cOAcoUpn18CN3Bdyf0jdSbz14bF8GOy8vjD3iw1WG81kqCiNRdfwTlo8CW58f1azNsCH4MwfA
 ZLgM4MVAVWE+CO4t1DY6o/gklDVnHuPUEJOX8I0TU+7Tm0vNQEAAA==
X-Change-ID: 20250502-sched-skip-reset-bf7c163233da
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Min Ma <min.ma@amd.com>, 
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Qiang Yu <yuq825@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6322; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=meH9HiE8bVTd42978097RgXkvxsoDK6ZW/dfzYFAew4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoa93X7cwys6aabncGBAIUhKGryhUZJ+SJFGSRd
 ZaQbDYu866JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaGvd1wAKCRA/8w6Kdoj6
 ql7vCACljpPcOZ1CkPJi/TM359XqOB+46Ut1gMpWOaY2+xlV/Vhw0nG3sQByUcD1mHfU8hGyANW
 Rb+C5flvb8yHYYkcU6qlglBDBVqGnm7vLxjD8iAXgLRAs1sNTW7ZoQeayhFG77vFKIsE1OwoUz1
 pRe3XcEm383NXzLh6UOh/HmguLkCNVfP0u7HH/bSSINW1yeTUiT5ZxXjHRfBn7uNmwqmC3ra7sD
 0Kt3gacYzbjL/2xamH71N8FyWTYnCwdfMX/3tGpxfS754m0xjMnGqpZIwETKHveuyJu+XqArHhI
 JLFUgciOI74BCLdfu9am9Ywi1yACSQR5GDxWZTV0kMuB9y+T
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

TL;DR: The only two patches that are lacking R-b's are:

[PATCH 2/8] drm/sched: Allow drivers to skip the reset and keep on running
[PATCH 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset

For those two patches, it would be great to gather feedback and/or R-b's,
particularly from the Intel folks.

Thanks for all the reviews so far!

---
When the DRM scheduler times out, it's possible that the GPU isn't hung;
instead, a job may still be running, and there may be no valid reason to
reset the hardware. This can occur in two situations:

  1. The GPU exposes some mechanism that ensures the GPU is still making
     progress. By checking this mechanism, the driver can safely skip the
     reset, re-arm the timeout, and allow the job to continue running until
     completion. This is the case for v3d, Etnaviv, and Xe.

  2. Timeout has fired before the free-job worker. Consequently, the
     scheduler calls `timedout_job()` for a job that isn't timed out.

These two scenarios are problematic because the job was removed from the
`sched->pending_list` before calling `sched->ops->timedout_job()`, which
means that when the job finishes, it won't be freed by the scheduler
though `sched->ops->free_job()`. As a result, the job and its resources
won't be freed, leading to a memory leak.

For v3d specifically, we have observed that these memory leaks can be
significant in certain scenarios, as reported by users in [1][2]. To
address this situation, I submitted a patch similar to commit 704d3d60fec4
("drm/etnaviv: don't block scheduler when GPU is still active") for v3d [3].
This patch has already landed in drm-misc-fixes and successfully resolved
the users' issues.

However, as I mentioned in [3], exposing the scheduler's internals within
the drivers isn't ideal and I believe this specific situation can be
addressed within the DRM scheduler framework.

This series aims to resolve this issue by adding a new DRM sched status
that allows a driver to skip the reset. This new status will indicate that
the job should be reinserted into the pending list, and the driver will
still signal its completion.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/12227
[2] https://github.com/raspberrypi/linux/issues/6817
[3] https://lore.kernel.org/dri-devel/20250430210643.57924-1-mcanal@igalia.com/T/

Best Regards,
- Maíra

---
v1 -> v2:

- Fix several grammar nits across the documentation and commit messages.
- Drop "drm/sched: Always free the job after the timeout" (Tvrtko Ursulin)
- [1/8] NEW PATCH: Rename DRM_GPU_SCHED_STAT_NOMINAL to a more semantic
	name (Tvrtko Ursulin, Philipp Stanner)
- [2/8] Rename DRM_GPU_SCHED_STAT_RUNNING to DRM_GPU_SCHED_STAT_NO_HANG (Tvrtko Ursulin, Philipp Stanner)
- [2/8] Requeue free-job work after reinserting the job to the pending list (Matthew Brost)
- [2/8] Create a helper function to reinsert the job (Philipp Stanner)
- [2/8] Rewrite the commit message (Philipp Stanner)
- [2/8] Add a comment to `drm_sched_start()` documentation, similar to what
	was commented in `drm_sched_stop()` (Philipp Stanner)
- [3/8] Keep HZ as timeout for `drm_mock_sched_job_wait_scheduled()` (Tvrtko Ursulin)
- [4/8] Use a job flag to indicate that `timedout_job()` should skip the
	reset (Tvrtko Ursulin)
- [7/8] Use DRM_GPU_SCHED_STAT_NO_HANG to re-arm the timer in other cases
	as well (Matthew Brost)
- Link to v1: https://lore.kernel.org/r/20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com

v2 -> v3:

- [2/8] Address comments about the commit message (Philipp Stanner)
- [2/8] Improve comments and documentation style (Philipp Stanner)
- [3/8] Rename the commit title to "drm/sched: Make timeout KUnit tests faster" (Philipp Stanner)
- [3/8] Add Tvrtko's R-b (Tvrtko Ursulin)
- [4/8] Instead of setting up a job duration, advance it manually (Tvrtko Ursulin)
- [4/8] Wait for 2 * MOCK_TIMEOUT instead of MOCK_TIMEOUT (Tvrtko Ursulin)
- [5/8, 6/8, 7/8, 8/8] Use Philipp's suggestion to improve the commit messages (Philipp Stanner)
- Link to v2: https://lore.kernel.org/r/20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com

v3 -> v4:

- [1/8] s/betters/better and Philipp's R-b (Philipp Stanner)
- [2/8] Apply some documentation nits (Philipp Stanner)
- [3/8] Add Philipp's A-b  (Philipp Stanner)
- [4/8, 5/8] Add Tvrtko's R-b (Tvrtko Ursulin)
- [6/8] Add Lucas' R-b (Lucas Stach)
- Link to v3: https://lore.kernel.org/r/20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com

---
Maíra Canal (8):
      drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
      drm/sched: Allow drivers to skip the reset and keep on running
      drm/sched: Make timeout KUnit tests faster
      drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
      drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset

 drivers/accel/amdxdna/aie2_ctx.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c          | 13 +++---
 drivers/gpu/drm/imagination/pvr_queue.c          |  4 +-
 drivers/gpu/drm/lima/lima_sched.c                |  6 +--
 drivers/gpu/drm/nouveau/nouveau_exec.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c          |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c          | 10 ++---
 drivers/gpu/drm/panthor/panthor_mmu.c            |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c          |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c           | 45 +++++++++++++++++--
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  7 ++-
 drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
 drivers/gpu/drm/scheduler/tests/tests_basic.c    | 55 ++++++++++++++++++++++--
 drivers/gpu/drm/v3d/v3d_sched.c                  | 18 ++------
 drivers/gpu/drm/xe/xe_guc_submit.c               | 14 ++----
 include/drm/gpu_scheduler.h                      |  7 ++-
 17 files changed, 134 insertions(+), 58 deletions(-)
---
base-commit: cedb945101df021e9c7546b7bf490bec4dbc9cc8
change-id: 20250502-sched-skip-reset-bf7c163233da


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D984BFF11E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030310E868;
	Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i648NmAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B918110E862;
 Thu, 23 Oct 2025 04:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192485; x=1792728485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BRleY8vdYxe0XY+XKzUI90e//WSpjN7iyXSBgpO+ito=;
 b=i648NmAGYJC2gkxKFdcp6UAPtGo70UsmdeOnQGLHE5IiS1JccbZX6H6v
 DLsx5Io66JB0LmilhhPWgvnQpinxKpoIksbVDB60XH2FdQTM2Iw4UR+eM
 RSX3g4iMig/aZrgHI0TjXE8J6yFBDtEnOzX6pk5ZcVod74rdPLFv7h2Ae
 h0VMBcVeTDjKqOgzbIzDCIKSlTPXK3Y0WN/ck9D8jREjvNPGkZ64/xJbG
 yj6XxZULO3pqMSy2eZwILtAN43iQt27YKXz5+04DKiVdPsQ3WwWR5V6Jd
 Jo/EjR+DlSvyfZNsuYNsZ0Xjsk0lzKpXbZcvykwxLmouU1Yf4Hu3FyRRJ g==;
X-CSE-ConnectionGUID: jJS4b1j6RJGc4teGkysxvg==
X-CSE-MsgGUID: nb04Km9kT96hHHMdc4UFmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391277"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: lQCANRBtRgWT4Vlmci8iow==
X-CSE-MsgGUID: CHq46pXXQUOu3qv/EJx5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175748"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 00/14] Disconnect fences from Xe module 
Date: Wed, 22 Oct 2025 21:07:46 -0700
Message-Id: <20251023040800.970283-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Mainly for CI and as a proof concept, built on top of Christian's work
[1].

Matt

[1] https://patchwork.freedesktop.org/series/155836/

Christian König (9):
  dma-buf: cleanup dma_fence_describe
  dma-buf: rework stub fence initialisation
  dma-buf: protected fence ops by RCU
  dma-buf: detach fence ops on signal
  dma-buf: inline spinlock for fence protection
  dma-buf: use inline lock for the stub fence
  dma-buf: use inline lock for the dma-fence-array
  dma-buf: use inline lock for the dma-fence-chain
  drm/sched: use inline locks for the drm-sched-fence

Matthew Brost (5):
  dma-fence: Fix selftest
  drm/xe: Disconnect the low hanging fences from Xe module
  drm/xe: Drop HW fence slab
  drm/xe: Promote xe_hw_fence_irq to an ref counted object
  drm/xe: Finish disconnect HW fences from module

 drivers/dma-buf/dma-fence-array.c           |   5 +-
 drivers/dma-buf/dma-fence-chain.c           |   3 +-
 drivers/dma-buf/dma-fence.c                 | 178 +++++++++++---------
 drivers/dma-buf/st-dma-fence.c              |   4 +-
 drivers/dma-buf/sw_sync.c                   |  14 +-
 drivers/dma-buf/sync_debug.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  12 +-
 drivers/gpu/drm/drm_crtc.c                  |   2 +-
 drivers/gpu/drm/drm_writeback.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c       |   5 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c     |   3 +-
 drivers/gpu/drm/qxl/qxl_release.c           |   3 +-
 drivers/gpu/drm/scheduler/sched_fence.c     |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   7 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |   2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c            |  62 ++++---
 drivers/gpu/drm/xe/xe_hw_fence.h            |   5 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h      |   4 +
 drivers/gpu/drm/xe/xe_module.c              |   5 -
 drivers/gpu/drm/xe/xe_oa.c                  |   5 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c       |   3 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h |   2 -
 drivers/gpu/drm/xe/xe_sched_job.c           |   4 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c           |   5 +-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h     |   2 -
 include/drm/gpu_scheduler.h                 |   4 -
 include/linux/dma-fence-array.h             |   1 -
 include/linux/dma-fence-chain.h             |   1 -
 include/linux/dma-fence.h                   |  60 ++++++-
 34 files changed, 249 insertions(+), 182 deletions(-)

-- 
2.34.1


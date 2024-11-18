Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0B9D1BE2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4E910E2A0;
	Mon, 18 Nov 2024 23:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxP5bOPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681AB10E040;
 Mon, 18 Nov 2024 23:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973043; x=1763509043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Q34MN1+S/hWvA02/u63ADNitopgDqBdhWospnhR7xY=;
 b=jxP5bOPrIPlBL3nIfrnRrhMyMiLmpKG/3YJ6Bx+yhbmnnaP0ZS3/kJOn
 Je8uUmdAlfrbEz7bMkzCNu0fisIjIt312Y7f4/kg4r9fbr7hLXfLAC21j
 C5ZwMG+6Q716QNjQ0ZtIBVPo8LjV2qXpZLXZIX+qkdokUtRQv+JMewDEB
 ivx5waIXfahhLQAyjKjF5WmfHJVp7FEMhY9IMmEJoXBjFaHYU4RosdKRb
 mwMCj2fTdJU9bCbsxn5wZNIvpxl649tnnYHaCtoLCalNInCTrwUySbDxQ
 0meAsckXGr09uQpctQy0JUP2Kd8zETfi0NU6ceqrKO9gvU5dNPt/6i1OW w==;
X-CSE-ConnectionGUID: x2tKnaqERvC17PbzXIR6jg==
X-CSE-MsgGUID: LuYItpm6Sq+/Wbhk+pYCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878845"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
X-CSE-ConnectionGUID: 6uthKWc1QrOgzNLsa/DkqQ==
X-CSE-MsgGUID: q0C1cGx7RrmIxksb1w+dEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521664"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 00/29] UMD direct submission in Xe
Date: Mon, 18 Nov 2024 15:37:28 -0800
Message-Id: <20241118233757.2374041-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This is an RFC, or possibly even a proof of concept, for UMD (User Mode
Driver) direct submission in Xe. It is similar to AMD's design [1] [2]
or ARM's design [3], utilizing a uAPI to convert user-space syncs
(memory writes) to kernel-space syncs (DMA fences). It is built around
the existing Xe preemption fences for dynamic memory management, such as
userptr invalidation and buffer object (BO) eviction.

The series also enables mapping a PPGTT-bound submission ring in
non-privileged mode, as well as exposing indirect ring state (such as
ring head, tail, etc.) and the doorbell to user space, enabling UMD
direct submission.

The target for this series is Mesa, with the goal of enabling UMD direct
submission and removing the submission thread that currently handles
future fences. I've discussed this with Sima and the Intel Mesa team,
and it seems like a reachable target. Most synchronization will be
handled in user space via memory writes and semaphore wait ring
instructions, with only legacy cross-process synchronization (e.g.,
compositors) requiring kernel synchronization (DMA fences).

The series includes some common patches at the beginning to implement
preemption fences and user fences. The idea of preemption
DMA-reservation slots [4] has been dropped in favor of attaching the
last exported DMA fence to the preemption fence as suggested by AMD.

This is a public checkpoint on the KMD (Kernel Mode Driver) work, which
will be tabled until Intel's Mesa team has the bandwidth to begin the
UMD work. That said, the uAPI is very preliminary and likely to change.
One idea that was discussed is a common user fence interface based
around DRM syncobjs, which will likely be explored further as UMD
engagement begins. Some work for syncing VM binds (kernel operation)
with UMD direct submission is also likely required.

Testing has been done with [5], and the main features—such as basic
submission, dynamic memory management, user-to-kernel sync conversion,
and protection against endless user fences—are working on BMG and LNL.

The GitLab branch [6] has also been pushed for reference.

Any early community feedback is always appreciated.

Matt

[1] https://patchwork.freedesktop.org/series/113675/
[2] https://patchwork.freedesktop.org/series/114385/
[3] https://patchwork.freedesktop.org/series/137924/
[4] https://patchwork.freedesktop.org/series/141129/
[5] https://patchwork.freedesktop.org/series/141518/
[6] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-umd-submission-post/-/tree/post-11-18-24?ref_type=heads 

Matthew Brost (28):
  dma-fence: Add dma_fence_preempt base class
  dma-fence: Add dma_fence_user_fence
  drm/xe: Use dma_fence_preempt base class
  drm/xe: Allocate doorbells for UMD exec queues
  drm/xe: Add doorbell ID to snapshot capture
  drm/xe: Break submission ring out into its own BO
  drm/xe: Break indirect ring state out into its own BO
  drm/xe: Clear GGTT in xe_bo_restore_kernel
  FIXME: drm/xe: Add pad to ring and indirect state
  drm/xe: Enable indirect ring on media GT
  drm/xe: Don't add pinned mappings to VM bulk move
  drm/xe: Add exec queue post init extension processing
  drm/xe: Add support for mmapping doorbells to user space
  drm/xe: Add support for mmapping submission ring and indirect ring
    state to user space
  drm/xe/uapi: Define UMD exec queue mapping uAPI
  drm/xe: Add usermap exec queue extension
  drm/xe: Drop EXEC_QUEUE_FLAG_UMD_SUBMISSION flag
  drm/xe: Do not allow usermap exec queues in exec IOCTL
  drm/xe: Teach GuC backend to kill usermap queues
  drm/xe: Enable preempt fences on usermap queues
  drm/xe/uapi: Add uAPI to convert user semaphore to / from drm syncobj
  drm/xe: Add user fence IRQ handler
  drm/xe: Add xe_hw_fence_user_init
  drm/xe: Add a message lock to the Xe GPU scheduler
  drm/xe: Always wait on preempt fences in vma_check_userptr
  drm/xe: Teach xe_sync layer about drm_xe_semaphore
  drm/xe: Add VM convert fence IOCTL
  drm/xe: Add user fence TDR

Tejas Upadhyay (1):
  drm/xe/mmap: Add mmap support for PCI memory barrier

 drivers/dma-buf/Makefile                     |   2 +-
 drivers/dma-buf/dma-fence-preempt.c          | 134 ++++++
 drivers/dma-buf/dma-fence-user-fence.c       |  73 ++++
 drivers/gpu/drm/xe/xe_bo.c                   |  29 +-
 drivers/gpu/drm/xe/xe_bo.h                   |   5 +
 drivers/gpu/drm/xe/xe_bo_evict.c             |   8 +-
 drivers/gpu/drm/xe/xe_device.c               | 181 +++++++-
 drivers/gpu/drm/xe/xe_device_types.h         |   3 +
 drivers/gpu/drm/xe/xe_exec.c                 |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           | 175 +++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h           |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  13 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 |  19 +-
 drivers/gpu/drm/xe/xe_ggtt.h                 |   2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  19 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  12 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   9 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 177 +++++++-
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c            |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c      |   4 +-
 drivers/gpu/drm/xe/xe_hw_fence.c             |  17 +
 drivers/gpu/drm/xe/xe_hw_fence.h             |   3 +
 drivers/gpu/drm/xe/xe_lrc.c                  | 176 ++++++--
 drivers/gpu/drm/xe/xe_lrc.h                  |   4 +-
 drivers/gpu/drm/xe/xe_lrc_types.h            |  16 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   1 +
 drivers/gpu/drm/xe/xe_preempt_fence.c        |  89 ++--
 drivers/gpu/drm/xe/xe_preempt_fence.h        |   2 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h  |  11 +-
 drivers/gpu/drm/xe/xe_pt.c                   |   5 +-
 drivers/gpu/drm/xe/xe_sync.c                 |  90 ++++
 drivers/gpu/drm/xe/xe_sync.h                 |   8 +
 drivers/gpu/drm/xe/xe_sync_types.h           |   5 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 423 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h                   |   4 +-
 drivers/gpu/drm/xe/xe_vm_types.h             |  26 ++
 include/linux/dma-fence-preempt.h            |  56 +++
 include/linux/dma-fence-user-fence.h         |  31 ++
 include/uapi/drm/xe_drm.h                    | 147 ++++++-
 42 files changed, 1798 insertions(+), 199 deletions(-)
 create mode 100644 drivers/dma-buf/dma-fence-preempt.c
 create mode 100644 drivers/dma-buf/dma-fence-user-fence.c
 create mode 100644 include/linux/dma-fence-preempt.h
 create mode 100644 include/linux/dma-fence-user-fence.h

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D266B2B35C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586B10E4E7;
	Mon, 18 Aug 2025 21:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnVoIbdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C39110E4D1;
 Mon, 18 Aug 2025 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552639; x=1787088639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NK77KOvc92dEI/Cw20kHAFkp26PTXgR3+Jr452SJg7k=;
 b=PnVoIbdT9iAwiG8CgdjbVvk4jJzU4ywswU5gejPl3WIlB5YKQ2b3DvvK
 MDlnXEbBiMp82cNphKLGNPb3w+YWGy5eTCgYe+dQvb4GAshckemFNhXMQ
 GR97oMD4/+QwC17MBJK0LXDl7IRWRyCvGeaRg8b4nBjAaUbVz07Qlw4UC
 yzHC6HMr0T/vvlS9rY2Ng6KTHRvUBfDdduSPzGzFbMEvyef4TOjx6smRx
 JNDE7ZBBrbzsdV9ICmLkM2GN7rtOqE8BC1v+Z+aDoKjxJsgW4KBTSiIqA
 NxQk1AZIaP5T1EdD4YTPZ3IB9HTjAugagFVXQaMhsx2PzjbyiLHf9fAlb Q==;
X-CSE-ConnectionGUID: W6BMwZ3ES2G2+71JElIoug==
X-CSE-MsgGUID: H4R8BxPxSPGx/W8xt4z6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815153"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:30:38 -0700
X-CSE-ConnectionGUID: E/3dEnrnTGuSCuezgkQcOg==
X-CSE-MsgGUID: RchRFaf3TDuI4QrjVh4ewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186200"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:30:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 00/24] MADVISE FOR XE
Date: Tue, 19 Aug 2025 03:27:29 +0530
Message-Id: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

Provides a user API to assign attributes like pat_index, atomic
operation type, and preferred location for SVM ranges.
The Kernel Mode Driver (KMD) may split existing VMAs to cover input
ranges, assign user-provided attributes, and invalidate existing PTEs so
that the next page fault/prefetch can use the new attributes.

Tested-with: https://github.com/intel/compute-runtime/pull/845

-v9
Nits 

-v8
Define new function in gpuvm for madvise
Fix tile check in ops_create

-v7
Change gpuvm layering on gpuvm_map_req struct
Fix EAGAIN return on garbage collector splitting vma

-v6
Rebase on gpuvm patches
Address review comments

-v5
Restore attributes to default after free from userspace
Add defragment worker to merge cpu mirror vma with default attributes
Avoid using VMA in uapi
address review comments

-v4:
fix atomic policies
fix attribute copy
address review comments

Boris Brezillon (2):
  drm/gpuvm: Pass map arguments through a struct
  drm/gpuvm: Kill drm_gpuva_init()

Himal Prasad Ghimiray (22):
  drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
  drm/xe/uapi: Add madvise interface
  drm/xe/vm: Add attributes struct as member of vma
  drm/xe/vma: Move pat_index to vma attributes
  drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
    parameter
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public
  drm/xe/svm: Split system allocator vma incase of madvise call
  drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
    madvise
  drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
  drm/xe: Implement madvise ioctl for xe
  drm/xe/svm: Add svm ranges migration policy on atomic access
  drm/xe/madvise: Update migration policy based on preferred location
  drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
  drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
  drm/xe/svm: Consult madvise preferred location in prefetch
  drm/xe/bo: Add attributes field to xe_bo
  drm/xe/bo: Update atomic_access attribute on madvise
  drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
  drm/xe/vm: Add helper to check for default VMA memory attributes
  drm/xe: Reset VMA attributes to default in SVM garbage collector
  drm/xe: Enable madvise ioctl for xe
  drm/xe/uapi: Add UAPI for querying VMA count and memory attributes

 drivers/gpu/drm/drm_gpusvm.c           | 122 ++-----
 drivers/gpu/drm/drm_gpuvm.c            | 287 ++++++++++++----
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  35 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  29 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
 drivers/gpu/drm/xe/xe_device.c         |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  35 +-
 drivers/gpu/drm/xe/xe_pt.c             |  39 ++-
 drivers/gpu/drm/xe/xe_svm.c            | 254 ++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h            |  23 ++
 drivers/gpu/drm/xe/xe_vm.c             | 438 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h             |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 445 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  57 +++-
 include/drm/drm_gpusvm.h               |  70 ++++
 include/drm/drm_gpuvm.h                |  38 ++-
 include/uapi/drm/xe_drm.h              | 274 +++++++++++++++
 22 files changed, 1922 insertions(+), 301 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1


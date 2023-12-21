Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD681ADF3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D528710E657;
	Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19910E638;
 Thu, 21 Dec 2023 04:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132901; x=1734668901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XsD+CouNVfYyOKjUTc4xzY+lYi6ZqUSxZpfOe8aBdhU=;
 b=Tk3X00/xbS+sXoLjFSRL4vz5pyQsWtf7XFmGquCT8Uk+iNb9B+Q4sKDf
 xyt4AKDCWbba1vkGSVzqTG9iZRh+F15Ae8u671fcaGjWoytYbvMi0gydt
 h6ZRB7fUZ3KH1zRHH+O+3ZHhRY2QUvBFwM0H/kQqU84MUqsOBDF65Gwi/
 qdHr1+SbrCbuXKt444ww02/o3Uu+UVLcma2y2rcia1ZGB7vhXN67eNWQ/
 8YQLDs3JBUcwI5HUHjVokxLJeQRKVNgB17i9YJ9YiCqJEfPAfGHglo+zO
 Q2KNikjZ9Sde42OLjgevmoQ+E5UdfilTd64mQEcC3XqkjE6ou9THjyV/S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069759"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481336"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481336"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 00/22] XeKmd basic SVM support
Date: Wed, 20 Dec 2023 23:37:50 -0500
Message-Id: <20231221043812.3783313-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the very basic SVM (shared virtual memory) support in XeKmd
driver. SVM allows the programmer to use a shaed virtual address space
between CPU program and GPU program. It abstracts away from the user
the location of the backing memory in a mixed CPU and GPU programming
environment.

This work is based on previous I915 SVM implementation mainly from
Niranjana Vishwanathapura and Oak Zeng, which has never been upstreamed
before. This is our first attempt to upstream this work.

This implementation depends on Linux kernel HMM support. See some key
designs in patch #1.

We are aware there are currently some effort to implement SVM using
GMEM(generalized memory management,
see https://lore.kernel.org/dri-devel/20231128125025.4449-1-weixi.zhu@huawei.com/)
We are open to this new method if it can be merged to upstream kernel.
Before that, we think it is still safer to support SVM through HMM.

This series only has basic SVM support. We think it is better to post
this series earlier so we can get more eyes on it. Below are the works
that is planned or ongoing:

*Testing: We are working on the igt test right now. Some part of this
series, especially the gpu page table update(patch #7, #8) and migration
function (patch #10) need some debug to make it work.

*Virtual address range based memory attributes and hints: We plan to
expose uAPI for user to set memory attributes such as preferred location
or migration granularity etc to a virtual address range. This is
important to tune SVM performance.

*GPU vram eviction: One key design choice of this series is, SVM
layer allocate GPU memory directly from drm buddy allocator, instead
of from xe vram manager. There is no BO (buffer object) concept
in this implementation. The key benefit of this approach is we can
migrate memory at page granularity easily. This also means SVM bypasses
TTM's memory eviction logic. But we want the SVM memory and BO driver
memory can mutually evicted each other. We have some prove of concept
work to rework TTM resource manager for this purpose, see
https://lore.kernel.org/dri-devel/20231102043306.2931989-1-oak.zeng@intel.com/
We will continue work on that series then implement SVM's eviction
function based on the concept of shared drm LRU list b/t SVM and TTM/BO
driver.

Oak Zeng (22):
  drm/xe/svm: Add SVM document
  drm/xe/svm: Add svm key data structures
  drm/xe/svm: create xe svm during vm creation
  drm/xe/svm: Trace svm creation
  drm/xe/svm: add helper to retrieve svm range from address
  drm/xe/svm: Introduce a helper to build sg table from hmm range
  drm/xe/svm: Add helper for binding hmm range to gpu
  drm/xe/svm: Add helper to invalidate svm range from GPU
  drm/xe/svm: Remap and provide memmap backing for GPU vram
  drm/xe/svm: Introduce svm migration function
  drm/xe/svm: implement functions to allocate and free device memory
  drm/xe/svm: Trace buddy block allocation and free
  drm/xe/svm: Handle CPU page fault
  drm/xe/svm: trace svm range migration
  drm/xe/svm: Implement functions to register and unregister mmu
    notifier
  drm/xe/svm: Implement the mmu notifier range invalidate callback
  drm/xe/svm: clean up svm range during process exit
  drm/xe/svm: Move a few structures to xe_gt.h
  drm/xe/svm: migrate svm range to vram
  drm/xe/svm: Populate svm range
  drm/xe/svm: GPU page fault support
  drm/xe/svm: Add DRM_XE_SVM kernel config entry

 Documentation/gpu/xe/index.rst       |   1 +
 Documentation/gpu/xe/xe_svm.rst      |   8 +
 drivers/gpu/drm/xe/Kconfig           |  22 ++
 drivers/gpu/drm/xe/Makefile          |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |  20 ++
 drivers/gpu/drm/xe/xe_gt.h           |  20 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  28 +--
 drivers/gpu/drm/xe/xe_migrate.c      | 213 +++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |   7 +
 drivers/gpu/drm/xe/xe_mmio.c         |  12 +
 drivers/gpu/drm/xe/xe_pt.c           | 134 ++++++++++-
 drivers/gpu/drm/xe/xe_pt.h           |   5 +
 drivers/gpu/drm/xe/xe_svm.c          | 324 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h          | 115 +++++++++
 drivers/gpu/drm/xe/xe_svm_devmem.c   | 232 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm_doc.h      | 121 ++++++++++
 drivers/gpu/drm/xe/xe_svm_migrate.c  | 345 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm_range.c    | 227 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_trace.h        |  71 +++++-
 drivers/gpu/drm/xe/xe_vm.c           |   7 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  12 +
 21 files changed, 1904 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_svm.rst
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm_range.c

-- 
2.26.3


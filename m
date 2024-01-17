Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB96830EF5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235C610E897;
	Wed, 17 Jan 2024 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35B810E88B;
 Wed, 17 Jan 2024 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528906; x=1737064906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XaPPO69K4CEqt/bqw3crVXXATMbZe4ObgLi1b0Uqi6s=;
 b=jq8I8Fb82dP731X3deZN41L0esDhnxmCET4SAqZY0pW5vJ6o5trx1ust
 ZJglPJ7akZidadsd4TZ1wiHSStkWLHkLvZospqjVOsEixf29vBrSU+NgF
 1By1K1KFuOm9ghkveO19p78T9jU5nG+hQ6CPdDCHdf3LD2JVB+66W6yU+
 m/eP0VC+ZNXD3PBcHKuWRCnLEGTvsYQR3necVtDDlJ5k+zYinunUvA8DU
 R+71t3e5CH26/z5bx7iJN8cPl9fiPsjR4wzwDvmphQ8i+YAh243YfTkcM
 QShJYyN2YidUTW9ZB1WaOl9mtZYabblFGNNTPcGvI6S9Be8CRD4uo4ybU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657613"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657613"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089216"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089216"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 00/23] XeKmd basic SVM support
Date: Wed, 17 Jan 2024 17:12:00 -0500
Message-Id: <20240117221223.18540-1-oak.zeng@intel.com>
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
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
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

Oak Zeng (23):
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
  drm/xe/svm: Add svm memory hints interface

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
 drivers/gpu/drm/xe/xe_pt.c           | 147 +++++++++++-
 drivers/gpu/drm/xe/xe_pt.h           |   5 +
 drivers/gpu/drm/xe/xe_svm.c          | 324 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h          | 115 +++++++++
 drivers/gpu/drm/xe/xe_svm_devmem.c   | 232 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm_doc.h      | 121 ++++++++++
 drivers/gpu/drm/xe/xe_svm_migrate.c  | 345 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm_range.c    | 227 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_trace.h        |  71 +++++-
 drivers/gpu/drm/xe/xe_vm.c           |   7 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 +-
 include/uapi/drm/xe_drm.h            |  40 ++++
 22 files changed, 1957 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_svm.rst
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm_range.c

-- 
2.26.3


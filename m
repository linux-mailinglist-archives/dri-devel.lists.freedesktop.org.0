Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAB5F2864
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513E10E20E;
	Mon,  3 Oct 2022 06:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA7F10E054;
 Mon,  3 Oct 2022 06:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664777597; x=1696313597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C5fMyO6FVu/m/lLU81PvzcOkqJUxEYSJo/Td0OtnL9c=;
 b=nDGjCKr+Zsgjvc/aznD2fYMVoo0thp7Pfx/901Vd1STFR3uUuzkS4gam
 juhF07wRLXz1iIdpPoffJodif4COGX2Ju72tR3xJIal0nAIn0QeeUbni+
 FhwAivdXdZX4GvQogsSmgAzXcSxKJkL96IfQDpBzRD9WvcLkMed05JXs9
 OjSW4A/bP5xZLkREdCdBEErTchCUEJR4sF0sXoyuoY8mwTref6yiymyLw
 2q0MM31RG9DdW/8x2cOTCWvdcw7SXsNNY6ZbjQq6paFwWLu7bK2TUIFSh
 bGIlW5INloUtcaMM3lHFkpe8tPWGKsHEBd+XZxTPjPJwr+tYAOwZ32k6T Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="300159056"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="300159056"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2022 23:13:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574516784"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="574516784"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2022 23:13:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/17] drm/i915/vm_bind: Add VM_BIND functionality
Date: Sun,  2 Oct 2022 23:12:28 -0700
Message-Id: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
buffer objects (BOs) or sections of a BOs at specified GPU virtual
addresses on a specified address space (VM). Multiple mappings can map
to the same physical pages of an object (aliasing). These mappings (also
referred to as persistent mappings) will be persistent across multiple
GPU submissions (execbuf calls) issued by the UMD, without user having
to provide a list of all required mappings during each submission (as
required by older execbuf mode).

This patch series support VM_BIND version 1, as described by the param
I915_PARAM_VM_BIND_VERSION.

Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
The new execbuf3 ioctl will not have any execlist support and all the
legacy support like relocations etc., are removed.

TODOs:
* Support out fence for VM_UNBIND ioctl.
* Async VM_UNBIND support.
* Optimizations.

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The IGT RFC series is posted as,
  [PATCH i-g-t v2 0/8] vm_bind: Add VM_BIND validation support

v2: Address various review comments

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (17):
  drm/i915/vm_bind: Expose vm lookup function
  drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
  drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
  drm/i915/vm_bind: Add support to create persistent vma
  drm/i915/vm_bind: Implement bind and unbind of object
  drm/i915/vm_bind: Support for VM private BOs
  drm/i915/vm_bind: Add support to handle object evictions
  drm/i915/vm_bind: Support persistent vma activeness tracking
  drm/i915/vm_bind: Add out fence support
  drm/i915/vm_bind: Abstract out common execbuf functions
  drm/i915/vm_bind: Use common execbuf functions in execbuf path
  drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
  drm/i915/vm_bind: Update i915_vma_verify_bind_complete()
  drm/i915/vm_bind: Expose i915_request_await_bind()
  drm/i915/vm_bind: Handle persistent vmas in execbuf3
  drm/i915/vm_bind: userptr dma-resv changes
  drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode

 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  67 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 516 +----------
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 867 ++++++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.c | 666 ++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.h |  74 ++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  17 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 439 +++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  18 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  27 +
 drivers/gpu/drm/i915/i915_driver.c            |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
 drivers/gpu/drm/i915/i915_getparam.c          |   3 +
 drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
 drivers/gpu/drm/i915/i915_vma.c               | 116 ++-
 drivers/gpu/drm/i915/i915_vma.h               |  57 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  39 +
 include/uapi/drm/i915_drm.h                   | 281 +++++-
 30 files changed, 2842 insertions(+), 519 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.21.0.rc0.32.g243a4c7e27


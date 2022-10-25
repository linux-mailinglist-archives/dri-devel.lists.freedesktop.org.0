Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143360C47E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327610E1CE;
	Tue, 25 Oct 2022 06:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D810E069;
 Tue, 25 Oct 2022 06:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666681151; x=1698217151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IR8weANTJV40UoXBGHPW5pVE20sGO/VvkaBZzpvSyDg=;
 b=B6u6DOm1t9CbBgIXHJf8Nq8DsMm4LBh9YURAwtdf/iq41RGGra0HRH9r
 7d3j57hSz11h1WeuzmsdyGZwj4GFNGc9rsJN2M3S77hqG5s3oR8cHvJfE
 8tAF7S9AQxcTyPgo1GW4UtFbjvn1y/KOmO46i0n4C/pmIwwxtlEhYJv3Z
 FjT0jdeOkXA9zjPTOMeIqrgptCijK6WhiWJgtxg9JSNVMo0TmTM3mSM30
 dU+gdQVbPfEDGHVOqHcDz8bt0gSRaXOHi4aIvsJptXaRbUi3pRtYlQ0Tf
 1L+5aYi5FyvLi7RSLTYj45lgOjB4MVaAm9d4d5Dp4FHYS1iVygpliG6ei w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334198156"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="334198156"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806564374"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="806564374"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/19] drm/i915/vm_bind: Add VM_BIND functionality
Date: Mon, 24 Oct 2022 23:58:46 -0700
Message-Id: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
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
* Async VM_UNBIND support.
* Optimizations.

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The IGT RFC series is posted as,
  [PATCH i-g-t v5 0/12] vm_bind: Add VM_BIND validation support

v2: Address various review comments
v3: Address review comments and other fixes
v4: Remove vm_unbind out fence uapi which is not supported yet,
    replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
v5: Render kernel-doc, use PIN_NOEVICT, limit vm_bind support to
    non-recoverable faults

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (19):
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
  drm/i915/vm_bind: Limit vm_bind mode to non-recoverable contexts
  drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode
  drm/i915/vm_bind: Render VM_BIND documentation

 Documentation/gpu/i915.rst                    |  78 +-
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  17 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  72 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 516 +----------
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 871 ++++++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.c | 666 +++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.h |  74 ++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  19 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 446 +++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  17 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  21 +
 drivers/gpu/drm/i915/i915_driver.c            |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
 drivers/gpu/drm/i915/i915_getparam.c          |   3 +
 drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
 drivers/gpu/drm/i915/i915_vma.c               | 134 ++-
 drivers/gpu/drm/i915/i915_vma.h               |  67 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  39 +
 include/uapi/drm/i915_drm.h                   | 275 +++++-
 30 files changed, 2967 insertions(+), 542 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.21.0.rc0.32.g243a4c7e27


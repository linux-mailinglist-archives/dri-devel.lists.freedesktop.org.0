Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F366A6714B3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C396A10E68D;
	Wed, 18 Jan 2023 07:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7322710E1E2;
 Wed, 18 Jan 2023 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026174; x=1705562174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVH3vVeL8p9HvV9fB3ig3Zs5QFeE//t7oLie1rwox10=;
 b=RJqesBrhGK/1cHLbLu8fXLRADs1NGW1Ix8vHTAg9nQGE0eNtHA4D4YUu
 8a8i6NNeWsn+zam0W7cVEZZ84epEfTFVeENTB6P31zQ22pa0yDLpeoUOF
 qZYfZAe7MsKssfLoNc2FSIF1TzYxPnlZgA4V8FV0GK3n2MM0zPu9u1pRH
 ryL3genzSw68mYkBdko4/ctI2KPafjijUlXm865mCy+3uNdnIrML7PUGK
 0m08stL81RjWSyzAmlH8b2WhiqCiVLc4eKM7v4EO0VM76RhX/pZUK8AFt
 ANgWPRLAnBCWRIzffbJQnOqilNHt1iPBOI6zorgS8sf80H6LFB5V1VLBG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482021"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482021"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661609952"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661609952"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 00/23] drm/i915/vm_bind: Add VM_BIND functionality
Date: Tue, 17 Jan 2023 23:15:46 -0800
Message-Id: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The IGT RFC series is posted as,
  [PATCH i-g-t v10 0/19] vm_bind: Add VM_BIND validation support

v2: Address various review comments
v3: Address review comments and other fixes
v4: Remove vm_unbind out fence uapi which is not supported yet,
    replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
v5: Render kernel-doc, use PIN_NOEVICT, limit vm_bind support to
    non-recoverable faults
v6: Rebased, minor fixes, add reserved fields to drm_i915_gem_vm_bind,
    add new patch for async vm_unbind support
v7: Rebased, minor cleanups as per review feedback
v8: Rebased, add capture support
v9: Address capture support feedback from v8
v10: Properly handle vma->resource for mappings with capture request

Test-with: 20230118071350.17498-1-niranjana.vishwanathapura@intel.com

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (23):
  drm/i915/vm_bind: Expose vm lookup function
  drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
  drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
  drm/i915/vm_bind: Support partially mapped vma resource
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
  drm/i915/vm_bind: Async vm_unbind support
  drm/i915/vm_bind: Properly build persistent map sg table
  drm/i915/vm_bind: Support capture of persistent mappings

 Documentation/gpu/i915.rst                    |  78 +-
 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  17 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  72 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 522 +----------
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 872 ++++++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.c | 671 ++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.h |  76 ++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  19 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 463 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  22 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  28 +
 drivers/gpu/drm/i915/i915_driver.c            |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_gem.c               |  14 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
 drivers/gpu/drm/i915/i915_getparam.c          |   3 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  52 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
 drivers/gpu/drm/i915/i915_vma.c               | 301 +++++-
 drivers/gpu/drm/i915/i915_vma.h               |  70 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  43 +
 include/uapi/drm/i915_drm.h                   | 281 +++++-
 32 files changed, 3245 insertions(+), 553 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.21.0.rc0.32.g243a4c7e27


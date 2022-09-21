Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6E5BF71B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC8510E833;
	Wed, 21 Sep 2022 07:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164510E833;
 Wed, 21 Sep 2022 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663744211; x=1695280211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c2xHz/YYkGoNPEUZ7lnI4BkY46a8f4f45eMs6cBtDZ0=;
 b=eg3eM7y383+t+APrUEYhVLKUunrItIHACIJqZoWeGDkrMv/UyxiO1Vbk
 HyW9kd4wyuMEkJ/GWMEkclqp+eVyenpK7XPoLzcbQIvi7GZWmKqvq1gRb
 UzLPp6poceghutnljs/bmFUcAeWkIIUXu/UnYAXKD/GxFCAWZ4U7j167t
 kSQM9ymwKCGTQ3IrTh5DDTFIxNMC36zs9cFi0yaawl27wGj97VbgmQNX7
 EBuuZEsaRmSZqSUBu3a0k/gnevg3adz6XHlgxBHDht7wmaSrYrNBwDQLD
 vJqEEkZXeiQ9DPp0nBnc6FR+IOgCHgkZ/P0GWmahj+Z6uI+M+GZLxUwne Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386208162"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="386208162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 00:10:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="948022794"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2022 00:10:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v4 00/14] drm/i915/vm_bind: Add VM_BIND functionality
Date: Wed, 21 Sep 2022 00:09:31 -0700
Message-Id: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
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
* Cleanups and optimizations.

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The IGT RFC series is posted as,
  [RFC v2 0/8] vm_bind: Add VM_BIND validation support

v4: Share code between legacy execbuf and execbuf3.
    Address review feedback from Thomas and Tvrtko.
    Reformat patches and some cleanups.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (14):
  drm/i915/vm_bind: Expose vm lookup function
  drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
  drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
  drm/i915/vm_bind: Implement bind and unbind of object
  drm/i915/vm_bind: Support for VM private BOs
  drm/i915/vm_bind: Handle persistent vmas
  drm/i915/vm_bind: Add out fence support
  drm/i915/vm_bind: Abstract out common execbuf functions
  drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
  drm/i915/vm_bind: Update i915_vma_verify_bind_complete()
  drm/i915/vm_bind: Handle persistent vmas in execbuf3
  drm/i915/vm_bind: userptr dma-resv changes
  drm/i915/vm_bind: Skip vma_lookup for persistent vmas
  drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode

 drivers/gpu/drm/i915/Makefile                 |   3 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 .../drm/i915/display/intel_plane_initial.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  60 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 520 +----------
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 861 ++++++++++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.c | 530 +++++++++++
 .../drm/i915/gem/i915_gem_execbuffer_common.h |  47 +
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  17 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  31 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 421 +++++++++
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  16 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  12 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |   2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   6 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |   2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  27 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring.c          |   2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   4 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |   2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |   2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/i915_driver.c            |   4 +
 drivers/gpu/drm/i915/i915_gem.c               |   2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
 drivers/gpu/drm/i915/i915_getparam.c          |   3 +
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  25 +-
 drivers/gpu/drm/i915/i915_sw_fence.h          |   7 +-
 drivers/gpu/drm/i915/i915_vma.c               |  98 +-
 drivers/gpu/drm/i915/i915_vma.h               |  51 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  42 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  44 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |   4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
 .../drm/i915/selftests/intel_memory_region.c  |   2 +-
 include/uapi/drm/i915_drm.h                   | 285 +++++-
 61 files changed, 2690 insertions(+), 604 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.21.0.rc0.32.g243a4c7e27


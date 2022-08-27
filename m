Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8D5A39C8
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D99F10ED22;
	Sat, 27 Aug 2022 19:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4698410ED1F;
 Sat, 27 Aug 2022 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629514; x=1693165514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4mszzfa+r+QHs/hijP3gU7q1bDGndVU1hB0+uTQ35OI=;
 b=QySwemFy1NZQZlLkthnWmfyhgpyCiTpn5VIOQzuPAZv6Zqg4sp+obCqi
 1jQBtRczdpNvKECBLywmcRH5+G+nRn1PxJhtMAYcZJV/wCK45LlY7g8pa
 WtBsLUDkeJFS4recQ0GJpqakR02+P1zFrAn3qdszT72aORitX/nOE5rwu
 nYGAnLVbG5/OJk5k/YuvElfzz9PvWZGJYM4XH8Bsuq5PJOpiuMTG0joG2
 uWCNkarNqf3NiifVjikFWxnFXJNouINeKt9foPfxjunbozROC3HFoM07t
 yvo/ihQgFIL64fYk3TxuSal9DDbaizQiGAmYX28Zy/q4cDnKsZK+Y3eAG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="295958271"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="295958271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="671878020"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:10 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 00/17] drm/i915/vm_bind: Add VM_BIND functionality
Date: Sat, 27 Aug 2022 21:43:46 +0200
Message-Id: <20220827194403.6495-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

just sending the original Niranjana's patch as an RFC. It's v3 as
the v2 has been reviewed offline with Ramalingam.

I'm still keeping most of the structure even though some further
discussion can be done starting from here.

Copy pasting Niranjana's original cover letter message:

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
* Share code between execbuf2 and execbuf3 where possible.
* Cleanups and optimizations.

NOTEs:
* It is based on below VM_BIND design+uapi patch series.
  https://lists.freedesktop.org/archives/intel-gfx/2022-July/300760.html

* The IGT RFC series is posted as,
  [RFC 0/5] vm_bind: Add VM_BIND validation support

Niranjana Vishwanathapura (17):
  drm/i915: Expose vm_lookup in i915_gem_context.h
  drm/i915: Mark vm for vm_bind usage at creation
  drm/i915/gem: expose i915_gem_object_max_page_size() in
    i915_gem_object.h
  drm/i915: Implement bind and unbind of object
  drm/i915: Support for VM private BOs
  drm/i915/dmabuf: Deny the dmabuf export for VM private BOs
  drm/i915/vm_bind: Handle persistent vmas
  drm/i915/vm_bind: Add out fence support
  drm/i915: Do not support vm_bind mode in execbuf2
  drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
  drm/i915: Add i915_vma_is_bind_complete()
  drm/i915/vm_bind: Handle persistent vmas in execbuf3
  drm/i915/vm_bind: userptr dma-resv changes
  drm/i915/vm_bind: Skip vma_lookup for persistent vmas
  drm/i915: Extend getparm for VM_BIND capability
  drm/i915/ioctl: Enable the vm_bind/unbind ioctls
  drm/i915: Enable execbuf3 ioctl for vm_bind

 drivers/gpu/drm/i915/Makefile                 |    2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |    2 +-
 .../drm/i915/display/intel_plane_initial.c    |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   16 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   16 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    9 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 1275 +++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |    2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   10 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |   24 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  437 ++++++
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   16 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |    2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |   12 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |    2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |    6 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |    2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |    2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   20 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   27 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |    4 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |    2 +-
 drivers/gpu/drm/i915/gt/intel_ring.c          |    2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |    4 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c      |    2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |    2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |    4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |    6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |    2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |    2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |    4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |    2 +-
 drivers/gpu/drm/i915/i915_driver.c            |    4 +
 drivers/gpu/drm/i915/i915_gem.c               |    2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   38 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |    3 +
 drivers/gpu/drm/i915/i915_getparam.c          |    3 +
 drivers/gpu/drm/i915/i915_perf.c              |    2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  114 +-
 drivers/gpu/drm/i915/i915_vma.h               |   62 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |   49 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   44 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |    2 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |    2 +-
 .../drm/i915/selftests/intel_memory_region.c  |    2 +-
 include/uapi/drm/i915_drm.h                   |  255 +++-
 56 files changed, 2424 insertions(+), 119 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.34.1


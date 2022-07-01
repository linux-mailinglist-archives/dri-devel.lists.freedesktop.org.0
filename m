Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF6563C95
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1904A11263F;
	Fri,  1 Jul 2022 22:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D933411255E;
 Fri,  1 Jul 2022 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715877; x=1688251877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eTLEmEdoSyx1SHLJ+DenIW3nicq9M9VRzvFU5oL8xz0=;
 b=KHYCtEtKpzH352nEjaHexOQEA3ypsSwhr24yQfm//q6I9rpb6A6DrORt
 o6tAhPbedc2w0PEuCMFCfdVUxCytpCKfRQO7HcrgTc5HfltO486erBaZm
 hf/6omwbStla2bu/Km2bkey/mHKkQ7DW3WqHcJruowX+Su2OBPQInyPHt
 sdCGviFicsDl2uvseUwfubibFJIE35Is5Zs7X66bt9r/vFynERBKbWdX1
 /7RRgMyF87+AUQPWulgUeeuZhZlzmOhblK8VYsdrnC3jCg2V4a0AXxkAC
 aksqyK3b46iKvHK/jPrkC26aeosv5rbdWUPiUxOp1H2GeFMlZw0wGIvzQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789046"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645083"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 00/10] drm/i915/vm_bind: Add VM_BIND functionality
Date: Fri,  1 Jul 2022 15:50:45 -0700
Message-Id: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
* Share code between execbuf2 and execbuf3 where possible.
* Cleanups and optimizations.

NOTEs:
* It is based on below VM_BIND design+uapi patch series.
  https://lists.freedesktop.org/archives/intel-gfx/2022-July/300760.html

* The IGT RFC series is posted as,
  [RFC 0/5] vm_bind: Add VM_BIND validation support

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (10):
  drm/i915/vm_bind: Introduce VM_BIND ioctl
  drm/i915/vm_bind: Bind and unbind mappings
  drm/i915/vm_bind: Support private and shared BOs
  drm/i915/vm_bind: Add out fence support
  drm/i915/vm_bind: Handle persistent vmas
  drm/i915/vm_bind: Add I915_GEM_EXECBUFFER3 ioctl
  drm/i915/vm_bind: Handle persistent vmas in execbuf3
  drm/i915/vm_bind: userptr dma-resv changes
  drm/i915/vm_bind: Skip vma_lookup for persistent vmas
  drm/i915/vm_bind: Fix vm->vm_bind_mutex and vm->mutex nesting

 drivers/gpu/drm/i915/Makefile                 |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   20 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   15 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   51 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    5 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 1270 +++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |    2 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |   54 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  342 +++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   37 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   20 +
 drivers/gpu/drm/i915/i915_driver.c            |   38 +
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   22 +
 drivers/gpu/drm/i915/i915_getparam.c          |    3 +
 drivers/gpu/drm/i915/i915_vma.c               |   59 +-
 drivers/gpu/drm/i915/i915_vma.h               |   80 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |   40 +
 include/uapi/drm/i915_drm.h                   |  289 +++-
 23 files changed, 2316 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c

-- 
2.21.0.rc0.32.g243a4c7e27


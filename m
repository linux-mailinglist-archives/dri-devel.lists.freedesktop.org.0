Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E481443D480
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA3A89E3F;
	Wed, 27 Oct 2021 21:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18C689BFD;
 Wed, 27 Oct 2021 21:20:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020824"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:20:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665153928"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:20:47 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v3 00/17] drm/i915/dg2: Enabling 64k page size and flat ccs
Date: Thu, 28 Oct 2021 02:53:22 +0530
Message-Id: <20211027212339.29259-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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

This series introduces the enabling patches for new memory compression
feature Flat CCS and 64k page support for i915 local memory, along with
documentation on the uAPI impact. Included the details of the feature and
the implications on the uAPI below. Which is also added into
Documentation/gpu/rfc/i915_dg2.rst

DG2 64K page size support:
=========================

On discrete platforms, starting from DG2, we have to contend with GTT
page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
objects. Specifically the hardware only supports 64K or larger GTT page
sizes for such memory. The kernel will already ensure that all
I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
sizes underneath.

Note that the returned size here will always reflect any required
rounding up done by the kernel, i.e 4K will now become 64K on devices
such as DG2.

Special DG2 GTT address alignment requirement:
=============================================

The GTT alignment will also need be at least 64K for such objects.

Note that due to how the hardware implements 64K GTT page support, we
have some further complications:

1) The entire PDE(which covers a 2M virtual address range), must contain
only 64K PTEs, i.e mixing 4K and 64K PTEs in the same PDE is forbidden
by the hardware.

2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
objects.

To handle the above the kernel implements a memory coloring scheme to
prevent userspace from mixing I915_MEMORY_CLASS_DEVICE and
I915_MEMORY_CLASS_SYSTEM objects in the same PDE. If the kernel is ever
unable to evict the required pages for the given PDE(different color)
when inserting the object into the GTT then it will simply fail the
request.

Since userspace needs to manage the GTT address space themselves,
special care is needed to ensure this doesn’t happen. The simplest
scheme is to simply align and round up all I915_MEMORY_CLASS_DEVICE
objects to 2M, which avoids any issues here. At the very least this is
likely needed for objects that can be placed in both
I915_MEMORY_CLASS_DEVICE and I915_MEMORY_CLASS_SYSTEM, to avoid
potential issues when the kernel needs to migrate the object behind the
scenes, since that might also involve evicting other objects.

To summarise the GTT rules, on platforms like DG2:

1) All objects that can be placed in I915_MEMORY_CLASS_DEVICE must have
64K alignment. The kernel will reject this otherwise.

2) All I915_MEMORY_CLASS_DEVICE objects must never be placed in the same
PDE with other I915_MEMORY_CLASS_SYSTEM objects. The kernel will reject
this otherwise.

3) Objects that can be placed in both I915_MEMORY_CLASS_DEVICE and
I915_MEMORY_CLASS_SYSTEM should probably be aligned and padded out to
2M.

Flat CCS support for lmem
=========================
On Xe-HP and later devices, we use dedicated compression control state
(CCS) stored in local memory for each surface, to support the 3D and
media compression formats.

The memory required for the CCS of the entire local memory is 1/256 of
the local memory size. So before the kernel boot, the required memory is
reserved for the CCS data and a secure register will be programmed with
the CCS base address.

Flat CCS data needs to be cleared when a lmem object is allocated. And
CCS data can be copied in and out of CCS region through
XY_CTRL_SURF_COPY_BLT. CPU can’t access the CCS data directly.

When we exaust the lmem, if the object’s placements support smem, then
we can directly decompress the compressed lmem object into smem and
start using it from smem itself.

But when we need to swapout the compressed lmem object into a smem
region though objects’ placement doesn’t support smem, then we copy the
lmem content as it is into smem region along with ccs data (using
XY_CTRL_SURF_COPY_BLT). When the object is referred, lmem content will
be swaped in along with restoration of the CCS data (using
XY_CTRL_SURF_COPY_BLT) at corresponding location.

Flat-CCS Modifiers for different compression formats
====================================================
I915_FORMAT_MOD_F_TILED_DG2_RC_CCS - used to indicate the buffers of
Flat CCS render compression formats. Though the general layout is same
as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression
algorithm is used. Render compression uses 128 byte compression blocks

I915_FORMAT_MOD_F_TILED_DG2_MC_CCS -used to indicate the buffers of Flat
CCS media compression formats. Though the general layout is same as
I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm
is used. Media compression uses 256 byte compression blocks.

I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC - used to indicate the buffers of
Flat CCS clear color render compression formats. Unified compression
format for clear color render compression. The genral layout is a tiled
layout using 4Kb tiles i.e Tile4 layout.

v2:
  Fixed some formatting issues and platform naming issues
  Added some more documentation on Flat-CCS

v3:
  Plane programming is handled for flat-ccs and clear color
  Tile4 and flat ccs modifier patches are rebased on table based
    modifier reference method
  Three patches are squashed
  Y tile is pruned for DG2.
  flat_ccs_cc plane format info is added
  Added mesa, compute and media ppl for required uAPI ack.

Abdiel Janulgue (1):
  drm/i915/lmem: Enable lmem for platforms with Flat CCS

Anshuman Gupta (1):
  drm/i915/dg2: Plane handling for Flat CCS and clear color

Ayaz A Siddiqui (1):
  drm/i915/gt: Clear compress metadata for Xe_HP platforms

CQ Tang (1):
  drm/i915/xehpsdv: Add has_flat_ccs to device info

Matt Roper (1):
  uapi/drm/dg2: Format modifier for DG2 unified compression and clear
    color

Matthew Auld (7):
  drm/i915/xehpsdv: set min page-size to 64K
  drm/i915/xehpsdv: enforce min GTT alignment
  drm/i915: enforce min page size for scratch
  drm/i915/gtt/xehpsdv: move scratch page to system memory
  drm/i915/xehpsdv: support 64K GTT pages
  drm/i915/xehpsdv: implement memory coloring
  drm/i915/uapi: document behaviour for DG2 64K support

Ramalingam C (3):
  drm/i915/dg2: Prune the Y Tiling modifiers
  drm/i915/Flat-CCS: Document on Flat-CCS memory compression
  Doc/gpu/rfc/i915: i915 DG2 uAPI

Stanislav Lisovskiy (1):
  drm/i915/dg2: Tile 4 plane format support

Stuart Summers (1):
  drm/i915: Add has_64k_pages flag

 Documentation/gpu/rfc/i915_dg2.rst            |  32 ++++
 Documentation/gpu/rfc/index.rst               |   3 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |   3 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  87 +++++++--
 drivers/gpu/drm/i915/display/intel_fb.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   1 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |   6 +-
 .../drm/i915/display/skl_universal_plane.c    |  68 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   6 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  61 +++++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 ++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   1 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 145 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  14 ++
 drivers/gpu/drm/i915/gt/intel_gt.c            |  19 ++
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  23 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  20 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 167 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  27 ++-
 drivers/gpu/drm/i915/i915_drv.h               |   7 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |  17 ++
 drivers/gpu/drm/i915/i915_pci.c               |   4 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/i915_vma.c               |  55 ++++--
 drivers/gpu/drm/i915/intel_device_info.h      |   3 +
 drivers/gpu/drm/i915/intel_pm.c               |  10 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  96 ++++++----
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |   2 +
 include/uapi/drm/drm_fourcc.h                 |  38 ++++
 include/uapi/drm/i915_drm.h                   |  67 ++++++-
 35 files changed, 909 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

-- 
2.20.1


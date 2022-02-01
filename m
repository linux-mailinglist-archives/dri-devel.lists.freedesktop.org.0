Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13AF4A5A30
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4615D10E896;
	Tue,  1 Feb 2022 10:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8CE10E892;
 Tue,  1 Feb 2022 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712090; x=1675248090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXC9FEBDVQJUEt5eCLBtD8WhVnaTrU+kaqR1lrH9DDM=;
 b=Q7gxt+aOSoweQS+VQu+CCYHcp9s3xLG5RRwGTAkUL8vigjY5G6OAR4AC
 W4zGXdkbZg9ywLsHvVUE8IXlFK7pFe5X5R8KiLf4mvQok7U9RKcXlBp5B
 /0u3i0C+egL9+gOHxMgFIuWhkYwefmqrFB3ABENAK/5Q1WfAB4iuGgKxn
 /xLpt6Op5JZdNVYjXMgY+g+jq6Uq5IxhRLfisc6jEHlD3DYtbxB9jRvp1
 yp7nop9VOwhCa2ETE8ytX9sRg5CG4fBLxVycDycPR8+kP4nGgiIILCEXK
 O5L5Hv01eLJ5Nc1Ou+9gaBtoU5hwA0yiwgoaN7+cfXHGPIgr6+GfLEqBI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020530"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011090"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:27 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 00/19] drm/i915/dg2: Enabling 64k page size and flat ccs
Date: Tue,  1 Feb 2022 16:11:13 +0530
Message-Id: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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
objects.  Specifically the hardware only supports 64K or larger GTT
page sizes for such memory. The kernel will already ensure that all
I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
sizes underneath.

Note that the returned size here will always reflect any required
rounding up done by the kernel, i.e 4K will now become 64K on devices
such as DG2.

Special DG2 GTT address alignment requirement:

The GTT alignment will also need to be at least 2M for such objects.

Note that due to how the hardware implements 64K GTT page support, we
have some further complications:

1) The entire PDE (which covers a 2MB virtual address range), must
contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
PDE is forbidden by the hardware.

2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
objects.

To keep things simple for userland, we mandate that any GTT mappings
must be aligned to and rounded up to 2MB. As this only wastes virtual
address space and avoids userland having to copy any needlessly
complicated PDE sharing scheme (coloring) and only affects DG2, this
is deemed to be a good compromise.

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
I915_FORMAT_MOD_4_TILED_DG2_RC_CCS - used to indicate the buffers of
Flat CCS render compression formats. Though the general layout is same
as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, new hashing/compression
algorithm is used. Render compression uses 128 byte compression blocks

I915_FORMAT_MOD_4_TILED_DG2_MC_CCS -used to indicate the buffers of Flat
CCS media compression formats. Though the general layout is same as
I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, new hashing/compression algorithm
is used. Media compression uses 256 byte compression blocks.

I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC - used to indicate the buffers of
Flat CCS clear color render compression formats. Unified compression
format for clear color render compression. The genral layout is a tiled
layout using 4Kb tiles i.e Tile4 layout. Fast clear color value expected
by HW is located in fb at offset 0 of plane#1

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

v4:
  Rebasing of the patches

v5:
  KDoc is enhanced for cc modifier. [Nanley & Lionel]
  inbuild macro usage for functional fix [Bob]
  Addressed review comments from Matt
  Platform coverage fix for modifiers [Imre]

Abdiel Janulgue (1):
  drm/i915/lmem: Enable lmem for platforms with Flat CCS

Anshuman Gupta (1):
  drm/i915/dg2: Flat CCS Support

Ayaz A Siddiqui (1):
  drm/i915/gt: Clear compress metadata for Xe_HP platforms

CQ Tang (1):
  drm/i915/xehpsdv: Add has_flat_ccs to device info

Matt Roper (1):
  drm/i915/dg2: Add DG2 unified compression

Matthew Auld (6):
  drm/i915: enforce min GTT alignment for discrete cards
  drm/i915: support 64K GTT pages for discrete cards
  drm/i915/gtt: allow overriding the pt alignment
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/migrate: add acceleration support for DG2
  drm/i915/uapi: document behaviour for DG2 64K support

Mika Kahola (1):
  uapi/drm/dg2: Introduce format modifier for DG2 clear color

Ramalingam C (4):
  drm/i915: add needs_compact_pt flag
  Doc/gpu/rfc/i915: i915 DG2 64k pagesize uAPI
  drm/i915/Flat-CCS: Document on Flat-CCS memory compression
  Doc/gpu/rfc/i915: i915 DG2 flat-CCS uAPI

Robert Beckett (1):
  drm/i915: add gtt misalignment test

Stanislav Lisovskiy (2):
  drm/i915: Introduce new Tile 4 format
  drm/i915/dg2: Tile 4 plane format support

 Documentation/gpu/rfc/i915_dg2.rst            |  32 ++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  68 +++-
 drivers/gpu/drm/i915/display/intel_fb.h       |   1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   1 +
 .../drm/i915/display/skl_universal_plane.c    |  70 +++-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 ++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  21 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 158 +++++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  14 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  19 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  31 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 336 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  17 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  24 +-
 drivers/gpu/drm/i915/i915_drv.h               |  18 +-
 drivers/gpu/drm/i915/i915_pci.c               |   4 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/i915_vma.c               |   9 +
 drivers/gpu/drm/i915/intel_device_info.h      |   3 +
 drivers/gpu/drm/i915/intel_pm.c               |   1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 224 ++++++++++--
 include/uapi/drm/drm_fourcc.h                 |  43 +++
 include/uapi/drm/i915_drm.h                   |  44 ++-
 28 files changed, 1102 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

-- 
2.20.1


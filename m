Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A246EFB8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8105510E2B2;
	Thu,  9 Dec 2021 16:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF010E117;
 Thu,  9 Dec 2021 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064765; x=1670600765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KwT0VLZsoPNktxDtG/+UHKdhejWu622/NZrOQpJLTsk=;
 b=UlqDemSW1tn66NwB/3tMoKeQCCdLavqA9zEfJSKbQNAF7U5LAQh08NvD
 n6Us5+h3o44yUaMjqrRoMpL3nMJePAOcyvV7/b6KK6JXGdRqZKJPaJW2K
 RjNrjppyUzDN7Bo3K0woDd2dyVLcotp6iH6Lwoven4pysMZX7wZhPPQNP
 yRTP8n9IzF6HA4L5Oqo0QVxlSqSjmb/kNmWnr2acBhQIiJv6TQGb3LLiu
 VoSy/XVHtnyD7gkCMvB/sdTEFjRdfQ5wSjS7SzgIAg73oY8//IIVuJyPY
 fDDntqttHfYfQxhoR8DHA307QxQ7YR1h5XzV0fxt3oeEtovVqV9CagEKO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298916789"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298916789"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:45:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535091"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:45:49 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 00/16] drm/i915/dg2: Enabling 64k page size and flat ccs
Date: Thu,  9 Dec 2021 21:15:17 +0530
Message-Id: <20211209154533.4084-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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

v4:
  Rebasing of the patches


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

Matthew Auld (7):
  drm/i915/xehpsdv: enforce min GTT alignment
  drm/i915/xehpsdv: support 64K GTT pages
  drm/i915/xehpsdv: implement memory coloring
  drm/i915/gtt: allow overriding the pt alignment
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/migrate: add acceleration support for DG2
  drm/i915/uapi: document behaviour for DG2 64K support

Mika Kahola (1):
  uapi/drm/dg2: Introduce format modifier for DG2 clear color

Ramalingam C (2):
  drm/i915/Flat-CCS: Document on Flat-CCS memory compression
  Doc/gpu/rfc/i915: i915 DG2 uAPI

Stanislav Lisovskiy (1):
  drm/i915/dg2: Tile 4 plane format support

 Documentation/gpu/rfc/i915_dg2.rst            |  32 ++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  68 +++-
 drivers/gpu/drm/i915/display/intel_fb.h       |   1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   1 +
 .../drm/i915/display/skl_universal_plane.c    |  75 +++-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 ++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 175 ++++++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  14 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  19 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   9 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  28 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 338 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  17 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  22 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |  17 +
 drivers/gpu/drm/i915/i915_pci.c               |   2 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/i915_vma.c               |  50 ++-
 drivers/gpu/drm/i915/intel_device_info.h      |   2 +
 drivers/gpu/drm/i915/intel_pm.c               |   1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  96 +++--
 include/uapi/drm/drm_fourcc.h                 |  41 +++
 include/uapi/drm/i915_drm.h                   |  67 +++-
 29 files changed, 1040 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

-- 
2.20.1


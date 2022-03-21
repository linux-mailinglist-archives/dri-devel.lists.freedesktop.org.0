Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581354E32C0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDAC10E05A;
	Mon, 21 Mar 2022 22:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7C310E05A;
 Mon, 21 Mar 2022 22:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902665; x=1679438665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=beTDsanJLIJS77JHg88G3vaK95cfaCaDvvCRAhs8skI=;
 b=TYPLtX++piU6VSbjQDGf8iaKm4/pnvRqjnVWZ4XllMrQu1o26GHU/XcR
 5m7Gz+LqTBYiF+US8/4ca+xnD+ibgou1SXtjrm9vC0k5CSPlPpvgGhrHB
 c4gm9W+xefU/M6F3f+6wTubUkvVhNQbMTumjSWMsRShlgp+yQH5H7SBxM
 8UubdpkQl5X9js8DBFkTV7L0hlisi7g+Tgh5djdQTeyZHdm5SrbT0RI4F
 yWAflLtJCgzd4JANaL3EKj4pPphmrnZjVu2IqAd2U7beVVekiQdewVj+r
 GXV98nZZEnx8GCfnsq2tTSj8m5jxItDbCE/0ArCP1Hd5PnD8SgXkklGwT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257613675"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257613675"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="543414163"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/9] drm/i915/ttm: Evict and restore of compressed object
Date: Tue, 22 Mar 2022 04:14:50 +0530
Message-Id: <20220321224459.12223-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Xe-HP and later devices, we use dedicated compression control
state (CCS) stored in local memory for each surface, to support
the 3D and media compression formats.

The memory required for the CCS of the entire local memory is
1/256 of the local memory size. So before the kernel
boot, the required memory is reserved for the CCS data and a
secure register will be programmed with the CCS base address

So when we allocate a object in local memory we dont need to explicitly
allocate the space for ccs data. But when we evict the obj into the smem
to hold the compression related data along with the obj we need smem
space of obj_size + (obj_size/256).

Hence when we create smem for an obj with lmem placement possibility we
create with the extra space.

When we are swapping out the local memory obj on flat-ccs capable platform,
we need to capture the ccs data too along with main meory and we need to
restore it when we are swapping in the content.

When lmem object is swapped into a smem obj, smem obj will
have the extra pages required to hold the ccs data corresponding to the
lmem main memory. So main memory of lmem will be copied into the initial
pages of the smem and then ccs data corresponding to the main memory
will be copied to the subsequent pages of smem.

Swapin happens exactly in reverse order. First main memory of lmem is
restored from the smem's initial pages and the ccs data will be restored
from the subsequent pages of smem.

Extracting and restoring the CCS data is done through a special cmd called
XY_CTRL_SURF_COPY_BLT

v5:
  Correct locating of ccs data [Thomas]
  Reuse of emit_copy_ccs.
  R-bs picked.

Test-with: 20220314051432.15785-1-ramalingam.c@intel.com

Ramalingam C (9):
  drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on graphics ver 12+
  drm/i915/gt: Optimize the migration and clear loop
  drm/i915/gt: Clear compress metadata for Flat-ccs objects
  drm/i915/selftest_migrate: Consider the possible roundup of size
  drm/i915/selftest_migrate: Check CCS meta data clear
  drm/i915/gt: offset handling for multiple copy engines
  drm/ttm: Add a parameter to add extra pages into ttm_tt
  drm/i915/gem: Add extra pages in ttm_tt for ccs data
  drm/i915/migrate: Evict and restore the flatccs capable lmem obj

 drivers/gpu/drm/drm_gem_vram_helper.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  29 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  20 +
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 409 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/selftest_migrate.c   | 253 ++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 10 files changed, 664 insertions(+), 71 deletions(-)

-- 
2.20.1


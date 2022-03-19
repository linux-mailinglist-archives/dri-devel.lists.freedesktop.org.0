Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D4A4DEAB5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 21:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465EA10E63B;
	Sat, 19 Mar 2022 20:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDBD10E22C;
 Sat, 19 Mar 2022 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722516; x=1679258516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t4c+yRgaotKssQlq7/FbcHF2Dfpe2A/FHgvMK1C0nD8=;
 b=nokno3IAjgyyJR+heY7FrOLM1D/E7fVJ+D7S2mss948ppW2oKmnq34BB
 QzSSN1m+9xRTXKsQAbr7UK6LBHaeMcSxII11Y8pdB8J/sGCglPwnHpszs
 P/mgwh40yJ7guIj6ScHheYyxwVm4qTXvWAglpqGJA6fYkIpZTBx/1cM20
 wQKRuqjz04XB1NxrBWol0pZJPKSevkByfXXvQa9ehW9Y2/s+ds7G+US4j
 N5TlLENk5Z3aTCgfLjJLqeyDug2ZefGUCKyRd+lQbBmZxIZXvzVtL6ugg
 acm9VjXPG9nkHl6fP8PhtnPVQeienD2pXa7RR+9oewOz5iZzvFjPBhDT2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="237270082"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="237270082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:41:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="559244950"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:41:54 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/8] drm/i915/ttm: Evict and restore of compressed object
Date: Sun, 20 Mar 2022 02:12:21 +0530
Message-Id: <20220319204229.9846-1-ramalingam.c@intel.com>
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

v4:
  Inflate the ttm_tt only when the obj is lmem only.
  Back to XY_CTRL_SURF_COPY_BLT to clear the ccs, as FAST_CLEAR_0
							failed.
  Add a selftest for testing the ccs clearing.

Test-with: 20220314051432.15785-1-ramalingam.c@intel.com

Ramalingam C (8):
  drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on graphics ver 12+
  drm/i915/gt: Clear compress metadata for Flat-ccs objects
  drm/i915/selftest_migrate: Consider the possible roundup of size
  drm/i915/selftest_migrate: Check CCS meta data clear
  drm/i915/gt: Optimize the migration loop
  drm/ttm: Add a parameter to add extra pages into ttm_tt
  drm/i915/gem: Add extra pages in ttm_tt for ccs data
  drm/i915/migrate: Evict and restore the flatccs capable lmem obj

 drivers/gpu/drm/drm_gem_vram_helper.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  29 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  20 +
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 404 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/selftest_migrate.c   | 277 +++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 10 files changed, 688 insertions(+), 66 deletions(-)

-- 
2.20.1


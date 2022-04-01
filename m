Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291C4EED3E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B348510E139;
	Fri,  1 Apr 2022 12:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F63510E0A0;
 Fri,  1 Apr 2022 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648816630; x=1680352630;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kfWtvLNFvXKKJmqHPjx1bqkB72+eWUO1BHjOQpO5xOE=;
 b=d6lfncPbA0fQCSQO42oUrkzmtehghOHlSypksefvHnE/JG/1cdHBcTlv
 +a3KelPJY/gOKGK7AKy43d7JJwQ/s9jpiFpVuT8WSold9p0GltQuwBxAA
 Ie81oz9QQ2p3WFsUqQa+1dQDhpkxSsrYZmOoRE83wLmp4dUfNgZR6Mk1V
 LyrAxpUK7LVRZq+bs4K9TbRlpCB5R1iXYRVQlOZtUp7oX8QP9bdT+5BHX
 g4QLxoX8K4E2Vs4xGaEf/cOyvJY3632fQ1QZEdz9tzRGPFubxbrfZXZHM
 +oVQCgKPfaAGIN1Fd5ryKg+/0M9jFO37KfC4G5KB5bCqEOVrM7BaXsPUs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257708051"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257708051"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="606725169"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:08 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/9] drm/i915/ttm: Evict and restore of compressed object
Date: Fri,  1 Apr 2022 18:07:42 +0530
Message-Id: <20220401123751.27771-1-ramalingam.c@intel.com>
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

v7:
  GEM_BUG_ON is added for catching if inflated pages are filled for
    get_pages
  Optimised emit_copy_clear
  Engine index is directly used for the upper 32 bits of offset
  Use FAT_COLOR_BLT only for FLAT_CCS capable platforms

Resending with updated igt version for test with.

Test-with: 20220401074527.15709-2-ramalingam.c@intel.com

Ramalingam C (9):
  drm/i915/gt: use engine instance directly for offset
  drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on graphics ver 12+
  drm/i915/gt: Optimize the migration and clear loop
  drm/i915/gt: Clear compress metadata for Flat-ccs objects
  drm/i915/selftest_migrate: Consider the possible roundup of size
  drm/i915/selftest_migrate: Check CCS meta data clear
  drm/ttm: Add a parameter to add extra pages into ttm_tt
  drm/i915/gem: Add extra pages in ttm_tt for ccs data
  drm/i915/migrate: Evict and restore the flatccs capable lmem obj

 drivers/gpu/drm/drm_gem_vram_helper.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  30 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  21 +
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 387 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/selftest_migrate.c   | 253 ++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 10 files changed, 642 insertions(+), 73 deletions(-)

-- 
2.20.1


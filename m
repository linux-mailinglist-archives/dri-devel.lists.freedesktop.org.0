Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0072D4E9F69
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A2410E9BA;
	Mon, 28 Mar 2022 19:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048610E966;
 Mon, 28 Mar 2022 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494420; x=1680030420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4jSgDosF8PE3lKPs5HTDsyoNwLi2b9dl3OmN2PHCy60=;
 b=dYy6W1jQMqdGTG+6/EaRDhjr4lLmeNkbofxtHzX9xz4yP2bThJT8E2rI
 3rKCgRFIPtC/tN3S1IJTIMgzmM69+JqEqnA+xoRpDA+8SjriIJF0SOuuZ
 STFpjFBh0jftuX3NaH68QGKUIXriB6bmANrbjo4TpHAAzBVFYOd0aamdd
 Oa+HUEcrwo9XzDtAuMDbsAkcyfol6luwzCpvnzt3QEtRqEJATv7kJC5/v
 gt87ApMcsLlHioMZbfmgFZoGDZTU7i1K9r/TZMXH0Fmlsa3Pd+cr65QN7
 C4jlvEOnooww/OWlfCMOWOYtMGMiclN6wazsEMrGPtVPhfw/Z4xFf+em3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678666"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678666"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:06:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563920869"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:06:56 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/9] drm/i915/ttm: Evict and restore of compressed object
Date: Tue, 29 Mar 2022 00:37:27 +0530
Message-Id: <20220328190736.19697-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
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

Test-with: 20220314051432.15785-1-ramalingam.c@intel.com

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
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 391 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/selftest_migrate.c   | 253 ++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 10 files changed, 644 insertions(+), 75 deletions(-)

-- 
2.20.1


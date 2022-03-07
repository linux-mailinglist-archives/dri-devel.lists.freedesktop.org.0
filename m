Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D994C4D0041
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3420B10E829;
	Mon,  7 Mar 2022 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC610E6E6;
 Mon,  7 Mar 2022 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646660415; x=1678196415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LX1mRjzUQl1Oq5usoOQ+HQ9DNzBd3x2I8OHaXvbweB0=;
 b=QYwzqSyZRE6697+5ZUmVDTOm1mdcsFdWM1AqB+HvX98KoVPfYpZqjdVx
 ibYbKiMLMXygsWaSuBLhk1eqepvtkxwqUDTfoOEoUoosXxzzFWuE4WqY5
 bJ3qBFbkyUhPr0nlP3BOR22ZC0ILjn9OghYX2C9a9iuLJB19Uz9rB95Jg
 7ajguEB5bvPXthq1F1TEVZDiunM5OGQcpX2wSALju2RDvh7XZfOy56VjN
 29ttNzba6tlz54fDLn8nS0iLpguliJhojOpFWP9oAPquCUEbM/DHd3IZ1
 ZDgLObMfHOQKn8qW20x9gw9U7bYz8MnvzgTCBtz8tZy1NFQ7BbZ75qB0Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="251963941"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="251963941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643248079"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:12 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/6] drm/i915/ttm: Evict and restore of compressed object
Date: Mon,  7 Mar 2022 19:10:32 +0530
Message-Id: <20220307134038.30525-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
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

v3:
  Fast_Clear_0 is used for clearing the ccs data on obj allocation [Thomas]
  Migration of main memory and ccs data are done in single request [Thomas]
  Small optimization patch is added for the migration loop
  CCS clearing is split into two patches.

Test-with: 20220307121042.23287-4-ramalingam.c@intel.com

Ramalingam C (6):
  drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on graphics ver 12+
  drm/i915/gt: Clear compress metadata for Flat-ccs objects
  drm/ttm: Add a parameter to add extra pages into ttm_tt
  drm/i915/gem: Add extra pages in ttm_tt for ccs data
  drm/i915/gt: Optimize the migration loop
  drm/i915/migrate: Evict and restore the flatccs capable lmem obj

 drivers/gpu/drm/drm_gem_vram_helper.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  23 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  23 ++
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 390 +++++++++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 9 files changed, 421 insertions(+), 39 deletions(-)

-- 
2.20.1


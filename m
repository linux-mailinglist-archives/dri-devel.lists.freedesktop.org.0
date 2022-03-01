Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E454C97EF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 22:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFA010E391;
	Tue,  1 Mar 2022 21:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D40C10E38B;
 Tue,  1 Mar 2022 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646171594; x=1677707594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mm176PIuzXWAZtxR6x0BC8QUH7PyO/xIkoCrEs+en9A=;
 b=IfyIFMxFwBgeYmKFuR4idbWt409E1MKT+jlLcxctde6LwxEMagpUfWRC
 hGlzvGWm6twqZJ7rSB7A4iT2tyGgjOUrjKo1We8mr3sYMOLvajPOw7pPX
 GQ954ixT3CJy+mb10Pe/p0UnsvPLvKTFGcxSBbyCBDmkucFzWjfME5NKA
 xSOcpLTpZpxH7CUBEbDpvuJ7bQFj9VkaXAPBLmRVnVWaARNmIOizmOMi4
 MpOF8y6fVfHzSJq2KkyvhV7RTqlHkkZa5ZpmDm4nh/3jIBA341vxwNE8X
 AlvyvgSrwSZXRjlzgDH/PG5DYfvXoCFPA4rACVcjeZe882TQWuzTXVubr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="277922705"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="277922705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:53:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="510704609"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:53:11 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/4] drm/i915/ttm: Evict and store of compressed object
Date: Wed,  2 Mar 2022 03:23:30 +0530
Message-Id: <20220301215334.20543-1-ramalingam.c@intel.com>
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

Test-with: 20220301212513.30772-1-ramalingam.c@intel.com

Ayaz A Siddiqui (1):
  drm/i915/gt: Clear compress metadata for Xe_HP platforms

Ramalingam C (3):
  drm/ttm: parameter to add extra pages into ttm_tt
  drm/i915/gem: Extra pages in ttm_tt for ccs data
  drm/i915/migrate: Evict and restore the flatccs capable lmem obj

 drivers/gpu/drm/drm_gem_vram_helper.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  23 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  15 +
 drivers/gpu/drm/i915/gt/intel_migrate.c      | 327 +++++++++++++++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c        |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                 |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c   |   2 +-
 include/drm/ttm/ttm_tt.h                     |   4 +-
 9 files changed, 357 insertions(+), 32 deletions(-)

-- 
2.20.1


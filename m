Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CC82F356
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB9210E0B6;
	Tue, 16 Jan 2024 17:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08DD10E37C;
 Tue, 16 Jan 2024 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705426954; x=1736962954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+BFNLqD+08tXQUMYOfU7xh9v72QOdYxbfICmSM4FVR8=;
 b=NT16B8PS8av3HoQU9ep7Tmt1O88YbbnrLcHrZ/k/bYdR1HTmgxHr2MyS
 7pWP8wtFxmpUnwIGhGhVZWRCtTjpcnfzep48xLkkwBH+r3Y+Vq7RqUlYV
 XFngGNAPaArwbGlAAaDqRS7pqBCmVn4geC6wLt1WMO0XhMLkUY3HxHHt4
 yiiZRLrjyFrR69jLu7Clf+IJHsz64AYfdHS8e+DjyL4g4SUTiTxVyII0J
 HSwy83I8EW2SHGXarPcV0Eq8eqc95QyyT1T7Ywf95rFqhs29+iJAFjzi/
 SCd6yfo2CeQmtep20orkqrD3z7+GRPBOLjIg2L0CvDjzk7jRBB/OTfqVd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13288225"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13288225"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927555526"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927555526"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/xe/mmio: Cast to u64 when printing
Date: Tue, 16 Jan 2024 09:40:47 -0800
Message-Id: <20240116174050.2435923-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116174050.2435923-1-lucas.demarchi@intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oak Zeng <oak.zeng@intel.com>, "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

resource_size_t uses %pa format in printk since the size varies
depending on build options. However to keep the io_size/physical_size
addition in the same call we can't pass the address without adding yet
another variable in these function. Simply cast it to u64 and keep using
%llx.

Fixes: 286089ce6929 ("drm/xe: Improve vram info debug printing")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c8c5d74b6e90..5f6b53ea5528 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -272,8 +272,8 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
 			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
 		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
-- 
2.40.1


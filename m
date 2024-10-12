Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C099B056
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 05:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB5A10EB64;
	Sat, 12 Oct 2024 03:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVbDujtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046310E12D;
 Sat, 12 Oct 2024 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728702576; x=1760238576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ebo1SegaNMj89+yiH94zvaeAmGSEGTceF7n5dRd9dfM=;
 b=UVbDujtJZQaaobEKe+ml+CZ+P0Db3szF5y0GI/8hW2Yv3bREkNfcr+mi
 a7QXxrJdNRyqE5zVjROZyu9yYyhuhV7zA06peynnBx5hiy7BKl+TRcWuD
 ktpEBn02CR+WkG0q0EXkUv5a2qC8+8aK32xPoa8K58VXmfrfkpXweuBOz
 w/x0QquyF1Ci28/d19CUkxutAHujyX/GluX+OOoVR75WyZ6xEAYJiQeVR
 ZrTFTeVB0qlYsct0zciurXmp+d4WKrDSXl/9smwXJmo0OP+molho3lLZa
 v7poe59/8108jEfqu5IJvDwW+3ZCbsJufTmsF7pOfL+l9zC5qwUTQL0k4 A==;
X-CSE-ConnectionGUID: H4qW9KXkRo6GDmkhvJ70jw==
X-CSE-MsgGUID: JWX5yfGySo+Bg8+8PbbApQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38687323"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38687323"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
X-CSE-ConnectionGUID: 2IdKiDezTVCJBdRBsDXTKw==
X-CSE-MsgGUID: I2IIRz82T4acY+quH5+Nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77278470"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v1 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while updating PTEs
Date: Fri, 11 Oct 2024 19:40:27 -0700
Message-ID: <20241012024524.1377836-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
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

If a BO's is_devmem_external flag is set, it means that it is an
imported dmabuf BO that has a backing store in VRAM. Therefore, we
need to add XE_PPGTT_PTE_DM to the PTE flags as part of vm_bind.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f27f579f4d85..909e5b96d518 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -660,10 +660,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
 	}
 
-	if (is_devmem) {
+	if (is_devmem || bo->is_devmem_external)
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
+
+	if (is_devmem)
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
-	}
 
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
-- 
2.45.1


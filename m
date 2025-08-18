Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B7B2AC91
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA910E487;
	Mon, 18 Aug 2025 15:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InZGBvV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19DE10E484;
 Mon, 18 Aug 2025 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530527; x=1787066527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vq9OkSCHcyIFia/Mk7P35FL6r6tGYjX3DXE88rGjJMc=;
 b=InZGBvV5vlPjHUhjP9MLbXc9kLCGk572+emrtKhGSU2twYf2+pHGm6Jn
 9OUWhpynEcXEIJG0LLGMJHGBCpska8Xt0sS0DGZi3X/CeuCvx54HM8hdE
 w8OzgdQRwEVzDsUx15e2elHzcVnRMT/A9031mdK24J9cQO9c7EGoCV8ol
 7Jy8Z5DNDe9sUdsKpEFYrFdk7I72oyj9UMUuKO8CPornpy/8pXZB+uJHj
 mqCJr7iENgXb5G4hvXsnI+iHyEItQFkfjsM02219My352hzwkbnUiuI0m
 Eq2mtwxXL4IwxNb1chIDOf8B6Aou8wGyWG5ZFe486AUevFHolMSC8IpJ7 w==;
X-CSE-ConnectionGUID: 2amMSeWITK68IXz2jzhqFw==
X-CSE-MsgGUID: 0G7ku3rdQlWLTVTgObfw2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205838"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69205838"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:07 -0700
X-CSE-ConnectionGUID: wjQnv5dLRoeZ6zTTD/Es6A==
X-CSE-MsgGUID: rGkZ6ZboRt24idl9O2w5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171837215"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 2/8] drm/gpusvm: use more selective dma dir in get_pages()
Date: Mon, 18 Aug 2025 16:21:55 +0100
Message-ID: <20250818152152.67815-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818152152.67815-10-matthew.auld@intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we are only reading the memory then from the device pov the direction
can be DMA_TO_DEVICE. This aligns with the xe-userptr code. Using the
most restrictive data direction to represent the access is normally a
good idea.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 50a36e7b71e2..a6cb44e3f33e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1296,6 +1296,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_range_flags flags;
+	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
+							   DMA_BIDIRECTIONAL;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1401,7 +1403,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
-							  DMA_BIDIRECTIONAL);
+							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
 					      range->dma_addr[j].addr)) {
 				err = -EFAULT;
@@ -1423,7 +1425,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
-					    DMA_BIDIRECTIONAL);
+					    dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
 				err = -EFAULT;
 				goto err_unmap;
@@ -1431,7 +1433,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 			range->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
-				 DMA_BIDIRECTIONAL);
+				 dma_dir);
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-- 
2.50.1


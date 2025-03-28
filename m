Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DACA75032
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316C10EA8D;
	Fri, 28 Mar 2025 18:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPLyUcDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F110EA86;
 Fri, 28 Mar 2025 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185462; x=1774721462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayzN+NeFrYSCzuDyMnZ2RH3Yji7YypMe41Ui0R8eT/k=;
 b=dPLyUcDoa2NjXn/MRWXHKlBR9vz58roOEc0TdXuMdB1h0mPdeiOSMDTE
 RYoctUdKogPGBUeXJvJRlVcmRgiuIw8zwFxs1YLAZPZUMwZPDdo7uzIDw
 z4/CKSTTW+iOJDUB8hexzZXgTiDFMpSjio+xO9iC65q2PtTeF3B6yYr3e
 bdpLpxGSdt4BEcJyi0vRw+w6o0lvrl+Thj6LOur0ZuepaoRo6noLME8Dl
 LUC+MYYyxLRLTyUPDmY7YM4EG00IRAkzdRuH7ZDIWU2+HBq0iqeKdwZt/
 UcCwk8aj/sRV+7C4V6GEdIy9vGx72nyytc9qpBjoaVn4KVgRXao53q8TR Q==;
X-CSE-ConnectionGUID: ngVVwsQ1SL2T/xHU5ki00w==
X-CSE-MsgGUID: 6twS4jrkSfOc41ETDDABsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55926122"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55926122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:01 -0700
X-CSE-ConnectionGUID: 7lDW8n5GQFWiuu7cZOvtMA==
X-CSE-MsgGUID: jSerzffaSUaYuQT3zlT0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156435995"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/7] drm/gpusvm: use more selective dma dir in get_pages()
Date: Fri, 28 Mar 2025 18:10:31 +0000
Message-ID: <20250328181028.288312-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
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
index 07dda042624c..e0c8d450752a 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1363,6 +1363,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
+	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
+							   DMA_BIDIRECTIONAL;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1467,7 +1469,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
-							  DMA_BIDIRECTIONAL);
+							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
 					      range->dma_addr[j].addr)) {
 				err = -EFAULT;
@@ -1486,7 +1488,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
-					    DMA_BIDIRECTIONAL);
+					    dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
 				err = -EFAULT;
 				goto err_unmap;
@@ -1494,7 +1496,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 			range->dma_addr[j] = drm_pagemap_device_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
-				 DMA_BIDIRECTIONAL);
+				 dma_dir);
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-- 
2.48.1


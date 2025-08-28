Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA93B3A190
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A155A10E9EA;
	Thu, 28 Aug 2025 14:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHb97+XS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499410E9E5;
 Thu, 28 Aug 2025 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391159; x=1787927159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3q1xdU8+HAqfz6p5e2Ws0RJbNrP9S9ACc2SmoYGrIBI=;
 b=PHb97+XSKbU9g7IXrOA4b8QSLOZG28so3uPNjgfAjCvP/qCrVSdWuNi2
 ynMiVFkvG4kYfQLpOiBqYZ/Bjt3oPYC7pVrUD+MKlkyeKLatZyYwnF2Ln
 +lYVc5HAeDkxXhPFfjfz5+N6pHn24TEpIKUaQWkESZqPbz3TFuDcZaKUe
 y+RaoiUUf/DqAvCfvs5KOOFahBvxyDBTFDrOZlPvJm9I+BT2DUu993AY3
 H1NUH2+NKB8R/c5eaWm8kv9nlW6trCUM0v20DWoqRKJCt7OFvzNqIS8q2
 9i+4NEUzeC+MwbhZJ0DBURc3GADZ2A3EWBs7te6XU9elCxIZO9lOFFF85 g==;
X-CSE-ConnectionGUID: xAIFD0lbQIiUySSbFYqfvQ==
X-CSE-MsgGUID: dHzEq9Q1Tc2CaeBrSnSKcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763192"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763192"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:25:59 -0700
X-CSE-ConnectionGUID: XamXG62VSaqjGdvJiOtRKg==
X-CSE-MsgGUID: bl3wmJL0Qwa6KghWXzRKbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025864"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:25:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 2/8] drm/gpusvm: use more selective dma dir in get_pages()
Date: Thu, 28 Aug 2025 15:24:33 +0100
Message-ID: <20250828142430.615826-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828142430.615826-10-matthew.auld@intel.com>
References: <20250828142430.615826-10-matthew.auld@intel.com>
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
index 49f64d26625d..b2920b8551f5 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1224,6 +1224,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_range_flags flags;
+	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
+							   DMA_BIDIRECTIONAL;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1329,7 +1331,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
-							  DMA_BIDIRECTIONAL);
+							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
 					      range->dma_addr[j].addr)) {
 				err = -EFAULT;
@@ -1351,7 +1353,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
-					    DMA_BIDIRECTIONAL);
+					    dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
 				err = -EFAULT;
 				goto err_unmap;
@@ -1359,7 +1361,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 			range->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
-				 DMA_BIDIRECTIONAL);
+				 dma_dir);
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-- 
2.51.0


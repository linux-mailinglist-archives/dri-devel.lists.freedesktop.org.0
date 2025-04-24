Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97FA9AD1A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80BF10E7DF;
	Thu, 24 Apr 2025 12:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdH0qAm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A6E10E7DE;
 Thu, 24 Apr 2025 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745497128; x=1777033128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZlP/QlT9D+tqkLb524RXAGEAsBglh4HMKb2bhZEx4z0=;
 b=hdH0qAm/ZxS1S3fCRkL7U+uflSxUrsk74o8GLyFy7icl0FHoDqcsfb+C
 BdDM5q3jYljR0bSzxQzAD9YAIBtQf/ldb936W0NLx4QKsN4lOYZuFtI/Q
 JL1U8eCbgjrgwLNjTIZpzz/h2Xub3XpWoUkDKkly/NlcNvzT8TFWimmB0
 pckOAvnCIpA/qu4Vn+BSLeoDVItdepuoW//JUg4UMJCKHwtCFjapr3H2H
 YoKtJ3+4O9lCt4SlE8tvoye/rN+n+UYZnXniUJtBF1eb0QOHc4A4qVRzr
 LKagZ30C6/5qz32In9jISQRnYsWCkE4VB9500ZnrEaxVir+2rrpxl1xZ8 g==;
X-CSE-ConnectionGUID: VnSk+JWRSfCUuRjK45DC2g==
X-CSE-MsgGUID: 9QyrPWCBRNSEv4NtxSV6kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50947937"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50947937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:48 -0700
X-CSE-ConnectionGUID: Otjv4HAuQW626a6lGh/GXw==
X-CSE-MsgGUID: 2wGEBvQzRAWm0qf+TG6g0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137589384"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/7] drm/gpusvm: use more selective dma dir in get_pages()
Date: Thu, 24 Apr 2025 13:18:30 +0100
Message-ID: <20250424121827.862729-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
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
index a2842a112ba0..d40a01524387 100644
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
2.49.0


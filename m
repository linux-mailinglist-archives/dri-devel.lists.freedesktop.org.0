Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F1AB3B9D
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA3310E43F;
	Mon, 12 May 2025 15:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GErNkOed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4931B10E438;
 Mon, 12 May 2025 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747062417; x=1778598417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+UCCE9x47S//JOd07gLtkCwdD8JrSfheWOEbksTugE=;
 b=GErNkOedSzYZPhIYLxJLOPuMFdxFT5HFMhS9xs8HzVM9C1pCk+1QiYwy
 MVmoBYMdQhar33bLD4Q4T9TzAm4kyQ9eFji8r7RKdMliVlfSHzxndidiJ
 SubP5JYIom5u3LN6txebPX1r7SonmCtjN6UKafjQ2M+bzGClefz7RtCTv
 kfyuKQDJusNh1PTBko0d+1SETQsCXBFjsS2RUPrgveyiWgLCTztDKPP9s
 hHIbv0qAu9oHfEJy7fzMdMDx0GpCP44b0TQKOBpCf9F7K/bt2ANjDRBaZ
 ftKdUo/nNOYZjH7KCFgqA0kbBRC4V7kPSk+Pn3AxE6ku/LI720BJ0GSUR A==;
X-CSE-ConnectionGUID: tQZG8wegSUSLPvDyeRz/Aw==
X-CSE-MsgGUID: 2gRhr3YwQZ6XhgkSV7ph9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71377054"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="71377054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:57 -0700
X-CSE-ConnectionGUID: MbWUkkCuQ4K5jxUxVSTQAw==
X-CSE-MsgGUID: BcM/38dITemRMZfQkhOH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137916548"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 2/8] drm/gpusvm: use more selective dma dir in get_pages()
Date: Mon, 12 May 2025 16:06:40 +0100
Message-ID: <20250512150637.61462-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512150637.61462-10-matthew.auld@intel.com>
References: <20250512150637.61462-10-matthew.auld@intel.com>
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
index abb78e06e810..949334ca3f5c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1362,6 +1362,8 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
+	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
+							   DMA_BIDIRECTIONAL;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1465,7 +1467,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
-							  DMA_BIDIRECTIONAL);
+							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
 					      range->dma_addr[j].addr)) {
 				err = -EFAULT;
@@ -1482,7 +1484,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
-					    DMA_BIDIRECTIONAL);
+					    dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
 				err = -EFAULT;
 				goto err_unmap;
@@ -1490,7 +1492,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 			range->dma_addr[j] = drm_pagemap_device_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
-				 DMA_BIDIRECTIONAL);
+				 dma_dir);
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-- 
2.49.0


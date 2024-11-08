Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AE9C1F75
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1E410E9DB;
	Fri,  8 Nov 2024 14:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Dh7NHJMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBF910E9D9;
 Fri,  8 Nov 2024 14:37:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731076634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puMK3tZ6hX81FClc+8KRmHVrx6kvND1x2bgZSkomJhE=;
 b=Dh7NHJMOoT/k5c5YYk+R8acRm+PFutkIehud0L1v/wUCXkEzklRXPa1fVJY0D7wxA7PuLd
 PpwHal/CxzP3fSefKEO3qpZNhEKfILHqDmrNVJWItXTUZcwsFamT7wPmEz00UNeJccr4Zk
 CRiiZJPrpzYsvzEs88jNTKQvcSm79xM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 2/2] drm/etnaviv: Remove the etnaviv_iommuv2_ensure_stlb()
Date: Fri,  8 Nov 2024 22:36:58 +0800
Message-Id: <20241108143658.2229786-2-sui.jingfeng@linux.dev>
In-Reply-To: <20241108143658.2229786-1-sui.jingfeng@linux.dev>
References: <20241108143658.2229786-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The etnaviv_iommuv2_ensure_stlb() function have been replaced by the
etnaviv_iommuv2_ensure_stlb_new(), remove it.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index fa6eed1ae1be..65b91eabb278 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -113,30 +113,6 @@ static void etnaviv_iommuv2_free(struct etnaviv_iommu_context *context)
 	vfree(v2_context);
 }
 
-static int
-etnaviv_iommuv2_ensure_stlb(struct etnaviv_iommuv2_context *v2_context,
-			    int stlb)
-{
-	if (v2_context->stlb_cpu[stlb])
-		return 0;
-
-	v2_context->stlb_cpu[stlb] =
-			dma_alloc_wc(v2_context->base.global->dev, SZ_4K,
-				     &v2_context->stlb_dma[stlb],
-				     GFP_KERNEL);
-
-	if (!v2_context->stlb_cpu[stlb])
-		return -ENOMEM;
-
-	memset32(v2_context->stlb_cpu[stlb], MMUv2_PTE_EXCEPTION,
-		 SZ_4K / sizeof(u32));
-
-	v2_context->mtlb_cpu[stlb] =
-			v2_context->stlb_dma[stlb] | MMUv2_PTE_PRESENT;
-
-	return 0;
-}
-
 static int etnaviv_iommuv2_map(struct etnaviv_iommu_context *context,
 			       unsigned long iova, phys_addr_t paddr,
 			       size_t size, int prot)
-- 
2.34.1


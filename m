Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D59B35BC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9535710E506;
	Mon, 28 Oct 2024 16:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VRVTOLDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2AA10E501
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:06:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730131570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fgCoZ4y8qaSWJDKKpZIzzsuVRy80/hcDc4rWHf1ZQg=;
 b=VRVTOLDMo6HNt4BGNxUImZTt1Xb2NCdCwPIOTa539wo2OUqKTlX5ysy4s2eWAAJGWNnvSc
 6uMk0SAsQKR0z0OYWRllvzWjMewpTWRIWt/9AXaaW/ZvKNsaU6eTZWTYsLCq8sFQ25qiQD
 Tn7Vv55bk4uC0sSf5kzK4OadFSPT8qI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 2/2] drm/etnaviv: Fix the debug log for the mmu map/unmap
 procudure
Date: Tue, 29 Oct 2024 00:05:55 +0800
Message-Id: <20241028160555.1006559-2-sui.jingfeng@linux.dev>
In-Reply-To: <20241028160555.1006559-1-sui.jingfeng@linux.dev>
References: <20241028160555.1006559-1-sui.jingfeng@linux.dev>
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

The 'iova' variable is invarant within one invoke of the
etnaviv_iommu_unmap()/etnaviv_iommu_unmap(), which means that the
debug log always print the same GPU virtual address while mapping
or unmaping.

Made the GPU virtual address being printed increment with real GPUVA
being mapped or unmapped.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 4ee9ed96b1d8..f6c997c459ca 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -83,7 +83,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 		dma_addr_t pa = sg_dma_address(sg) + sg->offset;
 		unsigned int bytes = sg_dma_len(sg) - sg->offset;
 
-		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
+		VERB("map[%d]: %08x %pap(%x)", i, da, &pa, bytes);
 
 		ret = etnaviv_context_map(context, da, pa, bytes, prot);
 		if (ret)
@@ -113,7 +113,7 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 
 		etnaviv_context_unmap(context, da, bytes);
 
-		VERB("unmap[%d]: %08x(%x)", i, iova, bytes);
+		VERB("unmap[%d]: %08x(%x)", i, da, bytes);
 
 		BUG_ON(!PAGE_ALIGNED(bytes));
 
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C49BBE7B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564BC10E4C3;
	Mon,  4 Nov 2024 20:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="tsNzNLon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1EB10E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 20:04:11 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730750649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+Cctltnj8jUTfRPzXWg7X11ZIlWeCkuZhPa7klvD+M=;
 b=tsNzNLonLnVwGYjHKHR5pndwa0CTcCHa1fkmIv1OZoDAGgf2SOAzTYcs1AW9APE7KXii7X
 rywSqhbS0+AEi2917D4rrYRiSnWpUHUXJlU5aNJHsE3DnmEpVI9sxJ8x3dE01Gxe7gCX2b
 ebJRVJE19zFB/IS3KSC1VwpJUZ+xfmQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v2 1/3] drm/etnaviv: Drop offset in page manipulation
Date: Tue,  5 Nov 2024 04:03:52 +0800
Message-Id: <20241104200354.656525-2-sui.jingfeng@linux.dev>
In-Reply-To: <20241104200354.656525-1-sui.jingfeng@linux.dev>
References: <20241104200354.656525-1-sui.jingfeng@linux.dev>
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

The 'offset' data member of the 'struct scatterlist' denotes the offset
into a SG entry in bytes. But under drm subsystem, there has nearly NO
drivers that actually tough the 'offset' data member of SG anymore.
Especially for drivers that could contact with drm/etnaviv. This means
that all DMA addresses that sg_dma_address() gives us will be PAGE_SIZE
aligned, in other words, sg->offset will  always equal to 0.

Drop those compulations about the offset of SG entries can save some
extra overhead.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 8f33f111f9e8..ddb536d84c58 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -82,8 +82,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context,
 		return -EINVAL;
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
-		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
-		unsigned int da_len = sg_dma_len(sg) + sg->offset;
+		phys_addr_t pa = sg_dma_address(sg);
+		unsigned int da_len = sg_dma_len(sg);
 		unsigned int bytes = min_t(unsigned int, da_len, va_len);
 
 		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
-- 
2.34.1


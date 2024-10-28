Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8529B35BB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA0710E505;
	Mon, 28 Oct 2024 16:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="UKLLVBEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267A110E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:06:09 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730131566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/zD5LNzI7jNYc5R6fYyO0FnToFM91b5X4KSLN/CxbiE=;
 b=UKLLVBEt8ozNUooEbsYp0mcQHO4AfYPCRLjLSMc0AQ6cMLhCHXMejlYCjTlj+KobSjOcQx
 rUOERdGZ+324zXBWgYX6ZQoObtIy+vDmDgv0qb81b5jfXHBKv1KuAW6vRpJv9eO20bL7u9
 vfvwPic/XhUmhlvxKND480qOliwX33Y=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/2] drm/etnaviv: Fix misunderstanding about the scatterlist
 structure
Date: Tue, 29 Oct 2024 00:05:54 +0800
Message-Id: <20241028160555.1006559-1-sui.jingfeng@linux.dev>
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
into a SG entry in bytes. The sg_dma_len() macro could be used to get
lengths of SG entries, those lengths are expected to be CPU page size
aligned. Since, at least for now, we call drm_prime_pages_to_sg() to
convert our various page array into an SG list. We pass the number of
CPU page as the third argoument, to tell the size of the backing memory
of GEM buffer object.

drm_prime_pages_to_sg() call sg_alloc_table_from_pages_segment() do the
work, sg_alloc_table_from_pages_segment() always hardcode the Offset to
ZERO. The sizes of *all* SG enties will be a multiple of CPU page size,
that is multiple of PAGE_SIZE.

If the GPU want to map/unmap a bigger page partially, we should use
'sg_dma_address(sg) + sg->offset' to calculate the destination DMA
address, and the size to be map/unmap is 'sg_dma_len(sg) - sg->offset'.

While the current implement is wrong, but since the 'sg->offset' is
alway equal to 0, drm/etnaviv works in practice by good luck. Fix this,
to make it looks right at least from the perspective of concept.

while at it, always fix the absue types:

- sg_dma_address returns DMA address, the type is dma_addr_t, not
  the phys_addr_t, for VRAM there may have another translation between
  the bus address and the final physical address of VRAM or carved out
  RAM.

- The type of sg_dma_len(sg) return is unsigned int, not the size_t.
  Avoid hint the compiler to do unnecessary integer promotion.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 1661d589bf3e..4ee9ed96b1d8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -80,10 +80,10 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 		return -EINVAL;
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
-		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
-		size_t bytes = sg_dma_len(sg) + sg->offset;
+		dma_addr_t pa = sg_dma_address(sg) + sg->offset;
+		unsigned int bytes = sg_dma_len(sg) - sg->offset;
 
-		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
+		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
 
 		ret = etnaviv_context_map(context, da, pa, bytes, prot);
 		if (ret)
@@ -109,11 +109,11 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 	int i;
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
-		size_t bytes = sg_dma_len(sg) + sg->offset;
+		unsigned int bytes = sg_dma_len(sg) - sg->offset;
 
 		etnaviv_context_unmap(context, da, bytes);
 
-		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
+		VERB("unmap[%d]: %08x(%x)", i, iova, bytes);
 
 		BUG_ON(!PAGE_ALIGNED(bytes));
 
-- 
2.34.1


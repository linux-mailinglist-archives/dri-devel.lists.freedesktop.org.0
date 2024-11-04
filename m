Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E29BBE7F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EE610E4CB;
	Mon,  4 Nov 2024 20:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MxMUUdvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2B610E4C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 20:04:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730750656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap8kfns4e0QzWlHcRchP0CB0jDssm0nIfPQZQM5uY6E=;
 b=MxMUUdvXRP8ULES+/xmT/L4Q70mtUkTb/nb0vQC46GxLEq5UVRT/iNZW0D2IG6LGIreX41
 xiAODPKtPhzT/YmwYfHOD9w7PbyF7Kemi6kPB1rnMjPq3B3dXXIIDyc7wEF79nJGcqlFzI
 UILx1Gt7bCbMwaeinYTxk+GRX7bNEqE=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v2 3/3] drm/etnaviv: Improve VA, PA,
 SIZE alignment checking
Date: Tue,  5 Nov 2024 04:03:54 +0800
Message-Id: <20241104200354.656525-4-sui.jingfeng@linux.dev>
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

We only need checking the alignment on the upper caller function, if those
address and/or sizes are pass the check. Those address will certainly pass
the same test under the etnaviv_context_unmap() function.

Remove redundant alignment tests in etnaviv_context_unmap() and move the
alignment tests to the upper caller etnaviv_iommu_map() function. Which
reduce some extra overhead.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 05021848126e..56ae2de76e15 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -19,12 +19,6 @@ static void etnaviv_context_unmap(struct etnaviv_iommu_context *context,
 	size_t unmapped_page, unmapped = 0;
 	size_t pgsize = SZ_4K;
 
-	if (!IS_ALIGNED(iova | size, pgsize)) {
-		pr_err("unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%zx\n",
-		       iova, size, pgsize);
-		return;
-	}
-
 	while (unmapped < size) {
 		unmapped_page = context->global->ops->unmap(context, iova,
 							    pgsize);
@@ -45,12 +39,6 @@ static int etnaviv_context_map(struct etnaviv_iommu_context *context,
 	size_t orig_size = size;
 	int ret = 0;
 
-	if (!IS_ALIGNED(iova | paddr | size, pgsize)) {
-		pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%zx\n",
-		       iova, &paddr, size, pgsize);
-		return -EINVAL;
-	}
-
 	while (size) {
 		ret = context->global->ops->map(context, iova, paddr, pgsize,
 						prot);
@@ -88,6 +76,14 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context,
 
 		VERB("map[%d]: %08x %pap(%x)", i, da, &pa, bytes);
 
+		if (!IS_ALIGNED(iova | pa | bytes, SZ_4K)) {
+			dev_err(context->global->dev,
+				"unaligned: iova 0x%x pa %pa size 0x%x\n",
+				iova, &pa, bytes);
+			ret = -EINVAL;
+			goto fail;
+		}
+
 		ret = etnaviv_context_map(context, da, pa, bytes, prot);
 		if (ret)
 			goto fail;
-- 
2.34.1


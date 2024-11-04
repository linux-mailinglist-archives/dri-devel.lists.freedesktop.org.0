Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394159BBE7D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B1B10E4C7;
	Mon,  4 Nov 2024 20:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jnbYpCw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7AC10E4C7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 20:04:14 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730750653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4hWc+SA0LxPrteqt2eM979LtFoCBRYmizsNb23n6NU=;
 b=jnbYpCw5slmXV2Kk/8PUqpn99ukY281IhV6AHXiVEbq5bf0tho+OMsHp7YxK8h7VvnAVnA
 ETa1b1ev0UZeeUTKgr1gqLVE8mSYc0osesM441O75Tpyu3lsiAme2BFudMuq+iU7gxcgij
 oq9oKyI5y20t9ycx+5s0brbe7A/bYkw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v2 2/3] drm/etnaviv: Fix the debug log of the
 etnaviv_iommu_map()
Date: Tue,  5 Nov 2024 04:03:53 +0800
Message-Id: <20241104200354.656525-3-sui.jingfeng@linux.dev>
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

The value of the 'iova' variable is the base GPU virtual address that is
going to be mapped, its value won't get updated when etnaviv_context_map()
is running under the "for_each_sgtable_dma_sg(sgt, sg, i) {}" loop.

Replace it with the 'da' variable, reflect the actual status that GPUVA
is being mapped.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index ddb536d84c58..05021848126e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -86,7 +86,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context,
 		unsigned int da_len = sg_dma_len(sg);
 		unsigned int bytes = min_t(unsigned int, da_len, va_len);
 
-		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
+		VERB("map[%d]: %08x %pap(%x)", i, da, &pa, bytes);
 
 		ret = etnaviv_context_map(context, da, pa, bytes, prot);
 		if (ret)
-- 
2.34.1


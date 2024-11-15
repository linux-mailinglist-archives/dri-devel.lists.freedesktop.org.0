Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B792E9CDE4A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 13:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E5610E859;
	Fri, 15 Nov 2024 12:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="tEpmfXTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D7310E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:33:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731674028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Q1NNXm8xCGlaeYRhrzTJWYfqyDhwYjiiGjFlTLExYI=;
 b=tEpmfXTAbP1X+EpnZ/kMxs8+Keov1Wrn1IC2phl4qaNcaMwKv+I2ursKhEvzRdc2kLo+4M
 9jdZHHnkPlpE/CBM6tIedljxu+eVgnZ3MqJAZPS0UgV6A8+EVRV+StvEwtY+U/mufIdHmr
 +3aSAl+isWcrlvU7oIm+k2gX2fsbS7A=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 2/3] drm/etnaviv: Fix the debug log of the
 etnaviv_iommu_map()
Date: Fri, 15 Nov 2024 20:32:45 +0800
Message-Id: <20241115123246.111346-3-sui.jingfeng@linux.dev>
In-Reply-To: <20241115123246.111346-1-sui.jingfeng@linux.dev>
References: <20241115123246.111346-1-sui.jingfeng@linux.dev>
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

The value of the 'iova' variable is the start GPUVA that is going to be
mapped, its value doesn't changed when the mapping is on going.

Replace it with the 'da' variable, which is incremental and it reflects
the actual address being mapped exactly.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index c786df840a18..ff90bf85c156 100644
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


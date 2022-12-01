Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4063FBDB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094D10E689;
	Thu,  1 Dec 2022 23:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370A510E689
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:21:13 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B8DA2851FB;
 Fri,  2 Dec 2022 00:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1669936871;
 bh=YY1vGPFmmP3FKSVq31eJs5VeJW8y6HukicNmEywxMzM=;
 h=From:To:Cc:Subject:Date:From;
 b=0HFoIjv1G6eLwn5H1YqW9DFlOK6C3ne1oPFB5RTLXD5PHTrxJGT4Frfww4SaqOd3y
 PhoCHsonA8WRMwYwbAJwAbWPhPbMygb61dMkPjRPvFvWL/heFVCjbR3TFbupWwk70L
 2li1xUks2jiVDTOW6A26ykx95iI394dxZjzFQ7Q5y7iY6mYPMDS5BtmJLtBLlKnPl8
 yX/nzpRcxh4+4stLMuUnBea7WSQB865jWHCB8W4Z8qtz9gu//lS6nNoT8F1a0+jhIp
 c4YJlAgnzftSlwDGpz2Z7a9p1VtplJvQy8cWACMsHGQnOrw3DBgqAkLQPesmGJqqoC
 SvQDcTsKC3Hxg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] [RFC] drm/etnaviv: Disable softpin
Date: Fri,  2 Dec 2022 00:21:00 +0100
Message-Id: <20221201232100.221606-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently softpin suffers from assorted race conditions exposed by newer
versions of mesa 22.2.y and 22.3.y . Those races are difficult to fix in
older kernel versions due to massive amount of backports necessary to do
so. Disable softpin by default until Linux 6.1.y is out, which contains
the necessary fixes to make softpin work reliably.

Fixes: 088880ddc0b20 ("drm/etnaviv: implement softpin")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 51320eeebfcff..326c9696cccea 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -146,10 +146,7 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		break;
 
 	case ETNAVIV_PARAM_SOFTPIN_START_ADDR:
-		if (priv->mmu_global->version == ETNAVIV_IOMMU_V2)
-			*value = ETNAVIV_SOFTPIN_START_ADDRESS;
-		else
-			*value = ~0ULL;
+		*value = ~0ULL;
 		break;
 
 	case ETNAVIV_PARAM_GPU_PRODUCT_ID:
-- 
2.35.1


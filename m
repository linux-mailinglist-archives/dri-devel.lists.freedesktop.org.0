Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BF2E2164
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB136E884;
	Wed, 23 Dec 2020 20:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68776E884
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:35:39 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Macf4-1kKTjY0wNG-00c84D; Wed, 23 Dec 2020 21:35:34 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH V2 2/4] drm/v3d: Set dma_mask as well as coherent_dma_mask
Date: Wed, 23 Dec 2020 21:35:12 +0100
Message-Id: <1608755714-18233-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:5REdR/avUBgLjbjE68ZefIl4VGgEtrbqdEDtIp1NmXGlfmT4gjK
 2xiMjVEVUf/+X9UIjlZWi0N602AriZvn9i7hfei8SmV14cN05NBBE8QLnEEEdLK0Mk2rAfj
 4ayJJXE7gchuE6lVGG5CylyxbU49OpeFXw3lDsxjN6n8PGX6YSgs2L8I4fUUr4R00hIU+FF
 p8va4pSUBEAmdE/KUquyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4yEbdgi/2ow=:LEsBN7MZxtlhrJw3pGzvyc
 2QdO31odOSDG3RYVy+A+hplMIh1aUspW2MWqAV84TEphA/nRDk9blYoJMtA1Qu3nYI8yNHWPC
 pAmgQEz99Nq2ejAXHNGQoj4NBKyZ1EVYXHCoc094GYlXIMHbiAYTe3d/jsKLjn9fZKMor0R76
 y4gRhexbh324oKR4mChgMAhtt5YJxYGisboRVWpG7uEipBF8QyDSbCw6DNh+xRxxvBQnnO+Zg
 5o38dRGiOjIDbH4czLvbdi1vhuNsh80hd+lsOwanVAFhVgz1ZMr3uStLNYuR73prALXN/ScML
 9TtZ+rIIJwp2bZq06h0+SxedDmTr6WFyiHheY5GwzX1bvtR8GGC0bA0XnE9Ywe/lUL4KDdBqk
 ZHlhc0obP75Cb6POncB6XwBsphMKuSL+/KjS5m4RkpwYz4LJdRwprdVheTL5o7RjLh2J5x6N6
 jHHbqdDnBQ==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phil Elwell <phil@raspberrypi.org>

Both coherent_dma_mask and dma_mask act as constraints on allocations
and bounce buffer usage, so be sure to set dma_mask to the appropriate
value otherwise the effective mask could be incorrect.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 42d401f..99e22be 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -232,8 +232,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		return ret;
 
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
-	dev->coherent_dma_mask =
-		DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
+	dma_set_mask_and_coherent(dev,
+		DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH)));
 	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
 
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

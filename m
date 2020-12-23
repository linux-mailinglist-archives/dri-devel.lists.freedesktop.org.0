Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A42E2169
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDF96E884;
	Wed, 23 Dec 2020 20:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4E6E884
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N1whr-1juOHo3Ia1-012GVD; Wed, 23 Dec 2020 21:27:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 2/4] drm/v3d: Set dma_mask as well as coherent_dma_mask
Date: Wed, 23 Dec 2020 21:27:23 +0100
Message-Id: <1608755245-18069-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:I6eIz9QT5FQaoqLrLyudDnWIK7ylWVUNJTT6VXZQmaNclBOqxaG
 QZjbnv5FMeEat5VFJ+unjzj8N7FCH3XIQ6EpPDqhfQiTHRnfhdL9e+Jfr4b4iLYDM/UCPCz
 4tQOZuy1P/qUJgVav08EX+dGubKdBddKK4G/PVQ01mNVbqkyb9uV3MYO+s9PHUE3GoXo5OO
 tGzgkovKr2fvv9P3sk1mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f4ulNhO4dPI=:N+Axddp0i7+PlfmHeF7GVv
 Zz7ELScBSx3Oq/tvMoQerl2WHQqobEhzbLd7f1kSxAbZ+Tvsbx2KqXe4hwj14/GJpu+yhWHrq
 3aCpxHtxOp9vdHvNJFaYtbibOhO34G9cy46Ov/8xc7J9PRPoLdRwnCf/wxJ6W/cWqfuYIb/6w
 rZ+5e2rgWGX0RByNL+QYCvyv839YQah4lKkeWeFwKjEa+ku7tf+6bUg/zCharnOnvxWgsAPAw
 2VWyKE197gdmI+7t1bA1loLEBTrEMBWtrZOnuNHqZALO0fo5R5esbuyvgD7sZJ6U4dnQJcT5c
 0HmKi00SyyDWs3tuDIv88e1KIbgwnzooLAEO1KqveKmVrGwAtJoYBB+j9Ha70/7graXy9x5+a
 qynO3fZC23tzadI0AmpTkwkmV7uJYvJLIwiEtRHUh/bbzloKLtcM2AUWHuMnwnj2AMtquZ5K4
 gbGcxnPAfw==
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
Cc: devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
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

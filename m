Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E42DF2C7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 03:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255E26E106;
	Sun, 20 Dec 2020 02:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464456E105
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 02:37:23 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] soc / drm: mediatek: Move mtk mutex driver to soc folder
Date: Sun, 20 Dec 2020 10:36:55 +0800
Message-Id: <20201220023655.30795-6-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220023655.30795-1-chunkuang.hu@kernel.org>
References: <20201220023655.30795-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

mtk mutex is used by DRM and MDP driver, and its function is SoC-specific,
so move it to soc folder.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Makefile                              | 3 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                         | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                         | 1 -
 drivers/soc/mediatek/Makefile                                  | 1 +
 .../{gpu/drm/mediatek/mtk_mutex.c => soc/mediatek/mtk-mutex.c} | 2 ++
 .../mtk_mutex.h => include/linux/soc/mediatek/mtk-mutex.h      | 0
 7 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mutex.c => soc/mediatek/mtk-mutex.c} (99%)
 rename drivers/gpu/drm/mediatek/mtk_mutex.h => include/linux/soc/mediatek/mtk-mutex.h (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 09979c4c340a..01d06332f767 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -9,8 +9,7 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o \
-		  mtk_mutex.o
+		  mtk_dpi.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 23d9abc4f46c..d7bd07916d74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/soc/mediatek/mtk-mutex.h>
 
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
@@ -22,7 +23,6 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
-#include "mtk_mutex.h"
 
 /*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 907a69eb6d51..d1232124b650 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -602,7 +602,6 @@ static struct platform_driver mtk_drm_platform_driver = {
 };
 
 static struct platform_driver * const mtk_drm_drivers[] = {
-	&mtk_mutex_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c7220f267a62..f7cd95903a4e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,7 +46,6 @@ struct mtk_drm_private {
 	struct drm_atomic_state *suspend_state;
 };
 
-extern struct platform_driver mtk_mutex_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index b6908db534c2..90270f8114ed 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/soc/mediatek/mtk-mutex.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mutex.c
rename to drivers/soc/mediatek/mtk-mutex.c
index e16b1772317c..f2597ebf52db 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -459,3 +459,5 @@ struct platform_driver mtk_mutex_driver = {
 		.of_match_table = mutex_driver_dt_match,
 	},
 };
+
+builtin_platform_driver(mtk_mutex_driver);
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_mutex.h
rename to include/linux/soc/mediatek/mtk-mutex.h
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

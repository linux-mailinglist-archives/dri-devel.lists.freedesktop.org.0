Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98BA825AC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAD310E897;
	Wed,  9 Apr 2025 13:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SrPVhs7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B81F10E896
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204408;
 bh=6n/C1ol+9ZHE0kqxLQJk3dYE6hvRX1EkWLOJJMxhMwA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SrPVhs7CrYsQ02BFZkYQGvkA0gsE6IPyLhef6o1k2kWHUs0KicMlxp8Tg6THcQpPZ
 A22HrV/pq4dY3k98U1bLaCW+6ZlF2tMOfDoam3Y/JrqQxvz2vVIYJ/mBONuMjTZ4P1
 rbe/AfmdAQNQEbCVmGAmL0fR9jX6sBZcj+2xeKz0NU9CV7ocFeOIVj2x3I5N9lLnwI
 BKVmCcRkXSe4deo/rytnQpzSLU1NyHKUwqFqrKjm8YmD5ea3NqkwBduhbJ6cntJiyJ
 QVakZsHDbguwbZyXkVhBPGkaiTvDB+jtQrHlaW5KRQtMcsXh0AG6QWVxuMXJDzPXdR
 q/MJRxCLjtAIA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9988417E0D67;
 Wed,  9 Apr 2025 15:13:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com, Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 04/23] drm/mediatek: mtk_hdmi_ddc: Switch to register as
 module_platform_driver
Date: Wed,  9 Apr 2025 15:12:59 +0200
Message-ID: <20250409131318.108690-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In preparation for adding a driver for the new HDMIv2 IP, and
before splitting out the common bits from the HDMI driver,
change the mtk_hdmi_ddc driver from being registered from the
HDMI driver itself to be a module_platform_driver of its own.

With this change, there are no more users of the mtk_hdmi.h header
so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/Makefile       |  6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  2 --
 drivers/gpu/drm/mediatek/mtk_hdmi.h     | 13 -------------
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index bdd3a062f797..43afd0a26d14 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,10 +21,8 @@ mediatek-drm-y := mtk_crtc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
-mediatek-drm-hdmi-objs := mtk_hdmi.o \
-			  mtk_hdmi_ddc.o
-
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
-obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f76e5629976f..5b869e8a3903 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -31,7 +31,6 @@
 #include <drm/drm_probe_helper.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_hdmi_regs.h"
 
 #define NCTS_BYTES	7
@@ -1791,7 +1790,6 @@ static struct platform_driver mtk_hdmi_driver = {
 };
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_ddc_driver,
 	&mtk_hdmi_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
deleted file mode 100644
index e40bc4651995..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014 MediaTek Inc.
- * Author: Jie Qiu <jie.qiu@mediatek.com>
- */
-#ifndef _MTK_HDMI_CTRL_H
-#define _MTK_HDMI_CTRL_H
-
-struct platform_driver;
-
-extern struct platform_driver mtk_hdmi_ddc_driver;
-
-#endif /* _MTK_HDMI_CTRL_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 07db68067844..6358e1af69b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -20,7 +20,6 @@
 #include <linux/of_platform.h>
 
 #include "mtk_drm_drv.h"
-#include "mtk_hdmi.h"
 
 #define SIF1_CLOK		(288)
 #define DDC_DDCMCTL0		(0x0)
@@ -337,6 +336,7 @@ struct platform_driver mtk_hdmi_ddc_driver = {
 		.of_match_table = mtk_hdmi_ddc_match,
 	},
 };
+module_platform_driver(mtk_hdmi_ddc_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI DDC Driver");
-- 
2.49.0


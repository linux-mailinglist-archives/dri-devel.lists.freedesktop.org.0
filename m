Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C70A89A92
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456A10E6FC;
	Tue, 15 Apr 2025 10:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WxGb9Qf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C80410E6FC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744713816;
 bh=Jj6J0Wp3BLe1Iu7KLkRvyL7L+U+C0SEmlBy2KW1i5N4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WxGb9Qf3bxsLrQVMAGY+GXK6b90Qh5rMsiCmNifwSDZEKWWCOgtQmAs1HdWkMYw0S
 53G7bq25DRWFaOViGM4NaBkbRxeh2O4FmpCcw0byeigoo+LZTKiV5/gfDfDXED5R/L
 MYEe6s9prsLX8YIR8QXoYW500kZXrEWomSSeZjx/Y9BTDDn4BL7dr2KHXbXkCgxhhY
 kZhtlqPURIPXpJwnYSEq0bDbdJIR9xsCY5V9Nj9Y37k6Uzi3w0xz7NXhl8JMU3wRXD
 oVHVHT5jJG2U0U57Q/SmlH1FtfnjimWy/8X5PD+pr5GSSBDmI8d13t7Bj8J4H9WUDS
 7nRvYCwiBj/4g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 799A317E35EB;
 Tue, 15 Apr 2025 12:43:34 +0200 (CEST)
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
Subject: [PATCH v9 04/23] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
Date: Tue, 15 Apr 2025 12:43:02 +0200
Message-ID: <20250415104321.51149-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
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
before splitting out the common bits from the HDMI driver, change
the mtk_cec driver from being registered from the mtk_hdmi driver
itself to be a module_platform_driver of its own.

Besides being a cleanup, this also allows build flexibility by
allowing to compile the CECv1 driver only when needed (for example,
this is not needed nor used in HDMIv2 configurations).

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/Makefile   | 4 ++--
 drivers/gpu/drm/mediatek/mtk_cec.c  | 7 ++++++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.h | 1 -
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 2930d8d42a95..4330866522da 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -23,10 +23,10 @@ mediatek-drm-y := mtk_crtc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
-mediatek-drm-hdmi-objs := mtk_cec.o \
-			  mtk_hdmi.o \
+mediatek-drm-hdmi-objs := mtk_hdmi.o \
 			  mtk_hdmi_ddc.o
 
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b42c0d87eba3..c7be530ca041 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_drm_drv.h"
 
 #define TR_CONFIG		0x00
@@ -102,6 +101,7 @@ void mtk_cec_set_hpd_event(struct device *dev,
 	cec->hpd_event = hpd_event;
 	spin_unlock_irqrestore(&cec->lock, flags);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_cec_set_hpd_event, "DRM_MTK_HDMI_V1");
 
 bool mtk_cec_hpd_high(struct device *dev)
 {
@@ -112,6 +112,7 @@ bool mtk_cec_hpd_high(struct device *dev)
 
 	return (status & (HDMI_PORD | HDMI_HTPLG)) == (HDMI_PORD | HDMI_HTPLG);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_cec_hpd_high, "DRM_MTK_HDMI_V1");
 
 static void mtk_cec_htplg_irq_init(struct mtk_cec *cec)
 {
@@ -247,3 +248,7 @@ struct platform_driver mtk_cec_driver = {
 		.of_match_table = mtk_cec_of_ids,
 	},
 };
+module_platform_driver(mtk_cec_driver);
+
+MODULE_DESCRIPTION("MediaTek HDMI CEC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1358a5095fde..f4476a12055b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1788,7 +1788,6 @@ static struct platform_driver mtk_hdmi_driver = {
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
 	&mtk_hdmi_ddc_driver,
-	&mtk_cec_driver,
 	&mtk_hdmi_driver,
 };
 
@@ -1810,3 +1809,4 @@ module_exit(mtk_hdmitx_exit);
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("DRM_MTK_HDMI_V1");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
index 472bf141c92b..e40bc4651995 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
@@ -8,7 +8,6 @@
 
 struct platform_driver;
 
-extern struct platform_driver mtk_cec_driver;
 extern struct platform_driver mtk_hdmi_ddc_driver;
 
 #endif /* _MTK_HDMI_CTRL_H */
-- 
2.49.0


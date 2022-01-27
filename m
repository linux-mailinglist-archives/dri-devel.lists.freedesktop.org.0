Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41449D89C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 03:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826E510E8CD;
	Thu, 27 Jan 2022 02:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62D410E814
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:55:56 +0000 (UTC)
X-UUID: b80d963d5b94480fbf5e8e1f66cb4ff8-20220127
X-UUID: b80d963d5b94480fbf5e8e1f66cb4ff8-20220127
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2079973334; Thu, 27 Jan 2022 10:55:54 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 10:55:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 27 Jan 2022 10:55:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 10:55:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v1, 2/8] media: mtk-vcodec: Add to support lat soc hardware
Date: Thu, 27 Jan 2022 10:55:38 +0800
Message-ID: <20220127025544.10854-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127025544.10854-1-yunfei.dong@mediatek.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add lat soc compatible and to support lat soc power/clk helper.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c      | 12 +++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h      |  2 ++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c      | 16 ++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h   |  1 +
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 7b5da3e4cac2..7374d5a5c156 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -28,6 +28,10 @@ static const struct of_device_id mtk_vdec_hw_match[] = {
 		.compatible = "mediatek,mtk-vcodec-core",
 		.data = (void *)MTK_VDEC_CORE,
 	},
+	{
+		.compatible = "mediatek,mtk-vcodec-lat-soc",
+		.data = (void *)MTK_VDEC_LAT_SOC,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vdec_hw_match);
@@ -166,9 +170,11 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
-	ret = mtk_vdec_hw_init_irq(subdev_dev);
-	if (ret)
-		goto err;
+	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
+		ret = mtk_vdec_hw_init_irq(subdev_dev);
+		if (ret)
+			goto err;
+	}
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
index a63e4b1b81c3..b8938c6c3e72 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -17,6 +17,8 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) (hw_idx != MTK_VDEC_LAT_SOC)
+
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
  * @VDEC_HW_SYS : vdec soc register index
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 1581a1277473..76e1442fc6f9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -203,6 +203,14 @@ static void mtk_vcodec_dec_child_dev_on(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_pw_on(pm);
 		mtk_vcodec_dec_clock_on(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_pw_on(pm);
+			mtk_vcodec_dec_clock_on(pm);
+		}
+	}
 }
 
 static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
@@ -215,6 +223,14 @@ static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_clock_off(pm);
 		mtk_vcodec_dec_pw_off(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_clock_off(pm);
+			mtk_vcodec_dec_pw_off(pm);
+		}
+	}
 }
 
 void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index cd2939b47790..363b999dd709 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -104,6 +104,7 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_CORE,
 	MTK_VDEC_LAT0,
 	MTK_VDEC_LAT1,
+	MTK_VDEC_LAT_SOC,
 	MTK_VDEC_HW_MAX,
 };
 
-- 
2.25.1


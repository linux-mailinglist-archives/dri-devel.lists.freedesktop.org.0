Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C444643F598
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437C16E9BB;
	Fri, 29 Oct 2021 03:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208C46E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 03:55:37 +0000 (UTC)
X-UUID: 976d263f3dd94d6898f72fac9b1fe618-20211029
X-UUID: 976d263f3dd94d6898f72fac9b1fe618-20211029
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1525981931; Fri, 29 Oct 2021 11:55:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:55:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 29 Oct 2021 11:55:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>
Subject: [PATCH v8,
 01/17] media: mtk-vcodec: Get numbers of register bases from DT
Date: Fri, 29 Oct 2021 11:55:11 +0800
Message-ID: <20211029035527.454-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029035527.454-1-yunfei.dong@mediatek.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Different platform may has different numbers of register bases. Gets the
numbers of register bases from DT (sizeof(u32) * 4 bytes for each).

Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 37 ++++++++++++++-----
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..59caf2163349 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -78,6 +78,30 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int reg_num, i;
+
+	/* Sizeof(u32) * 4 bytes for each register base. */
+	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
+		sizeof(u32) * 4);
+	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
+		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < reg_num; i++) {
+		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(dev->reg_base[i]))
+			return PTR_ERR(dev->reg_base[i]);
+
+		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
+	}
+
+	return 0;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -206,7 +230,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int i, ret;
+	int ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -238,14 +262,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
-	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
-		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
-		if (IS_ERR((__force void *)dev->reg_base[i])) {
-			ret = PTR_ERR((__force void *)dev->reg_base[i]);
-			goto err_res;
-		}
-		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
-	}
+	ret = mtk_vcodec_get_reg_bases(dev);
+	if (ret)
+		goto err_res;
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res == NULL) {
-- 
2.25.1


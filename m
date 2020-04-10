Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8771A41FB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 06:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77506EC56;
	Fri, 10 Apr 2020 04:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1A856EC56
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 04:33:04 +0000 (UTC)
X-UUID: cad6a353866c418a8ecd2f0370e21662-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mHf6jiGpr7KeVe7S0awWVzvSk807Yo2QlCE0YtnWX7w=; 
 b=GismMTcnv5BtfTLILJE6ntl/jGOc4Ha7h3YdiVZ8wZBaF39M5sqQVK1cy/9rJ0P33QOVciZLS2ViSO+9yO8DxUwaGWjY4KlkZVUcQ0ilSLodOzmOvFJcchyTNswNtPR8eiFRmNn2ZkODLkSst5Xd16Os+yDKfIBfoE4VtHzwNOo=;
X-UUID: cad6a353866c418a8ecd2f0370e21662-20200410
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1734901447; Fri, 10 Apr 2020 12:32:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 10 Apr 2020 12:32:57 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 10 Apr 2020 12:32:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/4] drm/mediatek: config mipitx impedance with calibration
 data
Date: Fri, 10 Apr 2020 12:32:48 +0800
Message-ID: <20200410043248.114384-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200410043248.114384-1-jitao.shi@mediatek.com>
References: <20200410043248.114384-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E7751B2F5E74A0DD2D4F9F4687FC3C9AA570AB677C0BBF1D9A0DD199084342622000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Read calibration data from nvmem, and config mipitx impedance with
calibration data to make sure their impedance are 100ohm.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 40 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  3 ++
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 21 ++++++++++
 3 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index e301af64809e..5e91fc2c1318 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -88,6 +88,44 @@ static const struct phy_ops mtk_mipi_tx_ops = {
 	.owner = THIS_MODULE,
 };
 
+static void mtk_mipi_tx_get_calibration_datal(struct mtk_mipi_tx *mipi_tx)
+{
+	struct nvmem_cell *cell;
+	size_t len;
+	u32 *buf;
+
+	memset(mipi_tx->rt_code, 0, sizeof(mipi_tx->rt_code));
+	cell = nvmem_cell_get(mipi_tx->dev, "calibration-data");
+	if (IS_ERR(cell)) {
+		dev_info(mipi_tx->dev, "can't get nvmem_cell_get, ignore it\n");
+	} else {
+		buf = (u32 *)nvmem_cell_read(cell, &len);
+		nvmem_cell_put(cell);
+
+		if (IS_ERR(buf)) {
+			dev_info(mipi_tx->dev, "can't get data, ignore it\n");
+		} else {
+			if (len < 3 * sizeof(u32)) {
+				dev_info(mipi_tx->dev, "invalid calibration data\n");
+				kfree(buf);
+				return;
+			}
+
+			mipi_tx->rt_code[0] = ((buf[0] >> 6 & 0x1f) << 5) |
+					       (buf[0] >> 11 & 0x1f);
+			mipi_tx->rt_code[1] = ((buf[1] >> 27 & 0x1f) << 5) |
+					       (buf[0] >> 1 & 0x1f);
+			mipi_tx->rt_code[2] = ((buf[1] >> 17 & 0x1f) << 5) |
+					       (buf[1] >> 22 & 0x1f);
+			mipi_tx->rt_code[3] = ((buf[1] >> 7 & 0x1f) << 5) |
+					       (buf[1] >> 12 & 0x1f);
+			mipi_tx->rt_code[4] = ((buf[2] >> 27 & 0x1f) << 5) |
+					       (buf[1] >> 2 & 0x1f);
+			kfree(buf);
+		}
+	}
+}
+
 static int mtk_mipi_tx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -174,6 +212,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mipi_tx->dev = dev;
 
+	mtk_mipi_tx_get_calibration_datal(mipi_tx);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   mipi_tx->pll);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
index eea44327fe9f..c76f07c3fdeb 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
@@ -12,9 +12,11 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/slab.h>
 
 struct mtk_mipitx_data {
 	const u32 mppll_preserve;
@@ -28,6 +30,7 @@ struct mtk_mipi_tx {
 	void __iomem *regs;
 	u32 data_rate;
 	u32 mipitx_drive;
+	u32 rt_code[5];
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
 	struct clk *pll;
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
index e4cc967750cb..9f3e55aeebb2 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
@@ -28,6 +28,7 @@
 #define MIPITX_PLL_CON4		0x003c
 #define RG_DSI_PLL_IBIAS		(3 << 10)
 
+#define MIPITX_D2P_RTCODE	0x0100
 #define MIPITX_D2_SW_CTL_EN	0x0144
 #define MIPITX_D0_SW_CTL_EN	0x0244
 #define MIPITX_CK_CKMODE_EN	0x0328
@@ -108,6 +109,24 @@ static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };
 
+static void mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
+{
+	int i, j;
+
+	for (i = 0; i < 5; i++) {
+		if ((mipi_tx->rt_code[i] & 0x1f) == 0)
+			mipi_tx->rt_code[i] |= 0x10;
+
+		if ((mipi_tx->rt_code[i] >> 5 & 0x1f) == 0)
+			mipi_tx->rt_code[i] |= 0x10 << 5;
+
+		for (j = 0; j < 10; j++)
+			mtk_mipi_tx_update_bits(mipi_tx,
+				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
+				1, mipi_tx->rt_code[i] >> j & 1);
+	}
+}
+
 static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 {
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
@@ -130,6 +149,8 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 				RG_DSI_HSTX_LDO_REF_SEL,
 				(mipi_tx->mipitx_drive - 3000) / 200 << 6);
 
+	mtk_mipi_tx_config_calibration_data(mipi_tx);
+
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

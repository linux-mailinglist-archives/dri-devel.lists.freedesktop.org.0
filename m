Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B371A41FC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 06:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A336EC57;
	Fri, 10 Apr 2020 04:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2F1F6EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 04:33:05 +0000 (UTC)
X-UUID: 2f345ddf911d4c1d926dc04197958f70-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AHxhUn2kmmaiTpuNqyuJ91haPBs27z9l86TI6FY89lo=; 
 b=P681JospeW7clmufrEnhNdQjB1QVmpndyiiLLC8Nb5emFRpWoJyRctIZJifd5j7dVRWbRsNW/f2D7e5gXeD8jjF09HGsNoLH7MI6/YCWT8dAPnu1sp73j76ZdREwLAKCrvBVx98qjbgkUcepEi7RUNyAN7aQv9VvRr+i2npv3rI=;
X-UUID: 2f345ddf911d4c1d926dc04197958f70-20200410
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 327123782; Fri, 10 Apr 2020 12:32:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 10 Apr 2020 12:32:55 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 10 Apr 2020 12:32:53 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/4] drm/mediatek: add the mipitx driving control
Date: Fri, 10 Apr 2020 12:32:47 +0800
Message-ID: <20200410043248.114384-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200410043248.114384-1-jitao.shi@mediatek.com>
References: <20200410043248.114384-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A5E095EBF718CF57F55493196C241806DF8C8BD009F0C431C325DABC9C882DF2000:8
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
 srv_heupstream@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a property in device tree to control the driving by different
board.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 14 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c |  7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index e4d34484ecc8..e301af64809e 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -125,6 +125,20 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
+				   &mipi_tx->mipitx_drive);
+	/* If can't get the "mipi_tx->mipitx_drive", set it default 0x8 */
+	if (ret < 0)
+		mipi_tx->mipitx_drive = 4600;
+
+	/* check the mipitx_drive valid */
+	if (mipi_tx->mipitx_drive > 6000 || mipi_tx->mipitx_drive < 3000) {
+		dev_warn(dev, "drive-strength-microamp is invalid %d, not in 3000 ~ 6000\n",
+			 mipi_tx->mipitx_drive);
+		mipi_tx->mipitx_drive = clamp_val(mipi_tx->mipitx_drive, 3000,
+						  6000);
+	}
+
 	ref_clk_name = __clk_get_name(ref_clk);
 
 	ret = of_property_read_string(dev->of_node, "clock-output-names",
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
index 413f35d86219..eea44327fe9f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
@@ -27,6 +27,7 @@ struct mtk_mipi_tx {
 	struct device *dev;
 	void __iomem *regs;
 	u32 data_rate;
+	u32 mipitx_drive;
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
 	struct clk *pll;
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
index 91f08a351fd0..e4cc967750cb 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
@@ -17,6 +17,9 @@
 #define RG_DSI_BG_CORE_EN		BIT(7)
 #define RG_DSI_PAD_TIEL_SEL		BIT(8)
 
+#define MIPITX_VOLTAGE_SEL	0x0010
+#define RG_DSI_HSTX_LDO_REF_SEL		(0xf << 6)
+
 #define MIPITX_PLL_PWR		0x0028
 #define MIPITX_PLL_CON0		0x002c
 #define MIPITX_PLL_CON1		0x0030
@@ -123,6 +126,10 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
 	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
 
+	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_VOLTAGE_SEL,
+				RG_DSI_HSTX_LDO_REF_SEL,
+				(mipi_tx->mipitx_drive - 3000) / 200 << 6);
+
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

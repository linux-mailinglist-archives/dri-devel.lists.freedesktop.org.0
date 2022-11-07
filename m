Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DC61EBD1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8D10E228;
	Mon,  7 Nov 2022 07:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F4410E200
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 07:22:54 +0000 (UTC)
X-UUID: 6c9aa084046c4490a4b784336c97a73c-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mHhD6MTL7kQ4bw5R6GY3/VesbL7KrPmV5W6K5k34Ns0=; 
 b=D12oBi7fJ6nPHZ2Xa5K8U8fAwsCHMOAyi0hwoEX9EGtCyH5rnP9B9W4SM5P+UglvPJN1ycVt7YGZ4pMxp2tIL67OpP95vE8SmUj+GLxNvTTEKqGToIP9VlYJTXdBVD2g9pLwlEgYYSG9AWXJkiLZy3UgSDG2IkzIKt/issvRXV8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:952645c2-119e-4486-8b32-d4f7b6aa2752, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:62cd327, CLOUDID:8c69a4eb-84ac-4628-a416-bc50d5503da6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
 L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6c9aa084046c4490a4b784336c97a73c-20221107
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 271953603; Mon, 07 Nov 2022 15:22:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 7 Nov 2022 15:22:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 7 Nov 2022 15:22:46 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
 <nfraprado@collabora.com>
Subject: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Date: Mon, 7 Nov 2022 15:22:37 +0800
Message-ID: <20221107072243.15748-6-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221107072243.15748-1-nancy.lin@mediatek.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify code for update  mmsys reg.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 9a327eb5d9d7..73c8bd27e6ae 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -99,22 +99,27 @@ struct mtk_mmsys {
 	struct reset_controller_dev rcdev;
 };
 
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl_relaxed(mmsys->regs + offset);
+	tmp = (tmp & ~mask) | (val & mask);
+	writel_relaxed(tmp, mmsys->regs + offset);
+}
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	u32 reg;
 	int i;
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr);
-			reg &= ~routes[i].mask;
-			reg |= routes[i].val;
-			writel_relaxed(reg, mmsys->regs + routes[i].addr);
-		}
+		if (cur == routes[i].from_comp && next == routes[i].to_comp)
+			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
+					      routes[i].val);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -124,27 +129,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	u32 reg;
 	int i;
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr);
-			reg &= ~routes[i].mask;
-			writel_relaxed(reg, mmsys->regs + routes[i].addr);
-		}
+		if (cur == routes[i].from_comp && next == routes[i].to_comp)
+			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
-static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
-{
-	u32 tmp;
-
-	tmp = readl_relaxed(mmsys->regs + offset);
-	tmp = (tmp & ~mask) | val;
-	writel_relaxed(tmp, mmsys->regs + offset);
-}
-
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 {
 	if (val)
@@ -161,18 +153,13 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
-	u32 reg;
 
 	spin_lock_irqsave(&mmsys->lock, flags);
 
-	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
-
 	if (assert)
-		reg &= ~BIT(id);
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
 	else
-		reg |= BIT(id);
-
-	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
-- 
2.18.0


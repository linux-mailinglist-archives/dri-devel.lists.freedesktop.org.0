Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938EFB3964E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB6E10E6D1;
	Thu, 28 Aug 2025 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Dx7Qk6uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7FE10E6CB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:14 +0000 (UTC)
X-UUID: 4420daa083e611f0b33aeb1e7f16c2b6-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ReZvEftY9OCzW7Dm6xWBCAsBP3wLpjVjsHSQsCNwqs8=; 
 b=Dx7Qk6uN6A9+5AmiRtot0855v6rdTDJp1ZS9gr2KT6pQNAytn84VV9AFtHPLaoWweiaQnfgzvbGcDxWcbh+me6sgWiRAPgdcpWctdeQXU0CHJM5+G+ZpSECIhzQZ92FcjqbhrbzGgYX6qqhqu5lcVfEMIS6wxB/JN0mJcSAJEo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:211774e2-ae5d-4547-85fb-0d8fd733597a, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:f1326cf, CLOUDID:449bb36d-c2f4-47a6-876f-59a53e9ecc6e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4420daa083e611f0b33aeb1e7f16c2b6-20250828
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 175946472; Thu, 28 Aug 2025 16:09:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:03 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 06/19] soc: mediatek: Add runtime PM and top clocks and
 async controls for MMSYS
Date: Thu, 28 Aug 2025 16:07:01 +0800
Message-ID: <20250828080855.3502514-7-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Nancy Lin <nancy.lin@mediatek.com>

- Add initialization of top clocks and async clocks for each MMSYS.
- Add PM runtime control and new functions to manage these clocks.
- Add functions to set these clocks according to the default
  configuration of the corresponding MMSYS.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 152 ++++++++++++++++++++++++-
 drivers/soc/mediatek/mtk-mmsys.h       |  18 +++
 include/linux/soc/mediatek/mtk-mmsys.h |   8 ++
 3 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..f448cc09ce19 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,12 +4,15 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
@@ -158,6 +161,9 @@ struct mtk_mmsys {
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
 	struct cmdq_client_reg cmdq_base;
+	struct clk **async_clk;
+	int num_async_clk;
+	struct clk **top_clk;
 };
 
 static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
@@ -180,6 +186,101 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	writel_relaxed(tmp, mmsys->regs + offset);
 }
 
+int mtk_mmsys_top_clk_enable(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	int ret, i;
+
+	if (!mmsys->data->num_top_clk)
+		return 0;
+
+	for (i = 0; i < mmsys->data->num_top_clk; i++)
+		ret = clk_prepare_enable(mmsys->top_clk[i]);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_enable);
+
+void mtk_mmsys_top_clk_disable(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < mmsys->data->num_top_clk; i++)
+		clk_disable_unprepare(mmsys->top_clk[i]);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_disable);
+
+int mtk_mmsys_ddp_clk_enable(struct device *dev, enum mtk_ddp_comp_id comp_id)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+
+	int i;
+
+	if (!mmsys->data->num_async_info)
+		return 0;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			return clk_prepare_enable(mmsys->async_clk[async[i].index]);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_enable);
+
+void mtk_mmsys_ddp_clk_disable(struct device *dev, enum mtk_ddp_comp_id comp_id)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+	int i;
+
+	if (!mmsys->data->num_async_info)
+		return;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			clk_disable_unprepare(mmsys->async_clk[async[i].index]);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_disable);
+
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id comp_id,
+			  int width, int height, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+	int i;
+	u32 val;
+
+	if (!mmsys->data->num_async_info)
+		return;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			break;
+
+	if (i == mmsys->data->num_async_info)
+		return;
+
+	val = FIELD_PREP(GENMASK(31, 16), height);
+	val |= FIELD_PREP(GENMASK(15, 0), width);
+	mtk_mmsys_update_bits(mmsys, async[i].offset, async[i].mask, val, cmdq_pkt);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
+
+void mtk_mmsys_default_config(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_default *def_config = mmsys->data->def_config;
+	int i;
+
+	if (!mmsys->data->num_def_config)
+		return;
+
+	for (i = 0; i < mmsys->data->num_def_config; i++)
+		mtk_mmsys_update_bits(mmsys, def_config[i].offset, def_config[i].mask,
+				      def_config[i].val, NULL);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_default_config);
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -390,7 +491,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	struct mtk_mmsys *mmsys;
-	int ret;
+	int ret, i;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
 	if (!mmsys)
@@ -432,6 +533,49 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(clks);
 	mmsys->clks_pdev = clks;
 
+	if (mmsys->data->num_top_clk) {
+		struct device_node *node;
+
+		node = of_get_child_by_name(dev->of_node, "top");
+		if (!node) {
+			dev_err(&pdev->dev, "Couldn't find top node\n");
+			return -EINVAL;
+		}
+
+		mmsys->top_clk = devm_kmalloc_array(dev, mmsys->data->num_top_clk,
+						    sizeof(*mmsys->top_clk), GFP_KERNEL);
+		if (!mmsys->top_clk)
+			return -ENOMEM;
+
+		for (i = 0; i < mmsys->data->num_top_clk; i++) {
+			mmsys->top_clk[i] = of_clk_get(node, i);
+			if (IS_ERR(mmsys->top_clk[i]))
+				return PTR_ERR(mmsys->top_clk[i]);
+		}
+	}
+
+	if (mmsys->data->num_async_info) {
+		struct device_node *node;
+
+		node = of_get_child_by_name(dev->of_node, "async");
+		if (!node) {
+			dev_err(&pdev->dev, "Couldn't find async node\n");
+			return -EINVAL;
+		}
+
+		mmsys->async_clk = devm_kmalloc_array(dev, mmsys->data->num_async_info,
+						      sizeof(*mmsys->async_clk), GFP_KERNEL);
+		if (!mmsys->async_clk)
+			return -ENOMEM;
+		mmsys->num_async_clk = mmsys->data->num_async_info;
+
+		for (i = 0; i < mmsys->num_async_clk; i++) {
+			mmsys->async_clk[i] = of_clk_get(node, i);
+			if (IS_ERR(mmsys->async_clk[i]))
+				return PTR_ERR(mmsys->async_clk[i]);
+		}
+	}
+
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
 
@@ -443,6 +587,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 	mmsys->drm_pdev = drm;
 
+	if (of_property_present(dev->of_node, "power-domains"))
+		pm_runtime_enable(dev);
+
 out_probe_done:
 	return 0;
 }
@@ -453,6 +600,9 @@ static void mtk_mmsys_remove(struct platform_device *pdev)
 
 	platform_device_unregister(mmsys->drm_pdev);
 	platform_device_unregister(mmsys->clks_pdev);
+
+	if (of_property_present(pdev->dev.of_node, "power-domains"))
+		pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index fe628d5f5198..bbc03ef5b025 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -102,6 +102,19 @@ struct mtk_mmsys_routes {
 	u32 val;
 };
 
+struct mtk_mmsys_async_info {
+	u32 comp_id;
+	u32 index;
+	u32 offset;
+	u32 mask;
+};
+
+struct mtk_mmsys_default {
+	u32 offset;
+	u32 val;
+	u32 mask;
+};
+
 /**
  * struct mtk_mmsys_driver_data - Settings of the mmsys
  * @clk_driver: Clock driver name that the mmsys is using
@@ -139,6 +152,11 @@ struct mtk_mmsys_driver_data {
 	const u32 num_resets;
 	const bool is_vppsys;
 	const u8 vsync_len;
+	const struct mtk_mmsys_async_info *async_info;
+	const unsigned int num_async_info;
+	const struct mtk_mmsys_default *def_config;
+	const unsigned int num_def_config;
+	const unsigned int num_top_clk;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4885b065b849..f50f626e1840 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -84,6 +84,14 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+int mtk_mmsys_top_clk_enable(struct device *dev);
+void mtk_mmsys_top_clk_disable(struct device *dev);
+int mtk_mmsys_ddp_clk_enable(struct device *dev, enum mtk_ddp_comp_id comp_id);
+void mtk_mmsys_ddp_clk_disable(struct device *dev, enum mtk_ddp_comp_id comp_id);
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id comp_id,
+			  int width, int height, struct cmdq_pkt *cmdq_pkt);
+void mtk_mmsys_default_config(struct device *dev);
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
2.45.2


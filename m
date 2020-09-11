Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AB268546
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0D6E1B8;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070136E07F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 11:22:43 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 852E8207FBD92955F13B;
 Fri, 11 Sep 2020 19:22:39 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 19:22:32 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jie.qiu@mediatek.com>,
 <junzhi.zhao@mediatek.com>
Subject: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_hdmi_dt_parse_pdata()
Date: Fri, 11 Sep 2020 19:21:51 +0800
Message-ID: <20200911112151.3220469-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 yukuai3@huawei.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if of_find_device_by_node() succeed, mtk_drm_kms_init() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f2e9b429960b..a97725680d4e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1507,25 +1507,30 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		dev_err(dev,
 			"Failed to get system configuration registers: %d\n",
 			ret);
-		return ret;
+		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hdmi->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
+	if (IS_ERR(hdmi->regs)) {
+		ret = PTR_ERR(hdmi->regs);
+		goto put_device;
+	}
 
 	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote)
-		return -EINVAL;
+	if (!remote) {
+		ret = -EINVAL;
+		goto put_device;
+	}
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
 		hdmi->next_bridge = of_drm_find_bridge(remote);
 		if (!hdmi->next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
-			return -EPROBE_DEFER;
+			ret = -EPROBE_DEFER;
+			goto put_device;
 		}
 	}
 
@@ -1534,7 +1539,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
 			remote);
 		of_node_put(remote);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_device;
 	}
 	of_node_put(remote);
 
@@ -1542,10 +1548,14 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
 		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_device;
 	}
 
 	return 0;
+put_device:
+	put_device(hdmi->cec_dev);
+	return ret;
 }
 
 /*
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

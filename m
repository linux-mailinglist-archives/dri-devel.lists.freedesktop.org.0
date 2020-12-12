Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDC2D93F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B996E0C9;
	Mon, 14 Dec 2020 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ACC66E56A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 04:12:10 +0000 (UTC)
X-UUID: 0195c41cebdb482bae373340d2554fa6-20201212
X-UUID: 0195c41cebdb482bae373340d2554fa6-20201212
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800293703; Sat, 12 Dec 2020 12:12:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:05 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 07/17] drm/mediatek: add disp config and mm 26mhz clock into mutex
 device
Date: Sat, 12 Dec 2020 12:11:47 +0800
Message-ID: <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there are 2 more clock need enable for display.
parser these clock when mutex device probe,
enable and disable when mutex on/off

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 60788c1..de618a1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -118,7 +118,7 @@ struct mtk_ddp_data {
 
 struct mtk_ddp {
 	struct device			*dev;
-	struct clk			*clk;
+	struct clk			*clk[3];
 	void __iomem			*regs;
 	struct mtk_disp_mutex		mutex[10];
 	const struct mtk_ddp_data	*data;
@@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
 {
 	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
 					   mutex[mutex->id]);
-	return clk_prepare_enable(ddp->clk);
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+		if (IS_ERR(ddp->clk[i]))
+			continue;
+		ret = clk_prepare_enable(ddp->clk[i]);
+		if (ret) {
+			pr_err("failed to enable clock, err %d. i:%d\n",
+				ret, i);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0)
+		clk_disable_unprepare(ddp->clk[i]);
+	return ret;
 }
 
 void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
 {
 	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
 					   mutex[mutex->id]);
-	clk_disable_unprepare(ddp->clk);
+	int i;
+
+	 for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+		if (IS_ERR(ddp->clk[i]))
+			continue;
+		clk_disable_unprepare(ddp->clk[i]);
+	}
 }
 
 void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
@@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
 	ddp->data = of_device_get_match_data(dev);
 
 	if (!ddp->data->no_clk) {
-		ddp->clk = devm_clk_get(dev, NULL);
-		if (IS_ERR(ddp->clk)) {
-			if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get clock\n");
-			return PTR_ERR(ddp->clk);
+		int ret;
+
+		for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+			ddp->clk[i] = of_clk_get(dev->of_node, i);
+
+			if (IS_ERR(ddp->clk[i])) {
+				ret = PTR_ERR(ddp->clk[i]);
+				if (ret != EPROBE_DEFER)
+					dev_err(dev, "Failed to get clock %d\n",
+						ret);
+
+				return ret;
+			}
 		}
 	}
 
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

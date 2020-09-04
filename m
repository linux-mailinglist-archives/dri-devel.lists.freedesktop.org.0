Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1B25E4AD
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B576ED01;
	Sat,  5 Sep 2020 00:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA66EB36
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:10:08 +0000 (UTC)
Received: from mxout2.routing.net (unknown [192.168.10.82])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id C0AA02C456
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:00:33 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id BEB3A5FC6A;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdElUpIkbQ13/jUvuSuFFzq8Cu6tg4R6UAkzid3KcG8=;
 b=vCVCqRsEwRtRMEqZXV09NTx/KmrnvClTwVoFAODo3XdxmnUYOB0gaMt58UbU4ETGMtRqMy
 nLANscbjr4+UdVsIeZ5v03w4OsYCeWqX6xnfJHlZ3TfkG3H8qhrBSpesYcyKYAdj2PPjl+
 y5yZnH0mW8b64PB6aHaZ1lToJ/Oy7n8=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0F39E3604C2;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/4] drm/mediatek: disable tmds on mt2701
Date: Fri,  4 Sep 2020 12:59:59 +0200
Message-Id: <20200904110002.88966-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904110002.88966-1-linux@fw-web.de>
References: <20200904110002.88966-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chunhui dai <chunhui.dai@mediatek.com>

Without that patch if you use specific resolutions like 1280x1024,
I can see distortion in the output. It seems as if the
frequency for updating the pixel of the image is out of sync.

For initialization tmds needs to be active, but can be disabled after init
to fix blurry display

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 1 +
 drivers/phy/mediatek/phy-mtk-hdmi.c        | 3 +++
 drivers/phy/mediatek/phy-mtk-hdmi.h        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index a6cb1dea3d0c..b74c65a1762c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -238,6 +238,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
 	.flags = CLK_SET_RATE_GATE,
+	.pll_default_off = true,
 	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 8fc83f01a720..47c029d4b270 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_provider);
 	}
 
+	if (hdmi_phy->conf->pll_default_off)
+		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index b13e1d5f8e78..dcf9bb13699b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -21,6 +21,7 @@ struct mtk_hdmi_phy;
 
 struct mtk_hdmi_phy_conf {
 	unsigned long flags;
+	bool pll_default_off;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D067023C6C6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA88E6E51A;
	Wed,  5 Aug 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7436E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id EA78E9614F;
 Tue,  4 Aug 2020 16:56:11 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id BD9671014A6;
 Tue,  4 Aug 2020 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tvt7koxlgmMWFSYlV9RwSNCWybA13LVEGNqsglV8N/o=;
 b=nrCQShCUiKb/bluJS6ekx73gjPCb+mpkwkkU5P+PfWHmgBVsxxsXKL3hNG2OaQ3ducby0z
 e4TFVfo0fVZjUSPVbS/eUfzYOKK3M2zroiH0lxYsVBG/Qk/2MKpSyY8we6WwPZfDGBhtJX
 0bKJ29FNQtGffNrUIiOCdv4LYD5LxmI=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1124E3603C2;
 Tue,  4 Aug 2020 16:56:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/6] drm/mediatek: disable tmds on mt2701
Date: Tue,  4 Aug 2020 18:55:52 +0200
Message-Id: <20200804165555.75159-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chunhui dai <chunhui.dai@mediatek.com>

disable tmds on phy on mt2701 to support other resolutions like 1280x1024

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 3 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        | 1 +
 drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
index 5223498502c4..edadb7a700f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_provider);
 	}
 
+	if (hdmi_phy->conf->pll_default_off)
+		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
index 2d8b3182470d..f472fdeb63dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
@@ -22,6 +22,7 @@ struct mtk_hdmi_phy;
 struct mtk_hdmi_phy_conf {
 	bool tz_disabled;
 	unsigned long flags;
+	bool pll_default_off;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
index d3cc4022e988..6fbedacfc1e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
@@ -239,6 +239,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
 	.tz_disabled = true,
 	.flags = CLK_SET_RATE_GATE,
+	.pll_default_off = true,
 	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

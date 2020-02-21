Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B0167BA5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5F6EF39;
	Fri, 21 Feb 2020 11:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6D36EE08
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:22:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 58A83295288
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v8 2/6] drm/mediatek: Omit warning on probe defers
Date: Thu, 20 Feb 2020 18:21:43 +0100
Message-Id: <20200220172147.919996-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220172147.919996-1-enric.balletbo@collabora.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Brugger <mbrugger@suse.com>

It can happen that the mmsys clock drivers aren't probed before the
platform driver gets invoked. The platform driver used to print a warning
that the driver failed to get the clocks. Omit this error on
the defered probe path.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v8: None
Changes in v7:
- Add Rv-by from CK

 drivers/gpu/drm/mediatek/mtk_disp_color.c |  5 ++++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |  5 ++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |  5 ++++-
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 12 +++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c        |  8 ++++++--
 drivers/gpu/drm/mediatek/mtk_hdmi.c       |  4 +++-
 7 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 6fb0d6983a4a..3ae9c810845b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -119,7 +119,10 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_color_funcs);
 	if (ret) {
-		dev_err(dev, "Failed to initialize component: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to initialize component: %d\n",
+				ret);
+
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 891d80c73e04..28651bc579bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -386,7 +386,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_ovl_funcs);
 	if (ret) {
-		dev_err(dev, "Failed to initialize component: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to initialize component: %d\n",
+				ret);
+
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0cb848d64206..e04319fedf46 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -294,7 +294,10 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_rdma_funcs);
 	if (ret) {
-		dev_err(dev, "Failed to initialize component: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to initialize component: %d\n",
+				ret);
+
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 01fa8b8d763d..1b219edef541 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -701,21 +701,27 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	dpi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dpi->engine_clk)) {
 		ret = PTR_ERR(dpi->engine_clk);
-		dev_err(dev, "Failed to get engine clock: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get engine clock: %d\n", ret);
+
 		return ret;
 	}
 
 	dpi->pixel_clk = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clk)) {
 		ret = PTR_ERR(dpi->pixel_clk);
-		dev_err(dev, "Failed to get pixel clock: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get pixel clock: %d\n", ret);
+
 		return ret;
 	}
 
 	dpi->tvd_clk = devm_clk_get(dev, "pll");
 	if (IS_ERR(dpi->tvd_clk)) {
 		ret = PTR_ERR(dpi->tvd_clk);
-		dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
+
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 302753744cc6..39700b9428b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -620,7 +620,8 @@ static int mtk_ddp_probe(struct platform_device *pdev)
 	if (!ddp->data->no_clk) {
 		ddp->clk = devm_clk_get(dev, NULL);
 		if (IS_ERR(ddp->clk)) {
-			dev_err(dev, "Failed to get clock\n");
+			if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get clock\n");
 			return PTR_ERR(ddp->clk);
 		}
 	}
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5fa1073cf26b..a45ed0270531 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1194,14 +1194,18 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dsi->engine_clk)) {
 		ret = PTR_ERR(dsi->engine_clk);
-		dev_err(dev, "Failed to get engine clock: %d\n", ret);
+
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get engine clock: %d\n", ret);
 		goto err_unregister_host;
 	}
 
 	dsi->digital_clk = devm_clk_get(dev, "digital");
 	if (IS_ERR(dsi->digital_clk)) {
 		ret = PTR_ERR(dsi->digital_clk);
-		dev_err(dev, "Failed to get digital clock: %d\n", ret);
+
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get digital clock: %d\n", ret);
 		goto err_unregister_host;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5e4a4dbda443..69c6a146c561 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1451,7 +1451,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
 	if (ret) {
-		dev_err(dev, "Failed to get clocks: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get clocks: %d\n", ret);
+
 		return ret;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

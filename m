Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A03FC905
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C697B89FE8;
	Tue, 31 Aug 2021 13:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id E19B889FE8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:57:15 +0000 (UTC)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
 by Forcepoint Email with ESMTPS id B5CFDF302C1658225B4C;
 Tue, 31 Aug 2021 21:57:13 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:57:13 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:57:13 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/omap: Make use of the helper function
 devm_platform_ioremap_resourcexxx()
Date: Tue, 31 Aug 2021 21:57:06 +0800
Message-ID: <20210831135707.4676-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c      | 4 +---
 drivers/gpu/drm/omapdrm/dss/dsi.c        | 7 ++-----
 drivers/gpu/drm/omapdrm/dss/dss.c        | 4 +---
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 4 +---
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c | 5 +----
 drivers/gpu/drm/omapdrm/dss/hdmi_phy.c   | 5 +----
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c   | 4 +---
 drivers/gpu/drm/omapdrm/dss/venc.c       | 4 +---
 drivers/gpu/drm/omapdrm/dss/video-pll.c  | 8 ++------
 9 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 5619420cc2cc..cee8c3952f3a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4725,7 +4725,6 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	struct dispc_device *dispc;
 	u32 rev;
 	int r = 0;
-	struct resource *dispc_mem;
 	struct device_node *np = pdev->dev.of_node;
 
 	dispc = kzalloc(sizeof(*dispc), GFP_KERNEL);
@@ -4750,8 +4749,7 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	if (r)
 		goto err_free;
 
-	dispc_mem = platform_get_resource(dispc->pdev, IORESOURCE_MEM, 0);
-	dispc->base = devm_ioremap_resource(&pdev->dev, dispc_mem);
+	dispc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dispc->base)) {
 		r = PTR_ERR(dispc->base);
 		goto err_free;
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f1722b040f4..4023cb8b311f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4884,7 +4884,6 @@ static int dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct dsi_data *dsi;
 	struct resource *dsi_mem;
-	struct resource *res;
 	unsigned int i;
 	int r;
 
@@ -4921,13 +4920,11 @@ static int dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->proto_base))
 		return PTR_ERR(dsi->proto_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
-	dsi->phy_base = devm_ioremap_resource(dev, res);
+	dsi->phy_base = devm_platform_ioremap_resource_byname(pdev, "phy");
 	if (IS_ERR(dsi->phy_base))
 		return PTR_ERR(dsi->phy_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pll");
-	dsi->pll_base = devm_ioremap_resource(dev, res);
+	dsi->pll_base = devm_platform_ioremap_resource_byname(pdev, "pll");
 	if (IS_ERR(dsi->pll_base))
 		return PTR_ERR(dsi->pll_base);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d6a5862b4dbf..9a25ac91f383 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1424,7 +1424,6 @@ static int dss_probe(struct platform_device *pdev)
 	const struct soc_device_attribute *soc;
 	struct dss_component_match_data cmatch;
 	struct component_match *match = NULL;
-	struct resource *dss_mem;
 	struct dss_device *dss;
 	int r;
 
@@ -1452,8 +1451,7 @@ static int dss_probe(struct platform_device *pdev)
 		dss->feat = of_match_device(dss_of_match, &pdev->dev)->data;
 
 	/* Map I/O registers, get and setup clocks. */
-	dss_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dss->base = devm_ioremap_resource(&pdev->dev, dss_mem);
+	dss->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dss->base)) {
 		r = PTR_ERR(dss->base);
 		goto err_free_dss;
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
index 35faa7f028c4..8720bf4f18fe 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
@@ -870,7 +870,6 @@ static const struct soc_device_attribute hdmi4_soc_devices[] = {
 int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 {
 	const struct hdmi4_features *features;
-	struct resource *res;
 	const struct soc_device_attribute *soc;
 
 	soc = soc_device_match(hdmi4_soc_devices);
@@ -881,8 +880,7 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 	core->cts_swmode = features->cts_swmode;
 	core->audio_use_mclk = features->audio_use_mclk;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
-	core->base = devm_ioremap_resource(&pdev->dev, res);
+	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
index 6cc2ad7a420c..21564c38234f 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
@@ -872,10 +872,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 {
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
-	core->base = devm_ioremap_resource(&pdev->dev, res);
+	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
index 5dc200f09c3c..060e8f76f2be 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
@@ -182,15 +182,12 @@ static const struct hdmi_phy_features omap54xx_phy_feats = {
 int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy,
 		  unsigned int version)
 {
-	struct resource *res;
-
 	if (version == 4)
 		phy->features = &omap44xx_phy_feats;
 	else
 		phy->features = &omap54xx_phy_feats;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
-	phy->base = devm_ioremap_resource(&pdev->dev, res);
+	phy->base = devm_platform_ioremap_resource_byname(pdev, "phy");
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
index 13bf649aba52..eea719243eaf 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
@@ -162,13 +162,11 @@ int hdmi_pll_init(struct dss_device *dss, struct platform_device *pdev,
 		  struct hdmi_pll_data *pll, struct hdmi_wp_data *wp)
 {
 	int r;
-	struct resource *res;
 
 	pll->pdev = pdev;
 	pll->wp = wp;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pll");
-	pll->base = devm_ioremap_resource(&pdev->dev, res);
+	pll->base = devm_platform_ioremap_resource_byname(pdev, "pll");
 	if (IS_ERR(pll->base))
 		return PTR_ERR(pll->base);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e522c17955d0..d70cc5e94e16 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -806,7 +806,6 @@ static const struct soc_device_attribute venc_soc_devices[] = {
 static int venc_probe(struct platform_device *pdev)
 {
 	struct venc_device *venc;
-	struct resource *venc_mem;
 	int r;
 
 	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
@@ -823,8 +822,7 @@ static int venc_probe(struct platform_device *pdev)
 
 	venc->config = &venc_config_pal_trm;
 
-	venc_mem = platform_get_resource(venc->pdev, IORESOURCE_MEM, 0);
-	venc->base = devm_ioremap_resource(&pdev->dev, venc_mem);
+	venc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(venc->base)) {
 		r = PTR_ERR(venc->base);
 		goto err_free;
diff --git a/drivers/gpu/drm/omapdrm/dss/video-pll.c b/drivers/gpu/drm/omapdrm/dss/video-pll.c
index b72c3ffddc9a..b6b52049f753 100644
--- a/drivers/gpu/drm/omapdrm/dss/video-pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/video-pll.c
@@ -137,7 +137,6 @@ struct dss_pll *dss_video_pll_init(struct dss_device *dss,
 	const char * const clkctrl_name[] = { "pll1_clkctrl", "pll2_clkctrl" };
 	const char * const clkin_name[] = { "video1_clk", "video2_clk" };
 
-	struct resource *res;
 	struct dss_video_pll *vpll;
 	void __iomem *pll_base, *clkctrl_base;
 	struct clk *clk;
@@ -146,16 +145,13 @@ struct dss_pll *dss_video_pll_init(struct dss_device *dss,
 
 	/* PLL CONTROL */
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, reg_name[id]);
-	pll_base = devm_ioremap_resource(&pdev->dev, res);
+	pll_base = devm_platform_ioremap_resource_byname(pdev, reg_name[id]);
 	if (IS_ERR(pll_base))
 		return ERR_CAST(pll_base);
 
 	/* CLOCK CONTROL */
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		clkctrl_name[id]);
-	clkctrl_base = devm_ioremap_resource(&pdev->dev, res);
+	clkctrl_base = devm_platform_ioremap_resource_byname(pdev, clkctrl_name[id]);
 	if (IS_ERR(clkctrl_base))
 		return ERR_CAST(clkctrl_base);
 
-- 
2.25.1


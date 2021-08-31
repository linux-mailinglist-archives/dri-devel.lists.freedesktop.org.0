Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF423FC91B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785716E02B;
	Tue, 31 Aug 2021 13:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C0DF6E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:57:48 +0000 (UTC)
Received: from BC-Mail-Ex06.internal.baidu.com (unknown [172.31.51.46])
 by Forcepoint Email with ESMTPS id 36AE43F512D1FCBF18F5;
 Tue, 31 Aug 2021 21:57:47 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex06.internal.baidu.com (172.31.51.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:57:47 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:57:46 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/sun4i: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:57:39 +0800
Message-ID: <20210831135740.4826-1-caihuoqing@baidu.com>
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c  | 4 +---
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 4 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 4 +---
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 4 +---
 drivers/gpu/drm/sun4i/sun4i_tv.c       | 4 +---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 +---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 4 +---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 4 +---
 8 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index bf8cfefa0365..f52ff4e6c662 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -782,7 +782,6 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun4i_backend *backend;
 	const struct sun4i_backend_quirks *quirks;
-	struct resource *res;
 	void __iomem *regs;
 	int i, ret;
 
@@ -815,8 +814,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	if (IS_ERR(backend->frontend))
 		dev_warn(dev, "Couldn't find matching frontend, frontend features disabled\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index edb60ae0a9b7..56ae38389db0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -561,7 +561,6 @@ static int sun4i_frontend_bind(struct device *dev, struct device *master,
 	struct sun4i_frontend *frontend;
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
-	struct resource *res;
 	void __iomem *regs;
 
 	frontend = devm_kzalloc(dev, sizeof(*frontend), GFP_KERNEL);
@@ -576,8 +575,7 @@ static int sun4i_frontend_bind(struct device *dev, struct device *master,
 	if (!frontend->data)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 2f2c9f0a1071..3799a745b7dd 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -489,7 +489,6 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 	struct cec_connector_info conn_info;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun4i_hdmi *hdmi;
-	struct resource *res;
 	u32 reg;
 	int ret;
 
@@ -504,8 +503,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 	if (!hdmi->variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->base = devm_ioremap_resource(dev, res);
+	hdmi->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->base)) {
 		dev_err(dev, "Couldn't map the HDMI encoder registers\n");
 		return PTR_ERR(hdmi->base);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 9f06dec0fc61..88db2d2a9336 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -841,11 +841,9 @@ static int sun4i_tcon_init_regmap(struct device *dev,
 				  struct sun4i_tcon *tcon)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource *res;
 	void __iomem *regs;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index cb91bc11a0c7..94883abe0dfd 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -538,7 +538,6 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun4i_tv *tv;
-	struct resource *res;
 	void __iomem *regs;
 	int ret;
 
@@ -548,8 +547,7 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	tv->drv = drv;
 	dev_set_drvdata(dev, tv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(dev, "Couldn't map the TV encoder registers\n");
 		return PTR_ERR(regs);
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 4f5efcace68e..4371684697bd 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1104,7 +1104,6 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const char *bus_clk_name = NULL;
 	struct sun6i_dsi *dsi;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
@@ -1120,8 +1119,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 				    "allwinner,sun6i-a31-mipi-dsi"))
 		bus_clk_name = "bus";
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "Couldn't map the DSI encoder registers\n");
 		return PTR_ERR(base);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 5b42cf25cc86..f5e8aeaa3cdf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -337,7 +337,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct sun4i_drv *drv = drm->dev_private;
 	struct sun8i_mixer *mixer;
-	struct resource *res;
 	void __iomem *regs;
 	unsigned int base;
 	int plane_cnt;
@@ -390,8 +389,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 75d8e60c149d..1b9b8b48f4a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -128,7 +128,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	struct clk_hw_onecell_data *clk_data;
 	struct sun8i_tcon_top *tcon_top;
 	const struct sun8i_tcon_top_quirks *quirks;
-	struct resource *res;
 	void __iomem *regs;
 	int ret, i;
 
@@ -158,8 +157,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		return PTR_ERR(tcon_top->bus);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	tcon_top->regs = regs;
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
2.25.1


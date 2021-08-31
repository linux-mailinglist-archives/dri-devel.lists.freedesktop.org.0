Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07C3FC924
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDC089F99;
	Tue, 31 Aug 2021 13:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD0F789F99
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:58:15 +0000 (UTC)
Received: from BC-Mail-Ex05.internal.baidu.com (unknown [172.31.51.45])
 by Forcepoint Email with ESMTPS id C55C368E0499D7A89664;
 Tue, 31 Aug 2021 21:58:14 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex05.internal.baidu.com (172.31.51.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 31 Aug 2021 21:58:14 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:58:14 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tegra: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:58:07 +0800
Message-ID: <20210831135808.4876-1-caihuoqing@baidu.com>
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
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 drivers/gpu/drm/tegra/dsi.c   | 4 +---
 drivers/gpu/drm/tegra/hdmi.c  | 4 +---
 drivers/gpu/drm/tegra/sor.c   | 4 +---
 drivers/gpu/drm/tegra/vic.c   | 9 +--------
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..52750853625d 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -447,7 +447,6 @@ static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
-	struct resource *regs;
 	u32 value;
 	int err;
 
@@ -461,8 +460,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dpaux->list);
 	dpaux->dev = &pdev->dev;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpaux->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dpaux->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpaux->regs))
 		return PTR_ERR(dpaux->regs);
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f46d377f0c30..4a49fe059911 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1550,7 +1550,6 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 static int tegra_dsi_probe(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi;
-	struct resource *regs;
 	int err;
 
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -1616,8 +1615,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..24ab2f049710 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1637,7 +1637,6 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 {
 	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
-	struct resource *regs;
 	int err;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
@@ -1712,8 +1711,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..0a0917547053 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3718,7 +3718,6 @@ static int tegra_sor_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_sor *sor;
-	struct resource *regs;
 	int err;
 
 	sor = devm_kzalloc(&pdev->dev, sizeof(*sor), GFP_KERNEL);
@@ -3791,8 +3790,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		}
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sor->regs = devm_ioremap_resource(&pdev->dev, regs);
+	sor->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sor->regs)) {
 		err = PTR_ERR(sor->regs);
 		goto remove;
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..7b2eb7951b11 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -404,7 +404,6 @@ static int vic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct host1x_syncpt **syncpts;
-	struct resource *regs;
 	struct vic *vic;
 	int err;
 
@@ -425,13 +424,7 @@ static int vic_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "failed to get registers\n");
-		return -ENXIO;
-	}
-
-	vic->regs = devm_ioremap_resource(dev, regs);
+	vic->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vic->regs))
 		return PTR_ERR(vic->regs);
 
-- 
2.25.1


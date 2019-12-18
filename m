Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F056125170
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4536A6EA54;
	Wed, 18 Dec 2019 19:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C426EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:10:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id x17so1406474pln.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qISq29HsJqizQ/dr9IDqB+kkI7D+OvUtJAFPrAy/nl4=;
 b=YxQafe8jh4QPqCjejR3M34Sd/4XpSYiKBWIcOBezUR1fhLtoc82k5kx5ExrQXHKQ2C
 vS2dLSfQvTrP8O11GKbHUhcEP9GDLGdcKLUU5I2q28k6yi1c1DgTTaNzcbSVB1iyx4KX
 Cen3RsibAKaJgtVRu+yHWhpGxscNR6JCAxUXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qISq29HsJqizQ/dr9IDqB+kkI7D+OvUtJAFPrAy/nl4=;
 b=X1Zn8JRIZLiCIkLjIoRSyQ73aRcP/4QZPeuxVcoEXSRLPeoprZBjotszjLi9YEB/o6
 1+kkVUZjFbBdv2HoIk1m62mS1bRk+ufrIQifidj6uemoCnOPg/kg4y9/fXcTIJWikMMm
 IitJUIRyzLOABQaXOsx/oEYi0MRcaee+BXy+Wo7fhBCJHcmBNc5kvt/ux1FE6HVzxu47
 eaPUuNFVUA6oEfkwzQBq+8V8ZPL3SQ4sKfhLrqQMR4BfmoXOBsvUngv/56FXU9rHObju
 7XQ29AwMZh0SXoED4jE5HJX9wGBrOoZuZ5UFfyaacr93piHkTzyhoNCG985LkwJO89L0
 vjsw==
X-Gm-Message-State: APjAAAUWQDMxZ8Py4zgYFqD1GdN4keiIoWigOvWXUWTcm0s84dpAAYrG
 wg58ZEwQHNZYg1cTpvxU2jUPEA==
X-Google-Smtp-Source: APXvYqx6pZtGD5CankRw2wtkMvreOH4b8xo+2gm+PpxrsNSXLh1P6DrOeczRQv/iXcWiQlhsiKLRBQ==
X-Received: by 2002:a17:90a:3747:: with SMTP id
 u65mr2730117pjb.25.1576696245276; 
 Wed, 18 Dec 2019 11:10:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
 by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:10:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v13 4/7] drm/sun4i: dsi: Handle bus clock via
 regmap_mmio_attach_clk
Date: Thu, 19 Dec 2019 00:40:14 +0530
Message-Id: <20191218191017.2895-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191218191017.2895-1-jagan@amarulasolutions.com>
References: <20191218191017.2895-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

regmap has special API to enable the controller bus clock while
initializing register space, and current driver is using
devm_regmap_init_mmio_clk which require to specify bus
clk_id argument as "bus"

But, the usage of clocks are varies between different Allwinner
DSI controllers. Clocking in A33 would need bus and mod clocks
where as A64 would need only bus clock.

Since A64 support only single bus clock, it is optional to
specify the clock-names on the controller device tree node.
So using NULL on clk_id would get the attached clock.

To support clk_id as "bus" and "NULL" during clock enablement
between controllers, this patch add generic code to handle
the bus clock using regmap_mmio_attach_clk with associated
regmap APIs.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- update the changes since has_mod_clk is dropped in previous patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 45 +++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 68b88a3dc4c5..de8955fbeb00 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1081,6 +1081,7 @@ static const struct component_ops sun6i_dsi_ops = {
 static int sun6i_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const char *bus_clk_name = NULL;
 	struct sun6i_dsi *dsi;
 	struct resource *res;
 	void __iomem *base;
@@ -1094,6 +1095,10 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &sun6i_dsi_host_ops;
 	dsi->host.dev = dev;
 
+	if (of_device_is_compatible(dev->of_node,
+				    "allwinner,sun6i-a31-mipi-dsi"))
+		bus_clk_name = "bus";
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base)) {
@@ -1107,25 +1112,36 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->regulator);
 	}
 
-	dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
-					      &sun6i_dsi_regmap_config);
-	if (IS_ERR(dsi->regs)) {
-		dev_err(dev, "Couldn't create the DSI encoder regmap\n");
-		return PTR_ERR(dsi->regs);
-	}
-
 	dsi->reset = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(dsi->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
 		return PTR_ERR(dsi->reset);
 	}
 
+	dsi->regs = devm_regmap_init_mmio(dev, base, &sun6i_dsi_regmap_config);
+	if (IS_ERR(dsi->regs)) {
+		dev_err(dev, "Couldn't init regmap\n");
+		return PTR_ERR(dsi->regs);
+	}
+
+	dsi->bus_clk = devm_clk_get(dev, bus_clk_name);
+	if (IS_ERR(dsi->bus_clk)) {
+		dev_err(dev, "Couldn't get the DSI bus clock\n");
+		ret = PTR_ERR(dsi->bus_clk);
+		goto err_regmap;
+	} else {
+		ret = regmap_mmio_attach_clk(dsi->regs, dsi->bus_clk);
+		if (ret)
+			goto err_bus_clk;
+	}
+
 	if (of_device_is_compatible(dev->of_node,
 				    "allwinner,sun6i-a31-mipi-dsi")) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
 			dev_err(dev, "Couldn't get the DSI mod clock\n");
-			return PTR_ERR(dsi->mod_clk);
+			ret = PTR_ERR(dsi->mod_clk);
+			goto err_attach_clk;
 		}
 	}
 
@@ -1164,6 +1180,14 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 err_unprotect_clk:
 	clk_rate_exclusive_put(dsi->mod_clk);
+err_attach_clk:
+	if (!IS_ERR(dsi->bus_clk))
+		regmap_mmio_detach_clk(dsi->regs);
+err_bus_clk:
+	if (!IS_ERR(dsi->bus_clk))
+		clk_put(dsi->bus_clk);
+err_regmap:
+	regmap_exit(dsi->regs);
 	return ret;
 }
 
@@ -1177,6 +1201,11 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	clk_rate_exclusive_put(dsi->mod_clk);
 
+	if (!IS_ERR(dsi->bus_clk))
+		regmap_mmio_detach_clk(dsi->regs);
+
+	regmap_exit(dsi->regs);
+
 	return 0;
 }
 
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B394F8EE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCBD10E181;
	Mon, 12 Aug 2024 21:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="gOl04uim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FED710E181
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:23:44 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723497816; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ieHrHpiltkX1UNLyKDtEdDj/Z1hoqspIEcZkNkpS27ZAgnJ6DHhBPFNHFuDF5vwv/db1hafZuqash/5J76L5HkuUs9pWC8IGY45svx4Fen+V1GfjYvn6jBY3GMs/RkOMBV2eJINHiFsyCqV6TtoC4fWnp8ugaORIdLqw4OAyHAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723497816;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jlGPm4zay+O+5NxYplC7hIV2VJhkT7SctwvsdxMk7NY=; 
 b=VtE7wAJYrlCy7RCHrO6mPxHzNNuUQq8uKqPeECo4YI14Ns+TdljUCC48aa3wzbsFWfrhiUkDVm6zKgueURuOrdh8oI/QBocUe6fQFqWIvSkZtwvGJR4D+vqJiMlWPG0IkNDhFH6+08kuk7Xzcp8pAKVMO9VHBUP+JczrqUmlokU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723497816; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=jlGPm4zay+O+5NxYplC7hIV2VJhkT7SctwvsdxMk7NY=;
 b=gOl04uimxp4DdUlWr2mNquqMCp6DdN8bNelW/4ZTAJ4bQwFzpYQvg0y3AeMKuMok
 6wJvnw3SK427wsPDdPv7LyCvR//++EiqESgkD6I1J+WClk4Lg1S3UVQLCuMZwkEM/12
 eB/hYvAXdAyoKMXW08nmZuR9/C+wF+TnQ3Ts4afA=
Received: by mx.zohomail.com with SMTPS id 1723497815850467.7307432445673;
 Mon, 12 Aug 2024 14:23:35 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Aug 2024 00:23:21 +0300
Subject: [PATCH] drm/bridge: dw-hdmi: Simplify clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-dw-hdmi-simple-clk-v1-1-78d45cef02a9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEh9umYC/x3MywqAIBBA0V+JWTegPejxK9HCcsohtVCoIPr3p
 OVZ3PtApMAUoc8eCHRy5N0nyDyD2Si/ErJOhkIUlWhlifpCox1jZHdYwtluSKqT01ILrUQDKTw
 CLXz/02F83w/fr504ZAAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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

Make use of devm_clk_get_enabled() to replace devm_clk_get() and
clk_prepare_enable() for isfr and iahb clocks, and drop the now
unnecessary calls to clk_disable_unprepare().

Similarly, use devm_clk_get_optional_enabled() helper for cec clock,
which additionally allows to remove the -ENOENT test.

Moreover, the clock related members of struct dw_hdmi are not required
anymore, hence drop them.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 66 ++++++++-----------------------
 1 file changed, 16 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9f2bc932c371..0031f3c54882 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -138,9 +138,6 @@ struct dw_hdmi {
 	struct platform_device *audio;
 	struct platform_device *cec;
 	struct device *dev;
-	struct clk *isfr_clk;
-	struct clk *iahb_clk;
-	struct clk *cec_clk;
 	struct dw_hdmi_i2c *i2c;
 
 	struct hdmi_data_info hdmi_data;
@@ -3326,6 +3323,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	struct device_node *ddc_node;
 	struct dw_hdmi_cec_data cec;
 	struct dw_hdmi *hdmi;
+	struct clk *clk;
 	struct resource *iores = NULL;
 	int irq;
 	int ret;
@@ -3405,50 +3403,27 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->regm = plat_data->regm;
 	}
 
-	hdmi->isfr_clk = devm_clk_get(hdmi->dev, "isfr");
-	if (IS_ERR(hdmi->isfr_clk)) {
-		ret = PTR_ERR(hdmi->isfr_clk);
+	clk = devm_clk_get_enabled(hdmi->dev, "isfr");
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		dev_err(hdmi->dev, "Unable to get HDMI isfr clk: %d\n", ret);
 		goto err_res;
 	}
 
-	ret = clk_prepare_enable(hdmi->isfr_clk);
-	if (ret) {
-		dev_err(hdmi->dev, "Cannot enable HDMI isfr clock: %d\n", ret);
-		goto err_res;
-	}
-
-	hdmi->iahb_clk = devm_clk_get(hdmi->dev, "iahb");
-	if (IS_ERR(hdmi->iahb_clk)) {
-		ret = PTR_ERR(hdmi->iahb_clk);
+	clk = devm_clk_get_enabled(hdmi->dev, "iahb");
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		dev_err(hdmi->dev, "Unable to get HDMI iahb clk: %d\n", ret);
-		goto err_isfr;
-	}
-
-	ret = clk_prepare_enable(hdmi->iahb_clk);
-	if (ret) {
-		dev_err(hdmi->dev, "Cannot enable HDMI iahb clock: %d\n", ret);
-		goto err_isfr;
+		goto err_res;
 	}
 
-	hdmi->cec_clk = devm_clk_get(hdmi->dev, "cec");
-	if (PTR_ERR(hdmi->cec_clk) == -ENOENT) {
-		hdmi->cec_clk = NULL;
-	} else if (IS_ERR(hdmi->cec_clk)) {
-		ret = PTR_ERR(hdmi->cec_clk);
+	clk = devm_clk_get_optional_enabled(hdmi->dev, "cec");
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		if (ret != -EPROBE_DEFER)
 			dev_err(hdmi->dev, "Cannot get HDMI cec clock: %d\n",
 				ret);
-
-		hdmi->cec_clk = NULL;
-		goto err_iahb;
-	} else {
-		ret = clk_prepare_enable(hdmi->cec_clk);
-		if (ret) {
-			dev_err(hdmi->dev, "Cannot enable HDMI cec clock: %d\n",
-				ret);
-			goto err_iahb;
-		}
+		goto err_res;
 	}
 
 	/* Product and revision IDs */
@@ -3462,12 +3437,12 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		dev_err(dev, "Unsupported HDMI controller (%04x:%02x:%02x)\n",
 			hdmi->version, prod_id0, prod_id1);
 		ret = -ENODEV;
-		goto err_iahb;
+		goto err_res;
 	}
 
 	ret = dw_hdmi_detect_phy(hdmi);
 	if (ret < 0)
-		goto err_iahb;
+		goto err_res;
 
 	dev_info(dev, "Detected HDMI TX controller v%x.%03x %s HDCP (%s)\n",
 		 hdmi->version >> 12, hdmi->version & 0xfff,
@@ -3479,14 +3454,14 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto err_iahb;
+		goto err_res;
 	}
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
 	if (ret)
-		goto err_iahb;
+		goto err_res;
 
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
@@ -3603,11 +3578,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 
 	return hdmi;
 
-err_iahb:
-	clk_disable_unprepare(hdmi->iahb_clk);
-	clk_disable_unprepare(hdmi->cec_clk);
-err_isfr:
-	clk_disable_unprepare(hdmi->isfr_clk);
 err_res:
 	i2c_put_adapter(hdmi->ddc);
 
@@ -3627,10 +3597,6 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
 	/* Disable all interrupts */
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
-	clk_disable_unprepare(hdmi->iahb_clk);
-	clk_disable_unprepare(hdmi->isfr_clk);
-	clk_disable_unprepare(hdmi->cec_clk);
-
 	if (hdmi->i2c)
 		i2c_del_adapter(&hdmi->i2c->adap);
 	else

---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240813-dw-hdmi-simple-clk-ea91bf50da07


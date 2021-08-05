Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0F3E16B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141436EA81;
	Thu,  5 Aug 2021 14:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BE16EA7B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172486;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=CliIVqvNzA/bGBlLAYmf7rIejrGR22i5z/kGrFUsuDU=;
 b=aQQJPEJ0jCM1iMaL2MFUfRGIIzKEaRcDNf2tGiFM8NcjZCfz4p8vQhjt1lrN7k83ZO
 BzAU7bAQB9qHCReArzr1c6eZ37KgHwnTGuom6o8amMiIRiaD6CzR3lexc1yketsDJ/Jg
 pIF7LOcdEkFt83UmjT+B1Z+Aoas3a6BwuStYAzUjWVtM1AIDYeiEiC30DeuJaIjTkK12
 dEduqK0sP6iJghpdd/R5/cmb1H9RTxOFL47/C8jmtBLJKxB7OIZeELY0TjU2sBEBHQJb
 MM/BWyMduC99sODYMs4Lx+Lwpd9KaVCIb4CMIanxDUVLhkiSzvEboTPjsPUg6/AjtFml
 TKJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75E85789
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 16:08:05 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework for
 jz4780 hdmi
Date: Thu,  5 Aug 2021 16:07:57 +0200
Message-Id: <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch attempts to convert the ingenic-dw-hdmi driver
into a version that uses the component framework.

Unfortunately the new version does not work.

Debugging shows that ingenic_dw_hdmi_bind() is never called.

Suggestions for reasons and fixes are welcome.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Co-authored-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 57 ++++++++++++++++++-----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
index 61e7a57d7cec1..a5ba0b69baa8c 100644
--- a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
+++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
@@ -1,17 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
- * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
+ * Copyright (C) 2019, 2020, 2021 Paul Boddie <paul@boddie.org.uk>
  *
  * Derived from dw_hdmi-imx.c with i.MX portions removed.
- * Probe and remove operations derived from rcar_dw_hdmi.c.
  */
 
+#include <linux/component.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_simple_kms_helper.h>
+
+struct ingenic_dw_hdmi_encoder {
+	struct drm_encoder encoder;
+	struct dw_hdmi *hdmi;
+};
 
 static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
 	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
@@ -87,24 +94,52 @@ static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
 
-static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
+static int ingenic_dw_hdmi_bind(struct device *dev, struct device *master,
+				void *data)
 {
-	struct dw_hdmi *hdmi;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = data;
+	struct drm_encoder *enc;
+	struct ingenic_dw_hdmi_encoder *hdmi_encoder;
 
-	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
-	if (IS_ERR(hdmi))
-		return PTR_ERR(hdmi);
+	hdmi_encoder = drmm_simple_encoder_alloc(drm, struct ingenic_dw_hdmi_encoder,
+						 encoder, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(hdmi_encoder))
+		return PTR_ERR(hdmi_encoder);
 
-	platform_set_drvdata(pdev, hdmi);
+	enc = &hdmi_encoder->encoder;
+	drm_encoder_helper_add(enc, NULL);
+	hdmi_encoder->hdmi = dw_hdmi_bind(pdev, enc, &ingenic_dw_hdmi_plat_data);
+
+	if (IS_ERR(hdmi_encoder->hdmi))
+		return PTR_ERR(hdmi_encoder->hdmi);
+
+	dev_set_drvdata(dev, hdmi_encoder->hdmi);
 
 	return 0;
 }
 
-static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
+static void ingenic_dw_hdmi_unbind(struct device *dev, struct device *master,
+				   void *data)
+{
+	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_unbind(hdmi);
+}
+
+static const struct component_ops ingenic_dw_hdmi_ops = {
+	.bind	= ingenic_dw_hdmi_bind,
+	.unbind	= ingenic_dw_hdmi_unbind,
+};
+
+static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
 {
-	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+	return component_add(&pdev->dev, &ingenic_dw_hdmi_ops);
+}
 
-	dw_hdmi_remove(hdmi);
+static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &ingenic_dw_hdmi_ops);
 
 	return 0;
 }
-- 
2.31.1


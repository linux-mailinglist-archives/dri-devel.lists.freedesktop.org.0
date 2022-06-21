Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43B552FDB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73610F794;
	Tue, 21 Jun 2022 10:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77B10F794
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:36:46 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso9941131pjn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2wqkYCAZVWUkcpI1DWSn0LbIIhYG3OmH1tlPS2Wtmd4=;
 b=XRS5+iWhrsBICJnOwC8C91JQz4hmxydSsLa/vKMWgcdj8M6vkccWS0GLA7ZnHNbXL5
 dAa00abp8VlEUYfuLW9jmP867hFNx1ocf1VOYWuiE0e4bFnq3hHhmu4gaQVEoDQemqsi
 ehKXjlfcKLeAFw5imwO/mVFnOcLPwbPuxFzdp1bB8OkiW9tvNdqAdY9K0/dTbmtfPUsf
 1VRK4iDNk9V4JkUfJvacetxmkeCtt/E3Bc+ndCYrG4XnBFCOgYTJTX4eTWly0zuBiiFK
 c8lFnIuKlOAv2E4ZAuRL9pOHU1KF9wWVXzuATNyygFYIwrJTz8gwEK/r+aPergnvPYwp
 yCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2wqkYCAZVWUkcpI1DWSn0LbIIhYG3OmH1tlPS2Wtmd4=;
 b=DePBUcMmaCyU8ap8akoqfK+9vx0v5wMfbqlFckSad6BHSD5QXRF26P1JO0eAgh4rl9
 DERPIx7FS63TLTmGsBu6QfMIb2kkYS7II8kM5Ut3LlRgNas+o3jtz+A2dSYIkw0xet9B
 ducFm00/Kw0ne7G/3wAda9L+UVE3cwRhiaYIXl8nyWI4hjHyKnpMhFn8xvttanDBfqbB
 +SJzZgXoXRhaimW/sXGr3HJZ5mg+w31jr/w8C/wTdBIjnQBQAVCEBQb/USAGUpe5jZsJ
 1WLnmFyT8PPxEtn2yWMeI0D514sJtWj8rRxUOe65FMEr0Pni/xLUcRqYbz/IyGVMQ7cO
 59zA==
X-Gm-Message-State: AJIora9CYgfUHhG9VJetBgA2/Pqm1lvZNAOqZ9b3xU2uJvhRK0k2M3X2
 V5hEdPPWqQegrZeNN+rmpgw=
X-Google-Smtp-Source: AGRyM1uGRIsIcP5NzsVPx4Jp99hohscoO3CeMiyTnZypEMga2gM0r3Aluuhfwhl4rfbbuNMZ+KrTGQ==
X-Received: by 2002:a17:902:a502:b0:151:8289:b19 with SMTP id
 s2-20020a170902a50200b0015182890b19mr27961661plq.149.1655807805722; 
 Tue, 21 Jun 2022 03:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:c428:5499:b787:9:3bde])
 by smtp.gmail.com with ESMTPSA id
 o188-20020a625ac5000000b0050dc762819bsm36295pfb.117.2022.06.21.03.36.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jun 2022 03:36:45 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v4 2/2] backlight: rt4831: Apply ocp level from devicetree
Date: Tue, 21 Jun 2022 18:36:28 +0800
Message-Id: <1655807788-24511-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
References: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add 'richtek,bled-ocp-microamp' property parsing in
device_property_init function.

This value may configure prior to the kernel driver. If it's not specified in
devicetree, keep the original setting. Else, use clamp to align the
value in min/max range and also roundup to choose the best selector.

Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Hi, Daniel:

I may use the wrong macro, must be 'DIV_ROUND_UP', not 'roundup'.
the v4 is to fix it.

Since v4
- Fix wrong macro usage, must be 'DIV_ROUND_UP', not 'roundup'

Since v2:
- Prase the 'richtek,bled-ocp-microamp', clamp the value in min/max range, and
  roundup to get the best selector.

---
 drivers/video/backlight/rt4831-backlight.c | 33 +++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index 42155c7..eb8c59e 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -12,6 +12,7 @@
 #define RT4831_REG_BLCFG	0x02
 #define RT4831_REG_BLDIML	0x04
 #define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_BLOPT2	0x11
 
 #define RT4831_BLMAX_BRIGHTNESS	2048
 
@@ -23,6 +24,11 @@
 #define RT4831_BLDIML_MASK	GENMASK(2, 0)
 #define RT4831_BLDIMH_MASK	GENMASK(10, 3)
 #define RT4831_BLDIMH_SHIFT	3
+#define RT4831_BLOCP_MASK	GENMASK(1, 0)
+
+#define RT4831_BLOCP_MINUA	900000
+#define RT4831_BLOCP_MAXUA	1800000
+#define RT4831_BLOCP_STEPUA	300000
 
 struct rt4831_priv {
 	struct device *dev;
@@ -85,7 +91,7 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
 {
 	struct device *dev = priv->dev;
 	u8 propval;
-	u32 brightness;
+	u32 brightness, ocp_uA;
 	unsigned int val = 0;
 	int ret;
 
@@ -120,6 +126,31 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
 	if (ret)
 		return ret;
 
+	/*
+	 * This OCP level is used to protect and limit the inductor current.
+	 * If inductor peak current reach the level, low-side MOSFET will be
+	 * turned off. Meanwhile, the output channel current may be limited.
+	 * To match the configured channel current, the inductor chosen must
+	 * be higher than the OCP level.
+	 *
+	 * Not like the OVP level, the default 21V can be used in the most
+	 * application. But if the chosen OCP level is smaller than needed,
+	 * it will also affect the backlight channel output current to be
+	 * smaller than the register setting.
+	 */
+	ret = device_property_read_u32(dev, "richtek,bled-ocp-microamp",
+				       &ocp_uA);
+	if (!ret) {
+		ocp_uA = clamp_val(ocp_uA, RT4831_BLOCP_MINUA,
+				   RT4831_BLOCP_MAXUA);
+		val = DIV_ROUND_UP(ocp_uA - RT4831_BLOCP_MINUA,
+				   RT4831_BLOCP_STEPUA);
+		ret = regmap_update_bits(priv->regmap, RT4831_REG_BLOPT2,
+					 RT4831_BLOCP_MASK, val);
+		if (ret)
+			return ret;
+	}
+
 	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
 	if (ret) {
 		dev_err(dev, "richtek,channel-use DT property missing\n");
-- 
2.7.4


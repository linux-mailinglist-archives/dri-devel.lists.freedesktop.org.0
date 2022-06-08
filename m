Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BF5429A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAE410E788;
	Wed,  8 Jun 2022 08:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2B10E788
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:41:47 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f16a3e0529so26395271fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SXmj6b+DkfLw5itmWk4/FOZXu0aiY0xTFwHQz3P20xg=;
 b=WdYBN8CGdrIXxQzK0GPeVgw2MzDlTQbjZImmiSCIjEzItPZCLwSrJunmeLbwAI5ikm
 7UpERZ2fzajMjBN38noWZM/RUcDEMPoazkYxmDCZ/piF6SB6ltAhCk3muTBLBmfff+up
 1ySlRhC1vAawc4shHJYJl8WtvyOFfF7pyOD2RMHst5fPRND+9bgFXKQhUs4eFuzF83pL
 TH7AybGjXUB/CPMHa+NdXiymNtTHvTNSi9Ff/1E1P5OvPjJCNNfhkrNJDXwi4zpqetk1
 kyOe8mqAmriJNKLHM0imih+M6yAeZIA/mFxwR6SZyk+XLKohGvYt0P+D4aZX/5GXgoaR
 obRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SXmj6b+DkfLw5itmWk4/FOZXu0aiY0xTFwHQz3P20xg=;
 b=M2avUm7GRxrikla717WvUpIY2EJUVgHAVW8jOtl/DhxT5n7sVNkc6Q61jK0cWKp+nf
 SHCkocZ1NrZWjSd6JYztok3m7XaI2QzWkRS80n6eDBFlUzNmgHuTl1suYhyA9D0IkDCZ
 wVfP3rvynSqGVdo9O9EVNTFs+S09qHRkvvI2RkN++/jJtG1TR7hKPGjmaUWYz1aKjZNr
 yVPXYPkqmjCgBKB64c6foDljb1Z+Y1YT5mldYXni8lAOsznRN2fBwSmKCd3n2oOodqAV
 7L4XQkyW+yF2HHeNW24FDiIyHWmYEeIHXF8f+DAUqM7X0wM8XBPD0/FhBW7Jp4wzPXJr
 OTfg==
X-Gm-Message-State: AOAM533l44tcMFgqIAXgrqnVOIJnCXuh7/tK4LpxEMsWisxlEqwhFK1o
 RwRZzPBcC6GhqcC94+zUFLuO4M2VioNGWg==
X-Google-Smtp-Source: ABdhPJxAOK47geI2yEq8uUzL6jVlujBVSQkzoXkWwANZs743d3DkA34VEE/uGgrzp5MCNfVJU/Fzyg==
X-Received: by 2002:a17:90a:4897:b0:1c7:5fce:cbcd with SMTP id
 b23-20020a17090a489700b001c75fcecbcdmr71830734pjh.45.1654677696141; 
 Wed, 08 Jun 2022 01:41:36 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:479:837b:38ad:1ae9:1239:b178])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902f34400b0015e8d4eb263sm13902217ple.173.2022.06.08.01.41.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 01:41:35 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v2 2/2] backlight: rt4831: Apply ocp level from devicetree
Date: Wed,  8 Jun 2022 16:41:14 +0800
Message-Id: <1654677674-15417-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
References: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
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
---
Since v2:
- Prase the 'richtek,bled-ocp-microamp', clamp the value in min/max range, and
  roundup to get the best selector.

---
 drivers/video/backlight/rt4831-backlight.c | 33 +++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index 42155c7..8c2001b 100644
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
+		val = roundup(ocp_uA - RT4831_BLOCP_MINUA,
+			      RT4831_BLOCP_STEPUA);
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


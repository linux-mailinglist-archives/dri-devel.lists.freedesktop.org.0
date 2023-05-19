Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF970A708
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 11:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA44410E149;
	Sat, 20 May 2023 09:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657EB10E47D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 20:05:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso23462325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1684526734; x=1687118734; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unGGcWMXSxlIkISO/XPChAGC5INeHx+xymr7hphOHTk=;
 b=k5Guw/07AnhDpxjKB8UcXAAmZWcQ5O3JowQVJ8laPyua71EN/rsYssN/IFPaFpkVpI
 TNQ3Unj6O43cAdOO+OlJb/KWDnruigOlVvcsww9kNmV0PUazy0v2IbPDWbOOOPXT46IK
 gb2tn8Hf/7Bg0Lu5ehkHUxiwM3yKMAO1UQ2MwV2DKEkEB946eY0I3G1Gxks2hY+Ydn7W
 ecXUt3qg+NzSrGI0M2vHUQcH7ryHNXhU1MzhxtbmTvYxXhHlz6txRv/tGxamizDCnjzp
 i2DRuPB/RPO5+nSINoDpkwQxIm/dOb0kmar0qY5Mm/EYGnDK2PDeXlgtmjuPcYIxJN/+
 M8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684526734; x=1687118734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unGGcWMXSxlIkISO/XPChAGC5INeHx+xymr7hphOHTk=;
 b=e4NEnyBMrzVhFDhcmikvYbeyZDZ6EZk9fnni70Bq8eu9YxLZtQZ8UdfHa0TsiQgwTC
 FUi6fVKymUZxaFzltTGmi4IF5yvoNhVY3EvzUdWLkTm+q56KghhzTQIrW7Ae5VxFeqwa
 83bPTp5fbtYfT21EVpwLdEsbhRg/LdCzjDae6TIAnemvVbLnDOzFmhGpczQSbpFmmA34
 YS8IdcunHTiWjDAHbW6AZOHUGo2bWK5m4QkWvwzXApmQWuNDVJnYIutbhOqj0GZ2kzlp
 ++/CMsBeJwKX8KXbG5QfSTqTrtSHj8/chE9FjXUqshcxjF6zGJ4sMt+f7cH/xMavsSaI
 6TWg==
X-Gm-Message-State: AC+VfDzjrMCN4z+CANbf24ypIIGoX/0kEqggPQLndvZx9WWEzTnZ1ttv
 NMxSiZ0zm6Q1yWu88LjblEXwE41/PcrBy+unpmXWLg==
X-Google-Smtp-Source: ACHHUZ7ga4CZxLiQQKfdmi4Xqh4DykUfMWEgzKKffEXW7eHm0kD86vFODcQqOLeT733JRNm32EOAfA==
X-Received: by 2002:a1c:7303:0:b0:3f1:9acf:8682 with SMTP id
 d3-20020a1c7303000000b003f19acf8682mr2044341wmb.17.1684526733947; 
 Fri, 19 May 2023 13:05:33 -0700 (PDT)
Received: from localhost.localdomain ([188.27.132.2])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfea03000000b002fe96f0b3acsm6220329wrm.63.2023.05.19.13.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 13:05:33 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 1/2] backlight: gpio_backlight: add new property
 default-brightness-level
Date: Fri, 19 May 2023 23:05:19 +0300
Message-Id: <20230519200520.10657-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 May 2023 09:58:49 +0000
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, robh+dt@kernel.org,
 Philippe CORNU <philippe.cornu@foss.st.com>, krzysztof.kozlowski+dt@linaro.org,
 Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Add new property to set a brightness by default at probe.

Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Link to original patch:
  https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98

 drivers/video/backlight/gpio_backlight.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6f78d928f054..d3fa3a8bef4d 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	u32 value;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	else
 		bl->props.power = FB_BLANK_UNBLANK;
 
-	bl->props.brightness = 1;
+	ret = device_property_read_u32(dev, "default-brightness-level", &value);
+	if (!ret && value <= props.max_brightness)
+		bl->props.brightness = value;
+	else
+		bl->props.brightness = 1;
 
 	init_brightness = backlight_get_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-- 
2.40.1


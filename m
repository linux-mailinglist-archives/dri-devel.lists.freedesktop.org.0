Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F183534940
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 05:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA0210E16E;
	Thu, 26 May 2022 03:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D044610E5FD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 03:16:51 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id m1so396635plx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UThOTLkpL6r0PfLYsEVVStjdxypFZ/KqJ5dVvlv45cQ=;
 b=TwvS3CSU4878l6qtnM6vjb91z+ZtHsGsRArRPglugXj1iIcrUot9+RP/7cVVUlboRH
 J/dJb7DHUGzCH5PXT5F7+FACbuPaPhozVRUKNFEKkfY/UzDoQgTwTUq2DwuUhOZV5FJD
 VGUHUVM+ZUt0okEKD6G8gHCqtLzE1EFzYi34hzKSu1Epue0KIxYLCXwxLyN3cd3SSkJM
 h0N5VIzySFDCKa1TXC0dfBWlTmsnDqEwQmX8mK61ruF44VsN0pYma9ckDd67YWRtRxqs
 NrSU/zhbjbZnUPQ4uZYlvheq0H5Y++27HZhiQ93dealVKz+LLtHvNf6PvYTHNZKv0ydH
 9hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UThOTLkpL6r0PfLYsEVVStjdxypFZ/KqJ5dVvlv45cQ=;
 b=fbBZ5h2df4gGioK1qzFnwQsAu0Oer0zuOXJNxxjewCqSffNFQq0Ii05BaYW188g8KC
 kq5ssm9hsYIZKbcOwbKytugkkl+CIsEAEffMztQatSzqonOpuldWPCU8hWqbA4knTDmx
 RgsAdoXjnmaybm7sq1hwZ6ftqDNtF14NfJB22a+PG4HBNo8bejHunYJBfBsAecRoT8L3
 6ZDFjlQup7uEnZC7Xs+5p0R/fuN9JlkV/o99JSgl9A18jNSrjpnJmvja5ATiD7LS+nKC
 GusH4WukR3ycz5snGhLbvBFDr/O7Z7KsNIzxEfstWB3VmeJECk0TVL1tAqrBp12vMpp6
 ktvQ==
X-Gm-Message-State: AOAM533rEw397Na3ARq/5fHiidCGiHqAhrlwHL+iVm7jmO0HeOujMFzU
 DBF0T8RRHO3yiDPYYOrVBC8=
X-Google-Smtp-Source: ABdhPJw4OWJucWjDO/OgkBgn3Kd7o4a82L1xaZs86EKdpB+JzlecBZUX/jxImhdjaEDiYy8UQCJd3g==
X-Received: by 2002:a17:90a:e7c6:b0:1e0:9cf7:d042 with SMTP id
 kb6-20020a17090ae7c600b001e09cf7d042mr354429pjb.234.1653535011416; 
 Wed, 25 May 2022 20:16:51 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:6b12:f420:101e:bfc0:b57c])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa79479000000b0050dc7628181sm152964pfq.91.2022.05.25.20.16.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 20:16:51 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH 2/2] backlight: rt4831: Add the property parsing for ocp level
 selection
Date: Thu, 26 May 2022 11:16:35 +0800
Message-Id: <1653534995-30794-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
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

Add the property parsing for ocp level selection.

Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/video/backlight/rt4831-backlight.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index 42155c7..c81f7d9 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -12,6 +12,7 @@
 #define RT4831_REG_BLCFG	0x02
 #define RT4831_REG_BLDIML	0x04
 #define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_BLOPT2	0x11
 
 #define RT4831_BLMAX_BRIGHTNESS	2048
 
@@ -23,6 +24,8 @@
 #define RT4831_BLDIML_MASK	GENMASK(2, 0)
 #define RT4831_BLDIMH_MASK	GENMASK(10, 3)
 #define RT4831_BLDIMH_SHIFT	3
+#define RT4831_BLOCP_MASK	GENMASK(1, 0)
+#define RT4831_BLOCP_SHIFT	0
 
 struct rt4831_priv {
 	struct device *dev;
@@ -120,6 +123,16 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "richtek,bled-ocp-sel", &propval);
+	if (ret)
+		propval = RT4831_BLOCPLVL_1P2A;
+
+	propval = min_t(u8, propval, RT4831_BLOCPLVL_1P8A);
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLOPT2, RT4831_BLOCP_MASK,
+				 propval << RT4831_BLOCP_SHIFT);
+	if (ret)
+		return ret;
+
 	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
 	if (ret) {
 		dev_err(dev, "richtek,channel-use DT property missing\n");
-- 
2.7.4


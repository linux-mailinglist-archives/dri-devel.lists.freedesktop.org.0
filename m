Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C067BE2D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F010310E8BB;
	Wed, 25 Jan 2023 21:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E63E10E185
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:09:22 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id 3so21076918vsq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9RJJ/n41zzX+saTp2LNncjY8Fypt3NmL9yEutFB4n1s=;
 b=WOHm/saIG3Dr4q+24Z7G6SYdxWckEwYZ2OiPVUiQlFDjk9J/GGH5G2lPCp9nPBdUM6
 NKLPG74xTyEwESMRZGQkeobMfCP0xvhk5dxc/hF9opSrydqXNm+bgs4xusEtsuqt6ZTj
 erM0lCjFlt1FjkKoN2A0doFteQq1lyRdmHVl5KpF63lOurZ1mSrCtIHL8WCuWLQTVOdQ
 f57HcEWpr7rvKo71D5asNmYTOkr2yKFiuCioq2hGejao5f7Z1Lr2hfTb0FQGrA4rgB2Z
 r62S/gRt3R3/7qHDmBiWTdJj+fteUohtw1NfX3myqFn9sBC4hrsY1vkKe36xcZhRDijK
 IetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RJJ/n41zzX+saTp2LNncjY8Fypt3NmL9yEutFB4n1s=;
 b=rHpAncUVB3CYntelazAvPFobQkDN/j+3heMcZjwUpcSyA01jFTXw2iqz1auWQHmiz0
 yniRmGFXx8X3WVSlDjTWKSGHTcwWPf+L9qiZ5fVyZqAvM1U7N6UIDhvELX2InerxnrfB
 FrjYtq6vmF84pgM4KmsRr5aOmHHoL7PyIIfUoHvj3AEYEl5Rtp5N690uTAj/6WE9cA/D
 eZD4WAXNqC8QTwyZU7GZDedT5tMaw9KhcPO0E3SRM7yns5Gsf83/Ew+2glpKp9V/04pj
 MYOpxG7tCb2iIz1/1tCAY7V78JliPJqHsZSzelbMJm54GWS/Ss8jhPcdbris27WPYTu5
 VvGQ==
X-Gm-Message-State: AO0yUKVrgfK8LPxaMG+JcjW3lBMU6wLOfWo6rgleEvWrgDlpZE6RdpNQ
 82T7Up2sXGwUbAO+wWy03ELE4g==
X-Google-Smtp-Source: AK7set9bH4FlpCkV+Z+7rYCaPzI9wpMh7X7Sa4ITkX7oLz7viTzX4t7Ud2ygznpBXw4WanAYEKE8aw==
X-Received: by 2002:a67:7284:0:b0:3e9:93fa:140c with SMTP id
 n126-20020a677284000000b003e993fa140cmr1644589vsc.9.1674680962198; 
 Wed, 25 Jan 2023 13:09:22 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q196-20020a3743cd000000b0070736988c10sm4177090qka.110.2023.01.25.13.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:09:21 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Wed, 25 Jan 2023 16:09:12 -0500
Subject: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected,
 use I2C for polled HPD status.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.11.3-dev-d001f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=dbb6ec7CfpiriM2pWdSl9OaXPVL9sCebyFiqEYEERQk=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0Zp8UY3oOfu1sE+y2VZfLN0nj6Zb8gpmkZWoxYPV
 wM1zUW2JAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9GafAAKCRDc1/0uCzbrqly9EA
 CPJlnlwhTnKovCKXXIx14LdNjTl14R/C5jZyKgskM3kkTsxuPRLUWuniHgeDEO7fhbZx3FwtW1QUp/
 Zn9RnwRza3ZKJEyHv0elltxnjisj/WTR0Z3NGL2xHIQXP8MxyGFBYtvJZoQHQ3rpmu9bOkhCIvD+fG
 7MenhcEfyBVbKBnIiK7AraSXgAMBWt5lGo6o8ZBbVHBVgol/iU5lkMs4Od1hCEmfWDyiGAbvvQnCGc
 XSo2TauNuwCKaDxFtgPUmxx9OEN5ng5G72LWN9H3o32YN7zWBHJsArkqExSVXGMn/BlK/rsjzKIwg5
 BQp91qTt4vHztKSR7ekaU6ikv8dQ8kG6f39xSrLXYOxt3IXaIauH6JtqkjeqnsaqxUDi3fR8sVjIW4
 6CU4mgt8wLdSt6qR7kSYMmqg6BDRRrKjvNd5HvlG1AYTs/aIXXxos80/58TJ+n/PqtROGGKAEPDDli
 oYJ6lkB/1H7pHV9ZfrvCTz9Ws4egquII/R3G7FOyp+kEMFTZQy7jIPfvmXHSdIIo8XSf8fg9pOz8IG
 j4k9CKHz3e699zCre/Yi7JazXyKpcJ3nedEX6XbrDIgXwqx7jShjt0rl2A/sdXuOQSR7Lfg1Ckqqmd
 X3/+eF32C7gtCmaP6ZLHcb0F93Y//74lDL+IYvGiTXMqEz+qFfntvOV1Q+Xw==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Williamson <michael.williamson@criticallink.com>

If the I2C bus is connected on the TFP410, then use the register
status bit to determine connection state.  This is needed, in particular,
for polling the state when the Hot Plug detect is not connected to
a controlling CPU via GPIO/IRQ lane.

Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 837e1f81a0ff..ac216eaec3c8 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -28,6 +28,9 @@
 #define TFP410_BIT_BSEL BIT(2)
 #define TFP410_BIT_DSEL BIT(3)
 
+#define TFP410_REG_CTL_2_MODE	0x09
+#define TFP410_BIT_HTPLG BIT(1)
+
 static const struct regmap_config tfp410_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -105,6 +108,16 @@ static enum drm_connector_status
 tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
+	u32 val;
+	unsigned int ret;
+
+	if (dvi->i2c) {
+		ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
+		if (ret < 0)
+			dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
+		else
+			return ret ? connector_status_connected : connector_status_disconnected;
+	}
 
 	return drm_bridge_detect(dvi->next_bridge);
 }

-- 
2.25.1

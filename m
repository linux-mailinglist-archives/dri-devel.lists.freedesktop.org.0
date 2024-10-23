Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52239AD173
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAC910E83B;
	Wed, 23 Oct 2024 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BC7FjCP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7235710E242
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so51271655e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702222; x=1730307022;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xZSl/F4a59d6cGzaQ8UBGb7tAkWNLG3z9Ozwy3jDhoY=;
 b=BC7FjCP73t6uU8ljUutFY/cHlbwrj3refAzsIq16dVqRkjTxLRY8bQZ5m32BqeKuTu
 z0G4Apb2RIHpqBan1taMeDOrd47/7tAf/cAgX9XcZYKpubt3Ma8F6u3vEPQ6VdTV3+7K
 6RvMCIxuCK+T7K85+lFcldKmRU3sGT97BNwg/lZ0hLX1ruUWd+QFhzuPXWSXzNb/1zhX
 3KKBC48SBOn+DtjKkD3iAMyFoFeK5mxHcCsC/1X2mmjUXDlPmZdC6jcbLr7T6FA/b978
 Ab7yXpXzAsth96yarFp5eawKQ9obPGQcG9M6z6Xjmv0UvmZtvt15ZCwVFkmW79SmhRyZ
 2qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702222; x=1730307022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZSl/F4a59d6cGzaQ8UBGb7tAkWNLG3z9Ozwy3jDhoY=;
 b=bkasyq6JgeW/Mc1imoFM/cP7QlMEEg9y5G+LdcE+bir0gZahQEAV0jVNjTGFBIiSN9
 Rv6HImWu45vzlNVnm/PY8PdlnDEL8TWqGez+PTTfxJuVIapQIobpbA8PR+macgBAGYvm
 vkYt9J9mqfI5jFEEtU3NVfQKm6dlcwFM0A/x9xBV+lCKJE9ujyNSaJnc0kPEKacYGu3g
 7qxYgfjsEr+ULgIMu/FBsThK+6I6kNCcfIsbBUWFX7SucAaaJEw160Sk14rOpNGl7H+m
 TFat3/jE3BjMv3s45frR7yQdw3Hr88ek0nJ+pvqEC43CSTAzooL6gFJvLXQc4wEuEfVE
 BVlQ==
X-Gm-Message-State: AOJu0Yw9aguYdeelPnXygX/RwCgP3ojNcNXDMUFgpqO1lt/F6PfqYphp
 siPvx7YdPFOD72+GxDwI5q9wuxmsDSlFon9xh58QUslUhp3Y5XGr0oQ6kBSEb14=
X-Google-Smtp-Source: AGHT+IGVp4GJMwBRKlS9Q12L5xPs/An67Q2sllEQsQWhIVdFiJ7lcu6JT07uXS8WxSxC/y5+CBUMhw==
X-Received: by 2002:a05:600c:1c29:b0:431:5df7:b310 with SMTP id
 5b1f17b1804b1-43184142c50mr24298445e9.8.1729702221727; 
 Wed, 23 Oct 2024 09:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:11 +0100
Subject: [PATCH 14/37] drm/vc4: txp: Introduce structure to deal with
 revision differences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-14-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 will have several TXP with small differences. Let's add a
structure tied to the compatible to deal with those differences.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_drv.h        |  6 +++++-
 drivers/gpu/drm/vc4/vc4_txp.c        | 23 ++++++++++++++++-------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 6527fb1db71e..c7b91c87f1bc 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -51,7 +51,7 @@ struct vc4_mock_desc {
 
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
+		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
@@ -77,7 +77,7 @@ static const struct vc4_mock_desc vc4_mock =
 
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_crtc_data,
+		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index a68cea921c11..1ed1fb5aa7e8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -536,7 +536,11 @@ struct vc4_crtc_data {
 	int hvs_output;
 };
 
-extern const struct vc4_crtc_data vc4_txp_crtc_data;
+struct vc4_txp_data {
+	struct vc4_crtc_data	base;
+};
+
+extern const struct vc4_txp_data vc4_txp_data;
 
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ffe1f7d1b911..dcb1b3fd37de 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -159,6 +159,7 @@
 
 struct vc4_txp {
 	struct vc4_crtc	base;
+	const struct vc4_txp_data *data;
 
 	struct platform_device *pdev;
 
@@ -484,17 +485,20 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const struct vc4_crtc_data vc4_txp_crtc_data = {
-	.name = "txp",
-	.debugfs_name = "txp_regs",
-	.hvs_available_channels = BIT(2),
-	.hvs_output = 2,
+const struct vc4_txp_data vc4_txp_data = {
+	.base = {
+		.name = "txp",
+		.debugfs_name = "txp_regs",
+		.hvs_available_channels = BIT(2),
+		.hvs_output = 2,
+	},
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
+	const struct vc4_txp_data *txp_data;
 	struct vc4_encoder *vc4_encoder;
 	struct drm_encoder *encoder;
 	struct vc4_crtc *vc4_crtc;
@@ -509,6 +513,11 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (!txp)
 		return -ENOMEM;
 
+	txp_data = of_device_get_match_data(dev);
+	if (!txp_data)
+		return -ENODEV;
+
+	txp->data = txp_data;
 	txp->pdev = pdev;
 	txp->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(txp->regs))
@@ -519,7 +528,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	vc4_crtc->regset.regs = txp_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
 
-	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &vc4_txp_crtc_data,
+	ret = vc4_crtc_init(drm, pdev, vc4_crtc, &txp_data->base,
 			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs, true);
 	if (ret)
 		return ret;
@@ -579,7 +588,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-txp" },
+	{ .compatible = "brcm,bcm2835-txp", .data = &vc4_txp_data },
 	{ /* sentinel */ },
 };
 

-- 
2.34.1


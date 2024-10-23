Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B929AD18B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E8D10E83A;
	Wed, 23 Oct 2024 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pZA6qi+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CAA10E236
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso70105755e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702229; x=1730307029;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7edjMwM9R4r+Uxc3cqOP0qRuD6L2fQT2FKa6L1QAhs0=;
 b=pZA6qi+6syxf26slNsUie8Z+x9LNo51yhu6C+8JGKMG53L8rmHUvfKuLNovGHmuwOm
 lM1c9SYEO2Xk23vAm8xiGJwrQI7saOvGP9qgvkMV8X5ycQbv6Cf1NKLxAr5H/41a2FQO
 KEQ64aFRBZwZJD9i6Yu3BYtdoJB+gF5S5EuOn7RxrXhWT3aRCk334SiMt+Um8kOGrtPu
 lKZYS0inTIbQcmRxdTgEECidEfDvUse2cVI3jGozmm4+Y7a2UEi4t51/QLHRe3Ns5sok
 6VyawJzDkCMenl/wKytFLaiCV6RgTr9uB7Y2flYbPRR9Pljx0sDW8huACONtXLmvCUmJ
 R55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702229; x=1730307029;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7edjMwM9R4r+Uxc3cqOP0qRuD6L2fQT2FKa6L1QAhs0=;
 b=B9IzMkO5XkgOLo7Gt4odBe3s17JDto6+0mXZNddDsVg4a0Ta4iwVRNVC4LGFzWOOQ5
 z2M1+P/3H13AoGG6j6o7v8PuroruMMchiQNZsTROSdvTRMziaGARaAO1A5sdkrrjrMtd
 wBY0ipMh0WbFOGfhwLLrKFJ4sLcBHqSAGLpmmwB/vcn5aBou6JnQtpttVjzuP2ZnK/EV
 LbIRjbZaziLcueRU6mO+P/K5hBuxFDxCTRWSWN4cKa5SoalALRg47y1/ypisRRldnxHe
 m4MqzGfImTfYDMG54e+s+CD4++AKUNv0urR8ZmxJsB4JX1YA813gFVk9ej2+tICb2Rjb
 XCrw==
X-Gm-Message-State: AOJu0YwgH+qFRCFcEToqD+QuNuTddJP1La9AKAYprXVcnr5CM54QXbnZ
 1AE710B+mDQnfl4vpXIurlbBjN0gjdlpuLdlOcq/jg1V4rOlesSOpKEGE93m3Uk=
X-Google-Smtp-Source: AGHT+IHmnnBF1XbicsZZSX63ufvz1Ey37usN3AVArfITs1P5URFwomZVlyoIAXXLcYHQj75m7dMF0g==
X-Received: by 2002:a05:600c:5802:b0:431:5f8c:ccbd with SMTP id
 5b1f17b1804b1-431841ee182mr25601835e9.4.1729702229220; 
 Wed, 23 Oct 2024 09:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:18 +0100
Subject: [PATCH 21/37] drm/vc4: txp: Add support for BCM2712 MOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-21-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has an evolution of what used to be called TXP in the
earlier SoCs, but is now called MOP.

There's a few differences still, so we can add a new compatible to deal
with them easily.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 2979d141f3bb..befb99c9b5bb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -386,6 +386,7 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_txp *txp = encoder_to_vc4_txp(encoder);
 	int idx;
 
@@ -404,7 +405,8 @@ static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 		WARN_ON(TXP_READ(TXP_DST_CTRL) & TXP_BUSY);
 	}
 
-	TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
+	if (vc4->gen < VC4_GEN_6_C)
+		TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
 
 	drm_dev_exit(idx);
 }
@@ -508,6 +510,20 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+const struct vc4_txp_data bcm2712_mop_data = {
+	.base = {
+		.name = "mop",
+		.debugfs_name = "mop_regs",
+		.hvs_available_channels = BIT(2),
+		.hvs_output = 2,
+	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP0,
+	.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOP,
+	.has_byte_enable = true,
+	.size_minus_one = true,
+	.supports_40bit_addresses = true,
+};
+
 const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
@@ -613,6 +629,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
+	{ .compatible = "brcm,bcm2712-mop", .data = &bcm2712_mop_data },
 	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };

-- 
2.34.1


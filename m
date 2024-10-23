Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231E9AD16A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0644810E825;
	Wed, 23 Oct 2024 16:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DoMAXXMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD910E832
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so68530915e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702220; x=1730307020;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
 b=DoMAXXMQrejBTD721GYsNhxbRlwBo7HpOMctxY8c+o5JdnSb0J8A6Rk9Rm+sTfjjz4
 QnfiXJdGZR4HyB1WltdXaLr7bfP3gfveRAgqHpsIE1jKt3y8WWCdJxJrgOIyrby0aECm
 kObYWYMB5v8Iv0uGzDGVfonAnZ01vOMy28PIuoPYluFga8DRaqzq+PNUx0gVCRNcp+S3
 ByLdZUCxT0tkrze0ROwVoktBUc3mau0I4E/KLwRtHf3eztmfwyO603TJgaSO7phKvnhi
 /boHWWyoFNhnLYWHJEY8IuETfaX5G/24h4d6W388TdlUUg/e/EQGI704uT9+lKRZa/Dz
 f94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702220; x=1730307020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsucG0Q0vHPFBy6lzVvgyGm98jkpqjywCenuNv6tqlM=;
 b=oMLYdlaIKrCvjjKTURi+YVBexirWDzHpGtOJ/m5koTE5awImg/iyF5ycvPN9MjrIka
 oX2pyVM0pn0t3pmmH1DSC+AianZPI91pYK6vxNcI2QvFD7UnrVlE8vqzeLDpyBAUtluN
 jBrS/vR++AhUUq39jAlMiJVn1SfOfjcamAm5Sttczs8GkyI09bjDiEYKBX2tJxOj1lYa
 Bgy1YLR0PnwKXA2wA3Nd+kag8NGIS5UCgYCUiC3wm/0ivFpjhOViOfBy73Qxcc3Lp/mg
 dRQMLnXRQ31J1VJF1kWwaUssy9CQaWQWmqIcfAPoEGe0GacUkHgZlXxv0SisY8SgAfsQ
 E4tw==
X-Gm-Message-State: AOJu0YxlNtfKdoeUnHJ8fQdCM6l+HOedMv2yu4gHJ2LXCCqLUAU2KmyL
 ZtE4JsvHMyilnsaMNeBytMQ8gzWz/4P/GAm+bW64V6EkyXLdfpm/jeoRph5X9H0=
X-Google-Smtp-Source: AGHT+IF+z5G2SpbBJXEoTC4AhNnyHaZc8I8tY/B+b0FqCsjD1XtrGZGyhc0Zli024GaKfZ4+HiMwEw==
X-Received: by 2002:a05:600c:4fcd:b0:431:508a:1a7b with SMTP id
 5b1f17b1804b1-431841a3efbmr26173175e9.34.1729702219677; 
 Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:09 +0100
Subject: [PATCH 12/37] drm/vc4: crtc: Add support for BCM2712 PixelValves
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-12-1cc2d5594907@raspberrypi.com>
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

The PixelValves found on the BCM2712 are similar to the ones found in
the previous generation.

Compared to BCM2711:
- the pixelvalves only drive one HDMI controller each
- HDMI1 PixelValve has a FIFO long enough to support 4k at 60Hz
- support has been added for odd horizontal timings whilst at 2pixels/clock

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 49 ++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 53bca104d0d5..bfa25efa5db2 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -240,6 +240,11 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.dev);
+
+	/*
+	 * NOTE: Could we use register 0x68 (PV_HW_CFG1) to get the FIFO
+	 * size?
+	 */
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
 	/*
@@ -421,6 +426,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 		 */
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
+			   (vc4->gen >= VC4_GEN_6_C ? PV_VCONTROL_ODD_TIMING : 0) |
 			   (is_dsi ? PV_VCONTROL_DSI : 0) |
 			   PV_VCONTROL_INTERLACE |
 			   (odd_field_first
@@ -432,6 +438,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	} else {
 		CRTC_WRITE(PV_V_CONTROL,
 			   PV_VCONTROL_CONTINUOUS |
+			   (vc4->gen >= VC4_GEN_6_C ? PV_VCONTROL_ODD_TIMING : 0) |
 			   (is_dsi ? PV_VCONTROL_DSI : 0));
 		CRTC_WRITE(PV_VSYNCD_EVEN, 0);
 	}
@@ -446,11 +453,17 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
-	if (vc4->gen == VC4_GEN_5)
+	if (vc4->gen >= VC4_GEN_5)
 		CRTC_WRITE(PV_MUX_CFG,
 			   VC4_SET_FIELD(PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP,
 					 PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
 
+	if (vc4->gen >= VC4_GEN_6_C)
+		CRTC_WRITE(PV_PIPE_INIT_CTRL,
+			   VC4_SET_FIELD(1, PV_PIPE_INIT_CTRL_PV_INIT_WIDTH) |
+			   VC4_SET_FIELD(1, PV_PIPE_INIT_CTRL_PV_INIT_IDLE) |
+			   PV_PIPE_INIT_CTRL_PV_INIT_EN);
+
 	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR |
 		   vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
@@ -549,7 +562,11 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
 				      "brcm,bcm2711-pixelvalve2") ||
 	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
-				      "brcm,bcm2711-pixelvalve4")))
+				      "brcm,bcm2711-pixelvalve4") ||
+	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2712-pixelvalve0") ||
+	      of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
+				      "brcm,bcm2712-pixelvalve1")))
 		return 0;
 
 	if (!(CRTC_READ(PV_CONTROL) & PV_CONTROL_EN))
@@ -1292,6 +1309,32 @@ const struct vc4_pv_data bcm2711_pv4_data = {
 	},
 };
 
+const struct vc4_pv_data bcm2712_pv0_data = {
+	.base = {
+		.debugfs_name = "crtc0_regs",
+		.hvs_available_channels = BIT(0),
+		.hvs_output = 0,
+	},
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI0,
+	},
+};
+
+const struct vc4_pv_data bcm2712_pv1_data = {
+	.base = {
+		.debugfs_name = "crtc1_regs",
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 1,
+	},
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI1,
+	},
+};
+
 static const struct of_device_id vc4_crtc_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
 	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
@@ -1301,6 +1344,8 @@ static const struct of_device_id vc4_crtc_dt_match[] = {
 	{ .compatible = "brcm,bcm2711-pixelvalve2", .data = &bcm2711_pv2_data },
 	{ .compatible = "brcm,bcm2711-pixelvalve3", .data = &bcm2711_pv3_data },
 	{ .compatible = "brcm,bcm2711-pixelvalve4", .data = &bcm2711_pv4_data },
+	{ .compatible = "brcm,bcm2712-pixelvalve0", .data = &bcm2712_pv0_data },
+	{ .compatible = "brcm,bcm2712-pixelvalve1", .data = &bcm2712_pv1_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index aea585bf83eb..a68cea921c11 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -558,6 +558,8 @@ extern const struct vc4_pv_data bcm2711_pv1_data;
 extern const struct vc4_pv_data bcm2711_pv2_data;
 extern const struct vc4_pv_data bcm2711_pv3_data;
 extern const struct vc4_pv_data bcm2711_pv4_data;
+extern const struct vc4_pv_data bcm2712_pv0_data;
+extern const struct vc4_pv_data bcm2712_pv1_data;
 
 struct vc4_crtc {
 	struct drm_crtc base;
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 9226429539cf..731b13742ef5 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -155,6 +155,7 @@
 # define PV_CONTROL_EN				BIT(0)
 
 #define PV_V_CONTROL				0x04
+# define PV_VCONTROL_ODD_TIMING			BIT(29)
 # define PV_VCONTROL_ODD_DELAY_MASK		VC4_MASK(22, 6)
 # define PV_VCONTROL_ODD_DELAY_SHIFT		6
 # define PV_VCONTROL_ODD_FIRST			BIT(5)
@@ -215,6 +216,11 @@
 # define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_SHIFT	2
 # define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP	8
 
+#define PV_PIPE_INIT_CTRL			0x94
+# define PV_PIPE_INIT_CTRL_PV_INIT_WIDTH_MASK	VC4_MASK(11, 8)
+# define PV_PIPE_INIT_CTRL_PV_INIT_IDLE_MASK	VC4_MASK(7, 4)
+# define PV_PIPE_INIT_CTRL_PV_INIT_EN		BIT(0)
+
 #define SCALER_CHANNELS_COUNT			3
 
 #define SCALER_DISPCTRL                         0x00000000

-- 
2.34.1


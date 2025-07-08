Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34237AFC442
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914B610E5AC;
	Tue,  8 Jul 2025 07:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="RJj8rZHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404010E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:39:09 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso4770758b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751960349; x=1752565149;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJltklMaBQd1uonax5ZyjgM8LqOkZCVtDNyE9v7JUsU=;
 b=RJj8rZHmVFamDgt6fJ3MlwBVBIFSzM4uqUQ6SnGWy3UV3ClIxczXepifMHoUoIxO3a
 dnPZ8aGb1O7em9tTb5yuRl9i37efU+83D9YpEthUC1+vj/3r6l8FZQQviMfD/FuVvzbD
 T3kfy6CgDRuK9bIU3ztqUYsmbCvRWUkNyxtAUD827BEqZckK+7h8QPGOrBqpn3BzsjrM
 GgfUsNh6qkczpKBc+w5W2v1/qsinj16w5nTvXWwVGCCwvoanmbKc7Z+p2fGnl+jaEQy2
 s/rEZMufQA+OMa6tl24F/B4XIaK10mA9IzgNB/lY1MCDIYJmYcpGSFkfqWyQ/woEGCoT
 4TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960349; x=1752565149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJltklMaBQd1uonax5ZyjgM8LqOkZCVtDNyE9v7JUsU=;
 b=uzF2CFYxPYdNUHshn37IG5WSzwCDbkS0YxJOW3Dp66lAcTiyuheKI5e3fYWTQH23Ct
 eatZlqlI6EcLtERhUXDJE4Cc0hvHIilrtKDq275XhvMczdaPsjpJkBVUiZEkSbbZGhHm
 OjG8Prh6mRa4xDPQySM3+U1cQjW7gg3+Y9Emk2IrIwsntCpuGsBfxi80fAyW/uv+ypX4
 j+88cx1ffJeMIeQk16I+3n2QuBDrSC7d0nABC2jBNKeTUTxvNb2OIUzX3BMOD/kZRI1E
 5f6ly5YiZ+eW0KtQhFvOPBHOf0oVp3Sq6jLYd0N0dOwSwvWtwlAA7IV8rOfcAM+91Ls+
 FaWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt8fmlndU2b6t+Kut9o+bsxpJhjzqAC0vHaPz32VpJnDt79+GqBEcR51bxmM6prE4m1TabwHEnIhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwftW09omuBDs83kmKlAaZDpeFiGbP8pbfgAPw25HhyG/GcS3TP
 0NzqHIY29/tmY6LyhjxHRDs4rJRXF8k1h3AUVgXt2nA8gDtFuTYQc0WYETq2EsYYEfE=
X-Gm-Gg: ASbGncvBin/WzcsaAgr0nsTNUa+hYnZ27uMnpSvTqrJA1d+p1yXF1rwn9y3F9vr8hqW
 S7ahpTOC9iEOQGJ2ytBPKW31mSm5wANYwcMiJKvcvLGs84p1E9patTHaomOfttvpJQQpFHHhujh
 V0WfCXNABULDZkNVR6fB7bjvslnVcNMkKS4tmcYSiB0HdXEj6SrQzfur09IyNlGg+JNnTAF63X8
 X/l7T/E7Iz2nCQr4L9VorfXykP0w+bHfIt2AKXuoDS9XbTm9bLSUFdkYn1UbXSnV9SfgVSj9Zv3
 sLE9CQYZ7TezFKM+PeDvAxBzQJF2zBucdFJqOBKbpEdJAcQwNp2iZHcNpYNWMSfjbYxmfMZb1i0
 DcqD0CCluYMOPx4jTWQ==
X-Google-Smtp-Source: AGHT+IHqUANsx8EsCJUxSKG4kP9NMyIVzSoN04mrpiatlzPSJx49O9nENQOctY2sHFDwZ4RpAEfzug==
X-Received: by 2002:a05:6a00:14c9:b0:748:eb38:8830 with SMTP id
 d2e1a72fcca58-74ce6669b0emr19597687b3a.13.1751960349086; 
 Tue, 08 Jul 2025 00:39:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:39:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI
 function calls
Date: Tue,  8 Jul 2025 01:38:58 -0600
Message-ID: <20250708073901.90027-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
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

Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
functions in order to facilitate improved error handling and remove the
panel's dependency on deprecated MIPI functions.

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between MIPI function calls in
order to preserve the exact behavior implemented using the non-multi
variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
 1 file changed, 59 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..5001bea1798f 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel)
 static int jdi_panel_unprepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx;
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
-
-	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	/* Specified by JDI @ 50ms, subject to change */
 	msleep(50);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* Specified by JDI @ 150ms, subject to change */
 	msleep(150);
@@ -123,72 +118,64 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	/* Specified by JDI @ 20ms, subject to change */
 	msleep(20);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 				       struct mipi_dsi_device *right,
 				       const struct drm_display_mode *mode)
 {
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx;
 
-	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
+	dsi_ctx.dsi = left;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, mode->hdisplay / 2 - 1);
+	dsi_ctx.dsi = right;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, mode->hdisplay / 2 - 1);
 
-	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
+	dsi_ctx.dsi = left;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, mode->vdisplay - 1);
+	dsi_ctx.dsi = right;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, mode->vdisplay - 1);
 
-	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx;
+
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
+				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+				   MCS_PWR_CTRL_PARAM1_DEFAULT,
+				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+				   MCS_PWR_CTRL_PARAM2_DEFAULT);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct mipi_dsi_multi_context dsi_ctx;
 	int err;
 
 	/* Disable backlight to avoid showing random pixels
@@ -239,57 +226,32 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,
 					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,
 					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT);
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
 
 	err = jdi_write_dcdc_registers(jdi);
 	if (err < 0) {
@@ -302,17 +264,13 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	 */
 	msleep(150);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
-		goto poweroff;
-	}
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D0B085A1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A945A10E6BF;
	Thu, 17 Jul 2025 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ezhA3hfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7969110E6BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:13 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7490702fc7cso450000b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752735493; x=1753340293;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/H4K+0OM84CcvR+j8iQAIfmopw+k66j+SclsWu5fEzM=;
 b=ezhA3hfbaAYheSsBrycrU4KSe3hALz3X+4QMfOcplBo6gXkbUvbwLN95OLcWQoqXaz
 FeNWfGarT1sQiQ0NPRtsfAyiGcLZSNloedbBiJu1u1JKuP8Mv5xjs9hEnLxJMKNGLzT/
 VX7JPrct2LppVZlOPYU1vck0W6GCWI+Hb2x7F5bHOGWu1PomKc+QGI+rv8eq9EYZHYmf
 dtPw1cgZBVXaxwNHgVoS+aJ9lCh4MbHS28jLHUTPBYBT/1I2Me6xk2e/5zrjRD2+qrS0
 OPvomycE7GENgm/mzsm5VyPhFJMWaeEV5JbaoHsPsuPROl5RdV7UrtF0m5VDz7yBGfFw
 Eeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752735493; x=1753340293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/H4K+0OM84CcvR+j8iQAIfmopw+k66j+SclsWu5fEzM=;
 b=gNGNRrkHc4kU0EGQy8Vl6j5NLVMco1JVZVF10dnp7ucvdcLoQhNr1m3kcgqgI06ph8
 jiZJ/pr8cJU385cMkrq3lmbOeqSl3HevwFpaUBIBM2z6CAPS2PduhN+u7pUOKggD/8GX
 indfDhMhOpPNEADWNCOLXl2GQJjhbijRFYheSuO9IT37YU3pmRjnV2aSrMBENP7XZpw+
 lkkTJ4OmaDOYtbSdf3fK+CYJN7V3b/j8dNRetHXwQx//Af2LJ+vz3WW/Yg5ZWOPUHZNR
 5grVShs7QQrnYbkTgW7QnRP2CZKETrrKkjvoMsVoP9wKXT4+lnvoxDQaDwIuC1LYitFG
 WDaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGk8Ba3PMhLD8JnczATCQGPjK5fOFlqTqclIaPF3SJht97dp8iK7VEqWeqWx45SDOuslEnQqhP8YA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz68EKUg1LgoecBv8ssmZBgfhEfJECT8MmnGy4YvCrHcNjzZGrM
 t0eP7t3OJu3ai/H9p+szSF84kvjLdyfw7iQ3ka1ng1fXWEcKi7rxgKop29tSwwpEVys=
X-Gm-Gg: ASbGncv+UjAC0/kpDrhW/ppTRCKSRqRbtsn9RF2OA/6sD2UL2g8E7IUS6IWMk36b26l
 ycXLxxYUKZKk2izoFiVzscIGRWmkj7jumyVuTbUcOW9vMkcRwQH87SV6hJB3+MyszeFgZ3nDPIr
 i7KrYqhbeYM6fKa1nhCC3fz4e8knxESp9vLKGouiyM3830NleClmFFNmCds7r3/ghRKDMP4egQs
 pIPhDq6emtrd41m0Zjzhif1fqjc/Hbhjb0SDGwLWBoEiv1h6+G1APFhRGJ751LYrvDoDuVyeZu4
 +CfDANpQL0R092Arqn9ZdwEw/zbfDjaC57nCkH0TyEvjim+C1glIj1inZY4qG85LBbUHIM4o/1R
 Q0L0tGxgh8CyR66qAFGiCom+uXKAHchvQnwGKVMdO3tSUxu/w/lXUBw==
X-Google-Smtp-Source: AGHT+IHH/vgpxV6vqdCi5vMoBUmo5CXiyXWtxttI7E89xJuwKL7vDndmJMVY1qcKcLpgkZTs1ukI7A==
X-Received: by 2002:a05:6a20:3d84:b0:232:36e3:9a4e with SMTP id
 adf61e73a8af0-237d7b6cdadmr9956537637.40.1752735492853; 
 Wed, 16 Jul 2025 23:58:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:58:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
Date: Thu, 17 Jul 2025 00:57:54 -0600
Message-ID: <20250717065757.246122-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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

Fix bug in unprepare() which causes the function's return value to be
that of the last mipi "enter sleep mode" command.

Update driver to use the "multi" variant of MIPI functions in order to
facilitate improved error handling and remove the panel's dependency on
deprecated MIPI functions.

Use the new mipi_dsi_dual macro to reduce code duplication.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 187 ++++++------------
 1 file changed, 55 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..b72b6518a090 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -81,25 +81,25 @@ static int jdi_panel_disable(struct drm_panel *panel)
 static int jdi_panel_unprepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
-	int ret;
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	/*
+	 * One context per panel since we'll continue trying to shut down the
+	 * other panel even if one isn't responding.
+	 */
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
+	struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx1);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx2);
 
 	/* Specified by JDI @ 50ms, subject to change */
 	msleep(50);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	/* Doesn't hurt to try sleep mode even if display off fails */
+	dsi_ctx1.accum_err = 0;
+	dsi_ctx2.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx1);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx2);
 
 	/* Specified by JDI @ 150ms, subject to change */
 	msleep(150);
@@ -123,72 +123,47 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	/* Specified by JDI @ 20ms, subject to change */
 	msleep(20);
 
-	return ret;
+	return 0;
 }
 
-static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
+static void jdi_setup_symmetrical_split(struct mipi_dsi_multi_context *dsi_ctx,
+				       struct mipi_dsi_device *left,
 				       struct mipi_dsi_device *right,
 				       const struct drm_display_mode *mode)
 {
-	int err;
-
-	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
-
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
+	mipi_dsi_dual(mipi_dsi_dcs_set_column_address_multi,
+			left, right, dsi_ctx,
+			0, mode->hdisplay / 2 - 1);
+	mipi_dsi_dual(mipi_dsi_dcs_set_page_address_multi,
+			left, right, dsi_ctx,
+			0, mode->vdisplay - 1);
 }
 
-static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
+static void jdi_write_dcdc_registers(struct mipi_dsi_multi_context *dsi_ctx,
+				    struct jdi_panel *jdi)
 {
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
+			jdi->link1, jdi->link2, dsi_ctx,
+			MCS_CMD_ACS_PROT, MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	return 0;
+	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
+			jdi->link1, jdi->link2, dsi_ctx,
+			MCS_PWR_CTRL_FUNC,
+			MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+			MCS_PWR_CTRL_PARAM1_DEFAULT,
+			MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+			MCS_PWR_CTRL_PARAM2_DEFAULT);
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct mipi_dsi_multi_context dsi_ctx;
 	int err;
 
 	/* Disable backlight to avoid showing random pixels
@@ -231,88 +206,36 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	 * put in place to communicate the configuration back to the DSI host
 	 * controller.
 	 */
-	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
+	jdi_setup_symmetrical_split(&dsi_ctx, jdi->link1, jdi->link2,
 					  jdi->mode);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
-			err);
-		goto poweroff;
-	}
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi,
+			jdi->link1, jdi->link2, &dsi_ctx,
+			jdi->mode->vdisplay - 16);
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi,
+			jdi->link1, jdi->link2, &dsi_ctx,
+			MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_pixel_format_multi,
+			jdi->link1, jdi->link2, &dsi_ctx,
+			MIPI_DCS_PIXEL_FMT_24BIT);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
+			jdi->link1, jdi->link2, &dsi_ctx);
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
-
-	err = jdi_write_dcdc_registers(jdi);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to write dcdc registers: %d\n", err);
-		goto poweroff;
-	}
+	jdi_write_dcdc_registers(&dsi_ctx, jdi);
 	/*
-	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode() and
-	 * mipi_dsi_dcs_set_display_on().
+	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode_multi()
+	 * and mipi_dsi_dcs_set_display_on_multi().
 	 */
-	msleep(150);
+	mipi_dsi_msleep(&dsi_ctx, 150);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
+			jdi->link1, jdi->link2, &dsi_ctx);
 
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


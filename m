Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68396B0AEA6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7110E1E6;
	Sat, 19 Jul 2025 08:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="IBruzSXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B1110E075
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:27:06 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b34a78bb6e7so2158102a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752913626; x=1753518426;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUcB18wkzXWaipSAyhcb0vwOoxhZL3UK8zpTQMvqMYk=;
 b=IBruzSXLxh9VTdldyY6UdL78csE2rIYyzyk8pIQBdkY4mcy8/+jrtyaaABj97f5VKF
 Q8+4jukigJFUQvAib067qAz0+DEkwHaa8CRfdMcdknudQLzHya+cnlIDhbc1T2ctNjRo
 Voy0A/mpUe1pwRVFmBDQlp6+giUcJwASP5Hz0IMBVl/uaRlCuKkgSHHY3QBSHsXj+ta2
 JG0tb+OAmT1mFJmmSoiWD2d+l1w0ugTGbMkI8RJnuH2MT5Xy4jjEsq3IGp2PyGuf4aYJ
 u/LJyhKoDG+NWexWsvNobfpipa9GuRFBcJqXxo+S1XaW6dIFOUm4jnIi77aov60qj2AP
 gj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752913626; x=1753518426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUcB18wkzXWaipSAyhcb0vwOoxhZL3UK8zpTQMvqMYk=;
 b=OoSfVl8/PRCId1BuE2A2dGYIDciPltVGU2rRo4JUgh+kfvRdZtGPOeKL7dRKeX22CV
 B123VmGp6ktYucz87qeQgudTztjYsJ7c7MA4INxRNicOIxKNC4LgcFqX8SLTgjx39lFQ
 ydnPL6t3tv4mxrUWZtUwQKeCVua870AmbnwVWGabcrV2LI1XkXBDlKzI2iXnV6GHdRED
 MjnXif/CTcBN+89/vdN18DAMINTRcA386GhpyeB+7OayL6YG64cAF8oQvDzCwc3HWmO4
 LQt6ILxM5d3h7aGfBz7Rr6Xi1rYHkfT3RFFWxL97ZVJS+kcEp/FaoyRLQ/DnhQVzDKsj
 z2uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkAioaad9hzGbo2leMCeWAztA9gxrjw6CBj0hYcV+V4f8Yz5Xg99ylVNrB12MamxmnvsmPfQfPmCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhpdPkGmdUOu82+0pS0hX/sAk4z0bUC0I+yd1URA1Lpvt5OjIn
 gqD7ELzVp0L7v4REeQAEKds9IHYUqoWWSm7+aHWwbqB6CV3zyqnqvN7aXtj5w6zwmt4=
X-Gm-Gg: ASbGncsjL4Y5gsW8la+fYX9dfU4uagBzTJRzJ4KNqu8amMzYS3YvRz6A8gQDxHeY8il
 S8+BoV8aMSteKOf4wVAgiTHwoiPMuHEJ+x34+2Ip/dci89qbko158IdJKpHo7K2ysok6HtnK6dO
 GAnjB0+zwuA4F6qpl9i92BqHIA/IP87NRrCrA8rSF2aScBF1FjbRuQXcbd9DObtVuj3aYRW1amF
 CoMFzJ2cXin4CMSHEmT2Rcbzl7m4SaZJJVFULtzr9+KRN7ezy9IiAGngEYt0FP/Qf8loCBF79gf
 odYuvvAilsEgO4jit7oxnHWIgyaeRQiiuWzM4fmViTvzkCxjfLAcyrZ06MnwrKNg0Sjn0ZIqnky
 zyyMGGSgDRu7dU2Tno3gUlYFMX2jxiH4s+LWDfZbIca0t4Cy/jK14vOgSexk9
X-Google-Smtp-Source: AGHT+IFPkdczjlK6LPkmOOuAv9fB6yl68RLosEVxYgGWeJCmhuywE1ktO67Cl/QDs6XE7vA8gZzPUw==
X-Received: by 2002:a05:6a21:6daa:b0:234:98ee:daae with SMTP id
 adf61e73a8af0-23812457aa5mr20792945637.21.1752913626173; 
 Sat, 19 Jul 2025 01:27:06 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:27:05 -0700 (PDT)
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
Subject: [PATCH v5 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
Date: Sat, 19 Jul 2025 02:26:36 -0600
Message-ID: <20250719082639.307545-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
 1 file changed, 59 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5f897e143758..243483a58c45 100644
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
@@ -123,72 +123,46 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	/* Specified by JDI @ 20ms, subject to change */
 	msleep(20);
 
-	return ret;
-}
-
-static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
-				       struct mipi_dsi_device *right,
-				       const struct drm_display_mode *mode)
-{
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
 	return 0;
 }
 
-static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
+static void jdi_setup_symmetrical_split(struct mipi_dsi_multi_context *dsi_ctx,
+					struct mipi_dsi_device *left,
+					struct mipi_dsi_device *right,
+					const struct drm_display_mode *mode)
+{
+	mipi_dsi_dual(mipi_dsi_dcs_set_column_address_multi,
+		      left, right, dsi_ctx,
+		      0, mode->hdisplay / 2 - 1);
+	mipi_dsi_dual(mipi_dsi_dcs_set_page_address_multi,
+		      left, right, dsi_ctx,
+		      0, mode->vdisplay - 1);
+}
+
+static void jdi_write_dcdc_registers(struct mipi_dsi_multi_context *dsi_ctx,
+				     struct jdi_panel *jdi)
 {
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_dual_generic_write_seq_multi(jdi->link1, jdi->link2, dsi_ctx,
+					      MCS_CMD_ACS_PROT,
+					      MCS_CMD_ACS_PROT_OFF);
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
+	mipi_dsi_dual_generic_write_seq_multi(jdi->link1, jdi->link2, dsi_ctx,
+					      MCS_PWR_CTRL_FUNC,
+					      MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+					      MCS_PWR_CTRL_PARAM1_DEFAULT,
+					      MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+					      MCS_PWR_CTRL_PARAM2_DEFAULT);
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct mipi_dsi_multi_context dsi_ctx = {};
 	int err;
 
 	/* Disable backlight to avoid showing random pixels
@@ -231,88 +205,36 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	 * put in place to communicate the configuration back to the DSI host
 	 * controller.
 	 */
-	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
-					  jdi->mode);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
-			err);
-		goto poweroff;
-	}
+	jdi_setup_symmetrical_split(&dsi_ctx, jdi->link1, jdi->link2,
+				    jdi->mode);
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      jdi->mode->vdisplay - 16);
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_pixel_format_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      MIPI_DCS_PIXEL_FMT_24BIT);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx);
 
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
+		      jdi->link1, jdi->link2, &dsi_ctx);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.50.1


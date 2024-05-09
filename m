Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1F8C1979
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D8E10F7F1;
	Thu,  9 May 2024 22:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gou0CDf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35910F7E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51ef64d051bso1663314e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294261; x=1715899061; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4V9OACuRHbXmTK2HTg8i0N9cnf1QLVjm1D07G84y0Mc=;
 b=Gou0CDf1UfTxC4dEimr8spSoinZRb/BUjfPAslU5f8B7ucUPXxe4GiTDjqxnZHFIyA
 6yoNo4QnVM6e0sGOKRahJXAExGk8q0jCLxumF7Ky0hL5evG+9WFd0ViJbEvjyBp1j5Ie
 nFGP+lBDVihJuAxyb+USpeYcvIbb+9jDE6qHeYaasdN/m+fDk7v7+uNYkfuWOJEPv2T0
 TWcS2PajNwY+h3xErshcenCNavNTVFSZ+cOQuHcf+f21tM7q/hDoc8o4OkxCMKCe1Qvn
 ieZwfi2cafHCN/nOGzlMXIcyoLv8lSxlE9OlvgzDxl7vxS5XLPQJZkLOxzYjtnjFjoZR
 KwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294261; x=1715899061;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V9OACuRHbXmTK2HTg8i0N9cnf1QLVjm1D07G84y0Mc=;
 b=FjejSm7HAlvig+gi9FIu1m1hFYGDYPlu6VppIoezpyy/HCFgTYoC0bDutk+p4ijuDs
 D4MrIIlXsbQs/DmgxTwQSB/ZFva7YJXGFrfFZDRlf7biLtta5Jp0vX7GLMOgDf4p4Ohl
 RWVNvmLYsa9fSzwljPrTxRoGeNuJwZWY8I3/hgdYEcKzaZaVJbV2ZYKac3+F3UnPswbu
 4ZyXUKDYdfkQE890pGditIew42eivN6xQuB/1ys1VYM2RsBgkSFrchMpNi0fipsZT/He
 Q622TLnlo+Q031dEk+pj5HaMIUWpmp0ISpnDCz5JSVN392qX0yMLAeqWgufa1hd0QMRN
 0zEQ==
X-Gm-Message-State: AOJu0Yzg4np2Qxn7cxMFcUdj3PJIP4xNqwYYf11BPEnGaD5EzA1YEmk3
 wqHJq8vv/2uKYROpSbz1O8sKMwrAMbFM/tLCCUbKyS17JgnWpCERvuQXlLnUFI8=
X-Google-Smtp-Source: AGHT+IH4bxmqWpDeL+ZzttXl0YgWZBnt+QPrn2JZIDE00Yte/ysK+RFkfP2uB4AOozawEkV0ixvYWQ==
X-Received: by 2002:a05:6512:33ce:b0:513:edf4:6f20 with SMTP id
 2adb3069b0e04-5220fe79457mr584485e87.54.1715294260804; 
 Thu, 09 May 2024 15:37:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:40 +0300
Subject: [PATCH RFC 7/7] drm/panel: lg-sw43408: use new streamlined MIPI
 DSI API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-7-317c78a0dcc8@linaro.org>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5760;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GUWCnr41TB+Guk2h1/zSROPDGudIEU9m291d3/Tj7jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAvVHEpsHtQ0Di+uIOFvItselZiMK+9r+UUI
 k5OzkP5BZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLwAKCRCLPIo+Aiko
 1Q3LB/9UnKKgdFuiCU5XHDbX1us37+pggofnVIlW3X8wgOEa4mWSE/6EpOUFQ2lzlJtqOZhs9jN
 XAwNM2NpoWTDGpXVFo5yOeHuRKKLPxVrjCr5C1DSPtnVqjEIn/tNYhAkRkA+r/rhHFS8KC8SL9i
 DIOibWPdbZmUfQybcPMc1IT7xP65iKfVbHo00p3VdDODEFC41reHt3GP6FeYnCT3KTQQsSMaBo0
 cW704hv6ADVO6lAqo95JjqZizVkt6YBuDuGyOI2kuLEzOza3qcWH1z+eIMNQPbgJ3FxihDg57Gr
 WoYpZp4zDFXGsnXHCgW6qDEK58pAHGDm8h1UxN+aRTsVSr8a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use newer mipi_dsi_*_multi() functions in order to simplify and cleanup
panel's prepare() and unprepare() functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 95 +++++++++++++-------------------
 1 file changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 67a98ac508f8..f3dcc39670ea 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -40,104 +40,83 @@ static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
 
 static int sw43408_unprepare(struct drm_panel *panel)
 {
-	struct sw43408_panel *ctx = to_panel_info(panel);
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
 	int ret;
 
-	ret = mipi_dsi_dcs_set_display_off(ctx->link);
-	if (ret < 0)
-		dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->link);
-	if (ret < 0)
-		dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
-	gpiod_set_value(ctx->reset_gpio, 1);
+	gpiod_set_value(sw43408->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
 
-	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	return ret ? : ctx.accum_err;
 }
 
 static int sw43408_program(struct drm_panel *panel)
 {
-	struct sw43408_panel *ctx = to_panel_info(panel);
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
 	struct drm_dsc_picture_parameter_set pps;
-	int ret;
 
-	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
 
-	ret = mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(panel->dev, "Failed to set tearing: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
-	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x0c, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf7, 0x01, 0x49, 0x0c);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->link);
-	if (ret < 0) {
-		dev_err(panel->dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
 
-	msleep(135);
+	mipi_dsi_msleep(&ctx, 135);
 
 	/* COMPRESSION_MODE moved after setting the PPS */
 
-	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xac);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xe5,
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xac);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5,
 			       0x00, 0x3a, 0x00, 0x3a, 0x00, 0x0e, 0x10);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xb5,
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5,
 			       0x75, 0x60, 0x2d, 0x5d, 0x80, 0x00, 0x0a, 0x0b,
 			       0x00, 0x05, 0x0b, 0x00, 0x80, 0x0d, 0x0e, 0x40,
 			       0x00, 0x0c, 0x00, 0x16, 0x00, 0xb8, 0x00, 0x80,
 			       0x0d, 0x0e, 0x40, 0x00, 0x0c, 0x00, 0x16, 0x00,
 			       0xb8, 0x00, 0x81, 0x00, 0x03, 0x03, 0x03, 0x01,
 			       0x01);
-	msleep(85);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xcd,
+	mipi_dsi_msleep(&ctx, 85);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcd,
 			       0x00, 0x00, 0x00, 0x19, 0x19, 0x19, 0x19, 0x19,
 			       0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19,
 			       0x16, 0x16);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xc0, 0x02, 0x02, 0x0f);
-	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
-	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
-
-	ret = mipi_dsi_dcs_set_display_on(ctx->link);
-	if (ret < 0) {
-		dev_err(panel->dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcb, 0x80, 0x5c, 0x07, 0x03, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x02, 0x02, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xca);
 
-	msleep(50);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
-	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	mipi_dsi_msleep(&ctx, 50);
 
-	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
-	ret = mipi_dsi_picture_parameter_set(ctx->link, &pps);
-	if (ret < 0) {
-		dev_err(panel->dev, "Failed to set PPS: %d\n", ret);
-		return ret;
-	}
+	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
 
-	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
+	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+
+	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	/*
 	 * This panel uses PPS selectors with offset:
 	 * PPS 1 if pps_identifier is 0
 	 * PPS 2 if pps_identifier is 1
 	 */
-	ret = mipi_dsi_compression_mode_ext(ctx->link, true,
+	mipi_dsi_compression_mode_ext_multi(&ctx, true,
 					    MIPI_DSI_COMPRESSION_DSC, 1);
-	if (ret < 0) {
-		dev_err(panel->dev, "Failed to set compression mode: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return ctx.accum_err;
 }
 
 static int sw43408_prepare(struct drm_panel *panel)

-- 
2.39.2


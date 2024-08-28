Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F84C962D35
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326DF10E4F3;
	Wed, 28 Aug 2024 16:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EGbCiGcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9924710E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:03:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so58230715e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724861029; x=1725465829; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W69b6g92/DGp6D3JvqV60hyAggDin3ttj9doq48N5+8=;
 b=EGbCiGcwfI3IdTFZPaqtpCi7zMC0AazE/qQmUnzNJ5EZh2dmF0h8OKx94YqS+iQSeX
 BIC2x1teRwHH4h0w6qrMdv3rXYaVtXog4M0xYnTZeXnNWBp1Kue4HLcivEvj+7bH4Prj
 Nmv1fheIRwaF/dKE7XERxeJ25MhQzczLVjYLqNTl9krXJGrshtgYmAW3j9Angg8cJRIh
 E2ZwFlDEW/AbE6ma4ku5F09/28Wr123+pmpS0d72ahOxPRcpTkDTIYDn+ZlOpsat8s9E
 1BE464RdQNbOocq5pxOh3XfMjNCr2CTjnymRO8cUPP2qJ3GOjhMU1p4B4Bt6g7eu1ADD
 97Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861029; x=1725465829;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W69b6g92/DGp6D3JvqV60hyAggDin3ttj9doq48N5+8=;
 b=vtpbll7FVfsy6XQlALEZxFpe2zjQ/aDI5x5YzPRKoXQIYweM+JFDJuLZnGiXq8bmmC
 SKk6Lwe2dndNaflw2rmg2gbd7uM6fi/ikiNi1NlsHf6OUfcoeIHSNOtRjSkcq2F53fu7
 sb761jmrnPtdsZ27QrEXIu1k5tcJl4DfB0W3sAHSpHkGMHHf74ctLkQNINQChWi3EtKR
 VS3tY3URy7356uk/Rtxsjp50G5GqxqWJGXLoMHJCEHCLhCmyr0rbLHSyRJCO7MOWsIB3
 D+aoeBCehHCqEjB0Sb7BriDGidzxz8DgOGOnWrY6OstlBaB8cJyQjskJTts+BCPxW8db
 hVDQ==
X-Gm-Message-State: AOJu0YzLc3CF3KUbG3Y5m163Bb6PldKgNTIlRIt+j7K/oMUwP9b2vSkn
 Vq2ddVHhJg66vuMTWhkLuPDcUsTss3E/+17p51CwQ/fRX1Ar7H5lRpZuYHykUwE=
X-Google-Smtp-Source: AGHT+IE71EMPg0d0xU4Ngbol1nfcjagFrZcwHCUhJd8Hmd1rIDMhBTOp8m2W86mIS3++wHbTiYT+uw==
X-Received: by 2002:adf:8bd2:0:b0:371:8d32:b5ed with SMTP id
 ffacd0b85a97d-3749b58e415mr24013f8f.46.1724861028485; 
 Wed, 28 Aug 2024 09:03:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b22da51sm153232f8f.15.2024.08.28.09.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:03:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 18:03:39 +0200
Subject: [PATCH 1/2] drm/panel: visionox-vtdr6130: switch to mipi_dsi
 wrapped functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-1-0cae20d4c55d@linaro.org>
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
In-Reply-To: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10299;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZqioXq8K9jXJCnv+6Ar0CTxBsvfi0yMEBDceSfV200k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmz0phdU3/i4zZKA1OSgfE3W3v4xygHP4n8NUbEXBc
 SD9NQJ+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs9KYQAKCRB33NvayMhJ0T2+EA
 CFkDV7NQYlVWULGz9cwkb/XVVhVYwOfT1BFNFtOMP9UGdS7wqr/4wN70CngSXDOOcdCrjJKgVsziIS
 pIfASacdT7AbvmDlGD7npkW9fO+Hq6fG42jbEWvySOy1Hn7rhPPEeN6oPwUAPA/tcc96fAhxp1iSzY
 yH8tGHU2cCCGN0dyd+X7AbLinmm8bY8NI9ifTG7hZNwp7DD3FCFVNuUVdf2KYr/abMyUisNkfqDM+z
 V+7JiE4oUDLeSZPhDC9M9uyCJRg39BzqPAvwO5g4pm5O16S4c32df1rFIxXDdMlaqVCtIfdNTKK+HI
 mhiJdjMQ3fyRA1gENNWmFC1gARGtnEhVCDdIhE1CB5z2Si/aZHCXgjuv8d8Vm4BkhEPcwlWa9b5G7A
 75nsVbiQnSvJW6AUaM+u3zS5pPKk1+ErkDBAgqLBAKW0CE2wiNu9I7xLupOG5Giwves/zbjBImtqWW
 PdjjdHUdt/uVDrr1eC0J9omYii8KNSF6Uw5BcG/u/vi2Chujzjoh+r/DoXgHNJVVECA13rqiQZV0I9
 oMJEUpKYYWAjQpBqv5YnstQhmR/ytYE0I3cAugfew6Bo9HyDFXoswzHgdNfH7TNi8rW/Tk4KHIdZ9H
 YLs4IpZ1DXPLEZNKe6kQmRB3w6HyLf7mDgAXJr/5Nf2x9sswmHc2fcgiDazQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Make usage of the new _multi() mipi_dsi functions instead of the
deprecated macros, improving error handling and printing.

bloat-o-meter gives a 12% gain on arm64:
Function                                     old     new   delta
visionox_vtdr6130_unprepare                  208     204      -4
visionox_vtdr6130_prepare                   1192     896    -296
Total: Before=2348, After=2048, chg -12.78%

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 186 +++++++++++-------------
 1 file changed, 82 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 540099253e1b..ebe92871dbb6 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -40,120 +40,103 @@ static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
 static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret)
-		return ret;
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x70,
-			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
-			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
-			       0x02, 0x0e, 0x00, 0x20, 0x03, 0xdd, 0x00, 0x07, 0x00,
-			       0x0c, 0x02, 0x77, 0x02, 0x8b, 0x18, 0x00, 0x10, 0xf0,
-			       0x07, 0x10, 0x20, 0x00, 0x06, 0x0f, 0x0f, 0x33, 0x0e,
-			       0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70, 0x77,
-			       0x79, 0x7b, 0x7d, 0x7e, 0x02, 0x02, 0x22, 0x00, 0x2a,
-			       0x40, 0x2a, 0xbe, 0x3a, 0xfc, 0x3a, 0xfa, 0x3a, 0xf8,
-			       0x3b, 0x38, 0x3b, 0x78, 0x3b, 0xb6, 0x4b, 0xb6, 0x4b,
-			       0xf4, 0x4b, 0xf4, 0x6c, 0x34, 0x84, 0x74, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1,
-			       0x01, 0x38, 0x00, 0x14, 0x00, 0x1c, 0x00, 0x01, 0x66,
-			       0x00, 0x14, 0x00, 0x14, 0x00, 0x01, 0x66, 0x00, 0x14,
-			       0x05, 0xcc, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0xce,
-			       0x09, 0x11, 0x09, 0x11, 0x08, 0xc1, 0x07, 0xfa, 0x05,
-			       0xa4, 0x00, 0x3c, 0x00, 0x34, 0x00, 0x24, 0x00, 0x0c,
-			       0x00, 0x0c, 0x04, 0x00, 0x35);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x03, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4,
-			       0x00, 0x33, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x00, 0x00,
-			       0x3e, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5,
-			       0x00, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x06, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0x00, 0x08, 0x09, 0x09, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0xbc,
-			       0x10, 0x00, 0x00, 0x06, 0x11, 0x09, 0x3b, 0x09, 0x47,
-			       0x09, 0x47, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xbe,
-			       0x10, 0x10, 0x00, 0x08, 0x22, 0x09, 0x19, 0x09, 0x25,
-			       0x09, 0x25, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0xfa, 0x08, 0x08, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x81);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xaa, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0xf9, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x51, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x9a);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x5a, 0x00);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	return 0;
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x12, 0x00, 0x00, 0xab,
+				     0x30, 0x80, 0x09, 0x60, 0x04, 0x38, 0x00,
+				     0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
+				     0x02, 0x0e, 0x00, 0x20, 0x03, 0xdd, 0x00,
+				     0x07, 0x00, 0x0c, 0x02, 0x77, 0x02, 0x8b,
+				     0x18, 0x00, 0x10, 0xf0, 0x07, 0x10, 0x20,
+				     0x00, 0x06, 0x0f, 0x0f, 0x33, 0x0e, 0x1c,
+				     0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70,
+				     0x77, 0x79, 0x7b, 0x7d, 0x7e, 0x02, 0x02,
+				     0x22, 0x00, 0x2a, 0x40, 0x2a, 0xbe, 0x3a,
+				     0xfc, 0x3a, 0xfa, 0x3a, 0xf8, 0x3b, 0x38,
+				     0x3b, 0x78, 0x3b, 0xb6, 0x4b, 0xb6, 0x4b,
+				     0xf4, 0x4b, 0xf4, 0x6c, 0x34, 0x84, 0x74,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x01, 0x38, 0x00, 0x14,
+				     0x00, 0x1c, 0x00, 0x01, 0x66, 0x00, 0x14,
+				     0x00, 0x14, 0x00, 0x01, 0x66, 0x00, 0x14,
+				     0x05, 0xcc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0x09, 0x11, 0x09, 0x11,
+				     0x08, 0xc1, 0x07, 0xfa, 0x05, 0xa4, 0x00,
+				     0x3c, 0x00, 0x34, 0x00, 0x24, 0x00, 0x0c,
+				     0x00, 0x0c, 0x04, 0x00, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x03, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x33, 0x00, 0x00,
+				     0x00, 0x3e, 0x00, 0x00, 0x00, 0x3e, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0x09, 0x09, 0x09,
+				     0x09, 0x09, 0x09, 0x06, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0x00, 0x08, 0x09,
+				     0x09, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x10, 0x00, 0x00, 0x06,
+				     0x11, 0x09, 0x3b, 0x09, 0x47, 0x09, 0x47,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x10, 0x10, 0x00, 0x08,
+				     0x22, 0x09, 0x19, 0x09, 0x25, 0x09, 0x25,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfa, 0x08, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x51, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x9a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
 }
 
-static int visionox_vtdr6130_off(struct visionox_vtdr6130 *ctx)
+static void visionox_vtdr6130_off(struct visionox_vtdr6130 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	return 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 }
 
 static int visionox_vtdr6130_prepare(struct drm_panel *panel)
 {
 	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
@@ -165,7 +148,6 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
 
 	ret = visionox_vtdr6130_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 		return ret;
@@ -177,12 +159,8 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
 static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
 {
 	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = visionox_vtdr6130_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	visionox_vtdr6130_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 

-- 
2.34.1


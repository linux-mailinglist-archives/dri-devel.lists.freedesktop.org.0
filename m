Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBCF8C34A2
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3A310E0D8;
	Sat, 11 May 2024 23:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fG5aRyMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6B10E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:32 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51f1e8eaee5so3855305e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468431; x=1716073231; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZlbS5jh0b75ZrT/x4A6CRj77uyalyI20zpVsXXitLV8=;
 b=fG5aRyMBhskoJgKpCpV9W0Q3/+CokdwWrglbeGXEvOZJkRUTk6dz9/4bV7dmkKwsit
 I3VZHdKZwOiQETslWLwutGJfFuHwoJddGSmQXB48Y4PXKyMDF4A6OGIHjBAKEyIQILcz
 OM1cVU/RgV5tPLHoqoTiGXCh6HRNm40LyqnmzEsEmxhsiZM5JJKo2R8cyDFmbaCOT7z0
 go92R1otVvuQkD0vqrd44Ehy1z6u6DtmMecvBKrsmbPKAqb0zhCpINP+APO42X7NOLlL
 bss2WEvnVTcvVnDxAt4G+6GBllMESdBP9OfOS/Zu/tvFQLea/NWOmtkpk9V2fDkS2Khu
 IsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468431; x=1716073231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZlbS5jh0b75ZrT/x4A6CRj77uyalyI20zpVsXXitLV8=;
 b=jRPBBZWsa57tv1NZsfeP710rgv3VE3jzzMRMGarkiwuwSkgPaICvYWS1eCT1Kex2vh
 H1iHUeHkG+f6GS8GKjaM35LAmZhiThjJhhNuEzNmBQNRDPIUi1us+zvuMODrLuPmbd6Y
 L5N9Yi7K9vLYXjZVi334BvG3lydYQIe6/+ne6PyqMNQFHh5MsCrmNuHF5xhgdB+8iJr2
 WvxwlszkY7COKEKGViOX9uGDMkE5QwftBI2iZepnZvpOJOrmfdYorDRmOGOS1AXzev0A
 WH465PZeFirUzsdwMPvVRFJEOHHO2YtBpk57pDXvtl8KVHz8ztvkgxsBfyiZ0P2CmTYh
 lwvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY7tLCR9jZa6V97Js2TKpA3xM24CstpdbPAMSi7Lm/TGz7V0+aTf2c1/KWxGkFXCYw53EcooNMjpWaDqDmoDmZf8oXca9+2sUSb9/AOcKS
X-Gm-Message-State: AOJu0YyNJt4tTZ2R8OtznwpltjMw5q/3PrlPSCoDnbJKLU2UDC0KRRFY
 lsTBJZVKvov/gXNANf80/scK/UaDuKqqGBkPWoxqPnqr+ezc7XjwzgG3vxSOJwc=
X-Google-Smtp-Source: AGHT+IFNzxKw6iznXtIrDqlhQ3yjMCMA9hbD0Cg+4mxcMiwkTWIsHs8HJvAAZ4q/qs1+E6pHglQqGw==
X-Received: by 2002:a05:6512:201a:b0:51b:ab9f:6b5c with SMTP id
 2adb3069b0e04-521e0954cc2mr2628895e87.1.1715468431034; 
 Sat, 11 May 2024 16:00:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 02:00:23 +0300
Subject: [PATCH v2 6/7] drm/panel: novatek-nt36672e: use wrapped MIPI DCS
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-dsi-panels-upd-api-v2-6-e31ca14d102e@linaro.org>
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
In-Reply-To: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
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
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=34017;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9/zvkUgD43YQx4k7ykLUOx127ZL/GCUMmr7Dr4RAWtU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iJPrlaJleLgc0PscuUtk4TOgqbR6Jpazd9V
 LoeWFb8hJmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iQAKCRCLPIo+Aiko
 1SPvB/9tYnp+yqpR9eb4t8p+mMFdoYT1259c/1ROd2arnuLS4CJsqogjNVqHD+hcsR0fg0CHqZO
 rmKxRBeolY/GUxl1vEYlI+bAECgmn6JNwjhz49xsq1YhmVVE+ElSiYfGc+ZufkhQnQiMTPio07t
 MpgaMxY0n3uklsZmLR3sLsncse6Kms0W+dCKp8YJUBl41/l3hXTxChV+92mzuObm5+flIeVNqNJ
 AlNarnisr/+ZCTxCiLy08gdpgiEw+BnZDWnbQz+pZSKMug37HDSdqQ5xshiXrerR65K28kzQT44
 YKuSA+TNHElqnBIt1PncfxiGDUGlJQ/DXPtAhv2rXWu0ilzn
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/exit code. This also includes passing context to
the init_sequence() function instead of passing the DSI device.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 597 ++++++++++++-------------
 1 file changed, 284 insertions(+), 313 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 9ce8df455232..e81a70147259 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -33,7 +33,7 @@ struct panel_desc {
 	enum mipi_dsi_pixel_format format;
 	unsigned int lanes;
 	const char *panel_name;
-	int (*init_sequence)(struct mipi_dsi_device *dsi);
+	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
 };
 
 struct nt36672e_panel {
@@ -49,297 +49,293 @@ static inline struct nt36672e_panel *to_nt36672e_panel(struct drm_panel *panel)
 	return container_of(panel, struct nt36672e_panel, panel);
 }
 
-static int nt36672e_1080x2408_60hz_init(struct mipi_dsi_device *dsi)
+static void nt36672e_1080x2408_60hz_init(struct mipi_dsi_multi_context *ctx)
 {
-	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
-
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc1, 0x89, 0x28, 0x00, 0x08, 0x00, 0xaa, 0x02,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc1, 0x89, 0x28, 0x00, 0x08, 0x00, 0xaa, 0x02,
 				     0x0e, 0x00, 0x2b, 0x00, 0x07, 0x0d, 0xb7, 0x0c, 0xb7);
 
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc2, 0x1b, 0xa0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x66);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x06, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x38);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x83);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x91);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x96, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x64);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf3, 0x54);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf4, 0x64);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf5, 0x54);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf6, 0x64);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf7, 0x54);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf8, 0x64);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf9, 0x54);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x0c);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x05, 0x1d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x08, 0x2f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x09, 0x2e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x2d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0b, 0x2c);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0x17);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x12, 0x13);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x13, 0x15);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x14);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0x16);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x17, 0x18);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x1d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x2f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x2e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x22, 0x2d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x23, 0x2c);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x17);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0x13);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2b, 0x15);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2f, 0x14);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x16);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x31, 0x18);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x32, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x1f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0x1f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4d, 0x14);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4e, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4f, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x30);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x11);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7a, 0x82);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7b, 0x8f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x13);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x31);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x90, 0x13);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x31);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x93, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x94, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x95, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9c, 0xf4);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9d, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa0, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa2, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa3, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa4, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa5, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc6, 0xc0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xc9, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd9, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe9, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x18, 0x22);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0xe4);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x66, 0xd8);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x68, 0x50);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x69, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6b, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x0d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6e, 0x48);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x41);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x73, 0x4a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x74, 0xd0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x62);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x79, 0x7e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x15);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x4d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xcf, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd6, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xd7, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x20);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf0, 0x84);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x81, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x85, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x86, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x05);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8a, 0x1a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8b, 0x11);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8c, 0x24);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8e, 0x42);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8f, 0x11);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x90, 0x11);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x91, 0x11);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9a, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9b, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9c, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9d, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x9e, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x27);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x01, 0x68);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x81);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x21, 0x6a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x25, 0x81);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x26, 0x94);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6e, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6f, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x70, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x71, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x72, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x75, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x76, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x77, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7d, 0x09);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x67);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x80, 0x23);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x82, 0x09);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x67);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa5, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa6, 0x23);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xa7, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0xd3);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xeb, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xec, 0x28);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x00, 0x91);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x03, 0x20);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x07, 0x50);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0a, 0x70);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0c, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0d, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x0f, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11, 0xe0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x15, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x16, 0xa4);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x19, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1a, 0x78);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x23);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1d, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1e, 0x3e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1f, 0x3e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x20, 0x3e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x28, 0xfd);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29, 0x12);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2a, 0xe1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x2d, 0x0a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x30, 0x49);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x33, 0x96);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x34, 0xff);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x36, 0xde);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x37, 0xf9);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x38, 0x45);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x39, 0xd9);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3a, 0x49);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x4a, 0xf0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7a, 0x09);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7b, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7f, 0xf0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x83, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x84, 0xa4);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x87, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x88, 0x78);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x89, 0x23);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8b, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8c, 0x7d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8d, 0x7d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x8e, 0x7d);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc2, 0x1b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x38);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2f, 0x83);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x69, 0x91);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x95, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x96, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf2, 0x64);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf3, 0x54);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf4, 0x64);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf5, 0x54);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf6, 0x64);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf7, 0x54);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf8, 0x64);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf9, 0x54);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x09, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0b, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0x17);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x12, 0x13);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x13, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0x16);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x18);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x22, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x23, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x29, 0x17);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2a, 0x13);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2b, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2f, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x16);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x18);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x32, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x4d, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x4e, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x4f, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x71, 0x30);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x79, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7a, 0x82);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7b, 0x8f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x80, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x81, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x82, 0x13);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x84, 0x31);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x85, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x86, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x87, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x90, 0x13);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x92, 0x31);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x93, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x95, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9c, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa0, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa2, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa3, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa4, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc6, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xd9, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xe9, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0xe4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x66, 0xd8);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x68, 0x50);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x69, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6d, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x72, 0x41);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x73, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x74, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x77, 0x62);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x79, 0x7e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7d, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7e, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x84, 0x4d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xd6, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xd7, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xef, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x84);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x81, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x83, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x84, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x85, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x86, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x87, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x88, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8a, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8b, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8c, 0x24);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8e, 0x42);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8f, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x90, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x91, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x9e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x68);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x81);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x25, 0x81);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0x94);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x72, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x75, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x77, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7d, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7e, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x80, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x82, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x83, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x89, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa6, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb6, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xe5, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xe6, 0xd3);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xeb, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xec, 0x28);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x91);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x50);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x70);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1a, 0x78);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1e, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1f, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x28, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x29, 0x12);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2a, 0xe1);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x2d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x49);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x33, 0x96);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0xff);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0xde);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x37, 0xf9);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x38, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x39, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x49);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x4a, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7a, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7f, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x83, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x84, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x87, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x88, 0x78);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x89, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8b, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8c, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8d, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x8e, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
 				     0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
 				     0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
 				     0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
 				     0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
 				     0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
 				     0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
 				     0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
 				     0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
 				     0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x21);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb0, 0x00, 0x00, 0x00, 0x17, 0x00, 0x49, 0x00,
 				     0x6a, 0x00, 0x89, 0x00, 0x9f, 0x00, 0xb6, 0x00, 0xc8);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb1, 0x00, 0xd9, 0x01, 0x10, 0x01, 0x3a, 0x01,
 				     0x7a, 0x01, 0xa9, 0x01, 0xf2, 0x02, 0x2d, 0x02, 0x2e);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb2, 0x02, 0x64, 0x02, 0xa3, 0x02, 0xca, 0x03,
 				     0x00, 0x03, 0x1e, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb3, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
 				     0x71, 0x00, 0x90, 0x00, 0xa7, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb5, 0x00, 0xe2, 0x01, 0x1a, 0x01, 0x43, 0x01,
 				     0x83, 0x01, 0xb2, 0x01, 0xfa, 0x02, 0x34, 0x02, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb6, 0x02, 0x6b, 0x02, 0xa8, 0x02, 0xd0, 0x03,
 				     0x03, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5b, 0x03, 0x6b);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb7, 0x03, 0x7e, 0x03, 0x94, 0x03, 0xac, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x51, 0x00,
 				     0x72, 0x00, 0x92, 0x00, 0xa8, 0x00, 0xbf, 0x00, 0xd1);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xb9, 0x00, 0xe2, 0x01, 0x18, 0x01, 0x42, 0x01,
 				     0x81, 0x01, 0xaf, 0x01, 0xf5, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xba, 0x02, 0x68, 0x02, 0xa6, 0x02, 0xcd, 0x03,
 				     0x01, 0x03, 0x1f, 0x03, 0x4a, 0x03, 0x59, 0x03, 0x6a);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xbb, 0x03, 0x7d, 0x03, 0x93, 0x03, 0xab, 0x03,
 				     0xc8, 0x03, 0xec, 0x03, 0xfe, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x2c);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x61, 0x1f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x62, 0x1f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x7e, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6a, 0x14);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6b, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6c, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x6d, 0x36);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x54, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x56, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x58, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x59, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0xf0);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5a, 0x00);
-
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x51, 0xff);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x53, 0x24);
-	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x01);
-
-	return ctx.accum_err;
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x61, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x62, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x7e, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6a, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6b, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6c, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x6d, 0x36);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x54, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x55, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x56, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x58, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x59, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x5a, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x51, 0xff);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x24);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x55, 0x01);
 }
 
 static int nt36672e_power_on(struct nt36672e_panel *ctx)
@@ -381,68 +377,46 @@ static int nt36672e_power_off(struct nt36672e_panel *ctx)
 	return ret;
 }
 
-static int nt36672e_on(struct nt36672e_panel *ctx)
+static int nt36672e_on(struct nt36672e_panel *nt36672e)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	const struct panel_desc *desc = ctx->desc;
-	int ret = 0;
+	struct mipi_dsi_multi_context ctx = { .dsi = nt36672e->dsi };
+	const struct panel_desc *desc = nt36672e->desc;
 
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+	nt36672e->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	if (desc->init_sequence) {
-		ret = desc->init_sequence(dsi);
-		if (ret < 0) {
-			dev_err(&dsi->dev, "panel init sequence failed: %d\n", ret);
-			return ret;
-		}
-	}
+	if (desc->init_sequence)
+		desc->init_sequence(&ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(100);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
-	return 0;
+	mipi_dsi_msleep(&ctx, 100);
+
+	return ctx.accum_err;
 }
 
-static int nt36672e_off(struct nt36672e_panel *ctx)
+static int nt36672e_off(struct nt36672e_panel *panel)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
+	struct mipi_dsi_multi_context ctx = { .dsi = panel->dsi };
 
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	panel->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(60);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 60);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int nt36672e_panel_prepare(struct drm_panel *panel)
 {
 	struct nt36672e_panel *ctx = to_nt36672e_panel(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
+	int ret;
 
 	ret = nt36672e_power_on(ctx);
 	if (ret < 0)
@@ -450,7 +424,6 @@ static int nt36672e_panel_prepare(struct drm_panel *panel)
 
 	ret = nt36672e_on(ctx);
 	if (ret < 0) {
-		dev_err(&dsi->dev, "Failed to initialize panel: %d\n", ret);
 		if (nt36672e_power_off(ctx))
 			dev_err(&dsi->dev, "power off failed\n");
 		return ret;
@@ -463,11 +436,9 @@ static int nt36672e_panel_unprepare(struct drm_panel *panel)
 {
 	struct nt36672e_panel *ctx = to_nt36672e_panel(panel);
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
+	int ret;
 
-	ret = nt36672e_off(ctx);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to un-initialize panel: %d\n", ret);
+	nt36672e_off(ctx);
 
 	ret = nt36672e_power_off(ctx);
 	if (ret < 0)

-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E748C197C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E210F802;
	Thu,  9 May 2024 22:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OHfnIEQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4910F7E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:42 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e3e18c23f9so18013161fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294260; x=1715899060; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t68VnMD7f5eQp0ZMoa1zqW8nBoF/NRoHSPk2XnhQ8lw=;
 b=OHfnIEQNIpNpmgrSHnNftoandwlxJD1fnY7+Apir8rPSCOmwsL6Xm+gEx8RA6bRtAB
 MOT3WNQz38JsZalkza46kljyb0p/X0J1ypQzgMcLoHRr7Xy0JW4SVzwiaFIrPINs0B8K
 FEmzem2WFN8++P2fPsvSxMwq6UUNexVwg4PcyZX0uGZIAVDPXA9QUVUjk4hE1Llt+Cpx
 0PLctkV7nERSehrWi/ldqJXTtYfEfHvum7rBPfcKimSyTydNagrIqFNucuQnrjw6jBwT
 7exX/U1aLJj+EK7IbmqztLtHJII0mVwRNQBYWDKbf2ie7cAf07cpjMDYBgouG+mwjFtx
 /FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294260; x=1715899060;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t68VnMD7f5eQp0ZMoa1zqW8nBoF/NRoHSPk2XnhQ8lw=;
 b=lK3Uy/nNGHLXfWOvUrlTLITp4kPSRr9qUZh8Cdhy+3OwccCBCF4bG3+1wWu/2fxNyR
 BeyMYvjD93Yx/j8Kqasx8lK30eraTVXYStxI604PwbsA/Iw+UoFyilTvAW4c+wbtZZcG
 s0iJfUOOeMysOqhUsYgxeT8POO0w+Sp+DvurJtGH1t7Y88rTSpxLg46ouo7krJcdek9W
 NQIXAfjdjCzpJHb0kwUx/XOSUNUSjkWQXRuvoKP4Xicqzq1Fd+OOKW3FLSJK2YTkRfN5
 l29omVLbEmkTOjP8MJiZ0zxfDjQB7pYgs2t5v8ZfasQya6mgxYUp+WiDKFtiUy2JKqHh
 QT6A==
X-Gm-Message-State: AOJu0YwZ7eQAQz2xWo+oAJ2sSiVGSChcb9tvmJsTMP2UOVi//m4vMWL2
 6XTT2UAy+TZZHU1A4gkCR84wuMBTggf8qGd2wYWCXhUFuMW3/SjRyaeG6C0f23o=
X-Google-Smtp-Source: AGHT+IHFA/cX0NP9mCPfOfOYMEWQuBq1O8OW9hOsbV/JoUh2wlE3WrWL4Tbx12X8W80ajNAGYt4JUg==
X-Received: by 2002:ac2:59d0:0:b0:51a:c913:a9ce with SMTP id
 2adb3069b0e04-5221016e9b5mr451242e87.50.1715294260157; 
 Thu, 09 May 2024 15:37:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:39 +0300
Subject: [PATCH RFC 6/7] drm/panel: lg-sw43408: add missing error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-6-317c78a0dcc8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2829;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0hHShducaAcMM1humQX/WthNAOeANb5d92F25xx+Ojw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAv7uOuDHmzIgnZl/hgCLHI0ZGC3YAQ6chPy
 Lo2F9poo2qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLwAKCRCLPIo+Aiko
 1X4zCACLyiMXdslsIcAFwHjM5jLM9yNm8VCGKPBgQsAj+QXVcpr+yNuaAhwp3y5hy5dQc+ZmzUL
 xCK65hUPV2jIWvhcGahKYiHJCVmjtLxMAU5mYO2YTCnBnSqgvLrKNuDFSbhbRK+Pk+5Vy3Dio86
 ea1ttyRr4DaTFvL3eEpTEWSbP4S3xrDwP++NQvpqh3R9Zu67Ik8pV2b65uKQcxgtHiImdo3rrEA
 l8k356tA62lWznZWLTrMQHIla//i71FW9KQXHOmO0Cc0XnjU0ahapJPh1pe++Crht0oWU9z9pnM
 5fOf5xjkP3d//Wqc1GxiyIsAbZF081LHg+Q2d+Z+GwoYwpKZ
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

Add missing error handling for the mipi_dsi_ functions that actually
return error code instead of silently ignoring it.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 33 ++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 2b3a73696dce..67a98ac508f8 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -62,16 +62,25 @@ static int sw43408_program(struct drm_panel *panel)
 {
 	struct sw43408_panel *ctx = to_panel_info(panel);
 	struct drm_dsc_picture_parameter_set pps;
+	int ret;
 
 	mipi_dsi_dcs_write_seq(ctx->link, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
 
-	mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	ret = mipi_dsi_dcs_set_tear_on(ctx->link, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to set tearing: %d\n", ret);
+		return ret;
+	}
 
 	mipi_dsi_dcs_write_seq(ctx->link, 0x53, 0x0c, 0x30);
 	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x00, 0x70, 0xdf, 0x00, 0x70, 0xdf);
 	mipi_dsi_dcs_write_seq(ctx->link, 0xf7, 0x01, 0x49, 0x0c);
 
-	mipi_dsi_dcs_exit_sleep_mode(ctx->link);
+	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->link);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
 
 	msleep(135);
 
@@ -97,14 +106,22 @@ static int sw43408_program(struct drm_panel *panel)
 	mipi_dsi_dcs_write_seq(ctx->link, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
 	mipi_dsi_dcs_write_seq(ctx->link, 0xb0, 0xca);
 
-	mipi_dsi_dcs_set_display_on(ctx->link);
+	ret = mipi_dsi_dcs_set_display_on(ctx->link);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
 
 	msleep(50);
 
 	ctx->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	drm_dsc_pps_payload_pack(&pps, ctx->link->dsc);
-	mipi_dsi_picture_parameter_set(ctx->link, &pps);
+	ret = mipi_dsi_picture_parameter_set(ctx->link, &pps);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to set PPS: %d\n", ret);
+		return ret;
+	}
 
 	ctx->link->mode_flags |= MIPI_DSI_MODE_LPM;
 
@@ -113,8 +130,12 @@ static int sw43408_program(struct drm_panel *panel)
 	 * PPS 1 if pps_identifier is 0
 	 * PPS 2 if pps_identifier is 1
 	 */
-	mipi_dsi_compression_mode_ext(ctx->link, true,
-				      MIPI_DSI_COMPRESSION_DSC, 1);
+	ret = mipi_dsi_compression_mode_ext(ctx->link, true,
+					    MIPI_DSI_COMPRESSION_DSC, 1);
+	if (ret < 0) {
+		dev_err(panel->dev, "Failed to set compression mode: %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }

-- 
2.39.2


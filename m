Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85048C34A1
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B688710E0CB;
	Sat, 11 May 2024 23:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wZBgef1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ACA10E045
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:29 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5206a5854adso3320549e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468427; x=1716073227; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ItR8Il0wZKComYTOQXyrvGGchY2JbpvV93y+cdGZEE=;
 b=wZBgef1tAhw/L7VP35o9LI5Q6L39BL892bI01Ky+nC8L0f+A7qhLpQmWEfPsX2GsMK
 PPYmvMWbI2qw0glqLZpqIVrAWVUvspwe8Hu9nmrfdwHBr1b7jJqyPqZNCdaDR+3CCpBy
 hfXa4gyr/c78owE3V3vqNnXcdgeIMFk73SkBa+dpOQIW2ou2fB6zgZCOfC2Km5AMtGFT
 peJkG9DnzHf/S8p/bUuid1NgiaCFeieN8Rx3dKNQPlk3XkxzCI8LAHZ1U+L5SmZi8YoO
 2ry1mCAm9bl4s3ndS+ZeeE34CJJdlardCVp4i0yqnphE0bmiv3l434VPPyRVUgQObnPT
 S4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468427; x=1716073227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ItR8Il0wZKComYTOQXyrvGGchY2JbpvV93y+cdGZEE=;
 b=Exhux9W69NfoXP+D8vDwPcytLi11ef+nzWA5x/rrG0HKpEnZRmsqEzDhwUdmVe+ZE0
 xRE41DO/mudul/PmV6wMrC+ZtjgSP5GtvE08PZgdTtFQB6MIaOeCxls/9OFKTKHTLvs9
 2Lo2C5PoLFkw0/MHvOhJC9rJ6+ZoNc6uqXxD4lujeMduuhyszuNqbHqrfVFmnDOwIHeJ
 seUNDZ7iocq+Iw0KxuoNIZM9ff2TdPMMweKpb5lST2H2baCM9UKkikheD3hNIp4D3yHd
 3JgqIi9no0fgETibw4b/cbH58sO85WJtyG13NJ0u3RarUyDCWgELzNK3TGFTbCy0qoNs
 tkFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt1ObCYioQQne8WT0pOKvfqoWzUJCdLbEsKP2RqExS/w6sUor3T8P632q/foSU+CV/VzdznMVJCVxZeFtVTTdd3apLFVw/5+wh5WL3fX9M
X-Gm-Message-State: AOJu0Yw47PyC8NveAJGYD+ll4XA0P2NU1yW9yntgTE575DJe8oewQ9bt
 gcdVUjz4m88lQop/0KkGiJxD062mlPHb4irl4bmwL1sBu9BkZyXEwcvH6LEpry8=
X-Google-Smtp-Source: AGHT+IGupD6xSF5z3LDxw5fpnNiXEVPwrXMtCUrN+VFBtOrmIH4ipNMQ9NazLPourMk+7YDo207urw==
X-Received: by 2002:a05:6512:ba3:b0:518:8d15:8810 with SMTP id
 2adb3069b0e04-5220fc7354cmr5061661e87.14.1715468427451; 
 Sat, 11 May 2024 16:00:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 02:00:18 +0300
Subject: [PATCH v2 1/7] drm/panel: lg-sw43408: add missing error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-dsi-panels-upd-api-v2-1-e31ca14d102e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sjNwNWt1lktWQrmL6beKWmXl2L8FICi4sYx1xY8LX/4=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iIq2PSj7Y1vez6Rc2QseG7HDNb8trfZ6GFD
 fbOLvZ4cmeJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iAAKCRCLPIo+Aiko
 1RPRB/iPkeSgZV6o0AQqVNOnA/LGZ26CD5knxYfdT6mUpksmIdzNgz51P7eJqFplreJORm+ki18
 Ak5BJgGG1G/Le90JBUp2AAfXsWY8Qyc4blaMEuaiR7idSxNgE3dIMdrdKAxvV+Y8Km3qAquwJXw
 XX1uW/CIGcFwAkWYummz3BUUcQvximQ8c1502Q2MWhPeH/LD/Eb3qLSn9gzcXWL90IZXsQqaMrd
 TADER+4+U8OhlF9N29/espaXx4aqOR7cgeJ812G0t+TXDhqUA/nD2ptzrzxANloKyaGOrI1Qnfm
 fPGdECpiiVL/ErgtxppPVEIEBME0FKNDHgTZbbRHeR1R0T4=
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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


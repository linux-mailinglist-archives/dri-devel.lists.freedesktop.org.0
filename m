Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20567896326
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 05:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4010F9B9;
	Wed,  3 Apr 2024 03:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bQOx4K4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8A10F755
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 03:44:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so7097318e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 20:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712115839; x=1712720639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
 b=bQOx4K4gT3BTjcOZw4STZfTC74gbbD4UEhuWlxm6jgTHB7u6NK0bQ3jz31dMvVPac5
 VfeO3lR7BhAhlzA/ONEwbYwxpk8kfLAi4EmcWPNur8zvJyOZNy38LPk9cAqVMBs4fMjt
 ouIc8CDjwrSoR87KmpRbZjn4K1tLVioJTmiedC+kA/0KLiiT/oyCDeOM2GBRfE8uSpOr
 cY1fJPlBrWm/0glDbmxifdsjrVBbV+7jqd3u8auVGIz0GQO31n+ocU1kaWuYl7V4y4Lw
 DiBEyz+rWMxMF6XvtqZP/+K1C0Xed+kJng1QClAFgrEcciUNGNBNnOxsBO+iyzlMDv1N
 rv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712115839; x=1712720639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
 b=LvXaiHUXbxLdYow8IGaikAdYgVl703TD6t6pwzsENNE58eDPy1kDQtKUj8JV9kWwdK
 fDtI25zKR8WEzzPjVyXpu20f2ipqkWC4dwDfF48GC+YL/x4ktWLI0gt97FVqNzGI9ddp
 S3dblGSdtfjwpHusD+cySXEA2gjiNUAk4hb/ASRQvSw7QKkU+c7YETxYNqJj3Wfxmq2y
 Ku7OW0ZIVcPtf+RbnRkbXzbQ7/AeAfcuH1iDtx+ERvaqyLPHXRrim03cywk6kTQuyd6X
 3cNoOaVMMqvVnL2qHOTwdWU8oreOktVIO3zvzyfJw9Td7nC38U1TfPGh9xgDozMRMIUi
 YpIg==
X-Gm-Message-State: AOJu0YwlqG2UVWLtQRlEwVYasYbkPj1P+hmxWb6xgjwMoej1NyBVc3AU
 Nz6tYmW/J6Folwq5hVcUcOtb4FY7m08mCrrkE8xqsf2Cmqkk8Ba0cxDCQ7nWsXc=
X-Google-Smtp-Source: AGHT+IGWjIDbSyZJRqOkpGhZlooCe5NnYBuMRUeV2c5yMblMFkTUU4HlaVfv4n7ziLPnEJUP7Eo/zw==
X-Received: by 2002:a19:e00c:0:b0:516:9fd3:3c1d with SMTP id
 x12-20020a19e00c000000b005169fd33c1dmr929600lfg.0.1712115838864; 
 Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:56 +0300
Subject: [PATCH v4 2/4] drm/mipi-dsi: use correct return type for the DSC
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-2-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2601;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jn//Iw9esRD8TM8P085ElFyT7MDokBKCt93Vkd/VJlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7Bhmcj7xfEHeWJ0WZ4DiWndh5iFgjKTlwL
 wA+mXe8wL6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1cd9B/9+3SNd6QlJrt7Tyd0MDnt29gkictOc8nxcAOr3RPy53ENCneJWdxUygrws2cN9w7XqBM3
 PM4hzCvu0MbrQchwX+azhxlLAG4ImRHLqB0IUTpmqiCPFTQJlKHOPCCrTu1edMziS8zCA3iTV7z
 /3zJvtKy+QapVf9Q5Xzynz21TLGlmfbd/UVLj/Vx7rJUWqsKUgN/FHgn2MxPfHahO2xZIrhUdgV
 1+I2rAI3iKic+h2Jn/Wv9S1o91VmNa5PahaFrYPpE2oT+ZRyaJVQx0F1XhC8a4w99M9xxbBMR0G
 C/bPyJT8e/r9CQfNQlI00cUia1aY7YLaAti0LV1LTaG8QcX7
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

The functions mipi_dsi_compression_mode() and
mipi_dsi_picture_parameter_set() return 0-or-error rather than a buffer
size. Follow example of other similar MIPI DSI functions and use int
return type instead of size_t.

Fixes: f4dea1aaa9a1 ("drm/dsi: add helpers for DSI compression mode and PPS packets")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
 include/drm/drm_mipi_dsi.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..9874ff6d4718 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -654,7 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
 {
 	/* Note: Needs updating for non-default PPS or algorithm */
 	u8 tx[2] = { enable << 0, 0 };
@@ -679,8 +679,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps)
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps)
 {
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..3011d33eccbd 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -241,9 +241,9 @@ int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps);
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps);
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);

-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA0072D503
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1B010E2D3;
	Mon, 12 Jun 2023 23:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469B510E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 23:36:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-976a0a1a92bso871151166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686613015; x=1689205015;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FBvGuFld2HS/YosRMlyucSBC03CdK0iBFINjDwbRfPc=;
 b=Nr7M7W4DM2srgt2XAqJ3BZ7rmizWMJa+c3nQhqhiqq1zRKhrd/rAiJ491SPbJzzL4I
 MXoTTD+1hI2EAXoHfmKMkmoVpmV3mZ1cN9Gfk95zSBWmzl/LGfAL7UT6Rz8/0G7eNoDo
 WXcxwOm6aDcvn5j5FgpSRSkUbDNQIkM8nbHCB5RxUJuYTz+/kEkLUgycd+fxFF7kMvW2
 J2STipYuWula3ILDWFGVs9i1t9WG/RJYvVaV1kDhcq7PcyQDpaFATVT7vr5iP63cHSWQ
 +eVGoeolXRofbw7Mg43tZq8HYv8h8J63fZmW8+yD5QWtWKD1mN904bWOTompJfXXe3bX
 RRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686613015; x=1689205015;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBvGuFld2HS/YosRMlyucSBC03CdK0iBFINjDwbRfPc=;
 b=WXY8LxiAGUEqz0BLdepLAIFVAMJ6qUjqo6L/dCFfZV2PxMgAnVW3llcKNdkpx82VQV
 5XqpOeGrGauLCJ6q3bf+gpNZAmMizwYNkIc40koUZ9OvtDKJahxiASKjv00h/6bf+GD6
 BzA7MWmtTkULTMYr/ZR7oiNbwIykoLoAaNkRTLXq/PsPb+1wPFI73kpWb3taTRyreOLG
 7QSZYf8q9h1gFln2Ghiii4da+cuBc0KWMVWp7zZAA0pYRhz21uTYy7Z0KguZZDwkOVoS
 Bl/ZJ8wzjNzswU6o6k6Wpa3E4mjYB0hVTRXCvE8amvonJKV+MlFXL+P95X9bOT9swLop
 u4UA==
X-Gm-Message-State: AC+VfDwqMlrNDiPXx2MLduDb6vNyEGpe0azgubZXXqZs9YSIQZ2LFUAL
 DWDW44wV03K3+4qo6+vipi3iQg==
X-Google-Smtp-Source: ACHHUZ5p/S1juWDIvqs7Js8VFADv/Kqifh3jM+HNo9Bydhpu6ctZ8ybaLwE01ft1NqDQMOognsNQzw==
X-Received: by 2002:a17:907:d09:b0:982:26c5:6525 with SMTP id
 gn9-20020a1709070d0900b0098226c56525mr2325960ejc.60.1686613015473; 
 Mon, 12 Jun 2023 16:36:55 -0700 (PDT)
Received: from lion.localdomain
 (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adff4ce000000b0030c40e2cf42sm13551195wrp.116.2023.06.12.16.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 16:36:55 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Tue, 13 Jun 2023 00:36:52 +0100
Subject: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
X-B4-Tracking: v=1; b=H4sIABOsh2QC/x2N0QqDMAwAf0XyvGza1jL2K2MPqYkz4DppQAbiv
 6/6eHDHbWBSVAwezQZFVjX95grdpYFhovwWVK4MrnW+jZ3HhbLMyKbIapRmwRBFkuudD0xQu0Q
 mmArlYTpK48899Ld4DciyHsJSZNTfOX2+9v0PdXG024QAAAA=
To: Joel Selvaraj <jo@jsfamily.in>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=5281;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=LDXAOSVx2AwP5lALm4/+utu1HKQoCclWHiZGLxOOTrM=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkh6wWExg9yTR1ZKMRcvSWNxbsSETPrEZDsJXWP
 QLkss/i5jmJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZIesFgAKCRAFgzErGV9k
 tqa0D/43doUtBqfSPTEtKcLtc2u81ViN/BICLW5biLCOJ70EeR9yq5HSf3tiYhQR2YGWnIbM87u
 1DcEZLBxW3dBKl8crH62FoH1rLM1xBRALwPd9shldj6EqQxObeottIZNUdU7AF0NBNfaG2KxVpF
 4Qfe+Q1XwBp60mA7v5iASuEJ7IOsyo1sjAc9F/5zyPP1fJPPIkWJbvDmpcCbpfo00mq/pxcUw8A
 hADdg2/lIVB6b0O4h5UMQM3si0+y8ya/Ja9OAIK6deFcl2+T5FMF22jy/nXcz7G4e19q5QgDWe+
 ty4g//CV7kqemfcO5HzGfjpwbo8j9nx02MWbyFfaGrSuS1K9r8xPN8f4gfHWtQJLjKvTOd1urJq
 O3Gq6Jc5OeioTXmC2nOgZKvXYLjVfeWX5MTLEyeT1r1KNxDaaZrDHL833GLve+fknmV+A6JUYcg
 G4WyRxZjHwR7xXBSfv/FEP9MhXMv6aZ1tJOWr6rDNIbQY71dXXQmlBbcLh7/WcapNVDMMbf6Oh3
 RImkG0wytQle7kgQA9jvYzWHpd5ss74uPSAa5s42lT92akJD/8myqCT9JmeC3tZLnhG9lTFwjcV
 +dS64EL+0lEHMpSfyVunsj9GGyXTudtDyXr1pZQRVjhcBaS/jNiRe2/cnK8uXsvbMx4wV/ampAR
 SsBJBYkvmXwyvcQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
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
Cc: Caleb Connolly <caleb.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
breaks panels which send DSI commands in their .unprepare callbacks.
Migrate to using .disable for that for some SDM845 panels.

Co-developed-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375

// Caleb (they/them)
---
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c      | 18 +++++++-----------
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 ++++++++++-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 11 ++++++++++-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index e85d63a176d0..b40a27558e7c 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -87,22 +87,22 @@ static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
 	return 0;
 }
 
-static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
+static int ebbg_ft8719_disable(struct drm_panel *panel)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
+	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
+	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
+	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set display off: %d\n", ret);
 		return ret;
 	}
 	usleep_range(10000, 11000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
 		return ret;
@@ -137,13 +137,8 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
 static int ebbg_ft8719_unprepare(struct drm_panel *panel)
 {
 	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ret = ebbg_ft8719_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -188,6 +183,7 @@ static int ebbg_ft8719_get_modes(struct drm_panel *panel,
 
 static const struct drm_panel_funcs ebbg_ft8719_panel_funcs = {
 	.prepare = ebbg_ft8719_prepare,
+	.disable = ebbg_ft8719_disable,
 	.unprepare = ebbg_ft8719_unprepare,
 	.get_modes = ebbg_ft8719_get_modes,
 };
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 73bcffa1e0c1..2e1a87001479 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -115,7 +115,7 @@ static int nt36672a_panel_power_off(struct drm_panel *panel)
 	return ret;
 }
 
-static int nt36672a_panel_unprepare(struct drm_panel *panel)
+static int nt36672a_panel_disable(struct drm_panel *panel)
 {
 	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
 	int ret;
@@ -144,6 +144,14 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
 	/* 0x3C = 60ms delay */
 	msleep(60);
 
+	return ret;
+}
+
+static int nt36672a_panel_unprepare(struct drm_panel *panel)
+{
+	struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
+	int ret;
+
 	ret = nt36672a_panel_power_off(panel);
 	if (ret < 0)
 		dev_err(panel->dev, "power_off failed ret = %d\n", ret);
@@ -255,6 +263,7 @@ static int nt36672a_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs panel_funcs = {
+	.disable = nt36672a_panel_disable,
 	.unprepare = nt36672a_panel_unprepare,
 	.prepare = nt36672a_panel_prepare,
 	.get_modes = nt36672a_panel_get_modes,
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index ec228c269146..9dc17afbe540 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -59,7 +59,7 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
 	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 }
 
-static int visionox_rm69299_unprepare(struct drm_panel *panel)
+static int visionox_rm69299_disable(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	int ret;
@@ -78,6 +78,14 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
 		dev_err(ctx->panel.dev, "enter_sleep cmd failed ret = %d\n", ret);
 	}
 
+	return ret;
+}
+
+static int visionox_rm69299_unprepare(struct drm_panel *panel)
+{
+	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	int ret;
+
 	ret = visionox_rm69299_power_off(ctx);
 
 	ctx->prepared = false;
@@ -184,6 +192,7 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
+	.disable = visionox_rm69299_disable,
 	.unprepare = visionox_rm69299_unprepare,
 	.prepare = visionox_rm69299_prepare,
 	.get_modes = visionox_rm69299_get_modes,


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB7C24578
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446710EAE9;
	Fri, 31 Oct 2025 10:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="T7bntPWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3A10EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:05:03 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7a2738daea2so2048862b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761905103; x=1762509903; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FEUFh8n08DQQphEfu7D6Jjf0DyrDDA8NGdeNReXL22I=;
 b=T7bntPWRatWyCyhB93d8tmyN/i2h8LDKNGemfNS2kcjg05q7PDQH6XYsgbgtaObUz0
 GghGy+YF56ykuGUjvE0uA95QDoaC5x5sHAEUxISGlLgUaMHydp89EHOvqgREPX1hagUs
 vFKt2Pvlm+//qQXo1oikHvZGv5DcElCbgwbDf5q+BMIlEMYbm6YXjUV/X2UKI6wjyurk
 LjKvGptDYjc/aaGlskB9ozS2e7+fAkweRBcUKew6TQJeEgNNjywk7aQJZBb6tQSMyirP
 SWq5DG1xt42vbEVs+Y/sHdnEo5eykOcUYmJxKs88IxKR28DbIzeOsl4hXqlHRxr4TyaR
 rBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905103; x=1762509903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEUFh8n08DQQphEfu7D6Jjf0DyrDDA8NGdeNReXL22I=;
 b=rvXFAMsRvQNXwqc2CtWlhQMRSEQfdGuaCnbsGJ9rWZWz8ZgDmIfYaK7mZtIuvShCoP
 74OZnBj4AcCz1dEexUIsaXBq2x0GJwDHupnaqaf700+OKgWxk6U0V7ivXByFAWUowJIY
 Y0PT3krifPgw8KH734tL0YmW8vSDAY4p5P/B/fkb4titJmnKQQXJek3+rPZikqSFkNt+
 i3xuA3K2xCX6uIjmpanzDgiREgM63Rr0fSDzk7ovj9JVVKZwJqX6QN61BUosQSOr6BFn
 O6y85Wxq8NVPE8tmAWViMijaY5M05aZaf7elYBlMfbseTbPW6d1Iceit8QL63bGYHe8k
 6vKw==
X-Gm-Message-State: AOJu0YxbTvSXve9xnqZJsWPAZLBt87/qSw0t4LLDd1X9AIooJcE11kcI
 243Dama2oBRiymvaKG/ADMZZM8T6ifneIPbq89QiC1EH3ORwHH1/Fxubp90MXrJGbwQ=
X-Gm-Gg: ASbGncsMi3OaAcQU8NjNi1bQ711/JrqMS1pif2COaOTilQLl8ZprhSUl6bSArNpueOK
 fdLsaWSAy/VrqzVI/OmnP3nsx10K9+HtiyQffnxnh7PtLRw9rCmQUiZUMOnl3b6F04ME3bRAPPi
 ILoOWUhJ5KNxyPVTUdz5qbYs+O4E+pNeWDPpMQ0yHTa7vDuT+CXer/tw+c8MoVpeXMd5ZWLdSUf
 WzEdHMyD5gefz2SUVooiNpkmUTnUDSk6A+5eh/1XCEoOAjQ2lnESM1EOAIf0jtoR1Ax+3MVjwns
 D6xQ7YS1Cyi/pGIwGoQT/SMNyWFR/01jev6KZSdafPPFDJ1KXtPA0XnLMfBI2FQ64BuIlQNIgDJ
 GMxoXVCgvlafgRwXylyskQWSYEsVfUxY4f6Xtddo8P0/JP9pvvJ5z/aoETOf8ZUW0yIQyR6ldOw
 6zIRdBAK8RXoXRlbflb/bgAbu9db/c0xNrqFjNmlvr2rrDo6KeeZM+0Ho+HQ==
X-Google-Smtp-Source: AGHT+IH//IxQyYKyB5E1QEm5vaYIp9M6eCvuPoYVqMg/AVtwUeanmUa0KKSrJP5wn5URAlX+DhkZZQ==
X-Received: by 2002:a05:6a00:4fcf:b0:781:1a9f:aeeb with SMTP id
 d2e1a72fcca58-7a776e94027mr3603542b3a.1.1761905102532; 
 Fri, 31 Oct 2025 03:05:02 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7d8982117sm1644352b3a.15.2025.10.31.03.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:05:02 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 2/2] drm/panel: ilitek-ili9882t: Add support for Ilitek
 IL79900A-based panels
Date: Fri, 31 Oct 2025 18:04:47 +0800
Message-Id: <20251031100447.253164-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
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

The Ilitek IL79900A display controller is similar to the ILI9882T and can
be supported within the existing `panel-ilitek-ili9882t.c` driver.

This patch extends the ILI9882T driver to handle IL79900A-based panels,
such as the Tianma TL121BVMS07-00. The IL79900A uses a similar command
sequence and initialization flow, with minor differences in power supply
configuration and timing.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 85c7059be214..c52f20863fc7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -61,6 +61,13 @@ struct ili9882t {
 	mipi_dsi_dcs_write_seq_multi(ctx, ILI9882T_DCS_SWITCH_PAGE, \
 				     0x98, 0x82, (page))
 
+/* IL79900A-specific commands, add new commands as you decode them */
+#define IL79900A_DCS_SWITCH_PAGE	0xFF
+
+#define il79900a_switch_page(ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(ctx, IL79900A_DCS_SWITCH_PAGE, \
+				     0x5a, 0xa5, (page))
+
 static int starry_ili9882t_init(struct ili9882t *ili)
 {
 	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
@@ -413,6 +420,38 @@ static int starry_ili9882t_init(struct ili9882t *ili)
 	return ctx.accum_err;
 };
 
+static int tianma_il79900a_init(struct ili9882t *ili)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
+
+	mipi_dsi_usleep_range(&ctx, 5000, 5100);
+
+	il79900a_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
+
+	il79900a_switch_page(&ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
+
+	il79900a_switch_page(&ctx, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
+
+	il79900a_switch_page(&ctx, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
+
+	il79900a_switch_page(&ctx, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 80);
+
+	return 0;
+};
+
 static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9882t, base);
@@ -529,6 +568,19 @@ static const struct drm_display_mode starry_ili9882t_default_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static const struct drm_display_mode tianma_il79900a_default_mode = {
+	.clock = 264355,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 20,
+	.hsync_end = 1600 + 20 + 4,
+	.htotal = 1600 + 20 + 4 + 20,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 82,
+	.vsync_end = 2560 + 82 + 2,
+	.vtotal = 2560 + 82 + 2 + 36,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
 static const struct panel_desc starry_ili9882t_desc = {
 	.modes = &starry_ili9882t_default_mode,
 	.bpc = 8,
@@ -543,6 +595,20 @@ static const struct panel_desc starry_ili9882t_desc = {
 	.init = starry_ili9882t_init,
 };
 
+static const struct panel_desc tianma_tl121bvms07_desc = {
+	.modes = &tianma_il79900a_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 163,
+		.height_mm = 260,
+	},
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init = tianma_il79900a_init,
+};
+
 static int ili9882t_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -680,6 +746,9 @@ static const struct of_device_id ili9882t_of_match[] = {
 	{ .compatible = "starry,ili9882t",
 	  .data = &starry_ili9882t_desc
 	},
+	{ .compatible = "tianma,tl121bvms07-00",
+	  .data = &tianma_tl121bvms07_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ili9882t_of_match);
-- 
2.34.1


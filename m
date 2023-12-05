Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA87805145
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C398C10E4FA;
	Tue,  5 Dec 2023 10:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B25610E4E8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 10:54:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso29584945e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701773655; x=1702378455;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swvtnnp/6+tgZ9c7iFm01DUZnyrAeq5dAskQ39/G3GU=;
 b=kVt4Id2ycBA8I/m9oXbtc5TeMxBpVPV1VBq6EhiNxW6+wCZatgwC0EsUAbCyusBTjd
 8D2FZEv3NEd/Aoumml7N47mey9KujY5921T0sD4BaqTozGJHDSafX7BdoG5/l/JL3F2Z
 9vf+8MRvxUBlLyju4CVQUFzuUyRFOxdVeucIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701773655; x=1702378455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swvtnnp/6+tgZ9c7iFm01DUZnyrAeq5dAskQ39/G3GU=;
 b=Y4lMJIqP/CQPn5JFQDMxEJxIVkLJQLFzC3dk5ydp3Bbvq/zyT+5t7pMGUhdn2Re/9h
 ul1hsxbUvBvhd4S0KXjWDL12Ae3PR6erZRQoC/nklwaHAui0wivTnkr4y8Vew+rJgDMh
 4CVrLRILwt9BADUZMCjVbpBNhGKzAOvls2xeBe1JTqVsbpWJZ3APXtLbFV304h7yWFA2
 oGIh/j8NXi4sMSHsZF7KKh9eMtd0fmeA/dROwjlAJNsGrCKb14tOiSbGpV125cVbrEb5
 Z+/z5ehrYaab4ptsREOXvJag8LB4Ek0XDKhhjc8xZTPz4DR/ApeMzR2WebZ4GlVOHM4K
 Uc3A==
X-Gm-Message-State: AOJu0YzRdtW3ntVH9PUnS9zZ5QOXmsM+gz+NqgLFRycSfwZpGNb0u+Fd
 5jAzmjqcs/hy6jDkuOjkbup9PQ==
X-Google-Smtp-Source: AGHT+IHChNDdh+cQbGBtu6Bgd07CJ2oRvZbR9ERxGu2dgQTudELRT95oH3OxPIGXQUCcMMzs9CSw5g==
X-Received: by 2002:a05:600c:4c08:b0:402:ea96:c09a with SMTP id
 d8-20020a05600c4c0800b00402ea96c09amr397846wmp.16.1701773655652; 
 Tue, 05 Dec 2023 02:54:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a170906089700b0099297782aa9sm6413491eje.49.2023.12.05.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:54:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/10] drm/panel: ilitek-ili9805: add support for Tianma
 TM041XDHG01 panel
Date: Tue,  5 Dec 2023 11:52:56 +0100
Message-ID: <20231205105341.4100896-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Tianma TM041XDHG01 utilizes the Ilitek ILI9805 controller.

Add this panel's initialzation sequence and timing to ILI9805 driver.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes in v4:
- Add Reviewed-by tag of Neil Armstrong

 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
index e36984b46e14..5054d1a2b2f5 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -87,6 +87,36 @@ static const struct ili9805_instr gpm1780a0_init[] = {
 	ILI9805_INSTR(0, 0xB9, 0x02, 0x00),
 };
 
+static const struct ili9805_instr tm041xdhg01_init[] = {
+	ILI9805_INSTR(100, ILI9805_EXTCMD_CMD_SET_ENABLE_REG, ILI9805_SETEXTC_PARAMETER1,
+		      ILI9805_SETEXTC_PARAMETER2, ILI9805_SETEXTC_PARAMETER3),
+	ILI9805_INSTR(100, 0xFD, 0x0F, 0x13, 0x44, 0x00),
+	ILI9805_INSTR(0, 0xf8, 0x18, 0x02, 0x02, 0x18, 0x02, 0x02, 0x30, 0x01,
+		      0x01, 0x30, 0x01, 0x01, 0x30, 0x01, 0x01),
+	ILI9805_INSTR(0, 0xB8, 0x74),
+	ILI9805_INSTR(0, 0xF1, 0x00),
+	ILI9805_INSTR(0, 0xF2, 0x00, 0x58, 0x40),
+	ILI9805_INSTR(0, 0xFC, 0x04, 0x0F, 0x01),
+	ILI9805_INSTR(0, 0xEB, 0x08, 0x0F),
+	ILI9805_INSTR(0, 0xe0, 0x01, 0x0d, 0x15, 0x0e, 0x0f, 0x0f, 0x0b, 0x08, 0x04,
+		      0x07, 0x0a, 0x0d, 0x0c, 0x15, 0x0f, 0x08),
+	ILI9805_INSTR(0, 0xe1, 0x01, 0x0d, 0x15, 0x0e, 0x0f, 0x0f, 0x0b, 0x08, 0x04,
+		      0x07, 0x0a, 0x0d, 0x0c, 0x15, 0x0f, 0x08),
+	ILI9805_INSTR(10, 0xc1, 0x15, 0x03, 0x03, 0x31),
+	ILI9805_INSTR(10, 0xB1, 0x00, 0x12, 0x14),
+	ILI9805_INSTR(10, 0xB4, 0x02),
+	ILI9805_INSTR(0, 0xBB, 0x14, 0x55),
+	ILI9805_INSTR(0, MIPI_DCS_SET_ADDRESS_MODE, 0x0a),
+	ILI9805_INSTR(0, MIPI_DCS_SET_PIXEL_FORMAT, 0x77),
+	ILI9805_INSTR(0, 0x20),
+	ILI9805_INSTR(0, 0xB0, 0x00),
+	ILI9805_INSTR(0, 0xB6, 0x01),
+	ILI9805_INSTR(0, 0xc2, 0x11),
+	ILI9805_INSTR(0, 0x51, 0xFF),
+	ILI9805_INSTR(0, 0x53, 0x24),
+	ILI9805_INSTR(0, 0x55, 0x00),
+};
+
 static inline struct ili9805 *panel_to_ili9805(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9805, panel);
@@ -227,6 +257,20 @@ static const struct drm_display_mode gpm1780a0_timing = {
 	.vtotal = 480 + 2 + 4 + 10,
 };
 
+static const struct drm_display_mode tm041xdhg01_timing = {
+	.clock = 26227,
+
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 2,
+	.htotal = 480 + 10 + 2 + 36,
+
+	.vdisplay = 768,
+	.vsync_start = 768 + 2,
+	.vsync_end = 768 + 10 + 4,
+	.vtotal = 768 + 2 + 4 + 10,
+};
+
 static int ili9805_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -331,8 +375,17 @@ static const struct ili9805_desc gpm1780a0_desc = {
 	.height_mm = 65,
 };
 
+static const struct ili9805_desc tm041xdhg01_desc = {
+	.init = tm041xdhg01_init,
+	.init_length = ARRAY_SIZE(tm041xdhg01_init),
+	.mode = &tm041xdhg01_timing,
+	.width_mm = 42,
+	.height_mm = 96,
+};
+
 static const struct of_device_id ili9805_of_match[] = {
 	{ .compatible = "giantplus,gpm1790a0", .data = &gpm1780a0_desc },
+	{ .compatible = "tianma,tm041xdhg01", .data = &tm041xdhg01_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9805_of_match);
-- 
2.43.0


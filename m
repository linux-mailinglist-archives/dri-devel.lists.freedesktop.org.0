Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854ACA14C01
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EF310E21E;
	Fri, 17 Jan 2025 09:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="zq6vtfZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB19310E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:18:20 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2163b0c09afso34776705ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737105440; x=1737710240; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vsu01DL5YXruSfsNC0w4FgwMrAXarB2x6Q2xxx/MZ8=;
 b=zq6vtfZ/X4oXX4hnsLHaZEODcJp7t9srgh4DO2czKaVlrgEXaZurx3XEfuzSa1b4KR
 BRZonZuTfBsmxKr8lMNaRDG+KB6qHmX20ulGNz3uORWxZi1NSJ8lDj7eo43fwKIYZxQa
 kuyP2FgOgBD3j/wcLLxANv3huTlr/ivDUb448UPBgm7yILlyZ9sWTE8sT4e/sPLANfT8
 ZAYAEINhEdW/J1C5yZD7KOC1YbjkaV5+fINz88N0SXJe1AAUe7zaNb898pzK4Lf9uXn3
 whQy7k34ulileqRUSqCH/2UwxNPA1Gyb7I6u8uyamass0sJe9/cmgUS91x5u9PwWnDZK
 SJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737105440; x=1737710240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vsu01DL5YXruSfsNC0w4FgwMrAXarB2x6Q2xxx/MZ8=;
 b=Czt3Pm2rdlFgTkNmdKWeZNykO8PYS/JHY3tc5T7AQqsHbWNmJDZv5ooGts/N72MFlj
 rgEcNVw+wNqWEKxP9kVj/K+trkxLsUIb0pYUiuCGufR+O54u9LZNKzDGt0wWPlSlBEzk
 K9m2fHzci9NUXwcZtwCjm2YBIiypQKHsq/3UszzJTmNKqpW2JrbXTAGe0YHSQG7tmwDG
 8tdKc2MwHPe3hoeG1bmgpqpoPd0TyFF8rO7rkrgZEND8B/GPnxntb6xuDIlyJqM/kxLh
 ib2cwSJ8xMCIlUeTHyx5QyvA2CAsEl5cfdTsFdW/oiLH+0i2dDyPY5PSiolKVgU6jPwX
 EIww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCOJ6H+Y7ZoQnDja3Mu1Cr4pJB+z4d7vHAowml7gLRBaq2cnM5IoZOR8qFvkiIE67/kWd3bCE2Tgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUGsnowuvtsMKaTU701qIolvbuGxfjvlJ/RZT6euKJBMp1AJLN
 obnKfeRJjFZQWPQxYSO5Vr3vEPfHVez26ToxAXuaskPHyzaxS0wL9QYTPlfEoCo=
X-Gm-Gg: ASbGnctDDSF1OlYoJ073WJbSE0inCf1JbEPCegCkNu8hpkdlN52S+LazjWAONBQX1gV
 J+te6Ub/8knM06jgKV1Yi24eMS6Qs1JNop8qP0/T0Tkue8+ftWEvTpI8R3U0YTIzbQWUrZUAXaY
 yVEzr6/aTs66D6cAyHOvjdW/uCgTzt0flL8IEGuiz7YTXBfpIw7ULpsxBxKMm9DbBNQBzkNEm8e
 aPsjTd9sGN/GoezmlOth0JHa9GgAH9ifWlf0G6ZDdgRIiIPJECmulSlLNyum8DpwEq3XoVWHPP9
 4aHFuSThuIVXx0VT8WwxINC3HcJm
X-Google-Smtp-Source: AGHT+IGoUaGk95oUM4yQSaHCkyk3jFE22p1d6MLwz3TYAGKxVg2fcmcmw3Ez/8KhKRUvTsG7JUf3Lg==
X-Received: by 2002:a05:6a00:2e9e:b0:725:e1de:c0bf with SMTP id
 d2e1a72fcca58-72daf9483fdmr2743028b3a.9.1737105440509; 
 Fri, 17 Jan 2025 01:17:20 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab815bccsm1421548b3a.56.2025.01.17.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:17:19 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 4/4] drm/panel: boe-tv101wum-nl6: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
Date: Fri, 17 Jan 2025 17:14:38 +0800
Message-Id: <20250117091438.1486732-5-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
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

The starry-2082109qfh040022-50e is a 10.95" TFT panel.
which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.
From the datasheet, MIPI needs to keep the LP11 state before the
lcm_reset pin is pulled high, so increase lp11_before_reset flag.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 72fa0f6a5cb6..d45321cece55 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1400,6 +1400,123 @@ static int kingdisplay_kd110n11_51ie_init(struct boe_panel *boe)
 	return 0;
 }
 
+static int starry_2082109qfh040022_50e_init(struct boe_panel *boe)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = boe->dsi };
+
+	msleep(50);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x21, 0x55, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD9, 0xD1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1, 0x33, 0xC3, 0x57,
+		0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF, 0xFF,
+		0x8F, 0xFF, 0x08, 0x3C, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x22, 0x70, 0x3C,
+		0xA1, 0x22, 0x00, 0x00, 0x00, 0x88, 0xF4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x14, 0x16, 0x14, 0x50, 0x14, 0x50, 0x0D, 0x6A,
+		0x0D, 0x6A, 0x01, 0x9E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB6, 0x34, 0x34, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB8, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCD);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBC, 0x1B, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xFC, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x38, 0x38, 0x22, 0x11, 0x33, 0xA0, 0x61, 0x08,
+		0xF5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC8, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC9, 0x00, 0x1E, 0x30, 0xD4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD0, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x2C, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x3B, 0x03, 0x73, 0x3B, 0x21, 0x21, 0x03, 0x03, 0x98, 0x10, 0x1D, 0x00,
+		0x1D, 0x32, 0x17, 0xA1, 0x07, 0xA1, 0x43, 0x17, 0xA6, 0x07, 0xA6, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x40, 0x40,
+		0x18, 0x18, 0x18, 0x18, 0x2A, 0x2B, 0x1F, 0x1F, 0x1E, 0x1E, 0x24, 0x25, 0x26,
+		0x27, 0x28, 0x29, 0x2A, 0x2B, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+		0x08, 0x09, 0x0A, 0x0B, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x02, 0xAA, 0xEA, 0xAA, 0xAA, 0x00, 0x02, 0xAA,
+		0xEA, 0xAA, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x07, 0x10, 0x10, 0x2A, 0x32, 0x9F, 0x01, 0x5A,
+		0x91, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x02, 0x02, 0x10, 0x33,
+		0x02, 0x04, 0x18, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x01, 0x7F, 0x11, 0xFD);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x3D);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00, 0x00, 0x00, 0x80, 0x80, 0x0C, 0xA1);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x03, 0xFF,
+		0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x02, 0x00, 0x2D, 0x01, 0x7F, 0x0F, 0x7C, 0x10,
+		0xA0, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xF2);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x02, 0x00, 0x00, 0x10, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x0A, 0x0A, 0x05, 0x03, 0x0A, 0x0A, 0x01, 0x03,
+		0x01, 0x01, 0x05, 0x0E);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x03, 0x1F, 0xE0, 0x11, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAB, 0xFF, 0xFF, 0xFF, 0xFF, 0xA0, 0xAB, 0xFF,
+		0xFF, 0xFF, 0xFF, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0x00, 0x00,
+		0x00, 0x03, 0x00, 0x03, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9E, 0x02, 0x01, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x03, 0xFF, 0xF8);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAA, 0xAB, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xAB,
+		0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBF, 0xFF, 0xFF, 0xFE, 0xA0, 0xAA, 0xBF, 0xFF,
+		0xFF, 0xFE, 0xA0, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xA0, 0xAA, 0xAA, 0xAA, 0xAA,
+		0xAA, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x00, 0x00, 0x00, 0x00);
+
+	msleep(110);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
+
+	mipi_dsi_msleep(&ctx, 120);
+
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
+
+	mipi_dsi_msleep(&ctx, 20);
+
+	return 0;
+}
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -1761,6 +1878,34 @@ static const struct panel_desc kingdisplay_kd110n11_51ie_desc = {
 	.lp11_before_reset = true,
 };
 
+static const struct drm_display_mode starry_2082109qfh040022_50e_default_mode = {
+	.clock = (1200 + 160 + 66 + 120) * (1920 + 115 + 8 + 28) * 60 / 1000,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 160,
+	.hsync_end = 1200 + 160 + 66,
+	.htotal = 1200 + 160 + 66 + 120,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 28,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc starry_2082109qfh040022_50e_desc = {
+	.modes = &starry_2082109qfh040022_50e_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init = starry_2082109qfh040022_50e_init,
+	.lp11_before_reset = true,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -1929,6 +2074,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "kingdisplay,kd110n11-51ie",
 	  .data = &kingdisplay_kd110n11_51ie_desc
 	},
+	{ .compatible = "starry,2082109qfh040022-50e",
+	  .data = &starry_2082109qfh040022_50e_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EBFCAF416
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B910E4B8;
	Tue,  9 Dec 2025 08:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJ+AFAFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65A10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:09:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59431f57bf6so5327472e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210171; x=1765814971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1aNlrUXvE9G3tlZet8hwVxpV/sy06v6Qc8FWhOK074=;
 b=EJ+AFAFcITrrhDNQcPr5u9eb7GFYetQeZP0uua5e8k16dak/0DT+u7Uy5EYEqgnaB3
 xhZ7KJKPEAsTgCtNROD5zOfcQSapiY6eRaKGv3y69IXr0XiHHOfrmiSYjnNLJGGOj/2H
 xW5I5YPSTpyPnCcgMcJ1BOu94XShxMVLXZzN3nOtb1EHFXJcxoxuptcod4DqtDbevlwR
 b+z3shZ7biInH9MApyyXJ8Nd4bMuh7s53vS990rRENWSFq/P6jnB1MX/1F5GewTx/lGy
 lratFAnIPiAcajjip5xtPOwZ9xW5HyCpxOagPdpvC8TlRgp+eKf4jhYDzWotvUklPcx5
 9dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210171; x=1765814971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m1aNlrUXvE9G3tlZet8hwVxpV/sy06v6Qc8FWhOK074=;
 b=If2FjgwXh6iYD2yS4SGD9wJXQoBBLFl63i9PzLp0rjRsicif3USgKVAOpZ2TbMpa86
 QIuWJhDBC5cAaV10pO7v+uhPl1gbhRopq7BeD5oavHpU1xdCzlwVbNNWoX2R0dHSW6Ca
 l5rymB5oWkxETU6Y9ncLaLsI+4/UP+MfLTUSdLsLGrsBxthsJviRPyoaIzI6LqMPxBPY
 RlLuvLFmMmHjftKA35e4ZzkfHCqiSMdml2wZi7q06L88jRyH3/4PYdNbf5IjKH/ql1i6
 fvdfsqbuWCejp0UoAs5XBrksOUnYAMghf8yvy3MOLg9vorg9pkKPCQL21jLzViCZy8AA
 iqvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuKUwwgAR2r/S+dfhoyZBvhtf0VGrjtflUrPFWv9LwA3z96zzMOb2YI4ZiPZIWQmQaMpxj/NDq6aQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy/DWAzfMufJhW5QqVxeLqO0x7QSQlpWqAaM8ww4oOtflvWVMr
 pzmaRLhxPwW4qo1UCPwuGz4HJ4Ze+awNM9Z/SznoqI8pm1Wekl6cl/41
X-Gm-Gg: ASbGnctnC+7uWB+L/Zah4cSUgpXoxlvlQAvscWsB9Kb+6IHw4B9r/hdBfF0lKdz30ok
 pJ3w9V3FuNkNsTo9joB4OVTWx6dAhSOCmLX4VhQTlYfheylgjrhNmHrt53KGxoU44N5Nddqazgo
 jV+YlSIq8Kxaxma8i4kAF5uv9DaF0OMsjEQUA8rsWWjp3q7Ta5hcaViha6pc1NZr1TC1V4cLTFy
 Vp7XvIDDZadbv8ci841mett4XiN4q1N0+cN5GOlN6B2ch7msDUdUOMnn7uiO4GRCujsWzCJYkS4
 tAhksuVgVb1Ib0vQrdXD1AeXKjoE2x2UTTbFYMWVoQQDVBCQzn8DTLLSi6znp7BLmXgWQMgia4q
 CID/2Mt8vFMfI5nrqQbPA5X8IxFRK0uT23nSPZeeKxGgcwKRRPYwo7f06scmc+aaeMTB0SY/u7c
 Etjzc9QMQk7Ep+DQdzhU8=
X-Google-Smtp-Source: AGHT+IGmA4cyCs29gemTckflsk9U+lij/68Cmq+ga4oHJ0+AQP90CruecO8SS/ippfv7NCZuamwmxA==
X-Received: by 2002:a05:6512:3501:b0:597:d765:19f9 with SMTP id
 2adb3069b0e04-59874374cefmr2859330e87.4.1765210170346; 
 Mon, 08 Dec 2025 08:09:30 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-597d7b24725sm4207106e87.22.2025.12.08.08.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:09:29 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/panel: himax-hx83102: add panel starry xr109ia2t
Date: Mon,  8 Dec 2025 19:09:17 +0300
Message-Id: <20251208160918.3760498-2-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208160918.3760498-1-vovchkir@gmail.com>
References: <20251208160918.3760498-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

The STARRY XR109AI2T is a 10.95" 1200x2000 (WUXGA+) TFT LCD panel with
himax-hx83102 controller. Hence, we add a new compatible with panel
specific config.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 193 ++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 4c432d207634..602f1adfc8ee 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -23,6 +23,7 @@
 /* Manufacturer specific DSI commands */
 #define HX83102_SETPOWER	0xb1
 #define HX83102_SETDISP		0xb2
+#define HX83102_SETRGBIF	0xb3
 #define HX83102_SETCYC		0xb4
 #define HX83102_UNKNOWN_B6	0xb6
 #define HX83102_UNKNOWN_B8	0xb8
@@ -33,6 +34,7 @@
 #define HX83102_UNKNOWN_BE	0xbe
 #define HX83102_SETPTBA		0xbf
 #define HX83102_SETSTBA		0xc0
+#define HX83102_SETDGCLUT	0xc1
 #define HX83102_SETTCON		0xc7
 #define HX83102_SETRAMDMY	0xc8
 #define HX83102_SETPWM		0xc9
@@ -701,6 +703,172 @@ static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+static int starry_himax83102_xr109_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(60);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb1,
+				     0xb1, 0x2d, 0xed, 0x32, 0xd7, 0x43, 0x36,
+				     0x36, 0x36, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x78, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47,
+				     0xb0, 0xd0, 0x00, 0x12, 0x72, 0x3c, 0x9b,
+				     0x22, 0x02, 0x02, 0x00, 0x88, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRGBIF, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x6a, 0x6a,
+				     0x6a, 0x6a, 0x6a, 0x6a, 0x6a, 0x4d, 0x6a,
+				     0x4d, 0x01, 0x95);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B8, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32,
+				     0x22, 0x11, 0x33, 0xa0, 0x61, 0x08, 0xf5,
+				     0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e,
+				     0x30, 0xd4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13,
+				     0x07, 0x00, 0x0e, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03,
+				     0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x06,
+				     0x00, 0x02, 0x04, 0x0c, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1f, 0x11,
+				     0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x6b, 0x03, 0xaa, 0xab, 0x0e, 0x0e, 0x03,
+				     0x03, 0x98, 0x10, 0x08, 0x00, 0x08, 0x32,
+				     0x17, 0xde, 0x07, 0xde, 0x32, 0x17, 0xe2,
+				     0x07, 0xe2, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x48, 0x48, 0x18,
+				     0x18, 0x18, 0x18, 0x22, 0x23, 0x1f, 0x1f,
+				     0x1e, 0x1e, 0x24, 0x25, 0x26, 0x27, 0x28,
+				     0x29, 0x2a, 0x2b, 0x00, 0x01, 0x02, 0x03,
+				     0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a,
+				     0x0b, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xaa,
+				     0xaa, 0xaa, 0xaa, 0x00, 0x00, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0x00, 0x00, 0xaa, 0xea, 0xaa,
+				     0xaa, 0x00, 0x00, 0xaa, 0xea, 0xaa, 0xaa,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x02,
+				     0x08, 0x0d, 0x12, 0x18, 0x2c, 0x32, 0x38,
+				     0x34, 0x4f, 0x56, 0x5e, 0x70, 0x72, 0x7e,
+				     0x89, 0x9e, 0x9f, 0x50, 0x59, 0x62, 0x68,
+				     0x00, 0x02, 0x08, 0x0d, 0x12, 0x18, 0x2c,
+				     0x32, 0x38, 0x34, 0x4f, 0x56, 0x5e, 0x70,
+				     0x72, 0x7e, 0x89, 0x9e, 0x9f, 0x50, 0x59,
+				     0x65, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x08, 0x10,
+				     0x10, 0x1b, 0x22, 0x95, 0x01, 0x5c, 0x97,
+				     0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12,
+				     0x05, 0x02, 0x02, 0x10, 0x33, 0x02, 0x04,
+				     0x18, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0xbf,
+				     0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20,
+				     0x24, 0x28, 0x2d, 0x30, 0x35, 0x39, 0x3d,
+				     0x41, 0x46, 0x4a, 0x4e, 0x56, 0x5d, 0x65,
+				     0x6e, 0x76, 0x7e, 0x86, 0x8d, 0x96, 0x9e,
+				     0xa5, 0xad, 0xb6, 0xbe, 0xc6, 0xcf, 0xd6,
+				     0xde, 0xe6, 0xed, 0xf5, 0xf9, 0xfa, 0xfc,
+				     0xfe, 0xff, 0x19, 0xa6, 0xbc, 0xdf, 0xc0,
+				     0x7d, 0x97, 0x2e, 0x24, 0xb6, 0x4d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00,
+				     0x00, 0x80, 0x80, 0x0c, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xff,
+				     0xff, 0xff, 0xff, 0x00, 0x00, 0xff, 0xff,
+				     0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00,
+				     0x3e, 0x01, 0x83, 0x0f, 0x7e, 0x10, 0xa0,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20,
+				     0x24, 0x28, 0x2c, 0x30, 0x34, 0x39, 0x3d,
+				     0x41, 0x45, 0x49, 0x4d, 0x55, 0x5c, 0x64,
+				     0x6c, 0x75, 0x7c, 0x84, 0x8c, 0x94, 0x9c,
+				     0xa4, 0xab, 0xb4, 0xbc, 0xc4, 0xcd, 0xd4,
+				     0xdd, 0xe5, 0xec, 0xf4, 0xf8, 0xfa, 0xfc,
+				     0xfe, 0xff, 0x19, 0x95, 0x6b, 0x70, 0x15,
+				     0x7b, 0x3d, 0xa6, 0x28, 0xc2, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x02, 0x1D,
+				     0xe0, 0x11, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xab, 0xff,
+				     0xff, 0xff, 0xff, 0xa0, 0xab, 0xff, 0xff,
+				     0xff, 0xff, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfb, 0x01,
+				     0xfb, 0x01, 0xfb, 0x01, 0x00, 0x00, 0x00,
+				     0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00,
+				     0x20, 0x94, 0x05, 0x04, 0x03, 0x02, 0x01,
+				     0x00, 0x00, 0x00, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff,
+				     0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x1f,
+				     0x24, 0x28, 0x2b, 0x2f, 0x33, 0x38, 0x3c,
+				     0x3f, 0x43, 0x47, 0x4b, 0x53, 0x5b, 0x62,
+				     0x6a, 0x73, 0x7b, 0x82, 0x8a, 0x92, 0x9a,
+				     0xa2, 0xa9, 0xb2, 0xba, 0xc3, 0xcb, 0xd3,
+				     0xdb, 0xe4, 0xeb, 0xf3, 0xf8, 0xfa, 0xfc,
+				     0xfe, 0xff, 0x11, 0x90, 0xc3, 0xa0, 0xff,
+				     0xdb, 0x0d, 0x7b, 0x72, 0xa2, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xbb,
+				     0xea, 0xaa, 0xaa, 0xa0, 0xaa, 0xbb, 0xea,
+				     0xaa, 0xaa, 0xa0, 0xab, 0xff, 0xff, 0xff,
+				     0xff, 0xa0, 0xab, 0xff, 0xff, 0xff, 0xff,
+				     0xa0, 0xaa, 0xba, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xba, 0xaa, 0xaa, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
+
+	mipi_dsi_msleep(&dsi_ctx, 60);
+
+	return dsi_ctx.accum_err;
+}
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -833,6 +1001,28 @@ static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
 	.init = starry_2082109qfh040022_50e_init,
 };
 
+static const struct drm_display_mode starry_himax83102_xr109_default_mode = {
+	.clock = 168500,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 55,
+	.hsync_end = 1200 + 55 + 20,
+	.htotal = 1200 + 55 + 20 + 40,
+	.vdisplay = 2000,
+	.vsync_start = 2000 + 116,
+	.vsync_end = 2000 + 116 + 8,
+	.vtotal = 2000 + 116 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc starry_himax83102_xr109_desc = {
+	.modes = &starry_himax83102_xr109_default_mode,
+	.size = {
+		.width_mm = 143,
+		.height_mm = 239,
+	},
+	.init = starry_himax83102_xr109_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -1069,6 +1259,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
+	{ .compatible = "starry,himax83102-xr109",
+	  .data = &starry_himax83102_xr109_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx83102_of_match);
-- 
2.34.1


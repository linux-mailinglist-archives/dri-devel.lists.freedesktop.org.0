Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1AB4782F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554010E429;
	Sat,  6 Sep 2025 22:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kNk+89a5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AE310E096
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:22:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5608bfae95eso418300e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 17:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756945357; x=1757550157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hs54R+cY2eDa4UXL+XlzVwDcfi5itAVEtYS9rV/3eBg=;
 b=kNk+89a5f+FWMQDtXEYmKXDE8OggVjBeMePSDf9eesnP5qtj7Oib0pu3FryYdXv8T+
 ENrl2Cci4cdkDokAt4To+5vmvY3Jqyj3mtUnN90XdXE0lO7R9M67da1DvgCoXks+u4IN
 pIp4son890ggRti/yUQLvv5PvoqB787efPAAdY5RbPW5qF7KAig1b9GWDa0HhJInhPv6
 EuXGxNUe1U3OqgWeaYX059rh8GqVIr8Co8WiXyPUZFWYFDgXOlZUufLNe+7mpGQd2ucV
 9LMkRNl2Jz4ADC9OjAyLcOo5GKzyYdfzvztwcML1/VQVbQKEzSvVjW+V4VNevwMuE+p7
 klWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756945357; x=1757550157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hs54R+cY2eDa4UXL+XlzVwDcfi5itAVEtYS9rV/3eBg=;
 b=bXqbFTv3aZuLtyrKDpNOI1eE3mgJDr+Y0O6b4UbYFw9dMVm7G//cnFVYlv06Kl+6WW
 C01YCHwemEoxAFvDLuA5IYdZCwXuhZFLn+IFYzfwG0OTMQrDoaJAaLleqBLTpZqJjkMt
 Ed008azquIR44dsRkXwX/lNZgQa0iK264x9ws6dBaV/mvco+Zq7OeW7JRPk772loU+Hv
 G6EuOjh1j1pjTKNZI1fwq3SjRG5OH5JqnJu7DtYH9Skv2ALWy2TRyyEUduI0ibRSnt8T
 i50ZG4MYBFt2I31UWE9P//XR3PLByRZnDLntoCpqMHJ9OPOx21lzPUDKaW9ERPHhThGn
 YLdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmxzZq3NjtuLoOKKQbc2zRx0LnVMk/PEHTzchOCqcwksQpkWg3VtPHB5y4+HHIFIOoqFarGr+1kko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQV76/5HVQt7ZPHjgTVMKk7BuTCt+kuYGZzYGPOGJMKr1T/iNF
 K8C62iKWywn6JJkRm6YZ6NUHfvd9Ie7pnmPYsLT6FLAPH4yBltz+eAip
X-Gm-Gg: ASbGncvmjj8OyP69Dghe90fu2FavYt/eE2QtISMG249YO8iHhABtf8bpO0azEnUkEFN
 Hz/IQm8IKo4h+NBNVorXdEcNmwNe/SyTAOiRNybNfdYhsRn88UnRpZ8xG1I7EXu0/mK4TfghWJy
 8MorXRGqrcea8Dr9hhz+5M3Xd4o0OxZlhgb9blXyIROAK81cOhCWkOgnPamqLo5ufojuIBGiAbu
 ChJ5dQC1n96lUMTsI26BqYN4roS4MlzkytpKf2tetasKmYHtUogjBABeuHaBpJIyiXzd2WkWxL0
 2yiRDDIKo7ZMsEHCYzfLioNgteV+sgCE1SU7J/d4y/NuWU8q/I0M1xWnDr4tl5BEp6lkpD+SgYi
 qPHP3s80IiCKZNrLXKIox46irFDbfPJu8udQH7m3ScjqaSvJIHK01/g==
X-Google-Smtp-Source: AGHT+IFX7Odr7JCq2UutFIWxBTRcw3JXG/BZmk3QFMKKgrt7rx/RJnwIPcQeJKxi1AZEayCAXLZBKw==
X-Received: by 2002:a05:6512:2513:b0:55f:6a72:5679 with SMTP id
 2adb3069b0e04-55f70906104mr5009627e87.34.1756945356768; 
 Wed, 03 Sep 2025 17:22:36 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab8e95bsm821613e87.34.2025.09.03.17.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 17:22:36 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH 2/2] drm/panel: himax-hx83102: add panel starry xr109ia2t
Date: Thu,  4 Sep 2025 03:22:32 +0300
Message-Id: <20250904002232.322218-3-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904002232.322218-1-vovchkir@gmail.com>
References: <20250904002232.322218-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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
index 2aad315aec5a..a10fb9973150 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -23,6 +23,7 @@
 /* Manufacturer specific DSI commands */
 #define HX83102_SETPOWER	0xb1
 #define HX83102_SETDISP		0xb2
+#define HX83102_SETRGBIF		0xb3
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2C, 0xB1,
+				     0xB1, 0x2D, 0xED, 0x32, 0xD7, 0x43, 0x36,
+				     0x36, 0x36, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xD9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x78, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47,
+				     0xB0, 0xD0, 0x00, 0x12, 0x72, 0x3C, 0x9B,
+				     0x22, 0x02, 0x02, 0x00, 0x88, 0xF0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRGBIF, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x6A, 0x6A,
+				     0x6A, 0x6A, 0x6A, 0x6A, 0x6A, 0x4D, 0x6A,
+				     0x4D, 0x01, 0x95);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B6, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1B, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xCD);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xFC, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32,
+				     0x22, 0x11, 0x33, 0xA0, 0x61, 0x08, 0xF5,
+				     0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xCC);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1E,
+				     0x30, 0xD4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13,
+				     0x07, 0x00, 0x0E, 0xA1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03,
+				     0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x06,
+				     0x00, 0x02, 0x04, 0x0C, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1F, 0x11,
+				     0x1F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x6B, 0x03, 0xAA, 0xAB, 0x0E, 0x0E, 0x03,
+				     0x03, 0x98, 0x10, 0x08, 0x00, 0x08, 0x32,
+				     0x17, 0xDE, 0x07, 0xDE, 0x32, 0x17, 0xE2,
+				     0x07, 0xE2, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x48, 0x48, 0x18,
+				     0x18, 0x18, 0x18, 0x22, 0x23, 0x1F, 0x1F,
+				     0x1E, 0x1E, 0x24, 0x25, 0x26, 0x27, 0x28,
+				     0x29, 0x2A, 0x2B, 0x00, 0x01, 0x02, 0x03,
+				     0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A,
+				     0x0B, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xAA,
+				     0xAA, 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA,
+				     0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xEA, 0xAA,
+				     0xAA, 0x00, 0x00, 0xAA, 0xEA, 0xAA, 0xAA,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x02,
+				     0x08, 0x0D, 0x12, 0x18, 0x2C, 0x32, 0x38,
+				     0x34, 0x4F, 0x56, 0x5E, 0x70, 0x72, 0x7E,
+				     0x89, 0x9E, 0x9F, 0x50, 0x59, 0x62, 0x68,
+				     0x00, 0x02, 0x08, 0x0D, 0x12, 0x18, 0x2C,
+				     0x32, 0x38, 0x34, 0x4F, 0x56, 0x5E, 0x70,
+				     0x72, 0x7E, 0x89, 0x9E, 0x9F, 0x50, 0x59,
+				     0x65, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x08, 0x10,
+				     0x10, 0x1B, 0x22, 0x95, 0x01, 0x5C, 0x97,
+				     0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12,
+				     0x05, 0x02, 0x02, 0x10, 0x33, 0x02, 0x04,
+				     0x18, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0xBF,
+				     0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C, 0x20,
+				     0x24, 0x28, 0x2D, 0x30, 0x35, 0x39, 0x3D,
+				     0x41, 0x46, 0x4A, 0x4E, 0x56, 0x5D, 0x65,
+				     0x6E, 0x76, 0x7E, 0x86, 0x8D, 0x96, 0x9E,
+				     0xA5, 0xAD, 0xB6, 0xBE, 0xC6, 0xCF, 0xD6,
+				     0xDE, 0xE6, 0xED, 0xF5, 0xF9, 0xFA, 0xFC,
+				     0xFE, 0xFF, 0x19, 0xA6, 0xBC, 0xDF, 0xC0,
+				     0x7D, 0x97, 0x2E, 0x24, 0xB6, 0x4D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x3C);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00,
+				     0x00, 0x80, 0x80, 0x0C, 0xA1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xFF,
+				     0xFF, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
+				     0xFF, 0xFF);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00,
+				     0x3E, 0x01, 0x83, 0x0F, 0x7E, 0x10, 0xA0,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C, 0x20,
+				     0x24, 0x28, 0x2C, 0x30, 0x34, 0x39, 0x3D,
+				     0x41, 0x45, 0x49, 0x4D, 0x55, 0x5C, 0x64,
+				     0x6C, 0x75, 0x7C, 0x84, 0x8C, 0x94, 0x9C,
+				     0xA4, 0xAB, 0xB4, 0xBC, 0xC4, 0xCD, 0xD4,
+				     0xDD, 0xE5, 0xEC, 0xF4, 0xF8, 0xFA, 0xFC,
+				     0xFE, 0xFF, 0x19, 0x95, 0x6B, 0x70, 0x15,
+				     0x7B, 0x3D, 0xA6, 0x28, 0xC2, 0x94, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xCC);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x02, 0x1D,
+				     0xE0, 0x11, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xAB, 0xFF,
+				     0xFF, 0xFF, 0xFF, 0xA0, 0xAB, 0xFF, 0xFF,
+				     0xFF, 0xFF, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xFB, 0x01,
+				     0xFB, 0x01, 0xFB, 0x01, 0x00, 0x00, 0x00,
+				     0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00,
+				     0x20, 0x94, 0x05, 0x04, 0x03, 0x02, 0x01,
+				     0x00, 0x00, 0x00, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xFF,
+				     0xF0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
+				     0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C, 0x1F,
+				     0x24, 0x28, 0x2B, 0x2F, 0x33, 0x38, 0x3C,
+				     0x3F, 0x43, 0x47, 0x4B, 0x53, 0x5B, 0x62,
+				     0x6A, 0x73, 0x7B, 0x82, 0x8A, 0x92, 0x9A,
+				     0xA2, 0xA9, 0xB2, 0xBA, 0xC3, 0xCB, 0xD3,
+				     0xDB, 0xE4, 0xEB, 0xF3, 0xF8, 0xFA, 0xFC,
+				     0xFE, 0xFF, 0x11, 0x90, 0xC3, 0xA0, 0xFF,
+				     0xDB, 0x0D, 0x7B, 0x72, 0xA2, 0xC0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xAA, 0xBB,
+				     0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBB, 0xEA,
+				     0xAA, 0xAA, 0xA0, 0xAB, 0xFF, 0xFF, 0xFF,
+				     0xFF, 0xA0, 0xAB, 0xFF, 0xFF, 0xFF, 0xFF,
+				     0xA0, 0xAA, 0xBA, 0xAA, 0xAA, 0xAA, 0xA0,
+				     0xAA, 0xBA, 0xAA, 0xAA, 0xAA, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xC5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4F);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3F);
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


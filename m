Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A552926E94
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 06:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ABB10E981;
	Thu,  4 Jul 2024 04:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="GRkk9PYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B410E8F3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 04:50:45 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70af5fbf0d5so171798b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720068645; x=1720673445; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YEP4Pq59dsIwYHVB+3j/E35J2uSNOsK6zNODVCesHM=;
 b=GRkk9PYX/IwVLaoi+C4OnoJs+fQFvsP31ZImA6CLw3g2ZtUnHXdeR7fwYrFs0tzFmq
 LC2Lr0H20Catf4uAvZJz1Cg7xkrDH6NIz3Wr7gRg9kQ1mSZxLXW32azZkX07u9YlMnPf
 ZDDD9vLLlCW3nFqkSj+pHBP8sJLRiNAzPgM7g/d6zsqHv5dwHqhWX3ol7tYPKSoKjoIT
 zUtRxoyqKMdhohK+iy4i5h5KtIX9+2c/Fd8mGL60S3Ton+ELmxDhzQ1YONlEyN6LQQXv
 /5ITZ6oc8uS1FwZdZCPSzUGNvidMHUCnsqxT/cJ77hcxTsBuoWhzSVyntFteRRRZy2wL
 xWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720068645; x=1720673445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YEP4Pq59dsIwYHVB+3j/E35J2uSNOsK6zNODVCesHM=;
 b=Dr8AJ/HY4zLAcjs3Y+zt7yhL1ohtjVvEHwXIw/CgUPEkUTSPSiKWXdmPVL2SHTbVTo
 UGkj95iEDkxHzXvEo/DobQknmg+GeBtw7WwzCl4pTMrB3YDNNRLM233Y4DM7Fv4XFZ1W
 uC3nGLfIVH3RE1UgVWsaiiYUyKkBzU3tsNx7/42Jrg0iDP0GmW46jtz6swuYhlTzi98o
 Dg/Kz4AUn6Ff1zdlDWXeMzXGtnCAnDLJA0kDXXchZs2OvfjpNaut24BhIGPdhDsx6F+M
 X91Ma8u+eIQDi4siB0ijee4MPbIl9MEKqBA3dtBAZ9SquJ8xrsbDHIefcDCtduAZPdai
 4NoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgk4U1VvXilERkEuVxr+UxSLI65Zn6mchbhYZ0l+Dncy/y611E5LDyqB3HNLyWzN/D2yEKyv74n2O8kInyV2j3HgeD+Fc69cquHO/7WvKz
X-Gm-Message-State: AOJu0YxH6lLQfX92A4+8RHd0dVsi+TazLJ60Zp2ThALpBH5yHNMPRtDw
 +EhZTQNCmFtF6TjpIGxYwULimwTiuwwJ8uQBrPAT1BD/ZRmAS4PVZMTYlFQKlM8=
X-Google-Smtp-Source: AGHT+IHuX5KUBMOSZtD7UAvek5USheWSgaTr64NI2c2gOrXik2u/mBbBLgPRtkMTdjpqPjSzpDJbLg==
X-Received: by 2002:a05:6a00:99a:b0:707:fa61:1c6a with SMTP id
 d2e1a72fcca58-70b01b33706mr509515b3a.10.1720068645137; 
 Wed, 03 Jul 2024 21:50:45 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a8ec1asm11291826b3a.188.2024.07.03.21.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 21:50:44 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/3] drm/panel: jd9365da: Break some CMDS into helper
 functions
Date: Thu,  4 Jul 2024 12:50:17 +0800
Message-Id: <20240704045017.2781991-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
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

These panels have some common cmds (e0h~e3h,80h), let's break
them into helper functions.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 89 +++++++++++--------
 1 file changed, 53 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5b525a111b90..04d315d96bff 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -48,6 +48,19 @@ struct jadard {
 	struct gpio_desc *reset;
 };
 
+#define JD9365DA_DCS_SWITCH_PAGE	0xe0
+
+#define jd9365da_switch_page(dsi_ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9365DA_DCS_SWITCH_PAGE, (page))
+
+static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
+}
+
 static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
 {
 	return container_of(panel, struct jadard, panel);
@@ -198,12 +211,10 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE1, 0x93);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE2, 0x65);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE3, 0xF8);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x01);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7E);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
@@ -276,7 +287,8 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x02);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
@@ -360,13 +372,15 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7C, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7D, 0x03);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7E, 0x7B);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x04);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0E);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xB3);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0E, 0x2A);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
 
 	return dsi_ctx.accum_err;
 };
@@ -398,12 +412,10 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE1, 0x93);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE2, 0x65);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE3, 0xF8);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x01);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x3B);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0C, 0x74);
@@ -471,7 +483,8 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x20);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0F);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x02);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x00);
@@ -584,12 +597,14 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7A, 0x17);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7D, 0x14);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7E, 0x82);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x04);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0E);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xB3);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0E, 0x48);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE0, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
 
@@ -623,12 +638,10 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xc7);
@@ -694,7 +707,8 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x26);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x14);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x52);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
@@ -808,12 +822,14 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x05);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
 
 	return dsi_ctx.accum_err;
 };
@@ -854,12 +870,10 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
@@ -932,7 +946,8 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x24);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x12);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x52);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x55);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x55);
@@ -1046,14 +1061,16 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x05);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x23);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x11);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x49);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x08);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
 
-- 
2.25.1


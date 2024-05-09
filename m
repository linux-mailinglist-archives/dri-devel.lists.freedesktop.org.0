Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2A8C095B
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 03:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14010E327;
	Thu,  9 May 2024 01:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="2FcMUIEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F84310E327
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 01:53:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1edfc57ac0cso2438635ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 18:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715219601; x=1715824401; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxqnVN8UJgjtUcypSEa8Q8vmTJk11ggZjob1mhOhIrM=;
 b=2FcMUIEQrBp5glVAD/nj/GRN2iYl8Pyar3+Ffmk5ZiCrQTN+qvcqfjahMt0nGmr1Ey
 yuivDgLP+m4DradpDGSJKtW8AGRqXw10evDbMSoOZgHl91AJRJXh768c/zXPB/E6I3Ai
 MCHV46qYVI3pb+w7QZsBZW2gV0N576UV9K3lh+9pH+0YVbXKHHv/JQV+QhO0AulKXGP1
 NkH3yauemlHOhd+rguKlb6oVxZNuFDVjpGMJzWj18gtbM2aLImuaDOpomp410x2tE0GN
 k87TADVxwpJI1pQ0IF4k+m54snji3FR1bPnGo2M7HxcBH/s9JnLf5wIeLV8hlMU4Mq7f
 Y+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715219601; x=1715824401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxqnVN8UJgjtUcypSEa8Q8vmTJk11ggZjob1mhOhIrM=;
 b=hEMy+a6rfKI/I1u3XKGJX/LBhwiKXUUu0PcvWhB/eUcevCKJPot8JeRSCwgplCbgoN
 icSiMibKNGCpKg6p2E2Bp/NlmIEMlqdFWjPR90754QaYxbinAILSg2Refh5fNyWI55N3
 jhAgfVPCMuPPD4xiOtT/FZfg78cPglcFxahprgbDBtoNI9UjV9HILq3a6L+Qgu6zcHKS
 VcYRrNFplOxFt2FkJSXD+uSGLQ9fS4UsAF150vThjWz11bfiy+q72AtBvp11iHoKTsjU
 tTIjKrIKWkeLdvuvB+Ws8awlUdAj098+byK56JzeRJxH7aT7WNhyNsBNJ56SOmad4CeX
 Vu2Q==
X-Gm-Message-State: AOJu0YxPytfZCw/+v8ORoz1VZ8IY85HcORhqedrTE1wJktEWP8uB/0V7
 yBV33AU81g1h4SmEmP3bmcigxyZbFwhqLnQvZKGXFaNC6kfNAhwsK4TSXNl91x4=
X-Google-Smtp-Source: AGHT+IHfTCrdnSCVYjBG5W24NcACBbQHWiiOrpEfYqS/fL0BabmdR3Tk52ZoofwEHKo/VMAnKUTE3A==
X-Received: by 2002:a17:902:ecc6:b0:1e2:6d57:c1bb with SMTP id
 d9443c01a7336-1eeb05938ddmr59121815ad.21.1715219600789; 
 Wed, 08 May 2024 18:53:20 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d15dfsm2117465ad.62.2024.05.08.18.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 18:53:20 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v5 7/7] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
Date: Thu,  9 May 2024 09:52:07 +0800
Message-Id: <20240509015207.3271370-8-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240509015207.3271370-1-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
Chage since V5:

- Adjust inital cmds indentation and check accum_err before calling mdelay in init().
- Adjust somes inital cmds to Optimize gamma.

V4: https://lore.kernel.org/all/20240507135234.1356855-8-yangcong5@huaqin.corp-partner.google.com

Chage since V4:

- inital cmds use lowercasehex.

V3: https://lore.kernel.org/all/20240424023010.2099949-8-yangcong5@huaqin.corp-partner.google.com

Chage since V3:

- Depend Dous'series [1].
[1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromium.org

V2: https://lore.kernel.org/all/20240422090310.3311429-8-yangcong5@huaqin.corp-partner.google.com

---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 131 ++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index f1273e1c92d2..03a82e48da11 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -293,6 +293,112 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
 	return 0;
 };
 
+static int ivo_t109nw41_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(60);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xed, 0xed, 0x0f, 0xcf, 0x42,
+				     0xf5, 0x39, 0x36, 0x36, 0x36, 0x36, 0x32, 0x8b, 0x11, 0x65, 0x00, 0x88,
+				     0xfa, 0xff, 0xff, 0x8f, 0xff, 0x08, 0xd6, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x12,
+				     0x71, 0x3c, 0xa3, 0x22, 0x20, 0x00, 0x00, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x35, 0x35, 0x43, 0x43, 0x35, 0x35,
+				     0x30, 0x7a, 0x30, 0x7a, 0x01, 0x9d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x34, 0x34, 0x22, 0x11, 0x22, 0xa0,
+				     0x31, 0x08, 0xf5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x13, 0x88, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x07, 0x06, 0x00, 0x02, 0x04, 0x2c,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x08,
+				     0x08, 0x08, 0x08, 0x37, 0x07, 0x64, 0x7c, 0x11, 0x11, 0x03, 0x03, 0x32,
+				     0x10, 0x0e, 0x00, 0x0e, 0x32, 0x17, 0x97, 0x07, 0x97, 0x32, 0x00, 0x02,
+				     0x00, 0x02, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x25, 0x24, 0x25, 0x24, 0x18, 0x18,
+				     0x18, 0x18, 0x07, 0x06, 0x07, 0x06, 0x05, 0x04, 0x05, 0x04, 0x03, 0x02,
+				     0x03, 0x02, 0x01, 0x00, 0x01, 0x00, 0x1e, 0x1e, 0x1e, 0x1e, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x21, 0x20, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x04, 0x04, 0x06, 0x0a, 0x0a, 0x05,
+				     0x12, 0x14, 0x17, 0x13, 0x2c, 0x33, 0x39, 0x4b, 0x4c, 0x56, 0x61, 0x78,
+				     0x7a, 0x41, 0x50, 0x68, 0x73, 0x04, 0x04, 0x06, 0x0a, 0x0a, 0x05, 0x12,
+				     0x14, 0x17, 0x13, 0x2c, 0x33, 0x39, 0x4b, 0x4c, 0x56, 0x61, 0x78, 0x7a,
+				     0x41, 0x50, 0x68, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1a, 0x26, 0x9e,
+				     0x00, 0x4f, 0xa0, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x0a, 0x02,
+				     0x02, 0x00, 0x33, 0x02, 0x04, 0x18, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00, 0x04, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x2b, 0x01, 0x7e, 0x0f,
+				     0x7e, 0x10, 0xa0, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x03, 0x07, 0x00, 0x10, 0x79);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0,
+				     0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
+				     0x00, 0x00, 0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x6e,
+				     0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0,
+				     0xff, 0xff, 0xff, 0xff, 0xfa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
+
+	msleep(60);
+
+	return 0;
+};
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -337,6 +443,28 @@ static const struct hx83102_panel_desc boe_nv110wum_desc = {
 	.init = boe_nv110wum_init,
 };
 
+static const struct drm_display_mode ivo_t109nw41_default_mode = {
+	.clock = 166400,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 75,
+	.hsync_end = 1200 + 75 + 20,
+	.htotal = 1200 + 75 + 20 + 55,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc ivo_t109nw41_desc = {
+	.modes = &ivo_t109nw41_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init = ivo_t109nw41_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	struct hx83102 *ctx = panel_to_hx83102(panel);
@@ -588,6 +716,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "boe,nv110wum-l60",
 	.data = &boe_nv110wum_desc
 	},
+	{ .compatible = "ivo,t109nw41",
+	  .data = &ivo_t109nw41_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.25.1


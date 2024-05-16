Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ECF8C71F1
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CC810E69E;
	Thu, 16 May 2024 07:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Xz63DbPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274910E71B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:21:26 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6f45f1179c3so7157528b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715844086; x=1716448886; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqGziCp7IU6SMQ7+Rs7OPcdGD9DD2lwjxFxRelRWDgs=;
 b=Xz63DbPJ4s4TO+NYWxOaKPmOAewxGE4z3ePqByM1Ywnu+w7CIIqIITBTCfw9BknalN
 6nfVboSEJlobV8HTyM0416tIlZX9yBE9M7Uhtk7pUU7yspmwAKDk2ZO8mg9/Yq1oK9j9
 RiHnkGWYqtxwL/a1Syfj7a7q9qKipbydBndNpfyu2L80NB00fFkmcZSge1Q2ttOqrwYY
 BARcQTWFdAeKyBuiV+aJQCKJpIAxXVtVHAccSW9WENmfMacT1ibbYDV6/s2Yavodk8j+
 mJQvksZRRIAcBZuz6a2t6735baWZH3PShAw/0uOnAgpzbJpovgqjkQGaIGYfTd24UEYE
 uADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715844086; x=1716448886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqGziCp7IU6SMQ7+Rs7OPcdGD9DD2lwjxFxRelRWDgs=;
 b=PevjcfsXcdvAF0h6SGOhBqIILBFIiKcwbK6xkSB0+zQIxKo6jx4nRhnqJgCZM2H4Wz
 Kr6tbbs0vk0JUnpKdbFC2Squ9ndNTy4zZZluYog9oZSPL5K4Iyq2KhL7eU3+lpkfTD0L
 klXRDWlXqJBn23vjcyEJgV5XE9DQljsb9NL/LV9RnH69zTF25ZGxgCJubWVzdBP+rj8P
 fh0kRBRevkQECJB415ksUlOWVPzJ+7AYUUXzYOjLsOCk4tV7FtLIC6PNEoZgRIsx9AeE
 h7SCtTiPJWxZdIGN6NJnWHCGxX1ziQ3cZb7zFFfMoSGUIuybSDk7ocjoHV3/WCwlup42
 OJDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcHz19avBvkgHYkkiIfSrAyJ1WY88GqTCj4reOf+09HeI7rUuLiQ7ZqQwt1eNUMta1Bnt1qAEQwB8d772xOLUvSt+Q8PoinW8ABY6toAhq
X-Gm-Message-State: AOJu0YxANHyTEv435a7o8GEKnLmbHb2KLKbWYLlM8wjjUf10X3VMA9NP
 pM5T7+Ju5WFJUp2fMaOcU124Qk3RlUlmZ4yGeMUamWoobooj8NkCqmd5SIkEPsA=
X-Google-Smtp-Source: AGHT+IHd/JpX5xFn4EGCz74L2slqcQ7QjDkSjcIP2W8oQaKnEU/mKK3nggc7grCcvoJBGCB/fTR4Qw==
X-Received: by 2002:a05:6a21:2782:b0:1af:b80e:5406 with SMTP id
 adf61e73a8af0-1afde0d4d1amr15066019637.21.1715844086284; 
 Thu, 16 May 2024 00:21:26 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a663a3sm12318724b3a.41.2024.05.16.00.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 00:21:25 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v8 6/6] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
Date: Thu, 16 May 2024 15:20:39 +0800
Message-Id: <20240516072039.1287065-7-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Chage since V8:

- No change.

V7: https://lore.kernel.org/all/20240515014643.2715010-8-yangcong5@huaqin.corp-partner.google.com

Chage since V7:

- Fine tune HFP/HBP/CLK to increase the frame rate to 60.01Hz.

V6: https://lore.kernel.org/all/20240511021326.288728-8-yangcong5@huaqin.corp-partner.google.com

Chage since V6:

- Add hx83102_enable_extended_cmds(&dsi_ctx, false) at end of inital cmds.

V5: https://lore.kernel.org/all/20240509015207.3271370-8-yangcong5@huaqin.corp-partner.google.com

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
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 132 ++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 43b8337513d3..1a6975937f30 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -293,6 +293,113 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
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
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
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
@@ -337,6 +444,28 @@ static const struct hx83102_panel_desc boe_nv110wum_desc = {
 	.init = boe_nv110wum_init,
 };
 
+static const struct drm_display_mode ivo_t109nw41_default_mode = {
+	.clock = 167700,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 75,
+	.hsync_end = 1200 + 75 + 20,
+	.htotal = 1200 + 75 + 20 + 65,
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
 	msleep(130);
@@ -584,6 +713,9 @@ static const struct of_device_id hx83102_of_match[] = {
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


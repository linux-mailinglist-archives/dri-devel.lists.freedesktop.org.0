Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67E92CD6E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9310E6EC;
	Wed, 10 Jul 2024 08:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="D8pvQ8rg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24810E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:46 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70af5fbf0d5so382289b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720601266; x=1721206066; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXBDlG1I/lzZeBefyMjGbvmhGQI0/1kYfl254lPabwc=;
 b=D8pvQ8rgmh6R/VTyo/7TYLdaoR3xy5invyFGcLNRXLRqmGIKytP+4tBzgOgR4tMzNO
 pG78//qwFs41+PdN/xl2hRCkMBpRLnVz1UpoVzsZ1kTNrHh2gHV7DNzlR1quqlBgiDqY
 vUjsDxv7KXjD7itF/CVRfD6YZlDxmkp6unGdwk7anxuYfCx++KyUK8YMSZqokVXw5+n0
 hry02s8gfEnn81CDHuS6/QYtVvmQBqndgK4yqaZP6HxKL62dsK+mSBAyeaU5rG/Ew0Fn
 7G2KBCOE+fLyL1WH7R8oAMLrscqd5LiawPCXVbrrOoIJdj/RNmsnDXfobWlyMHE0pQER
 eGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720601266; x=1721206066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXBDlG1I/lzZeBefyMjGbvmhGQI0/1kYfl254lPabwc=;
 b=NkEe9LaCtOuB8JZsot+l/EBL0kpYDcpu57yMRMywIX1fFORW0+3cn/eWxKjA6jeWis
 TcD/DRli/txl0BnhzWWoCT7bjGWRLwrakwOC3yogSYkhxlLcPV9cYvBeLwj6ekb6FVuC
 9K6FQHN+yErY6nuH4ZpTUkp/sl91J9RoOKBXvH+OBkqL08pOzRTemAD30rVXT4SKgIV/
 oymeKoNpR2SRHNbA3OUr5M21wL/OYb3PBNA39zWhPu4nGBdA6FRe0KRidNe5Jg1rmFf3
 Sd7V8zEF+COg5jeKt8ucNEkKbHOigWcICyum+sh3e/YpHomTQN5khvPbxH1bmMwjCtbq
 jdYA==
X-Gm-Message-State: AOJu0YwVvTJSqBUeQQNaZRQ5GSjewy/UiF/4U6AL+2tdZAhAVQrA/VJZ
 GgK71Ah2ZtLXfx6luxH95lDG9OJwBUyNUQSVAufGql/kO/WkknUumhMF1mroYRE/F0HiwUHHVpI
 c
X-Google-Smtp-Source: AGHT+IHRpFgk9Kh/NEjBd2abgjEdLxEoyMQEAZuELGDG3fQNivCkALbrYlNh01gHQfOmG2fRpuRYfQ==
X-Received: by 2002:a05:6a00:1396:b0:705:d6ad:2495 with SMTP id
 d2e1a72fcca58-70b44e02e67mr8110266b3a.12.1720601266161; 
 Wed, 10 Jul 2024 01:47:46 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438997d4sm3216077b3a.28.2024.07.10.01.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 01:47:45 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, mwalle@kernel.org,
 dianders@chromium.org, linus.walleij@linaro.org, airlied@gmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/4] drm/panel: nt35521: Break some CMDS into helper
 functions
Date: Wed, 10 Jul 2024 16:47:13 +0800
Message-Id: <20240710084715.1119935-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
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

Break select page cmds into helper functions.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../panel/panel-sony-tulip-truly-nt35521.c    | 29 ++++++++++++++-----
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
index f2198fa29735..104b2290560e 100644
--- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
+++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
@@ -25,6 +25,12 @@ struct truly_nt35521 {
 	struct gpio_desc *blen_gpio;
 };
 
+#define NT35521_DCS_SWITCH_PAGE	0xf0
+
+#define nt35521_switch_page(dsi_ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, NT35521_DCS_SWITCH_PAGE, \
+				     0x55, 0xaa, 0x52, 0x08, (page))
+
 static inline
 struct truly_nt35521 *to_truly_nt35521(struct drm_panel *panel)
 {
@@ -48,7 +54,7 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+	nt35521_switch_page(&dsi_ctx, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x11, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf7, 0x20, 0x00);
@@ -59,7 +65,8 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x11, 0x11);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb6, 0x02);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
+
+	nt35521_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x09, 0x09);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x09, 0x09);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbc, 0x8c, 0x00);
@@ -71,7 +78,8 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb4, 0x25, 0x25);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x43, 0x43);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba, 0x24, 0x24);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
+
+	nt35521_switch_page(&dsi_ctx, 0x02);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xee, 0x03);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0,
 					 0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00, 0xc3,
@@ -103,7 +111,8 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 					 0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
 					 0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0xf6, 0x03, 0xf7);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
+
+	nt35521_switch_page(&dsi_ctx, 0x03);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x22, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x22, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
@@ -122,7 +131,8 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc5, 0xc0);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc6, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc7, 0x00);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
+
+	nt35521_switch_page(&dsi_ctx, 0x05);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x17, 0x06);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x17, 0x06);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x17, 0x06);
@@ -178,7 +188,8 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xeb, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xed, 0x30);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
+
+	nt35521_switch_page(&dsi_ctx, 0x06);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x31, 0x31);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x31, 0x31);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb2, 0x2d, 0x2e);
@@ -235,10 +246,12 @@ static int truly_nt35521_on(struct truly_nt35521 *ctx)
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf3, 0x01);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+
+	nt35521_switch_page(&dsi_ctx, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd9, 0x02, 0x03, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
+
+	nt35521_switch_page(&dsi_ctx, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb1, 0x6c, 0x21);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x35, 0x00);
-- 
2.25.1


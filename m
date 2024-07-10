Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6292CD71
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A3B10E6EE;
	Wed, 10 Jul 2024 08:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="WEN6ywJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41CF10E6F0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-38c616bfb47so961315ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720601276; x=1721206076; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdSsX2hRP68+2VkCMs98/L4VKlK5bg19EsXogh1t9Wo=;
 b=WEN6ywJ6aES9MkzVVNpkuNLqnFzqczLU1/X7oegstdCjngLpAALqK3iShdvTCYyPXA
 Jn3LwJYzPLcw/PMYN02ntGakIGaxdC7zXTgiBMuPw/9HkMA0vTB3M/xau745uIjRkpOE
 rz64KX9oIgqWcgHl94fgfjkLtckvygUg4xO67sg8JOMa4Osg9FjUTIIpjtgdzdVmBwfF
 5JrbH9uqWcAzzGCegCjBeyc2EnC1XVmITWuqFzCYAr4Wg0jelf1yCfArU1TMn+L3QzDO
 cBi/FMwzzl2+yPBwXrcvEhKQ4EJwb8qFbO4fvz6l7qT1X3ykjGctNLxJsBS+WKrztcqM
 MkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720601276; x=1721206076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdSsX2hRP68+2VkCMs98/L4VKlK5bg19EsXogh1t9Wo=;
 b=ZMxbExYxeLYzP1H8FlOumMhoTOyJ2fEjnVGLOWwMYrp95vL9lGsehAi47XniBHbCCe
 wM4Ag0QZkkuOVnJwWwlftoiqXHiBGQY0O9UGsqAml6I2eqDXxpUpQd/kvjZdX7Bygju0
 Sm4mSOTRLRcTHf5NWaAfl5n5W2zydvS1sSKZXwBRjIEev2gzT9UOzpYD2RhM5VoyZyZ0
 vifKMBfR/Mthznj/XK7b0DzdNqJEQ/K5nPoI6tWyTQA6ih/45qZQg7oGWxSYI9MoM32K
 HXocQdUzNdQc9flb+ccSotxx4wS4twOEQ9+yEZbFIoJjV3v2+Yb1aQM6hMKgJGjLCXoe
 kWgQ==
X-Gm-Message-State: AOJu0YzKiX8DLdQIQX51psaTI1DrQ/dvGOhpPDoUgriusINIpR9svT5/
 mSqPK/Pi71vUkgjvGSWXC+o+bfpj/EL0zDhaM+l1C+KIBPxCjL6Kj7BRjRE75Kk=
X-Google-Smtp-Source: AGHT+IEhdBXlvTXTNxPpSAqUXDrupWPb2+8ZA9pQkHECsu0JxSijkOpQo0s7y/6jmiFP7pAfDuJ/Mg==
X-Received: by 2002:a05:6e02:1c8e:b0:377:14a7:fc7a with SMTP id
 e9e14a558f8ab-38a58583d49mr58625765ab.12.1720601276050; 
 Wed, 10 Jul 2024 01:47:56 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438997d4sm3216077b3a.28.2024.07.10.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 01:47:55 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, mwalle@kernel.org,
 dianders@chromium.org, linus.walleij@linaro.org, airlied@gmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
Date: Wed, 10 Jul 2024 16:47:15 +0800
Message-Id: <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
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

Break select page cmds into helper function.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
index e4a44cd26c4d..68fb9a1a4d80 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
@@ -35,6 +35,12 @@ struct ili9806e_panel {
 	enum drm_panel_orientation orientation;
 };
 
+#define ILI9806E_DCS_SWITCH_PAGE	0xff
+
+#define ili9806e_switch_page(ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(ctx, ILI9806E_DCS_SWITCH_PAGE, \
+				     0xff, 0x98, 0x06, 0x04, (page))
+
 static const char * const regulator_names[] = {
 	"vdd",
 	"vccio",
@@ -227,7 +233,7 @@ static void ili9806e_dsi_remove(struct mipi_dsi_device *dsi)
 static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
 {
 	/* Switch to page 1 */
-	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
+	ili9806e_switch_page(ctx, 0x01);
 	/* Interface Settings */
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x18);
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01);
@@ -285,14 +291,14 @@ static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
 	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x0a);
 
 	/* Switch to page 7 */
-	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
+	ili9806e_switch_page(ctx, 0x07);
 	/* Power Control */
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x00);
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x1d);
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x32);
 
 	/* Switch to page 6 */
-	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
+	ili9806e_switch_page(ctx, 0x06);
 	/* GIP settings */
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x20);
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x02);
@@ -352,7 +358,7 @@ static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x12);
 
 	/* Switch to page 0 */
-	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
+	ili9806e_switch_page(ctx, 0x00);
 	/* Interface Pixel format */
 	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x60);
 };
-- 
2.25.1


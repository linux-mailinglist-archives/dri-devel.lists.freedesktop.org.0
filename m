Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A35999A02
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 04:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F29410E002;
	Fri, 11 Oct 2024 02:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="RPJ5Jw2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF6B10E002
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 02:08:29 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71df468496fso1508318b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 19:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1728612509; x=1729217309; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OX/0cWK2A4rNRPaYgXrW7HH4NgfbM9CvQw2XOjRlOYA=;
 b=RPJ5Jw2IpjAA//ydw2S/ZqR+kLd9W+XmKqMzpCcaB4knTiETgYnBb2/1A7gHxkZAaE
 g9JrT7BoTfskHY27MiqlCF4eXB3odJ5Ow90zLPjBwmfAOaeJhqQQl1Nvs1tNdujqCCho
 j5siJ0Ts4KCSt6x52SPSvYKLZWEed27g9oi6qerqsebzfkbqjXYe5lwDtLuqyeziafJD
 +mrNwnpmJCjCOHpg8w5dCel9OTUMg5WGNBgS6oT0RjpMHgRJ2nz5D8iQBsvSAt/x4JBL
 2JRDZwLaiu4ABYhETxE6Byf2YDdQtyMl1MJyFbEz1sw/WvQ8QzDybIldBipOnWPGrpuW
 v9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728612509; x=1729217309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OX/0cWK2A4rNRPaYgXrW7HH4NgfbM9CvQw2XOjRlOYA=;
 b=FZ3a0NFQUi2fCuRYBt7DBrJWUvpmI+ijFr579vjqKc6cGz0PxdRMmdAavYpL5EiU3j
 6ivliDzJ3TNovvR5RKip8wLGwVg/Ui5DOdr1EV6Qx+Xl6ZWrqYB2M09LAPqdwS0CoBqL
 74AJIDe8pimMnUh1xMH6qNBii6Ta6D2iH1ng7WrfDddFcpj8lZG6bDTlVk8664XkzOhQ
 JG+H5dZPx1PvgMlN/gBC0n172FwQajLtqGEXZ9nEQJBTPpidGtnp+QNljbOb3mlGKThX
 uo25YAlX/mhpB0UKbaopmaXt0zIkdyXzv59KmUohFZ9Fty+K5oDMTAEoI1mqBNx49zih
 2T0g==
X-Gm-Message-State: AOJu0YwemTBQkulxO+EvPd3sMb8h/kjGJnAJIutwdJl+ZU98f1DociOQ
 EhHvzW43Oa1s3/lTaRtZCY26hLxnVzRTCD5EhJrZ/N3GJ/PVv4XPdlbQBrcMhag=
X-Google-Smtp-Source: AGHT+IF9mcm2RkDY9IO6EMccSf9CuYCSmn+WiuGWvmpj9/f/mKYsiETorNjFHxqPn1wD1ODbE5XKbg==
X-Received: by 2002:a05:6a21:478a:b0:1d8:a29b:8f6f with SMTP id
 adf61e73a8af0-1d8bcf12fcemr1829434637.16.1728612509380; 
 Thu, 10 Oct 2024 19:08:29 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e2a9f4f35sm1701232b3a.47.2024.10.10.19.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 19:08:28 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@chromium.org,
 linus.walleij@linaro.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: himax-hx83102: Adjust power and gamma to optimize
 brightness
Date: Fri, 11 Oct 2024 10:08:19 +0800
Message-Id: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

The current panel brightness is only 360 nit. Adjust the power and gamma to
optimize the panel brightness. The brightness after adjustment is 390 nit.

Fixes: 3179338750d8 ("drm/panel: Support for IVO t109nw41 MIPI-DSI panel")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6e4b7e4644ce..8b48bba18131 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -298,7 +298,7 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
 	msleep(60);
 
 	hx83102_enable_extended_cmds(&dsi_ctx, true);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xed, 0xed, 0x0f, 0xcf, 0x42,
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xed, 0xed, 0x27, 0xe7, 0x52,
 				     0xf5, 0x39, 0x36, 0x36, 0x36, 0x36, 0x32, 0x8b, 0x11, 0x65, 0x00, 0x88,
 				     0xfa, 0xff, 0xff, 0x8f, 0xff, 0x08, 0xd6, 0x33);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x12,
@@ -343,11 +343,11 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
 				     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x04, 0x04, 0x06, 0x0a, 0x0a, 0x05,
-				     0x12, 0x14, 0x17, 0x13, 0x2c, 0x33, 0x39, 0x4b, 0x4c, 0x56, 0x61, 0x78,
-				     0x7a, 0x41, 0x50, 0x68, 0x73, 0x04, 0x04, 0x06, 0x0a, 0x0a, 0x05, 0x12,
-				     0x14, 0x17, 0x13, 0x2c, 0x33, 0x39, 0x4b, 0x4c, 0x56, 0x61, 0x78, 0x7a,
-				     0x41, 0x50, 0x68, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x07, 0x10, 0x17, 0x1c, 0x33,
+				     0x48, 0x50, 0x57, 0x50, 0x68, 0x6e, 0x71, 0x7f, 0x81, 0x8a, 0x8e, 0x9b,
+				     0x9c, 0x4d, 0x56, 0x5d, 0x73, 0x00, 0x07, 0x10, 0x17, 0x1c, 0x33, 0x48,
+				     0x50, 0x57, 0x50, 0x68, 0x6e, 0x71, 0x7f, 0x81, 0x8a, 0x8e, 0x9b, 0x9c,
+				     0x4d, 0x56, 0x5d, 0x73);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x1a, 0x26, 0x9e,
 				     0x00, 0x4f, 0xa0, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x0a, 0x02,
 				     0x02, 0x00, 0x33, 0x02, 0x04, 0x18, 0x01);
-- 
2.25.1


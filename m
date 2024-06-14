Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79706908DF2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A3D10EDA6;
	Fri, 14 Jun 2024 14:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="D718s4tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475B910ED7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 14:55:41 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f7274a453bso20577355ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718376940; x=1718981740; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pu5LRvimdEl5RzT2qMnkBN0BnjaWqgD8vo8gH2oaLfw=;
 b=D718s4twTVV6pDHBiaDPDdOg/FY+HTXIuJT8k6pj4MfdbyNMthcJYJuEC4EUlK0H+X
 XcgpLf5esV9Xkeeq1gq9ryhBeR/XXJnWrka6+RFWFjzzmpOAru3/GJvRccai6spCHUNx
 0mAzANfhHhCNKaxGLaMdcQMuNVPyuN9G1DVdOitIIcmxZK65/oUhMgCWNu2koH/K/k3R
 6flfZt/7hR3Vxb+SHpizdMidnsY7aKX0fx4qfuK6RJe0LJMxujokelTTnPkUYvzdlPTb
 R26aNeLnTbpboY1d+ATVl0kHCRMqs6VqMr1mp4PAUxTutGcsi9TVebBww8hScYjmjf5z
 OScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718376940; x=1718981740;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu5LRvimdEl5RzT2qMnkBN0BnjaWqgD8vo8gH2oaLfw=;
 b=SmGytnX84+3a55wMcvtAsDbczYIhJiBw8Ba0Q+9MzwGSQIGLvPkcFMep3g2kW0DusC
 0Nn6A0/Sgw9go7X5b30uATegcMdcWOnkcZ1jt40VAjDfqvolxlvBy6YEMcqNn5oXdzJJ
 MgDZ8qUjSBWK720ThxiNuz0LX1vAq0qeQKetowa4jIGuAq7McS1Xmidp00vQXZy02P2q
 P9XubpIxGqlAaL31LH44WqVY99V508eD5ZiIw2Z5HHaom/eJMx+sEm9l3xZY/S3ASz4p
 HzHe8LvA0S7rznKzFQJiv6WNCh5SRpcqXKkU4SrmBWvz7mp3QVhd1LX2c1Dk0HcMjGsp
 brTg==
X-Gm-Message-State: AOJu0Yw8Tbubntore7624w7ztX9N2Mo22dEsOt3TpagOuJSE1cB6usmb
 Sj8IOccJu/5pggHcoQPhu53fXi8zmSzy9fDhTB5ryfbBucH8VZcOGnoj/QcC9qw=
X-Google-Smtp-Source: AGHT+IHsOWYnc/lagYtmrJqXed+bAdNj3O/ZwWwDQYPuGKWEmWzWAZNWgpSTjlu1pFBCi7TULC691g==
X-Received: by 2002:a17:902:c212:b0:1f7:2ba:4c15 with SMTP id
 d9443c01a7336-1f8625c6439mr26426005ad.2.1718376940567; 
 Fri, 14 Jun 2024 07:55:40 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e739b7sm32914495ad.93.2024.06.14.07.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:55:40 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 4/4] drm/panel: jd9365da: Add the function of adjusting
 orientation
Date: Fri, 14 Jun 2024 22:55:10 +0800
Message-Id: <20240614145510.22965-5-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This driver does not have the function to adjust the orientation,
so this function is added.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index f6e130567707..7f86bb7f2299 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -42,7 +42,7 @@ struct jadard {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	const struct jadard_panel_desc *desc;
-
+	enum drm_panel_orientation orientation;
 	struct regulator *vdd;
 	struct regulator *vccio;
 	struct gpio_desc *reset;
@@ -205,12 +205,20 @@ static int jadard_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
+{
+	struct jadard *jadard = panel_to_jadard(panel);
+
+	return jadard->orientation;
+}
+
 static const struct drm_panel_funcs jadard_funcs = {
 	.disable = jadard_disable,
 	.unprepare = jadard_unprepare,
 	.prepare = jadard_prepare,
 	.enable = jadard_enable,
 	.get_modes = jadard_get_modes,
+	.get_orientation = jadard_panel_get_orientation,
 };
 
 static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
@@ -907,6 +915,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	ret = drm_panel_of_backlight(&jadard->panel);
 	if (ret)
 		return ret;
-- 
2.17.1


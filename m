Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1C90FE42
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF4B10E856;
	Thu, 20 Jun 2024 08:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="cnCtailE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FEC10E84B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:05:50 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-25c4d8ae511so326681fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718870749; x=1719475549; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AMOoGP2LakwJmw2FH71ZMogJWrdUzY8/qHEtPyyBbV4=;
 b=cnCtailEqC7NN7Rj2Jc9ETu833R5cQY6n6SfYH/FBORXDhsjBmoXbMa9shKT8uZatg
 kz1rlGkEvJBLvV7E+TD+25x64lo7yZ0ozwQki3ufXbUc2/c/vQDZguMYZNmpjCDF5WVA
 cZts38Beatq022pQ56vBX6KPzf9EAitFVLqM2l0J9RqEf4RxlrDrn/S/jvw4wOAq9qxW
 +6kOcY5wT4p4/WodJBjTqHr/dk72eacsb/ET1sWnQUcRWOJhjBfrfeb0dvr6afa1NUUK
 yhKP9DKXUvGZoW7qmNaehgP37vkIE5H0s/608EjcpvhlUuF1XH9EkH/FvaX4PEKZ7REW
 GEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718870749; x=1719475549;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMOoGP2LakwJmw2FH71ZMogJWrdUzY8/qHEtPyyBbV4=;
 b=a3DY1OWiTW24/UAsW6NxhqKiYNuxnXzCWjPg/9zudV0PdT1IdzvqM0yqRYOxM0aGGd
 7s1Vhw1/jQnYCH5+TuqPVBFv/KBNcVBeAQUmLbG3Gxqqiqm1mZAiE1tgAIxAkKUI2xio
 vpXwon7zAS8o0tAU6rrye5qZzWqpJV4sRLjOLivl93uaiS2VLSYd+cSEJqAsmagbTHET
 lgEa8hk/Qgq5AkVu/haYxAr011ZpO3jUHchMAsnEbXIUlbmrVRPQpzalGu5VCanurAx/
 ZsLiy0Cl1RvHI6sCMx2jZuUKmfhcGsOV2jvQOjTeTJkJHfRo4YNNLhd6fdWivHiTwQ0m
 d/mA==
X-Gm-Message-State: AOJu0YzbkZY+dqkBDzlgbCYLgCpzIvmNdhw77DpRQQrC8r85e+Z29K/O
 GhqCbOP5T24/VVQ/QtF+B7dNaYzQxuZowoQQkpbCQ0SdKc1jR4h3a9pr6pcwo6Y=
X-Google-Smtp-Source: AGHT+IEbQAMEJgVsRzS0P1rsWA85d/j/lSoDKbJ+GhYfS/LOyoubfsealP8TGQ73YDuxPIYvuL2izg==
X-Received: by 2002:a05:6870:b50f:b0:255:1819:b458 with SMTP id
 586e51a60fabf-25c948f70cfmr4660143fac.8.1718870749476; 
 Thu, 20 Jun 2024 01:05:49 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96c8c5sm11805889b3a.58.2024.06.20.01.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:05:49 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v4 4/4] drm/panel: jd9365da: Add the function of adjusting
 orientation
Date: Thu, 20 Jun 2024 16:05:09 +0800
Message-Id: <20240620080509.18504-5-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Changes between V4 and V3:
- No changes.

---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 632bffa035ee..2545e22a5c85 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -46,7 +46,7 @@ struct jadard {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
 	const struct jadard_panel_desc *desc;
-
+	enum drm_panel_orientation orientation;
 	struct regulator *vdd;
 	struct regulator *vccio;
 	struct gpio_desc *reset;
@@ -203,12 +203,20 @@ static int jadard_get_modes(struct drm_panel *panel,
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
 
 static const struct jadard_init_cmd radxa_display_8hd_ad002_init_cmds[] = {
@@ -893,6 +901,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
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


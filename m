Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BA914FC7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17310E46A;
	Mon, 24 Jun 2024 14:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="bZBuJvQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D710E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:21:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f9a78c6c5dso34423805ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719238875; x=1719843675; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1qpj0f/OeWA6dGKiRxuI0hvWF2bl8N/2CZEVg3ha4Ow=;
 b=bZBuJvQuUbOkUkY/SM268UfLIQwGmBC/6bEB421pkF7TS2sMzqnkDGx4AS4UrZEWyK
 0i+GcGw6TvMBUvcYkt3YtyXLniGIlb4Rlf/tNUqSWN8Yihng0UPBp3ZRsajvKz4PYHNc
 cr9CF1+h/6lfDF0NS9IU954w2THKt1hl9AEe0Xa7g9sW7tDn3ftYSwIShZW6FIePzHbY
 OwIj5yqSWYHc+rqXc4gM+DCS7aWEnS/eBZ8Wb7VYaUrZ2L/H0cLHo8kxaKwo7Ku4022n
 dARD1a/MWp6CVeQ5qu/w0ivt4FNInreZRnVshgSk7tAr+YLnfDuqkAnyl4ZtWBjYWRRY
 MX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719238875; x=1719843675;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qpj0f/OeWA6dGKiRxuI0hvWF2bl8N/2CZEVg3ha4Ow=;
 b=SxhX2RBNDkNp6UfKggXM9xUqZWQ0v66Pe7XQkZ3KMUdgmOYjT64V203NulsF4wgHET
 KibTyFhwF4uUZOQ68Y7Z91mQTcKpHNNCYdVUkKZ/+RLpeEzZMike8fUzepW9wkPztNI5
 K2MHVLBFh/C99ikKqI+nvCtLPJkTmVL/86GYFAiyQY8/p/zy6N1Vr0pUPfnVOECpKQh9
 +H3mIpHeVVOwJ+RN0Q0Hzpn2GKzCcpqfjcq5Zg+4N1YenA7cJ201Qih/X+aEK+oy+mLZ
 7BXgFjm4MmVza2G+l8/ZecJkFpTZPkE9phFdZi9LLfQ3IUULf2qd7OaKaSzUM0epWp26
 LNiA==
X-Gm-Message-State: AOJu0YxkrUMKlEcMlsGvKuCBioM+8+rQR3nCO1A9KcItH8dzQmezVm+O
 Y94f1WCniRtd3bbGiACqWBv6LC+rvgSGq8M27BSxdua8iOO+bTYek6IWrpEe/rQ+07BOuMF7llZ
 i
X-Google-Smtp-Source: AGHT+IGOvHDC4YqenIDttqXlIUEmp0xeeweiw5w0vewijcFzwGrUoNqHB/fSBZ8ly/gUksuCYnoCrg==
X-Received: by 2002:a17:902:ea11:b0:1fa:a89:fd1a with SMTP id
 d9443c01a7336-1fa23bdce4fmr53443755ad.10.1719238874719; 
 Mon, 24 Jun 2024 07:21:14 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d5fa9sm63243855ad.206.2024.06.24.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:21:13 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 5/5] drm/panel: jd9365da: Add the function of adjusting
 orientation
Date: Mon, 24 Jun 2024 22:19:26 +0800
Message-Id: <20240624141926.5250-6-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Changes between V5 and V4:
- 1. Change dev_err() to dev_err_probe().

V4:https://lore.kernel.org/all/20240620080509.18504-5-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
- No changes.

---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 593e12b31ebd..c6b669866fed 100644
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
@@ -178,12 +178,20 @@ static int jadard_get_modes(struct drm_panel *panel,
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
@@ -880,6 +888,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get orientation\n");
+
 	ret = drm_panel_of_backlight(&jadard->panel);
 	if (ret)
 		return ret;
-- 
2.17.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00467FAE32
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839D10E31B;
	Mon, 27 Nov 2023 23:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60F10E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:10:28 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so6953291e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701126627; x=1701731427; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wSqQHdm2tAnngdZ4T3GO4w4i+AkvfcnW67KysvUoiKg=;
 b=who62fcI6R38kKaKzCmMQ3duGPDuvNu6Nz96n5J7xBl5P+ukF7gR9hi35PNx03F0No
 2FMk4DN1SZRozGIXQE/50TJW9HnGykKkQ0PS+M1M4yDT+i2YpeANepilqDnRdcKDgTWL
 Mx3PH4llPn2G4HxqJ0xXKLrGfhLfm6SNctQWajpLRoQ206MXfzVPUyZuZZ1cvqPLFn/3
 +3SAtiyEVuXQBHuMtypCMlLb2EyUNNb7uytSmwYgpe4+VIygd5VFjvYGVvgKcCs48AUn
 pRrg3oYcAGCT5kwDNrn87aSH/HEYBP3x+ClNb3WZjS3PwmHrLI5jvHf+Z4j4FnI8Y/Ph
 iJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701126627; x=1701731427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSqQHdm2tAnngdZ4T3GO4w4i+AkvfcnW67KysvUoiKg=;
 b=O7CNMfX5SE9g9XTNyu8KmDeriighGJPX4Jpwj5Rdhd2gb7bvKoRsIdBEj5LFTWAkY1
 SK2aGg7vW0MzNiM8FUfLYrwdnRc4xyX46BEP2H30LfQdEGNuarH2Wt0zO4pZcg5lJOPT
 /1wPmnifL7H7MrIjyb/2cQbi/7EWQomXhxZZhINuRGTsiOSKOFPF4BZVwgHvczrnmRXg
 YDozmc7/1ryt317oqC92nnDcCSQenQHexOtM0zblFvcrkucU/VqQ7PAp1crQ1r3JEuSK
 gCZrPDUUSG8/jjPtyOwLf43fIYz/AbBOSbOQDiu+uadvJx6LGlWN4JgdsxaRufuGrmhI
 1VKg==
X-Gm-Message-State: AOJu0YwbDywF7kZVvZuO1IM9pEBR8Lq6zerJ/i9FJyoxPXfBogVK2TRU
 649D1q+oV00jgKHZxXXLEIy74w==
X-Google-Smtp-Source: AGHT+IEIaVbkz/Qqn3PYVmMWBo7MTr0rs45ISGfiLxrUqq0lGxY5f9yvJf3revevuWpDGFC2mqL8pg==
X-Received: by 2002:a05:6512:20c2:b0:507:b911:6706 with SMTP id
 u2-20020a05651220c200b00507b9116706mr6914486lfr.25.1701126627002; 
 Mon, 27 Nov 2023 15:10:27 -0800 (PST)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.211.33]) by smtp.gmail.com with ESMTPSA id
 cf17-20020a056512281100b0050aa94e6d15sm1636877lfb.9.2023.11.27.15.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 15:10:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 00:10:20 +0100
Subject: [PATCH 2/3] Revert "drm/bridge: panel: Check device dependency
 before managing device link"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-revert-panel-fix-v1-2-69bb05048dae@linaro.org>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
In-Reply-To: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 39d5b6a64ace77d0c11c398d272218df5f939abb.

This patch was causing build errors by using an unexported
function from the device core, which Greg questions the
saneness in exporting.

Link: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 5e8980023407..e48823a4f1ed 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -23,7 +23,6 @@ struct panel_bridge {
 	struct drm_panel *panel;
 	struct device_link *link;
 	u32 connector_type;
-	bool is_independent;
 };
 
 static inline struct panel_bridge *
@@ -68,17 +67,12 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
-	panel_bridge->is_independent = !device_is_dependent(drm_dev->dev,
-							    panel->dev);
-
-	if (panel_bridge->is_independent) {
-		panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
-						     DL_FLAG_STATELESS);
-		if (!panel_bridge->link) {
-			DRM_ERROR("Failed to add device link between %s and %s\n",
-				  dev_name(drm_dev->dev), dev_name(panel->dev));
-			return -EINVAL;
-		}
+	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
+					     DL_FLAG_STATELESS);
+	if (!panel_bridge->link) {
+		DRM_ERROR("Failed to add device link between %s and %s\n",
+			  dev_name(drm_dev->dev), dev_name(panel->dev));
+		return -EINVAL;
 	}
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -86,8 +80,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
-		if (panel_bridge->is_independent)
-			device_link_del(panel_bridge->link);
+		device_link_del(panel_bridge->link);
 		return -ENODEV;
 	}
 
@@ -99,8 +92,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 				 panel_bridge->connector_type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
-		if (panel_bridge->is_independent)
-			device_link_del(panel_bridge->link);
+		device_link_del(panel_bridge->link);
 		return ret;
 	}
 
@@ -123,8 +115,7 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
-	if (panel_bridge->is_independent)
-		device_link_del(panel_bridge->link);
+	device_link_del(panel_bridge->link);
 
 	/*
 	 * Cleanup the connector if we know it was initialized.

-- 
2.41.0


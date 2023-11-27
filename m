Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766687FAE30
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AB110E0E3;
	Mon, 27 Nov 2023 23:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4C210E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:10:29 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507c5249d55so7312132e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701126628; x=1701731428; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ebCaCeD18lScqs91J6GhqRptQIZNUU3CWEgjdYQG/5k=;
 b=hjMDJqt16N1aRE0d9kHeKQbIrW918ruaxETviE5KYh6DpKNUuvUXMTjrMfIXjC0DSV
 IjGQFw3iri3GDQ4EqNPYhzeFlEcTLW91dRG1KOMbZE9wglsf+RymvYTF0a2HpwXqx/5K
 nrlOT6s1uuVbPuoNR+fzwAnm0KX7gQIkHBaI56g/7ab/FBUNQXk0nFzqw9QVDLXBnW/m
 D+kRzC7R0vDiVlKhpQzraXWhlgMpCdIfADpukfkAx1/AQssySUn79t2eonMOH0lZH8nq
 jNsdo7GQBjQaCOBcjfjr+8GF0bJiKnsiOGpRxv+RFjwIk9udRuJekhvkaTiS05KiT5A9
 3j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701126628; x=1701731428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebCaCeD18lScqs91J6GhqRptQIZNUU3CWEgjdYQG/5k=;
 b=Om8Bn9+d2mggOkcFhDgxfXwxEQ81I4bAQkZpKZcVeK66aesR+Gnre9qLxytYcxg4Nf
 qxS/0loW2tRHm3aSsPjh/Qdtq9S7gnOtOk4D6VDQxiEk8lqpKbiFT5AiYeN77q/+7oKE
 fN6PfVDL1SxYUeXyMDau2eipaCROrdu+ljZycKl4ykLaCcb5UIIzgnXsyVLAvIflFKjq
 XHpWuFUVBZK7xNaQ9gKzbTZb2vPilcfHxsajAi77f/uVrFINSAmpKSwvmjG+KkPBwLQa
 n/c4IezdIpMCu3zFMJFYCUF6X7k9TYyXvs6avPLzBgNjBD25u6qtjKunHv4XhXNATqvs
 134w==
X-Gm-Message-State: AOJu0YzzTeqgZqkRw/UQ0ubQiQfzRe9PtcS6aPx5R1jQym6/zyDbU0+w
 fEaxm6nxCleiQVlkQonCgZcQAg==
X-Google-Smtp-Source: AGHT+IEhEPXemDbkIJhSLCv5/GH5cwpEPdzf5GSgTd+fUOw58GlymZwfd+AJ0UkTPtPIdrnHM/VP5Q==
X-Received: by 2002:a05:6512:4883:b0:509:8fbf:7af0 with SMTP id
 eq3-20020a056512488300b005098fbf7af0mr7163748lfb.69.1701126628030; 
 Mon, 27 Nov 2023 15:10:28 -0800 (PST)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.211.33]) by smtp.gmail.com with ESMTPSA id
 cf17-20020a056512281100b0050aa94e6d15sm1636877lfb.9.2023.11.27.15.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 15:10:27 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 00:10:21 +0100
Subject: [PATCH 3/3] Revert "drm/bridge: panel: Add a device link between
 drm device and panel device"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-revert-panel-fix-v1-3-69bb05048dae@linaro.org>
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

This reverts commit 199cf07ebd2b0d41185ac79b895547d45610b681.

This patch creates bugs on devices where the DRM device is
the ancestor of the panel devices.

Attempts to fix this have failed because it leads to using
device core functionality which is questionable.

Reported-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e48823a4f1ed..7f41525f7a6e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -4,8 +4,6 @@
  * Copyright (C) 2017 Broadcom
  */
 
-#include <linux/device.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -21,7 +19,6 @@ struct panel_bridge {
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 	struct drm_panel *panel;
-	struct device_link *link;
 	u32 connector_type;
 };
 
@@ -63,24 +60,13 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
-	struct drm_panel *panel = panel_bridge->panel;
-	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
-	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
-					     DL_FLAG_STATELESS);
-	if (!panel_bridge->link) {
-		DRM_ERROR("Failed to add device link between %s and %s\n",
-			  dev_name(drm_dev->dev), dev_name(panel->dev));
-		return -EINVAL;
-	}
-
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
-		device_link_del(panel_bridge->link);
 		return -ENODEV;
 	}
 
@@ -92,7 +78,6 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 				 panel_bridge->connector_type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
-		device_link_del(panel_bridge->link);
 		return ret;
 	}
 
@@ -115,8 +100,6 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
-	device_link_del(panel_bridge->link);
-
 	/*
 	 * Cleanup the connector if we know it was initialized.
 	 *

-- 
2.41.0


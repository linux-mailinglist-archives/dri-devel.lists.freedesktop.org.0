Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C49C2D15
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D9410E2B1;
	Sat,  9 Nov 2024 12:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/mvd2dL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A42410E2B1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53c73f01284so3728322e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155725; x=1731760525; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=j/mvd2dLdYNe9sbV2HtfEbhqDU9a/C3Pm4Br10jGzSdhWghCJrMajoqjYU6ovp5hIZ
 zIcYC4HRkGwK2r2dnYkYNLGJvdHwkI/kfHNVjKNWZ0Ytddd8trq+AfRy9cW3Kgsf2T5M
 ex8OTXVb57hzdfn+TJu2wUCAcpWz1Zu3pRu7f1oND+s2bWE8puJQ9NDpOSJFFN2JJByo
 /5im34btVthmk9PA74HZKTEJAvvZygFVuAqisZSOK7c26VsIHrYyEmS+/pLLb1QUutqM
 pjVTReBMx1ncuBZvhtKefz3gai1lkeuIGfB0X7b8faIyyj2XJqYwL47/58TmP1v5BqBw
 2cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155725; x=1731760525;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
 b=h2D1K7PvwopjGOQ/LNeKdPT28T76W7st7WYUheYUMrhPYImogkauirjyQ6FabsdTmr
 Z4b1HLrgwq66u+a46DQlhanFXIX708ESzWvmHjpO6ZLf6OamM9xn1rS9gqQbr8BgiMMp
 3glVAkChb4oSPbPOgiP8bD8s/3KnNLweUc7usmhrjfOE7kpyyJd57x+cD3lE2IkPxY3Z
 lwDw/WPM5kGn7oBcV+07NNfqzdhCBngiXP0iVwKnZ+qFxju2lP+BPM8adUW6ISvwTVmo
 IUzSlQs4BzY0gHM6dCPp0GWK5egJE+501Rr4/mCHruLtfcSavd2wYfnu09452m7nw0au
 MK/A==
X-Gm-Message-State: AOJu0YzXoVPJwc+LDU40dLp7UWLSZP30UerxTFJsxi/gpxJSw9fymGOv
 9b0xHYCh0esqZ+XetopVnggn9DEzRovThwUrBUvtaCHr01w0AZJA6QzQaXwzZLY=
X-Google-Smtp-Source: AGHT+IG2mF9zXCA/y3y0kG03UAbkXGpNVLSwpOM/qt6TF2Y6MK5K8/eQXGRo4a4HPRqLDiFR1eFg0A==
X-Received: by 2002:a05:6512:1592:b0:539:f51e:2465 with SMTP id
 2adb3069b0e04-53d8628a83dmr3060627e87.22.1731155724584; 
 Sat, 09 Nov 2024 04:35:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:08 +0200
Subject: [PATCH v3 4/7] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-4-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/KHIaludY1+1CnUBh/lq0s+PtcC5v0NONs
 Pv90ths6RCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1c5rB/95XEPGSJ2I/WYRUC9L7roQJ7z8kswhRTv6gT+rta7yHL8pZMMbulp8JmYNT6Rk6+a0XTK
 Z46yGeFYciY49oWjdprjny4+rAL4woYLtKm7yJFmib4najumMWlTV+Pj0JggMJqKwSTFZebEbZr
 xPGfugM6N8F456I3/6sjXptKWIF+VOVGk2tCwSDNlK5K3gX5l2adzR5ldrIquHhJWkh4ySTeUnU
 lJro1JwucnZoQ3+bJ4VWkPpcN4sZUWiMd8Or9Zknb6b9gLWnpIaANiowZHGh3Q1FHVaMUvnezMy
 lUGU0SiMa9kFJBSSehYWwauSlUUfkAEePIgEdIJPy/WCafW3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5


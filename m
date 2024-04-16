Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C78A64F2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 09:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D66C112AAD;
	Tue, 16 Apr 2024 07:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lKXJA8VM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB93112AAC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 07:21:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6eff9dc1821so1589748b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713252100; x=1713856900;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KfZXB2BpFfIoHxhagie2lEibr4RlvT9R7XTtuJHOq8g=;
 b=lKXJA8VMByElKoD5nLZWRj7VOA0cwGERIPnc9hGg6YRYl3FTzLQgDZzCgkyB1woZ6d
 3+arUNmrvhIicJd5OXQvhLRPvRlSnQAPoUrb31UbKJbsFeN1plyeb9bW5YAwKlOb9GP+
 lr6GA83xA+0E5oWopOC3PajkVPWnY9AeODuE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713252100; x=1713856900;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfZXB2BpFfIoHxhagie2lEibr4RlvT9R7XTtuJHOq8g=;
 b=tKigF2vSDV2yhRR6zs9hc4PhJsCIDeHydYBKf/ZjURUozrXJnzmr1xCxvN8X0WQp6e
 BKMS4j4n1eNOvG4GLiOzqhn42EyLBeYlHUAWUm+gUODeny4/j66IcRuyc/Ta3eISaZtf
 1LFjXNqBPa6eBQrCFt685gTf1ZmnlrXFLenzibZwXOmgo0fjYv1/3uBtdr4omkCXqZTo
 f1lsUbyscOCfGMWbS2U76612NfydkS0gFoXxtViZfXjuYhE2vM94dWXsFEVeupNCCo6K
 0LxbM85iiG/jyecePIy0Zbeq/SVtLLMc2zELYdhN9uLrL+Heg2kkaI1jsalyFV2DBX1Y
 L7fA==
X-Gm-Message-State: AOJu0Yw3vRMJY94So7VWZVQTYSf9hYYuJWa5eQknaaYZIeMXtWX3faNo
 XvkLWyYDe4JAFZLf7h+U8nJwzVjFGEprfCFPVj+D46rzRIrONFO1XXvvO7pfyg==
X-Google-Smtp-Source: AGHT+IE7afWFhGfCo8YNIeMgjqQi06GV4Qk3C+gWZbRMgAZZl4K/rVD0mwLMuSGHZpf8I9hBZPpmJg==
X-Received: by 2002:a05:6a20:2d08:b0:1a9:ab88:f938 with SMTP id
 g8-20020a056a202d0800b001a9ab88f938mr10966169pzl.19.1713252100098; 
 Tue, 16 Apr 2024 00:21:40 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com
 (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a056a00234400b006ead47a65d1sm8323679pfj.109.2024.04.16.00.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 00:21:39 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 16 Apr 2024 07:21:35 +0000
Subject: [PATCH RESEND v3] drm/bridge: anx7625: Update audio status while
 detecting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-anx7625-v3-1-f916ae31bdd7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAP4mHmYC/3XNPQ+CMBAG4L9COlvT9qCgk4OsDjoah9IP6ACYV
 hsM4b/bdNH4Mb5397w3I6+d1R5tsxk5Hay34xADrDIkOzG0GlsVM2KE5QRIgcUwlZwV2GjKFYi
 NglKheH112tgpNZ3RsT7Vhz26xHln/W10j/Qg0LT96goUU1yBViClETyXO9m5sbf3fj26NtUE9
 k75i7JISwqVJqRhRWN+UPhDIdINgZxxaEwB5IMuy/IE9nwxMh8BAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, the audio status was not updated during detection, leading
to a persistent audio despite hot plugging events. To resolve this
issue, update the audio status during detection.

Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---


Change-Id: I0b36c27d426b2988886db98452700cb7227d868c
---
Changes in v3:
- Add Fixes tag.
- Link to v2: https://lore.kernel.org/r/20240306-anx7625-v2-1-7138e00b25bf@chromium.org

Changes in v2:
- Add a space after the colons in the subject line.
- Link to v1: https://lore.kernel.org/r/20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 29d91493b101a..9f0d0c5b8ebf5 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2481,15 +2481,22 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 	mutex_unlock(&ctx->aux_lock);
 }
 
+static void
+anx7625_audio_update_connector_status(struct anx7625_data *ctx,
+				      enum drm_connector_status status);
+
 static enum drm_connector_status
 anx7625_bridge_detect(struct drm_bridge *bridge)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
+	enum drm_connector_status status;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
 
-	return anx7625_sink_detect(ctx);
+	status = anx7625_sink_detect(ctx);
+	anx7625_audio_update_connector_status(ctx, status);
+	return status;
 }
 
 static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240305-anx7625-fe16d3a9d37d

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


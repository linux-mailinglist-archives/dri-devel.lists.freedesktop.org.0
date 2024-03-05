Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391F871F44
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12259112A9D;
	Tue,  5 Mar 2024 12:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HTkxeLBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3E0112A3F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:27:34 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dd1d9daf02so11981465ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709638054; x=1710242854;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S6lk2VSf0du4ELFj1o53K00Oxr2xrvdHE8vh0vkwTlg=;
 b=HTkxeLBGyB5SeEqL0nC/GyLlPVOrOt4gIlHdd1fl+KYy4zYUmpXnJtgMisSFXR6Q5C
 afo+rGVKfnTPNcxtACqth93ZK5dl5jf3N6GM4wVlRQPGaNYNgofitLoiBfKYwyp6Rjg8
 gzF4c6p7f8tiHyGvUfQ2lb5pQTbaCvLj7JtQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638054; x=1710242854;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6lk2VSf0du4ELFj1o53K00Oxr2xrvdHE8vh0vkwTlg=;
 b=aJAwwpKRHJ19oABlcW3x+zd6D8/5MSpWr9+TUgTaGRpV/JImSdKKEsYY0JbKRnr+gc
 /3dTHxj1+khxVNvE6eMpIKchSuaUKXbQZVStK6T0n2svfHbAvl9W/SIalIAolHMJGTCx
 aBGp6G4wD0QLIt5uNPBIltqHjwO6j9ZbU1agJcuwgDIqC4+nb7/coaLdOigQWvEfqyvj
 FBQtGFeYi4zgZsz130ZjsVNQQeok+vXWmsVrkCyZrHOG0iKtradmalWy4wo2fY8ZnY19
 jXPR/JB2MScsq5wvHlHAzSdoPGRHnd7PBIr+P0xsl4cqYPrxlmh63147I3nXzJF8i3IG
 0+2g==
X-Gm-Message-State: AOJu0YxsnjHvh9DYvPTdWg43DJhODdupRsQUNKaac3bws7LaJY6eZHDu
 GbfNMPrBfptSlWkxSBPc6wPNNxNMAjt+/VchDRbXzC8uRcLeVdaH99WedkM75w==
X-Google-Smtp-Source: AGHT+IF+WI48qE7GkIClJ44xeG82/z0EBNUVoILGmHKbKaq3pKcJ4kmhGj+wfJpEJ6EhEvErdgTBoA==
X-Received: by 2002:a17:902:e88b:b0:1db:d811:732a with SMTP id
 w11-20020a170902e88b00b001dbd811732amr1481426plg.37.1709638054295; 
 Tue, 05 Mar 2024 03:27:34 -0800 (PST)
Received: from yuanhsinte1.c.googlers.com
 (36.157.124.34.bc.googleusercontent.com. [34.124.157.36])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b001db9cb62f7bsm10344720plg.153.2024.03.05.03.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:27:33 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Mar 2024 11:27:26 +0000
Subject: [PATCH] drm/bridge:anx7625:Update audio status while detecting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJ0B52UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwNT3cS8CnMzI1PdtFRDsxTjRMsUY/MUJaDqgqLUtMwKsEnRsbW1AGE
 vZz5ZAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Tue, 05 Mar 2024 12:32:00 +0000
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

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
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


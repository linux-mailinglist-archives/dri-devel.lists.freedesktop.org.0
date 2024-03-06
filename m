Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1DB872F2B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 08:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247C8112F6A;
	Wed,  6 Mar 2024 07:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PoRd1Khb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41374112F6A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 07:02:13 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6e5eb3dd2f8so2777667b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 23:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709708532; x=1710313332;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VK485e0Io4FQkZBiTpzl/C3wrcGvcoGSSd6OtH3yQ7I=;
 b=PoRd1KhbtXVIXhhN3W69/WhJZdlyPWWQcL0uXFhLVmc4bR41nEdcWIP0+JYjYFbtfJ
 fCKtOsdtLPg7hF6Ins6xLpI10pp7nhT91er5S1804RD4HXSIuPTQhiYrfPN4Ya5yOHsE
 CuNGf8mwlpnQCpvvwmkc0hqsiUzd51usWFnXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709708532; x=1710313332;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VK485e0Io4FQkZBiTpzl/C3wrcGvcoGSSd6OtH3yQ7I=;
 b=LBhjYfH/uHlySSDVyeQw5NKfqp/uerP/4lE1s57VckgROulUmtwitkso2dy64lynxO
 kJ2l3Jtk7XagfcC6eb2Rrpg8QeND0baSDF0hjhlWYl5Ff4/5g820TG4CxSu+6n7XMxHR
 ST3RgSOxbBnL0whey4MSjQgQWngcdGMXq71Z5p/EHCpu+cEYy72inC20WH51WoHK/tcL
 vCvQxC4nPnp7qvd30dTLLLZKBzwcy73UIt1TQtFYgnS6F+oFy4cBOEidCKLVpoh40CRD
 jo9bqyyRO8yzAvQhe/dpuVw1ex+ZDpe6HmFnnqncKN8vCrT6ET7SVrQX19xGvzicGJkA
 aFHQ==
X-Gm-Message-State: AOJu0YzmALNk9zK0NvwnPTnAXgPIN2Lhx3aNz82UWD4uBIyLVkyWRiLH
 GQJqTN5nUI4Q3fcJy71hYWYE+OoD3l1AvYcgWUQZdx80Piu08B5FAOrWajpGag==
X-Google-Smtp-Source: AGHT+IFbWNFYlMqMc3R+n0gCpcHOYtxNikqGOqeuD3hgYH40fY8Xzs7SDFPWH+N4evPaxjDKsrCeVA==
X-Received: by 2002:a62:6203:0:b0:6e5:e7f5:856 with SMTP id
 w3-20020a626203000000b006e5e7f50856mr9491049pfb.19.1709708532552; 
 Tue, 05 Mar 2024 23:02:12 -0800 (PST)
Received: from yuanhsinte1.c.googlers.com
 (36.157.124.34.bc.googleusercontent.com. [34.124.157.36])
 by smtp.gmail.com with ESMTPSA id
 ei24-20020a056a0080d800b006e57247f4e5sm10014654pfb.8.2024.03.05.23.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 23:02:12 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 06 Mar 2024 07:02:02 +0000
Subject: [PATCH v2] drm/bridge: anx7625: Update audio status while
 detecting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-anx7625-v2-1-7138e00b25bf@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOkU6GUC/2XMSw7CIBSF4a00dyyGR0vVkfswHRC4lDtoMaCkp
 mHvYqcO/5OTb4eMiTDDrdshYaFMcW0hTx3YYNYZGbnWILnsueIDM+s2ajkwj0I7Za5OjQ7a+5n
 Q03ZIj6l1oPyK6XPARfzWf6MIJthFoVPWeqN7e7chxYXeyzmmGaZa6xe+fCEGoQAAAA==
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


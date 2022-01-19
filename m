Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961F493CCF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F10710E2E0;
	Wed, 19 Jan 2022 15:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD7610E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:17:59 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so3610352pjj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3q9wkMinheXrqXy/yp63auEPN8EtJaQhX9gCBlzKxgs=;
 b=Zdrn3Q/sjcYybnCWRu+AhUNqW46Mcf7GN9hnGfFvlRO6R+4JRocOrAC65tdFdThPV0
 O5YFdHpPjjqW5B0DMrVfI8KJrd8wZUksbqeTBRBITITMUrlcV6FNjeZpvx8Ajf/akXLQ
 tYQ1J6gCzrjsaz9AGcQFzhK7LaabpIo+esYmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3q9wkMinheXrqXy/yp63auEPN8EtJaQhX9gCBlzKxgs=;
 b=NPZMefRi6/+wm7XvRekm/8dosVO4TJcdZ4njxtHYF5eY0ltO5E0pcQ5QwbT36wEXhs
 JAZEJ9vkRDt4fZOHvaYxz/sZgSfalBqbIPB6Xyu10fJ9fVr3CBMxS8y5KopX7XFLbO+t
 ZScw/u97I0rbwPBSG+iosOYL3tGRh7UUouR50m9YIG3Q1dr+DhTrRWuqYP3fN7Uq2KoE
 3NR42TL67YdIdQmFYMiKFHo7B7Y3Yv8L5f9gkKEXF2DPDLCLZZZeFrgk5msXKjHpsUHg
 WX2AfFwrznc0KiZDwrHPEfyOrEAfw/Haua7eqV6FJyB/dMejNDYGsIbx7ySJZg7Euy1r
 vBwg==
X-Gm-Message-State: AOAM530JpF9yN/F9AomRfU2YsBEKHTPyqQ6BRx8kZMAmUHWKswSYlbKQ
 B2/f2i/AwY7aebHcgZj9Q2Auag==
X-Google-Smtp-Source: ABdhPJzj6S8M29551fXljrtaSezPvrG8R5E7z1zyIjmFRDld04a3/q4jBB5qrR8JahUduArog2NHwg==
X-Received: by 2002:a17:902:e80b:b0:14a:67fc:a40 with SMTP id
 u11-20020a170902e80b00b0014a67fc0a40mr32624045plg.102.1642605479193; 
 Wed, 19 Jan 2022 07:17:59 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ab3b:7ccf:392:3f04])
 by smtp.gmail.com with ESMTPSA id ip14sm6731596pjb.11.2022.01.19.07.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:17:58 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v5 2/4] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Wed, 19 Jan 2022 23:17:49 +0800
Message-Id: <20220119151751.986185-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220119151751.986185-1-hsinyi@chromium.org>
References: <20220119151751.986185-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
handled by driver detach.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v2->v3: remove kfree() in anx7625_i2c_remove().
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 17b23940549a42..b7e3373994b480 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
 	if (!platform) {
 		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
 		return -ENOMEM;
@@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		goto free_platform;
+		return ret;
 	}
 
 	platform->client = client;
@@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (!platform->hdcp_workqueue) {
 		dev_err(dev, "fail to create work queue\n");
 		ret = -ENOMEM;
-		goto free_platform;
+		return ret;
 	}
 
 	platform->pdata.intp_irq = client->irq;
@@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->hdcp_workqueue)
 		destroy_workqueue(platform->hdcp_workqueue);
 
-free_platform:
-	kfree(platform);
-
 	return ret;
 }
 
@@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.audio_en)
 		anx7625_unregister_audio(platform);
 
-	kfree(platform);
 	return 0;
 }
 
-- 
2.34.1.703.g22d0c6ccf7-goog


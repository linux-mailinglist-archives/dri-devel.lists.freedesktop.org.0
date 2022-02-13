Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5A4B3ADC
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 11:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2761A10F558;
	Sun, 13 Feb 2022 10:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3710F558
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 10:34:45 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so16171911pjl.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 02:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XlBwl7o2DNhygikLmKSXtkQRcDcWt/TKcyEWF2to5rk=;
 b=VAAPmWcvaHNUdrS2u53/VaEJDPb9prLyiHuw80d7g6QMuXnIKY50lvgl2QrHuDGpx+
 XH7B5g/EPetbCInq7yCPXlCwSvmjuDrYU0SF6499sCxwSFHw0BsYSammHG+XCsC8uGDo
 LdGckrvNCOE16ID/se/afR6GDAqSd0Hv1ATyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlBwl7o2DNhygikLmKSXtkQRcDcWt/TKcyEWF2to5rk=;
 b=k5vGw/Xk2r8gxrvxDKZLHV6pSRX/U+oHITA/v63ULCF5nhyqOtY5+ScqBJuldjiJpi
 is77Okze/Hnj2nzyxlDf5ZXcb+ONACOAGZJNt9F0SqAJWO3Z7drNGbVugYuDYLIw/1Fk
 IaBhXwFKYBXROQMXykvdfizwXdY4jDySqLc4CFyD6LD7KUpK/4az/VEwQVoJJI+ywmip
 7e+GABfwZYovXDz856gfKs9m1fRaap2qRZtxTA/8IFZg1/Xh/COzy3AKuJZnOLesNzXb
 KnHB6On2yimgTGuZs1KgQRuD1mbDEShBDb93C8Sdj3pDICvXOTBjWm+cwWkjpxWax4Fh
 JUhA==
X-Gm-Message-State: AOAM533xcSwKFK/cRidlfs6ATayOkgaRt/1fYVa6frj2NTtSJuUptfrI
 UkD479pVeEOLOcXwQ/rU65Il/trwQTIwlg==
X-Google-Smtp-Source: ABdhPJx94pETzDPyGgDuZhPH83OhmsRPB3UaRsFJltfeL30LyGvKcouT89u1M5Mn4hHkMLPS7/2rwQ==
X-Received: by 2002:a17:902:7281:: with SMTP id
 d1mr9449746pll.26.1644748485459; 
 Sun, 13 Feb 2022 02:34:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3653:bf18:8571:5f26])
 by smtp.gmail.com with ESMTPSA id n85sm1589407pfd.142.2022.02.13.02.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 02:34:45 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v7 2/4] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Sun, 13 Feb 2022 18:34:35 +0800
Message-Id: <20220213103437.3363848-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220213103437.3363848-1-hsinyi@chromium.org>
References: <20220213103437.3363848-1-hsinyi@chromium.org>
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
 dri-devel@lists.freedesktop.org,
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
2.35.1.265.g69c8d7142f-goog


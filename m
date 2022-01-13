Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530948D392
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75C010E5CF;
	Thu, 13 Jan 2022 08:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BB510E5CF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:29:24 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id z3so8536557plg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 00:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4op/u68zI+4WVyhPoMH6yG4GghylPG80uqiNuH7iz0=;
 b=mw3VLB1Iuvvy9py7WeAUm99j4YmT3btnkjvUT+Td3XKqGtB0pNs1QCkudkqICjzhlU
 rxsfZ+4f+ig651o9W5weUKXy4BDknzJkTnx/M5D/0i/yA8ZrpA44W2ia1JHQB9MccERW
 ZG4pyh+yY3XyFtdAdFpeYYely6qDMzORKN6Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4op/u68zI+4WVyhPoMH6yG4GghylPG80uqiNuH7iz0=;
 b=XCMuYUf3L8xA/v/3a4VlqNyi+8I7vscsU7D6TTgDf1v36elfyXoks1NTzp/wEnOpWK
 O5H1B60cbQkKKM4YWx8uw0V5etuZReOLDEoe2Y7hPPScMxU0E5ahF4eOIa6Zz2RQJemn
 Icw7fiwsWGsiJxiReAcC2s+oXHqXleSt5rpbXuSTZJnc60Y1CyEVlmwXa3yCCVKBSEPH
 theeo0wTQ/XRPx4H7wli+FtgQFxeQS3uleXHEmKxpejboFcqQGCLcgn3k631fZhYSsEp
 w9GcsuUSlG5L/b191vqeYng5btPIvpND83QSjP/rtciwWzmveOXcozfPXQ9qi40kQEEH
 fEog==
X-Gm-Message-State: AOAM532F/qDNaRd42GNAtD5WMeO9taOw6d2Y0BUHSvx7uxXne1qZzSnv
 UiwvRRp74kOcwENBGDPJHKSVoA==
X-Google-Smtp-Source: ABdhPJz/RtyoDXSF8VlNzPzCVqMhK9QWK+OP7Ul83B39Sj4ZdhnXQwSmK4XsSL71wkAnaItnDK+RKw==
X-Received: by 2002:a17:903:2341:b0:14a:5184:3ea7 with SMTP id
 c1-20020a170903234100b0014a51843ea7mr3393290plh.107.1642062563642; 
 Thu, 13 Jan 2022 00:29:23 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3ced:e0da:4852:430c])
 by smtp.gmail.com with ESMTPSA id b12sm2109894pfv.148.2022.01.13.00.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 00:29:23 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v3 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Thu, 13 Jan 2022 16:29:16 +0800
Message-Id: <20220113082918.2279347-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
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
index 0b858c78abe8b6..d3661c78770a8f 100644
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
2.34.1.575.g55b058a8bb-goog


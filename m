Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEC56054E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1878910E3E8;
	Wed, 29 Jun 2022 16:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E516210E2FE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:06:02 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id x8so11135499pgj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=notPBC4MnqP3/2b0DoBP3luF+le6LrZ0so+pTM6prWs=;
 b=NlCjvaxetubf24Z+sQZfc332yDLW4QSIKdokM9O2OcMgf3swcWTSFE70+NvWJG6RH6
 5KUa8cDpnS2Hlxm/E0AcW2EQ44MaKor8CzE1Rr8OUrOHZuWX9ucpten1Ll5u54CY07Jf
 iP/Ts5khXRN5mvLnEikY481Wpob2eMYx85b90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=notPBC4MnqP3/2b0DoBP3luF+le6LrZ0so+pTM6prWs=;
 b=LMq5M8TMLR2RnWkvTCWZnPiMpJx9ibWF6VJj66fvvy1xxJIDAh9qOy4dWvJ64fx54t
 bD8itWCEGz3LYrMYSKHYEfbjUQo6CcfmFug4h8GxiQ9jZzvXq9gti0KraUZUrHC0old8
 qCIhch1ZB4U0HPtHphSKCAAFgWb3zyw/t/v9+vZSZBLvqLvnIYSd9yMrsMERZk51U4rn
 wi3oSugZGFLV7MP3ZqURw0vKHcAo/CxhTg7EGfUqRcfULjJY5DcAuBrK9w8piCoWfFHp
 UDEXT22RaBN3PDHMJnFo+P2moV0yM4UpnOW+K20g0NqwGmfCddERU3MDRKFnwaYmVmhS
 wHZw==
X-Gm-Message-State: AJIora+x116UelyJP++OPXQ5DMIHk3GPs+m2lMdLUcTBOhndFrtsc3Fp
 FIbmvVazssCmUE4uCIxwsbWBsA==
X-Google-Smtp-Source: AGRyM1vg6eF7pHecOpH49930sygS1lu8vE8q9/o+9+HVT9Nz4uVBZw2Pt0NdQ0HZB4n2QPKkcQX5Og==
X-Received: by 2002:a05:6a00:22cb:b0:525:ba83:559a with SMTP id
 f11-20020a056a0022cb00b00525ba83559amr10977364pfj.54.1656518762463; 
 Wed, 29 Jun 2022 09:06:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902e3d300b00163f8ddf160sm11495350ple.161.2022.06.29.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:06:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 1/4] drm/bridge: anx7625: Convert to
 devm_i2c_new_dummy_device()
Date: Thu, 30 Jun 2022 00:05:47 +0800
Message-Id: <20220629160550.433980-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629160550.433980-1-hsinyi@chromium.org>
References: <20220629160550.433980-1-hsinyi@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the resource management.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 96 +++++++----------------
 1 file changed, 27 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 3710fa9ee0acd..f89e8151475f7 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2436,82 +2436,44 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
 					      struct i2c_client *client)
 {
-	int err = 0;
+	struct device *dev = &ctx->client->dev;
 
-	ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
-						     TX_P0_ADDR >> 1);
+	ctx->i2c.tx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						TX_P0_ADDR >> 1);
 	if (IS_ERR(ctx->i2c.tx_p0_client))
 		return PTR_ERR(ctx->i2c.tx_p0_client);
 
-	ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
-						     TX_P1_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tx_p1_client)) {
-		err = PTR_ERR(ctx->i2c.tx_p1_client);
-		goto free_tx_p0;
-	}
+	ctx->i2c.tx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						TX_P1_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.tx_p1_client))
+		return PTR_ERR(ctx->i2c.tx_p1_client);
 
-	ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
-						     TX_P2_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tx_p2_client)) {
-		err = PTR_ERR(ctx->i2c.tx_p2_client);
-		goto free_tx_p1;
-	}
+	ctx->i2c.tx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						TX_P2_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.tx_p2_client))
+		return PTR_ERR(ctx->i2c.tx_p2_client);
 
-	ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
-						     RX_P0_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p0_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p0_client);
-		goto free_tx_p2;
-	}
+	ctx->i2c.rx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						RX_P0_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p0_client))
+		return PTR_ERR(ctx->i2c.rx_p0_client);
 
-	ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
-						     RX_P1_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p1_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p1_client);
-		goto free_rx_p0;
-	}
+	ctx->i2c.rx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						RX_P1_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p1_client))
+		return PTR_ERR(ctx->i2c.rx_p1_client);
 
-	ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
-						     RX_P2_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p2_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p2_client);
-		goto free_rx_p1;
-	}
+	ctx->i2c.rx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						RX_P2_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p2_client))
+		return PTR_ERR(ctx->i2c.rx_p2_client);
 
-	ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
-						    TCPC_INTERFACE_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tcpc_client)) {
-		err = PTR_ERR(ctx->i2c.tcpc_client);
-		goto free_rx_p2;
-	}
+	ctx->i2c.tcpc_client = devm_i2c_new_dummy_device(dev, client->adapter,
+						TCPC_INTERFACE_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.tcpc_client))
+		return PTR_ERR(ctx->i2c.tcpc_client);
 
 	return 0;
-
-free_rx_p2:
-	i2c_unregister_device(ctx->i2c.rx_p2_client);
-free_rx_p1:
-	i2c_unregister_device(ctx->i2c.rx_p1_client);
-free_rx_p0:
-	i2c_unregister_device(ctx->i2c.rx_p0_client);
-free_tx_p2:
-	i2c_unregister_device(ctx->i2c.tx_p2_client);
-free_tx_p1:
-	i2c_unregister_device(ctx->i2c.tx_p1_client);
-free_tx_p0:
-	i2c_unregister_device(ctx->i2c.tx_p0_client);
-
-	return err;
-}
-
-static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
-{
-	i2c_unregister_device(ctx->i2c.tx_p0_client);
-	i2c_unregister_device(ctx->i2c.tx_p1_client);
-	i2c_unregister_device(ctx->i2c.tx_p2_client);
-	i2c_unregister_device(ctx->i2c.rx_p0_client);
-	i2c_unregister_device(ctx->i2c.rx_p1_client);
-	i2c_unregister_device(ctx->i2c.rx_p2_client);
-	i2c_unregister_device(ctx->i2c.tcpc_client);
 }
 
 static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
@@ -2723,8 +2685,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (!platform->pdata.low_power_mode)
 		pm_runtime_put_sync_suspend(&client->dev);
 
-	anx7625_unregister_i2c_dummy_clients(platform);
-
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
@@ -2754,8 +2714,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (!platform->pdata.low_power_mode)
 		pm_runtime_put_sync_suspend(&client->dev);
 
-	anx7625_unregister_i2c_dummy_clients(platform);
-
 	if (platform->pdata.audio_en)
 		anx7625_unregister_audio(platform);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog


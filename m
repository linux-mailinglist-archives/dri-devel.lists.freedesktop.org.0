Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDF5688B9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1BA11AEE5;
	Wed,  6 Jul 2022 12:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9E311AEF3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:53:04 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c13so9825375pla.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwMB+k9IGlD1nBJyNrEkLFj2csDbu5Qc4SyaeENoXs4=;
 b=VLocBcR67BH55CFePg7A7u3NRm1n4ardKuomKvCqMEuZ1qS29FEGTPbwhupBegRGGV
 pEFJtFTMkb/b2XpBQPLTY7Oe7jtGOopiYkTJgulNCbmKKEnHW5FeZDiPqZmAKO0i8WqZ
 Lm9yqq7WX9rKKbs4KFq6mTwidKV/MGZxvUBHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwMB+k9IGlD1nBJyNrEkLFj2csDbu5Qc4SyaeENoXs4=;
 b=Nv1LidiELaKNgzGBUIGexqgJbWLIlK2NwOR7JoENG1rM/hNE5uW+3Xg4R0SqXB3Jmp
 VzGoeWqg2s5j1WAtAwOWzt6MbwOumWadQUUsBTmt4aH9+BgmYV/kxqSIvpQfXKddUV8R
 +SJcM1e2xbKUWLO4VnT+dNQZIMbxvjPTFRw2Ngy0P8xE5X+1Gr5FoycMMgCfb4h+jq20
 JBINaxn2QT0DboEbrk2kr34+ZyrIsnaYvOcI18zhlpmbikK8jL8P0F13roXk2B6pZ2Dl
 /pC78RYp95+7OHUO+pkfpm8J9DfwFyMqDb9rD3i3e1f2tuz+1C+UdJZc8s4tCeIf/2V0
 ktnA==
X-Gm-Message-State: AJIora9ZswiyHQhgcCIC41hsRW57NGCRyKPW7XJfGlYavviDMy62cKQd
 Pa8NmZQ8itHmJvHxMqsG69rwlQ==
X-Google-Smtp-Source: AGRyM1vRXlvrOK3qxEFCRY5ntUjBQ+I/TKLHMNestZ/71lmAhunY5e/klvvWxIOHDet94pd164yMmQ==
X-Received: by 2002:a17:90a:178b:b0:1ef:7c85:8070 with SMTP id
 q11-20020a17090a178b00b001ef7c858070mr25348020pja.233.1657111984407; 
 Wed, 06 Jul 2022 05:53:04 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5300:b974:1680:1bd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0016a6cd546d6sm25640127ple.251.2022.07.06.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:53:04 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 1/4] drm/bridge: anx7625: Convert to
 devm_i2c_new_dummy_device()
Date: Wed,  6 Jul 2022 20:52:51 +0800
Message-Id: <20220706125254.2474095-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706125254.2474095-1-hsinyi@chromium.org>
References: <20220706125254.2474095-1-hsinyi@chromium.org>
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
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v1->v2:
Fix indent.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 96 +++++++----------------
 1 file changed, 27 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 3710fa9ee0acd..ab346d32d8735 100644
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
+							  TX_P0_ADDR >> 1);
 	if (IS_ERR(ctx->i2c.tx_p0_client))
 		return PTR_ERR(ctx->i2c.tx_p0_client);
 
-	ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
-						     TX_P1_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tx_p1_client)) {
-		err = PTR_ERR(ctx->i2c.tx_p1_client);
-		goto free_tx_p0;
-	}
+	ctx->i2c.tx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							  TX_P1_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.tx_p1_client))
+		return PTR_ERR(ctx->i2c.tx_p1_client);
 
-	ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
-						     TX_P2_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tx_p2_client)) {
-		err = PTR_ERR(ctx->i2c.tx_p2_client);
-		goto free_tx_p1;
-	}
+	ctx->i2c.tx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							  TX_P2_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.tx_p2_client))
+		return PTR_ERR(ctx->i2c.tx_p2_client);
 
-	ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
-						     RX_P0_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p0_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p0_client);
-		goto free_tx_p2;
-	}
+	ctx->i2c.rx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							  RX_P0_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p0_client))
+		return PTR_ERR(ctx->i2c.rx_p0_client);
 
-	ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
-						     RX_P1_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p1_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p1_client);
-		goto free_rx_p0;
-	}
+	ctx->i2c.rx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							  RX_P1_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p1_client))
+		return PTR_ERR(ctx->i2c.rx_p1_client);
 
-	ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
-						     RX_P2_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.rx_p2_client)) {
-		err = PTR_ERR(ctx->i2c.rx_p2_client);
-		goto free_rx_p1;
-	}
+	ctx->i2c.rx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							  RX_P2_ADDR >> 1);
+	if (IS_ERR(ctx->i2c.rx_p2_client))
+		return PTR_ERR(ctx->i2c.rx_p2_client);
 
-	ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
-						    TCPC_INTERFACE_ADDR >> 1);
-	if (IS_ERR(ctx->i2c.tcpc_client)) {
-		err = PTR_ERR(ctx->i2c.tcpc_client);
-		goto free_rx_p2;
-	}
+	ctx->i2c.tcpc_client = devm_i2c_new_dummy_device(dev, client->adapter,
+							 TCPC_INTERFACE_ADDR >> 1);
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


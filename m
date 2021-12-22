Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B291647CE59
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B531125BC;
	Wed, 22 Dec 2021 08:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92D11125BC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:33:58 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id iy13so1643821pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=uFcfCCmLqz8Ms/S5ZFwbRJf6FXCon9mx/P6+leniJPQ=;
 b=B/nkD+RxzYrTMpj8qHYjiPlo4H+XGTRQ2FJOCbXw5tBLjZf3eIPKBeZUbEp3wqrXTf
 qA4O6ILyyipfaMzln1Ql1RyjNzMnDY0Q9NZMWjl2zBYK/gc4Uw7oTYZ9f50LTZcyJZbx
 fKL6LsmOTpsuuB4P83hgzOyupp8G6k83XMs2XGQ2eQXO+DfKs8rL4UcchCoFIhy/uWx0
 ltKMut+O+kStkILq+1dQtYVGrfHKqXANNoXaQt0meh9cbw1UxtnrxY3fpNULqIjbRF0H
 TZbU4IgdlykCUCqXNPIDUIw7LCk/4mzZAemU6RxsDRd3f4JlWVecsVRn7agQZOtO21ZL
 MGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uFcfCCmLqz8Ms/S5ZFwbRJf6FXCon9mx/P6+leniJPQ=;
 b=HZ9l3AiEis7cKKkWHSsePQhac82MoeCeuETnKvQ4dNwCtz8z4dfdWVfAjaCROhuCdE
 xRuJCq0fMObj1doeDy+HNZPyJpFsqMHJgLb6na7zZRfvf85IvL8OYg6pHnCOdziRl8jm
 meppQU978qHwUxqscwk8gGLYfoy/nHjkm/G8GmFAQNeNRyyFymIDkV0ax1hA8preW4s0
 WSkGz1WCwPO/7yg9eL8HX3asFLk0aHhbCuKcH4KCpscipETef/hZ0yJytsp3BqvN2XVD
 Pog0FObxCQxeVsfZ49yFvRtaGM7LZhqBwnw0/29wCnFamZ4RH+jEbqozNeSub5Wo8ewB
 RGzA==
X-Gm-Message-State: AOAM532Z01vJVEBZzQtKBIDv8JSP37zAgga7Irz8DFuAHDEtIKKW9RIw
 SX2/CmB0rO6NnsckLwfeVug=
X-Google-Smtp-Source: ABdhPJz4Gg5MNWXZ2x4Pdz7qJw2MGvY6mrzL2Qo8Pu1nl2B4Y+FUIpjLupqql4K7XOj4av6NIV3TLg==
X-Received: by 2002:a17:90a:f405:: with SMTP id
 ch5mr189965pjb.32.1640162038482; 
 Wed, 22 Dec 2021 00:33:58 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id w76sm1518693pff.21.2021.12.22.00.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:33:58 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/bridge: anx7625: Fix null vs IS_ERR() checking in
 anx7625_register_i2c_dummy_clients
Date: Wed, 22 Dec 2021 08:33:48 +0000
Message-Id: <20211222083350.18514-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since i2c_new_client_device() function return error pointers.
The i2c_new_dummy_device() function does not return NULL, It returns error
pointers too. Using IS_ERR() to check the return value to fix this.

Fixes: 8bdfc5dae4e3("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 32 ++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822..eb72aa6aedd6 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1637,40 +1637,54 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
 					      struct i2c_client *client)
 {
+	int err = 0;
+
 	ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
 						     TX_P0_ADDR >> 1);
-	if (!ctx->i2c.tx_p0_client)
-		return -ENOMEM;
+	if (IS_ERR(ctx->i2c.tx_p0_client))
+		return PTR_ERR(ctx->i2c.tx_p0_client);
 
 	ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
 						     TX_P1_ADDR >> 1);
-	if (!ctx->i2c.tx_p1_client)
+	if (IS_ERR(ctx->i2c.tx_p1_client)) {
+		err = PTR_ERR(ctx->i2c.tx_p1_client);
 		goto free_tx_p0;
+	}
 
 	ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
 						     TX_P2_ADDR >> 1);
-	if (!ctx->i2c.tx_p2_client)
+	if (IS_ERR(ctx->i2c.tx_p2_client)) {
+		err = PTR_ERR(ctx->i2c.tx_p2_client);
 		goto free_tx_p1;
+	}
 
 	ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
 						     RX_P0_ADDR >> 1);
-	if (!ctx->i2c.rx_p0_client)
+	if (IS_ERR(ctx->i2c.rx_p0_client)) {
+		err = PTR_ERR(ctx->i2c.rx_p0_client);
 		goto free_tx_p2;
+	}
 
 	ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
 						     RX_P1_ADDR >> 1);
-	if (!ctx->i2c.rx_p1_client)
+	if (IS_ERR(ctx->i2c.rx_p1_client)) {
+		err = PTR_ERR(ctx->i2c.rx_p1_client);
 		goto free_rx_p0;
+	}
 
 	ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
 						     RX_P2_ADDR >> 1);
-	if (!ctx->i2c.rx_p2_client)
+	if (IS_ERR(ctx->i2c.rx_p2_client)) {
+		err = PTR_ERR(ctx->i2c.rx_p2_client);
 		goto free_rx_p1;
+	}
 
 	ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
 						    TCPC_INTERFACE_ADDR >> 1);
-	if (!ctx->i2c.tcpc_client)
+	if (IS_ERR(ctx->i2c.tcpc_client)) {
+		err = PTR_ERR(ctx->i2c.tcpc_client);
 		goto free_rx_p2;
+	}
 
 	return 0;
 
@@ -1687,7 +1701,7 @@ static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
 free_tx_p0:
 	i2c_unregister_device(ctx->i2c.tx_p0_client);
 
-	return -ENOMEM;
+	return err;
 }
 
 static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
-- 
2.17.1


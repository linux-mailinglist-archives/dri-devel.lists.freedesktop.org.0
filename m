Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659FC45E3AF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 01:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13E6E19A;
	Fri, 26 Nov 2021 00:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DD6E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 00:32:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bi37so19982728lfb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1wJ1nsI24XrxYxVwGXZg9+kPz7FeJME7p8v2K+2gfg=;
 b=XHc0x7ceky8JSlNWRv1dZqZ6c9SrjN3nFtQpgzZ6dXVUppQnrYuOHe3XKSvKdaC1wO
 mijzH3DZgFKwgtsEO4k7thYMpDoV357vO9NarJ/+cq3euJeixv2A7WEispaY2ThzEH1R
 HF99H03cci+3ZGfAIvMKtBlYj7axRpJXl9kn3qk+xys8HCVYVRQW43aPOJ+YjZ4viO1R
 DGIhT/o/AnLtJa2a2a88clApEi+ioL3m8Iwg7gNvyqIFpYnhECPe7Z7NHH1iGNtSC7SA
 THMK8enfz510+zOMjkB5o7wPfJe8lUIgROP+DqOi545cQJh1nh6VTwoxaWcXKVsgmBcq
 rrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1wJ1nsI24XrxYxVwGXZg9+kPz7FeJME7p8v2K+2gfg=;
 b=2ILHpPAE/TD/dSnHhdVOPtSJe7Fbao0hciVfOlqpsKs+lEcWee5lYfvUA3xLHCNKox
 F0PaEzUwNdwSsNp7+clXhNkyvRCaIjVqZzZaAgOfHTFPNzk6KX8YWzVOSJoJswx7wYIy
 yHdyUKrqdkcT+2YjaU/i+0sNnLVB9CIcXfbsjNZn8xvrsZ4Uhc7g54Ez5zz2VaxHGPN3
 HLyQTdx1E4OR5Tvl2Bbjt6n/31fwZvBSAVGT1Nrc788KgEdBn+M3qfmWThOoRuod3/JL
 YsvEB8Mh4Uv32TqoYPFIVcUy4aGteKDTDA/dZWXUX9nL/O5hWXZWH4r6VQi7mCi6Gk1I
 XAyA==
X-Gm-Message-State: AOAM530eBO3jkBTEA9K448cmNS1YUhmvkl8XqWj65SmfPrnx5prz/Z38
 c8bRDXHzpkKAMcvQkYKmkWtotA==
X-Google-Smtp-Source: ABdhPJxnlcaYicViBXqJw38eU6xWtyDY8aqOeYF1orqAXtH4ov62ce9adXEOKCPCrOGXa3Z59+R0LQ==
X-Received: by 2002:a19:3844:: with SMTP id d4mr25546116lfj.64.1637886748118; 
 Thu, 25 Nov 2021 16:32:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k13sm417812lfo.300.2021.11.25.16.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 16:32:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 1/2] drm/ bridge: tc358762: move bridge init to enable callback
Date: Fri, 26 Nov 2021 03:32:26 +0300
Message-Id: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the pre_enable time the previous bridge (e.g. DSI host) might be
not initialized yet. Move the regulator enablement and bridge init to
te enable callback (and consequently regulator disblement to disable).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7104828024fd..ebdf771a1e49 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -64,7 +64,7 @@ struct tc358762 {
 	struct drm_connector connector;
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
-	bool pre_enabled;
+	bool enabled;
 	int error;
 };
 
@@ -125,26 +125,26 @@ static int tc358762_init(struct tc358762 *ctx)
 	return tc358762_clear_error(ctx);
 }
 
-static void tc358762_post_disable(struct drm_bridge *bridge)
+static void tc358762_disable(struct drm_bridge *bridge)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
 
 	/*
-	 * The post_disable hook might be called multiple times.
+	 * The disable hook might be called multiple times.
 	 * We want to avoid regulator imbalance below.
 	 */
-	if (!ctx->pre_enabled)
+	if (!ctx->enabled)
 		return;
 
-	ctx->pre_enabled = false;
+	ctx->enabled = false;
 
 	ret = regulator_disable(ctx->regulator);
 	if (ret < 0)
 		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
 }
 
-static void tc358762_pre_enable(struct drm_bridge *bridge)
+static void tc358762_enable(struct drm_bridge *bridge)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
@@ -157,7 +157,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
 
-	ctx->pre_enabled = true;
+	ctx->enabled = true;
 }
 
 static int tc358762_attach(struct drm_bridge *bridge,
@@ -170,8 +170,8 @@ static int tc358762_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
-	.post_disable = tc358762_post_disable,
-	.pre_enable = tc358762_pre_enable,
+	.disable = tc358762_disable,
+	.enable = tc358762_enable,
 	.attach = tc358762_attach,
 };
 
@@ -218,7 +218,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-	ctx->pre_enabled = false;
+	ctx->enabled = false;
 
 	/* TODO: Find out how to get dual-lane mode working */
 	dsi->lanes = 1;
-- 
2.33.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2F54ADD6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 11:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72C610E703;
	Tue, 14 Jun 2022 09:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1DA10E703
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655200724; x=1686736724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m3U9khN9VwnX3aHSm6IRqW4Y59RhhXnaHJJdJ7gX1FA=;
 b=lE4PFaJT6UYp1Ia4poXy57Rr7Mk71anqK9dXOvOuBRTjS67xH9r6T66b
 OgrLyp87iaKIwVWzYImvUqoBz4X17JtyqlwoJiZFooxAiYAfTWShCAyTh
 ldgK3z380gx7+5p2ygTJ7CeZ1kusID0v/Wr3fPpjC/49nRIj5IsQ3kg6L
 NZyK+MOqsZb+mFB1oFV8ggsUjtjTvdK//qgxwvlWr2Gxb5V8ES/qMcGv7
 pXixHFFXkTAy6DwTmFC1TrBaHTpelWZSuOYH7PyOXqAm1lK4efnv6FkWd
 j9Py8K4gMeXTMMXvaopxXwIcfF9GKOMPdvsHpaprYW1EOyC7QSsUbpJD2 g==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647298800"; d="scan'208";a="24444863"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 14 Jun 2022 11:58:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 14 Jun 2022 11:58:42 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 14 Jun 2022 11:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655200722; x=1686736722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m3U9khN9VwnX3aHSm6IRqW4Y59RhhXnaHJJdJ7gX1FA=;
 b=pngEWlnvrxFmUv1yxxUCjjcdiqFTmgUVqtptX8n2zHdXWYuLwXl76lxm
 f75A46NGno/HXXqlC1+LvuJpj1Qb+cLsibq6uCwOKiDENjNa4GYq7PLvV
 MM6kxPoRnEq+n5l2eUrtbDoHrkmS2i819psVV7Q4/HgBFlyze8P3Q22fd
 GpCVDIT4OocIAJSTHQiM52Kf0Hfcw4wzLpq5C8u3AbxDI6aw/dyVe+//E
 xr1yR2Fs+dTb4NdE7DtF3ETRRbWYPlnJKVcY3VaF9Gj6TwdIWVh7/Tvim
 +3GtssdNo1N1+loteOGMrldrtVdJqJuRrmagqd4QXvZucqtVYH6FnTm02 A==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647298800"; d="scan'208";a="24444862"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 14 Jun 2022 11:58:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D0788280056;
 Tue, 14 Jun 2022 11:58:41 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/bridge: ti-sn65dsi83: add more dev_err_probe
Date: Tue, 14 Jun 2022 11:58:34 +0200
Message-Id: <20220614095835.1398708-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add more warning/debug messages during probe. E.g. a single -EPROBE_DEFER
might have several causes, these messages help finding the origin.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
* New in v2

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index b27c0d7c451a..a306150a8027 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -677,7 +677,7 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
 						   GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->enable_gpio))
-		return PTR_ERR(ctx->enable_gpio);
+		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio), "failed to get enable GPIO\n");
 
 	usleep_range(10000, 11000);
 
@@ -687,7 +687,7 @@ static int sn65dsi83_probe(struct i2c_client *client,
 
 	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
 	if (IS_ERR(ctx->regmap))
-		return PTR_ERR(ctx->regmap);
+		return dev_err_probe(dev, PTR_ERR(ctx->regmap), "failed to get regmap\n");
 
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
-- 
2.25.1


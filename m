Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DD5688BD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B7611AF06;
	Wed,  6 Jul 2022 12:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8311AEFF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:53:12 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id r1so13554176plo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpU/47CIGfcMKZ4E2aqoCQ1BOqNCcamkTX7gRfUbreo=;
 b=N4/8r99A/+2PtNfA6zKC7zYa6daai8aymv0oo3OLKvNL1LFMgLq9MqhuNCRPZ3Orxk
 9zvYKc6A5GGxS5wljKrCbsmwjwHl6kAnoYdQMXqFdMF7SXJW4lvoOmGOpHB6cWTmBgbP
 vttKZCao/XCM9jfG6jGi8vO8rWAAtlO5bajew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpU/47CIGfcMKZ4E2aqoCQ1BOqNCcamkTX7gRfUbreo=;
 b=0Ek8HI6ChJf9MVNrRP4z1EeO60Gikqdq1L55we0USPqhUE0stzRPR8cdKvz5/3HVZd
 TMOMCZZEbT8+UF5d8Rq3eYI3TBUdfLd4LaLm5oBGr43wmgM9Y+bHyrK375CjLAJYqK4F
 1KgzcFnwN7jrkFiVy6Wptr5VsTwCvaEb0oGVQKfna3lT4TtJfBdtkgJK/End3fSfm3lO
 A1EcG7e4JKDYvepDa/cMJtA1rq52Puu47P/M1BKcWo0a5CBhzuPHiJrtWB2GZj6DvpoX
 vERbWstGsbGIIlbkreecbH1bUXnmcATLgEwZuLPFYQ2Cqzm9n4XE2s6cyWeQKXl7q/8P
 6Jiw==
X-Gm-Message-State: AJIora/TwQVvL7Cz0K/5LkWQLHyNRDVkAbfsxoORwk7hK8dXhq4L44OM
 y18IKIH1r0+cC9yLM4MRUP0zGQ==
X-Google-Smtp-Source: AGRyM1vPZy1bE7pCVFrwvF6JhtLpJ3e5q30yrQdoFZdI6S+SjkzAjaWd6jRhqaEDx5rYAAusjkJdSg==
X-Received: by 2002:a17:902:d50d:b0:16b:ff69:35 with SMTP id
 b13-20020a170902d50d00b0016bff690035mr4257876plg.160.1657111992179; 
 Wed, 06 Jul 2022 05:53:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5300:b974:1680:1bd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0016a6cd546d6sm25640127ple.251.2022.07.06.05.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:53:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 4/4] drm/bridge: anx7625: Add wait_hpd_asserted() callback
Date: Wed,  6 Jul 2022 20:52:54 +0800
Message-Id: <20220706125254.2474095-5-hsinyi@chromium.org>
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

Move hpd polling check into wait_hpd_asserted() callback. For the cases
that aux transfer function wasn't used, do hpd polling check after pm
runtime resume, which will power on the bridge.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v1->v2: fix indent.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index aded20b9e25b1..d1f1d525aeb6d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1443,23 +1443,24 @@ static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
 }
 
-static void anx7625_hpd_polling(struct anx7625_data *ctx)
+static int _anx7625_hpd_polling(struct anx7625_data *ctx,
+				unsigned long wait_us)
 {
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
 	/* Interrupt mode, no need poll HPD status, just return */
 	if (ctx->pdata.intp_irq)
-		return;
+		return 0;
 
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
-				 5000,
-				 5000 * 100);
+				 wait_us / 100,
+				 wait_us);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "no hpd.\n");
-		return;
+		return ret;
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "system status: 0x%x. HPD raise up.\n", val);
@@ -1472,6 +1473,23 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 
 	if (!ctx->pdata.panel_bridge && ctx->bridge_attached)
 		drm_helper_hpd_irq_event(ctx->bridge.dev);
+
+	return 0;
+}
+
+static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
+				     unsigned long wait_us)
+{
+	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
+	struct device *dev = &ctx->client->dev;
+	int ret;
+
+	pm_runtime_get_sync(dev);
+	ret = _anx7625_hpd_polling(ctx, wait_us);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
 }
 
 static void anx7625_remove_edid(struct anx7625_data *ctx)
@@ -1741,6 +1759,7 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 	}
 
 	pm_runtime_get_sync(dev);
+	_anx7625_hpd_polling(ctx, 5000 * 100);
 	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
 	pm_runtime_put_sync(dev);
 
@@ -2378,6 +2397,7 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	ctx->connector = connector;
 
 	pm_runtime_get_sync(dev);
+	_anx7625_hpd_polling(ctx, 5000 * 100);
 
 	anx7625_dp_start(ctx);
 }
@@ -2497,7 +2517,6 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	mutex_lock(&ctx->lock);
 
 	anx7625_power_on_init(ctx);
-	anx7625_hpd_polling(ctx);
 
 	mutex_unlock(&ctx->lock);
 
@@ -2589,6 +2608,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->aux.name = "anx7625-aux";
 	platform->aux.dev = dev;
 	platform->aux.transfer = anx7625_aux_transfer;
+	platform->aux.wait_hpd_asserted = anx7625_wait_hpd_asserted;
 	drm_dp_aux_init(&platform->aux);
 
 	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
@@ -2617,6 +2637,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (!platform->pdata.low_power_mode) {
 		anx7625_disable_pd_protocol(platform);
 		pm_runtime_get_sync(dev);
+		_anx7625_hpd_polling(platform, 5000 * 100);
 	}
 
 	/* Add work function */
-- 
2.37.0.rc0.161.g10f37bed90-goog


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E45D560552
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8F610E2FE;
	Wed, 29 Jun 2022 16:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5FE10E52A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:06:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so19898365pjl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjoZa4oRghyRXFlLw4DClOAhKTZMl2uJvOPWFlMMk24=;
 b=ci6b5plqfpyMOn/13KVzANy4B4Rw1UFEP8CVEpPlw6wBopmzuXQme/cGfxNlpgxG1f
 mmTB4kdLCSpAEwAyqVvM0ReKyOuCbetN6Vtc9KdptUPJJU3JAorOKZ1fODsDgpTR3Hsh
 jFFDXR3iw4NZEsFlRNgMcRZUd3+U9jjmD8dz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjoZa4oRghyRXFlLw4DClOAhKTZMl2uJvOPWFlMMk24=;
 b=pBLrXfCvI/doqgOAZAhVUAu+jiwM/1b8rZwKQT91+4uXLZkcKcrsoT6j62dS+kcQyf
 ho1k/sQzgbV0o1Qw4i9C2sQwwO1VPXjfcOMzdJUNKUenjc8Ws7t5FQXCW4B6CK6GqwCR
 WKcEjQdu3tEv8s5ixX8IT+suWoWRCKOPmfBatrSbJbKmGBApTATl2o1EXxUgdZQHiLvv
 QoUy31/u3X6mOiFKn+d6Em+qccUnG1yVgg0WdOlz6ILJ2JC0eU8G79jXLRYOzMjrokX1
 h+0EZuI13yiA4/Apn6xnmBiRyWIycyXYryo4hikdXU0/Ug313igWj8r7setuoEcZin3X
 AI8g==
X-Gm-Message-State: AJIora+8FhdBYH7wYCfjDvEdXuiYhF8RWK2xjcz25Din2nBL0KTTHvr6
 QyDSjQUXPIwecI8rOZQScf8Ymf/uJ+6o4g==
X-Google-Smtp-Source: AGRyM1u+U191CnPQy0WhIfImTsCFkxYOpxdbN26rcYsm/FPVqX/YPldsedf3YCIavcqiQsWlmZY2xg==
X-Received: by 2002:a17:902:ef46:b0:168:bac3:2fd4 with SMTP id
 e6-20020a170902ef4600b00168bac32fd4mr11007834plx.132.1656518771029; 
 Wed, 29 Jun 2022 09:06:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902e3d300b00163f8ddf160sm11495350ple.161.2022.06.29.09.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:06:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 4/4] drm/bridge: anx7625: Add wait_hpd_asserted() callback
Date: Thu, 30 Jun 2022 00:05:50 +0800
Message-Id: <20220629160550.433980-5-hsinyi@chromium.org>
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

Move hpd polling check into wait_hpd_asserted() callback. For the cases
that aux transfer function wasn't used, do hpd polling check after pm
runtime resume, which will power on the bridge.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 59ddeba33652b..ea5a0b86fe52a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1443,23 +1443,24 @@ static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
 }
 
-static void anx7625_hpd_polling(struct anx7625_data *ctx)
+static int _anx7625_hpd_polling(struct anx7625_data *ctx,
+				 unsigned long wait_us)
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


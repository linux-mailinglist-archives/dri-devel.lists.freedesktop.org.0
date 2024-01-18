Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B94831130
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 03:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED8010E0DE;
	Thu, 18 Jan 2024 02:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD1610E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 02:00:23 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5961a2726aaso6205634eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705543161; x=1706147961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0aZ0gh2nMEIgtdl3btOXR1faHkRWy2p55YtG63QiVs=;
 b=jrH7rNyF6y3XYV0lQqcbyeMsVWZNZpH3MA7zsGHUNGeSHWImMR/jD0oMwM6VRETAQu
 nB002fW7iphmbmpwjcBV4eDeVj/6y6TQf4FtwVuEECd2gTyWKKux7698tBSavGI+xpNO
 SFVPqaYU/hNx+x1X6R0/3mU4fgUbjGYIo1QJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705543161; x=1706147961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0aZ0gh2nMEIgtdl3btOXR1faHkRWy2p55YtG63QiVs=;
 b=jBn9BHZDegcocsnrt0HkEp+T6IHnPoZXuOLr0lj3AvkSR7ywNXwLUsq+eiF50ecmJv
 2FWig9KN0B0J8emc9PxlcqaMybMyDQVVpZ6Cl+74bldkIbA8XnofFhWt9TsFm2WtMuF/
 /1o1jqCYpNa0/1A1VwkB3PxzecAnSbrIeUxgXx2bNnCNP3oqkvPnH64MOIGsCim4C81N
 H2KSVcWAZiivykr4/JTuoBCAexxDEZY5ojTetnhVY1VZbiUoclMqwzQ7g8RfOZXEC8Ou
 pH9kSWm+Lb/pGhD7SXm+Vs1iRD3UoYRzvfRGYBIWI/jhoBULQtzbc7kafRhZQ4pdzvvT
 Vejw==
X-Gm-Message-State: AOJu0Ywh08IsYFerDaPJL+6wSwsKXqtMLiX6G2mjtzrpuSkz39IpZZzE
 OsQlcKpAvLFMi23cvcax6bXUE61noQSLXl8Vd0RzhSa/W1d2IQbODTytYkxhUw==
X-Google-Smtp-Source: AGHT+IHCITwuSs+RUYFe/ZYh2Aaq7Mwt3FYk63+r+HrTRQNnTtj99c4qfSNv1QoNApfW32peMOyUlQ==
X-Received: by 2002:a4a:d490:0:b0:598:8de8:be69 with SMTP id
 o16-20020a4ad490000000b005988de8be69mr175483oos.10.1705543161418; 
 Wed, 17 Jan 2024 17:59:21 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:2557:c164:9ba8:60b])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a65638a000000b005c2420fb198sm270879pgv.37.2024.01.17.17.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 17:59:21 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: anx7625: Ensure bridge is suspended in disable()
Date: Wed, 17 Jan 2024 17:58:14 -0800
Message-ID: <20240118015916.2296741-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
is suspended in .post_disable()"). Add a mutex to ensure that aux transfer
won't race with atomic_disable by holding the PM reference and prevent
the bridge from suspend.

Also we need to use pm_runtime_put_sync_suspend() to suspend the bridge
instead of idle with pm_runtime_put_sync().

Fixes: 3203e497eb76 ("drm/bridge: anx7625: Synchronously run runtime suspend.")
Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 7 ++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index ef31033439bc..29d91493b101 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1762,6 +1762,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 	u8 request = msg->request & ~DP_AUX_I2C_MOT;
 	int ret = 0;
 
+	mutex_lock(&ctx->aux_lock);
 	pm_runtime_get_sync(dev);
 	msg->reply = 0;
 	switch (request) {
@@ -1778,6 +1779,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 					msg->size, msg->buffer);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
+	mutex_unlock(&ctx->aux_lock);
 
 	return ret;
 }
@@ -2474,7 +2476,9 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
-	pm_runtime_put_sync(dev);
+	mutex_lock(&ctx->aux_lock);
+	pm_runtime_put_sync_suspend(dev);
+	mutex_unlock(&ctx->aux_lock);
 }
 
 static enum drm_connector_status
@@ -2668,6 +2672,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&platform->lock);
 	mutex_init(&platform->hdcp_wq_lock);
+	mutex_init(&platform->aux_lock);
 
 	INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
 	platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 66ebee7f3d83..39ed35d33836 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -475,6 +475,8 @@ struct anx7625_data {
 	struct workqueue_struct *hdcp_workqueue;
 	/* Lock for hdcp work queue */
 	struct mutex hdcp_wq_lock;
+	/* Lock for aux transfer and disable */
+	struct mutex aux_lock;
 	char edid_block;
 	struct display_timing dt;
 	u8 display_timing_valid;
-- 
2.43.0.381.gb435a96ce8-goog


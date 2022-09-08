Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0181B5B1696
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE3310E999;
	Thu,  8 Sep 2022 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682C10E999
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:13:11 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1627599pjl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=O1vPzp++Y+rg877+GNK8AXhim+X8pwwIT0iX2ZyyZGc=;
 b=aU+cB1J4gIcX9czY5UabCbYzMhsgnCE6P3ZxLkl4oSTxzOqBFcrV2pRr1ffiSzzg3l
 IHX9G44qeKLQ/5IltNvL0aay91DB+3ApLtFPI4BmiGuGODuMQEXCZ3lZsS9p3yf9WnRz
 f+81tttNHHZ+kIoOjkUd0vEXPpMkSPGalXvbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O1vPzp++Y+rg877+GNK8AXhim+X8pwwIT0iX2ZyyZGc=;
 b=XojbTd7xeJV8bcbTOIPa/eTnO9x2g0rtELIfpZA/dZD6OsxcILu4J7qt/uYIdOqGiU
 rzQZosBrAowIE1LDYN2/qbq+QUX8gFWFRjmJNFuGO/0rMd/cqqtPRMvc6AA5mZ5IoPle
 QtdBzZ7Y7dvcWWx6ZQsuT6G5nsfkAKC2Fm2+xed+SpCvOe532/KFGa7WFl/9PtsHoSyF
 20JLdKs5tV3lDiMfxl5RSCzgJiaS484S/dWZa+ZvCUMuD9+cddX7no0o/7n/3DAOAJ7L
 0Ka6YMl5ASf5kSJNa2Aloc4Y3ZlyRJ1AIIvkLJ0K1fnBASx6KUd9GIqPgfuVBYqxWeqa
 VjIw==
X-Gm-Message-State: ACgBeo3sVmmC6IpxCxm4Y5EoLLFHW3RAdfh2G0Qo17omQZ1Mky++lD80
 8aAPk1Aecy1R/AtJKHkldRI/tw==
X-Google-Smtp-Source: AA6agR7NC8MzGBXfOam39plBc4fj/sNv5PauFaLxGrH8rC2K1EiGjJ6oljoacaKFQeeyTHBzyd58Jw==
X-Received: by 2002:a17:902:ec88:b0:175:d8f:44b with SMTP id
 x8-20020a170902ec8800b001750d8f044bmr7849588plg.84.1662624791085; 
 Thu, 08 Sep 2022 01:13:11 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5237:c185:9b01:8955])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa79496000000b0052d4cb47339sm14159702pfk.151.2022.09.08.01.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:13:10 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/bridge: it6505: Adapt runtime power management
 framework
Date: Thu,  8 Sep 2022 16:12:57 +0800
Message-Id: <20220908081259.503236-2-treapking@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220908081259.503236-1-treapking@chromium.org>
References: <20220908081259.503236-1-treapking@chromium.org>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_(get|put)_sync to control the bridge power, and add
SET_SYSTEM_SLEEP_PM_OPS with pm_runtime_force_(suspend|resume) to it6505
driver. Without SET_SYSTEM_SLEEP_PM_OPS, the bridge will be powered on
unnecessarily when no external display is connected.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2bb957cffd94..9d37660545fb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -421,6 +421,7 @@ struct it6505 {
 	struct notifier_block event_nb;
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
+	int extcon_state;
 	enum drm_connector_status connector_status;
 	enum link_train_status link_state;
 	struct work_struct link_works;
@@ -2685,31 +2686,34 @@ static void it6505_extcon_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, extcon_wq);
 	struct device *dev = &it6505->client->dev;
-	int state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
-	unsigned int pwroffretry = 0;
+	int state;
 
 	if (it6505->enable_drv_hold)
 		return;
 
 	mutex_lock(&it6505->extcon_lock);
 
+	state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
 	DRM_DEV_DEBUG_DRIVER(dev, "EXTCON_DISP_DP = 0x%02x", state);
+
+	if (state == it6505->extcon_state)
+		goto unlock;
+
 	if (state > 0) {
 		DRM_DEV_DEBUG_DRIVER(dev, "start to power on");
 		msleep(100);
-		it6505_poweron(it6505);
+		pm_runtime_get_sync(dev);
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, "start to power off");
-		while (it6505_poweroff(it6505) && pwroffretry++ < 5) {
-			DRM_DEV_DEBUG_DRIVER(dev, "power off fail %d times",
-					     pwroffretry);
-		}
+		pm_runtime_put_sync(dev);
 
 		drm_helper_hpd_irq_event(it6505->bridge.dev);
 		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 		DRM_DEV_DEBUG_DRIVER(dev, "power off it6505 success!");
 	}
+	it6505->extcon_state = state;
 
+unlock:
 	mutex_unlock(&it6505->extcon_lock);
 }
 
@@ -3032,8 +3036,10 @@ static __maybe_unused int it6505_bridge_suspend(struct device *dev)
 	return it6505_poweroff(it6505);
 }
 
-static SIMPLE_DEV_PM_OPS(it6505_bridge_pm_ops, it6505_bridge_suspend,
-			 it6505_bridge_resume);
+static const struct dev_pm_ops it6505_bridge_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(it6505_bridge_suspend, it6505_bridge_resume, NULL)
+};
 
 static int it6505_init_pdata(struct it6505 *it6505)
 {
@@ -3315,6 +3321,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
 	debugfs_init(it6505);
+	pm_runtime_enable(dev);
 
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.37.2.789.g6183377224-goog


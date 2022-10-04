Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0E5F3C3A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 06:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339E410E5A2;
	Tue,  4 Oct 2022 04:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4984910E5A1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 04:49:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id u21so6542301pfc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 21:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Oju4xub6V7o9xdAwaD+T9qBCkcycOQCYgq5nWXYf73c=;
 b=g2MUedlp2FmmMd643uwEZbCZtVYI18tEjGcXa6bcde+90DOKQzZFnf9PlJgcernkbP
 hfxXV1vocR9AXTAwnwjzqJnN30j617uXUheWuN5H8g7cDrK9WvyW77BRt2CYlADtvyI4
 +5qVi4VQ3QkdewrNJD8ON/DY7n1Ooaa3PPHGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Oju4xub6V7o9xdAwaD+T9qBCkcycOQCYgq5nWXYf73c=;
 b=wuJW7TZH7/noM3HqwTvx4GbB0O/vjcEG1kAlyej1VJ2ZCcHsiruLxDyw+Y0UyaWgET
 87sXteFv208/rJFUWZ9SMbTBe+wElm/8y8XJapd/MTDcNumT7lz8Q3hegm9Qi0Vazl2D
 qbIo2yZiVN3Yemak8VPWWyLNKtEagckEyIFe/DjgqYwoWDA/Ke+4L6z2ilBOGMtnUhTf
 0Ug2s/QPUrVKAwFvmeVpX8JGUCLcXj0WDSK7KLToM2H0C9FfYCgjJpvMmJYssToWmuDY
 IS7BC5JE4hvzQScj8wscy2hkieR2A99GnUz/ySatJlKO61YDsMeVknZFhuFXmp7aSPLB
 gJ7g==
X-Gm-Message-State: ACrzQf3quIUyFVAMBhhe/v0biZSWUlJiP6Kv+X+L85/HZFgcpmxO5DoO
 irH0GER8aW3XNZoZdtsY91ZmrQ==
X-Google-Smtp-Source: AMsMyM7mi1Icb6JbtEanxHY2Ja6jRia1xju1EzBz4lc1wz9V+WfGDXYAie3hAGBmHJiYfPsV5b+mCw==
X-Received: by 2002:a05:6a00:22c7:b0:544:bbf0:8780 with SMTP id
 f7-20020a056a0022c700b00544bbf08780mr25661740pfj.80.1664858994828; 
 Mon, 03 Oct 2022 21:49:54 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5713:ccf0:f1dd:69d2])
 by smtp.gmail.com with ESMTPSA id
 gl1-20020a17090b120100b0020ab3f9c27dsm1095051pjb.55.2022.10.03.21.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 21:49:54 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/bridge: it6505: Adapt runtime power management
 framework
Date: Tue,  4 Oct 2022 12:49:42 +0800
Message-Id: <20221004044943.2407781-2-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221004044943.2407781-1-treapking@chromium.org>
References: <20221004044943.2407781-1-treapking@chromium.org>
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

Changes in v3:
- Handle the error from extcon_get_state

Changes in v2:
- Handle the error from pm_runtime_get_sync in it6505_extcon_work

 drivers/gpu/drm/bridge/ite-it6505.c | 34 ++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2bb957cffd94..050f3be9adbc 100644
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
@@ -2685,31 +2686,41 @@ static void it6505_extcon_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, extcon_wq);
 	struct device *dev = &it6505->client->dev;
-	int state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
-	unsigned int pwroffretry = 0;
+	int state, ret;
 
 	if (it6505->enable_drv_hold)
 		return;
 
 	mutex_lock(&it6505->extcon_lock);
 
+	state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
 	DRM_DEV_DEBUG_DRIVER(dev, "EXTCON_DISP_DP = 0x%02x", state);
-	if (state > 0) {
+
+	if (state == it6505->extcon_state || unlikely(state < 0))
+		goto unlock;
+	it6505->extcon_state = state;
+	if (state) {
 		DRM_DEV_DEBUG_DRIVER(dev, "start to power on");
 		msleep(100);
-		it6505_poweron(it6505);
+		ret = pm_runtime_get_sync(dev);
+
+		/*
+		 * On system resume, extcon_work can be triggered before
+		 * pm_runtime_force_resume re-enables runtime power management.
+		 * Handling the error here to make sure the bridge is powered on.
+		 */
+		if (ret)
+			it6505_poweron(it6505);
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
 
+unlock:
 	mutex_unlock(&it6505->extcon_lock);
 }
 
@@ -3032,8 +3043,10 @@ static __maybe_unused int it6505_bridge_suspend(struct device *dev)
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
@@ -3315,6 +3328,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
 	debugfs_init(it6505);
+	pm_runtime_enable(dev);
 
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.38.0.rc1.362.ged0d419d3c-goog


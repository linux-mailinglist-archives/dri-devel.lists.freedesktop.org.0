Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889375F2813
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 07:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3C810E0D5;
	Mon,  3 Oct 2022 05:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75E710E0D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 05:03:52 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id s206so8798048pgs.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Oct 2022 22:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aBBW7OEU3Jgfto9gKhCEsUvgKLnU3sOd14ZwKXmRCUU=;
 b=VOs7XxzGPKi8k8vLT++EXRfoNjCuEcMwGNH7k6UOdHcoLaHmZOyxPkgLqMtDa3ocaj
 INMu6y/TvmRJOKFZl8pMwl2Wi5dYSKawjc07YqUiryTmLxVviffpXJWYMXY9azqCWste
 qdgJC/Q8mKo19TX+ujvqHl63YHyazDU4W5yi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aBBW7OEU3Jgfto9gKhCEsUvgKLnU3sOd14ZwKXmRCUU=;
 b=TDW8xLKxF3lKwHS0GSomRN5Ldf+WNSlSx1i/dTeq/MkfyKOcbmUexceyn6vGno7g5/
 7gC2unEb3xHBn/+Vfvrt3xC18RIzYqaAdiVxjyIY+qczaLunFNZ3EJefqdB5gsrL6ZFJ
 NEy+MorfmItR1cw9vgFKoBiqhfK5a1yfdy8mdFbiIfZfH+wMRvzEO1w73jD8XP2d8Iht
 oTeL+Uqrx2OXslIdMtyzY/xBvVWcBDbz0xvR0jVX/yWEgDg7kXqjwZRBCWuOmy4l8Dsm
 q35kFRywVonClZJSRWufe/+9AS16MQ/GxBCnLZlhZMtm0FseP+7TZW1cVp+2DLQ3mVCM
 RYAA==
X-Gm-Message-State: ACrzQf3QXOhKEjCJ1j31HCsWdIRgf7xf7z83wDczd9VJfRWqK3vD45ss
 j94MdkBzONo2vb7l+6C1FiY7eg==
X-Google-Smtp-Source: AMsMyM4JnYlktQ8B8Bmm6tGapdzDSy19ilVqdF8e9ZTCi3eSy74kgYRGZfNK3k+jqcqm8iFkKmP8lQ==
X-Received: by 2002:a63:1210:0:b0:435:60d2:b953 with SMTP id
 h16-20020a631210000000b0043560d2b953mr17385550pgl.459.1664773432289; 
 Sun, 02 Oct 2022 22:03:52 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:dfa6:5a1a:b35a:db69])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a170902b48800b0017680faa1a8sm6174628plr.112.2022.10.02.22.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 22:03:51 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/bridge: it6505: Adapt runtime power management
 framework
Date: Mon,  3 Oct 2022 13:03:34 +0800
Message-Id: <20221003050335.1007931-2-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221003050335.1007931-1-treapking@chromium.org>
References: <20221003050335.1007931-1-treapking@chromium.org>
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

Changes in v2:
- Handle the error from pm_runtime_get_sync in it6505_extcon_work

 drivers/gpu/drm/bridge/ite-it6505.c | 33 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2bb957cffd94..685d8e750b12 100644
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
@@ -2685,31 +2686,42 @@ static void it6505_extcon_work(struct work_struct *work)
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
+
+	if (state == it6505->extcon_state)
+		goto unlock;
+
 	if (state > 0) {
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
+	it6505->extcon_state = state;
 
+unlock:
 	mutex_unlock(&it6505->extcon_lock);
 }
 
@@ -3032,8 +3044,10 @@ static __maybe_unused int it6505_bridge_suspend(struct device *dev)
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
@@ -3315,6 +3329,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
 	debugfs_init(it6505);
+	pm_runtime_enable(dev);
 
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.38.0.rc1.362.ged0d419d3c-goog


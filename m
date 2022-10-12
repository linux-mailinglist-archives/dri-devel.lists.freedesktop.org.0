Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BE5FC94D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36010E69C;
	Wed, 12 Oct 2022 16:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ECD10E69C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 16:29:18 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 128so8220200pga.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YtuM603E+k6aqfoZ0FWElqsR6+Ku8jsdYOTJIWy3xg=;
 b=JJVRnC0QblF7NOzu5SIQUJXUdGu4jFeHBztSiP6B0Hk5imlX8l5zmBJWT76HdJEPEV
 TRkk4ztAQ7AiB3Uv5CWTnWVhliNgd/e3mdY0OuykXX5b6Y0gwK5gBC2zNHtt1cQ/NigM
 aHA7wABZ2CzyXwzkx/l2K6TCJjq1djZWp7XGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YtuM603E+k6aqfoZ0FWElqsR6+Ku8jsdYOTJIWy3xg=;
 b=oyQX8YD3KQ+ms+4Onr0UudnX2tiQpruWYoFI7iEOzMxCW5VY4NEWnuCqJ9aSj27LM2
 Q9DOlwIxE7NHy5jrLwUr7XXiK1fSRSE+BrwgXe+f3BWghS8TNkhEefrgthc3MHU7piEN
 B50sWEZ+1UWr1HSOjww2IMnKrTVngYsWMfoeqzFi6AibVX2HUmH4JXBWnCyUH21vwaG+
 snkRR9Pmp4KDMgfGP0jVO1NH5ZNIBYdDCt1OpAq7W9DhfgXTdTZo2rG/yNEhEYyMizO1
 ZMuukiz/t4HMV54ZsNE1TXPha9TBbU6ydsf0fWqG1bTfb/kYpcqLz40ciHRaz/e7wfTg
 EDug==
X-Gm-Message-State: ACrzQf28EXT6/eX99+tAKkjvav7Qr1W957FWM7ugDxg6opYQtQfor8Tn
 2wwcL9sCK7ATThDOkSjWzJXtEg==
X-Google-Smtp-Source: AMsMyM72DawyO7B4FUZI7F8l22On/SCorvViNiLwZ6BHyI4yq5QUrHG1RLmH8urxD793dTuMqmVQ1Q==
X-Received: by 2002:a63:b12:0:b0:44a:d193:6b16 with SMTP id
 18-20020a630b12000000b0044ad1936b16mr26631125pgl.604.1665592157605; 
 Wed, 12 Oct 2022 09:29:17 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:2921:f6a9:5848:18e1])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a635704000000b0045dc85c4a5fsm9722163pgb.44.2022.10.12.09.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:29:17 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/bridge: it6505: Improve synchronization between
 extcon subsystem
Date: Thu, 13 Oct 2022 00:28:59 +0800
Message-Id: <20221012162900.2876686-4-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221012162900.2876686-1-treapking@chromium.org>
References: <20221012162900.2876686-1-treapking@chromium.org>
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
Cc: Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally, the it6505 relies on a short sleep in the IRQ handler and a
long sleep to make sure it6505->lane_swap and it6505->lane_count is
configured in it6505_extcon_work and it6505_detect, respectively.

Use completion and additional DPCD read to remove the unnecessary waits,
and use a different lock for it6505_extcon_work and the threaded IRQ
handler because they no longer need to run exclusively.

The wait time of the completion is usually less than 10ms in local
experiments, but leave it larger here just in case.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cf94e44ec73a..52515b43171c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -412,6 +412,7 @@ struct it6505 {
 	 * Mutex protects extcon and interrupt functions from interfering
 	 * each other.
 	 */
+	struct mutex irq_lock;
 	struct mutex extcon_lock;
 	struct mutex mode_lock; /* used to bridge_detect */
 	struct mutex aux_lock; /* used to aux data transfers */
@@ -440,7 +441,7 @@ struct it6505 {
 	enum hdcp_state hdcp_status;
 	struct delayed_work hdcp_work;
 	struct work_struct hdcp_wait_ksv_list;
-	struct completion wait_edid_complete;
+	struct completion extcon_completion;
 	u8 auto_train_retry;
 	bool hdcp_desired;
 	bool is_repeater;
@@ -2315,8 +2316,8 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			     it6505->hpd_state ? "high" : "low");
 
 	if (it6505->hpd_state) {
-		wait_for_completion_timeout(&it6505->wait_edid_complete,
-					    msecs_to_jiffies(6000));
+		wait_for_completion_timeout(&it6505->extcon_completion,
+					    msecs_to_jiffies(1000));
 		it6505_aux_on(it6505);
 		if (it6505->dpcd[0] == 0) {
 			it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
@@ -2328,7 +2329,6 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 
 		DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
 				     it6505->sink_count);
-
 		it6505_lane_termination_on(it6505);
 		it6505_lane_power_on(it6505);
 
@@ -2487,8 +2487,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	};
 	int int_status[3], i;
 
-	msleep(100);
-	mutex_lock(&it6505->extcon_lock);
+	mutex_lock(&it6505->irq_lock);
 
 	if (it6505->enable_drv_hold || !it6505->powered)
 		goto unlock;
@@ -2518,7 +2517,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	}
 
 unlock:
-	mutex_unlock(&it6505->extcon_lock);
+	mutex_unlock(&it6505->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -2695,9 +2694,12 @@ static void it6505_extcon_work(struct work_struct *work)
 		 */
 		if (ret)
 			it6505_poweron(it6505);
+
+		complete_all(&it6505->extcon_completion);
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, "start to power off");
 		pm_runtime_put_sync(dev);
+		reinit_completion(&it6505->extcon_completion);
 
 		drm_helper_hpd_irq_event(it6505->bridge.dev);
 		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
@@ -3268,6 +3270,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	if (!it6505)
 		return -ENOMEM;
 
+	mutex_init(&it6505->irq_lock);
 	mutex_init(&it6505->extcon_lock);
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
@@ -3323,7 +3326,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
-	init_completion(&it6505->wait_edid_complete);
+	init_completion(&it6505->extcon_completion);
 	memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 	it6505->powered = false;
 	it6505->enable_drv_hold = DEFAULT_DRV_HOLD;
-- 
2.38.0.rc1.362.ged0d419d3c-goog


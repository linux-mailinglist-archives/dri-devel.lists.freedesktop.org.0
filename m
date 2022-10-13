Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFEA5FD80F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0643010E7EA;
	Thu, 13 Oct 2022 11:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1DE10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:04:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1574180pjl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yF0qS9tpjnO5hKItBT5kTiggjtXt00AKvk0lGYLixs=;
 b=lBd+WLazCAhdHwvY2Ydhae9hCVMbvMx0M3hb3hy0vujF2bvWl0gPMyEqZGHGXh6OVj
 sUYmtigt3bUR5i8ZVQ/KOl9sCb04tIaF2JW0rkmxBPvMGSHvtV2TTinTDMwaqiOky0cf
 +FVbSuyM3Ll7gEXcjrLD37S0ElVORRerxb+R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yF0qS9tpjnO5hKItBT5kTiggjtXt00AKvk0lGYLixs=;
 b=1gYBzS4HbA5s8eX/E0dYdCTK0nMjYzVNzAiAQDujWVt4jOamofSp++yw/2mEeeOaV8
 LvWD8iMlNAkkww5GT8l7TFWTDqcHAmSlRbhSyW95PmiUheaiRDfdSvGBuw7b41KjIX94
 al1/bKdH+HqHtTlvOIu47Ik6bB8gepUvfSsXkdqKJemaKw9a+WHpEYgISPpihVLB5ATG
 uc8lVjO5R8dIt3HYgFTpgOW1enSmVGNSir1rFnO2g3p/rLJcWZ3Epx5M6aEMHXY0+oU7
 pD5xqZN9/RRuNAFJPbN+VpZmWx8QzjzO+d9w4r98aoK2pqXiYEG22zB+prnrzMBQNJXp
 tISg==
X-Gm-Message-State: ACrzQf3CISJ4tzxVFNCQLApMINY/8dnOIf6SUOGpzhs15/hNKUWTXNsj
 otsFKzuAZm6Mzn5pldpJrw/Hcg==
X-Google-Smtp-Source: AMsMyM5n8b4kdcavLxHUEz7UcQdZzikHP9Q/BHDphy9Lvrobv7/aRxwlsifSGGLCA2RYZPw8FkPXcQ==
X-Received: by 2002:a17:90b:4b8b:b0:20d:ac2f:8bb2 with SMTP id
 lr11-20020a17090b4b8b00b0020dac2f8bb2mr1353420pjb.194.1665659070952; 
 Thu, 13 Oct 2022 04:04:30 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4b90:18ed:8d41:7622])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a17090ab88b00b0020af2411721sm2914794pjr.34.2022.10.13.04.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 04:04:30 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/bridge: it6505: Improve synchronization between
 extcon subsystem
Date: Thu, 13 Oct 2022 19:04:10 +0800
Message-Id: <20221013110411.1674359-4-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221013110411.1674359-1-treapking@chromium.org>
References: <20221013110411.1674359-1-treapking@chromium.org>
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

Changes in v2:
- Add the empty line back

 drivers/gpu/drm/bridge/ite-it6505.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4b6061272599..0de44c651c60 100644
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
@@ -2316,8 +2317,8 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			     it6505->hpd_state ? "high" : "low");
 
 	if (it6505->hpd_state) {
-		wait_for_completion_timeout(&it6505->wait_edid_complete,
-					    msecs_to_jiffies(6000));
+		wait_for_completion_timeout(&it6505->extcon_completion,
+					    msecs_to_jiffies(1000));
 		it6505_aux_on(it6505);
 		if (it6505->dpcd[0] == 0) {
 			it6505_get_dpcd(it6505, DP_DPCD_REV, it6505->dpcd,
@@ -2493,8 +2494,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	};
 	int int_status[3], i;
 
-	msleep(100);
-	mutex_lock(&it6505->extcon_lock);
+	mutex_lock(&it6505->irq_lock);
 
 	if (it6505->enable_drv_hold || !it6505->powered)
 		goto unlock;
@@ -2524,7 +2524,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	}
 
 unlock:
-	mutex_unlock(&it6505->extcon_lock);
+	mutex_unlock(&it6505->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -2701,9 +2701,12 @@ static void it6505_extcon_work(struct work_struct *work)
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
@@ -3274,6 +3277,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	if (!it6505)
 		return -ENOMEM;
 
+	mutex_init(&it6505->irq_lock);
 	mutex_init(&it6505->extcon_lock);
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
@@ -3329,7 +3333,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
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


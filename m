Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD772C6295
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCDA6EB84;
	Fri, 27 Nov 2020 10:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834C96EB71
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:23:22 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t22so5210723ljk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 01:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jap4CSSphbNhkQ0riEHLjy5ZHv6p/5lP6LbqE0EEZnE=;
 b=VgzMNMCYncvkjKZ7PGOsRpkTT1+54DEF/4ixFBc7ESvn9jYTi7c8ZUHHu5FiGgEoWG
 Ju+IiUrvVm93SUL/SLg+4KbI0MtS0zzN/fgX1TykpiB/DDk9Z4jjhab7BtieElUEWoOI
 md2ZVWBEr+F1b5UG/spnhu0pZdvj9ViMXlDSqqSev0usIQMKFqYbHlh/iTdZz1WW47my
 +VhfNNQgYyldQneoWQkGnPVqfR2bP7CmBPnRzQsrDNdR3Zdx+GW5xAiBgHXIe+/lN3Mu
 jNKohrj7OWNtuYNt8JU/ptDz1itNFH1ojC24cgiRSkqUyzxILtH/tCfMbp4GpzdHoQbb
 aA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jap4CSSphbNhkQ0riEHLjy5ZHv6p/5lP6LbqE0EEZnE=;
 b=pzdTDGMB4ERYr+yZ5kYFYq9udsproRPcCY5cnFVzkeeWNqbMfMB9Kj/Ik7mHliaQgC
 9SbId/hnARaKYLSvCqfmSVZ4Gws/SSz+gfyOqeg6/arRdU4g5fLB6mqDdbk3FVKeK0LS
 2dPxlUOzsX7aXvdMwJJYVt9f9LuCPFZkQV4w43ugAt4Om1z/yCyntQ3AlS7kaPtBqgf6
 eyD5En1dxnLg3v9cTWdM+rt9KWhqEUZsIE9DrUeUS1PnV+ZpwUT8CewDCtXksHRJN2yq
 VVH8alSLUrHu/lIXvLe3beaeRFPZCVVVCYv2GcHS0QukIYPonk+KkXBWDs4xAULKqmWM
 lRiA==
X-Gm-Message-State: AOAM531KwwwA1wCZckEmb0aRLD7dlEUubw5Y16DQ9tKy8yFmnB8CqOh4
 FCYjJTnPDOr8nrKvXvXrbtGSIsXmeX/7fw==
X-Google-Smtp-Source: ABdhPJxuyB4IHPUPxJcrPeo6dQYafbut5vK33LBKEmQw43u7jbE7CeVq373AT576hexUZjM0dJT27A==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr2999342ljc.224.1606469000477; 
 Fri, 27 Nov 2020 01:23:20 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
 by smtp.gmail.com with ESMTPSA id a6sm615442lfi.107.2020.11.27.01.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 01:23:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge/lontium-lt9611uxc: move HPD notification out
 of IRQ handler
Date: Fri, 27 Nov 2020 12:23:16 +0300
Message-Id: <20201127092316.122246-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
thus delaying further lt9611uxc IRQ events processing.  It was observed
occasionally during bootups, when drm_client_modeset_probe() was waiting
for EDID ready event, which was delayed because IRQ handler was stuck
trying to deliver hotplug event.
Move hotplug notifications from IRQ handler to separate work to be able
to process IRQ events without delays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b708700e182d..88630bc2921f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
 
 #include <sound/hdmi-codec.h>
 
@@ -36,6 +37,7 @@ struct lt9611uxc {
 	struct mutex ocm_lock;
 
 	struct wait_queue_head wq;
+	struct work_struct work;
 
 	struct device_node *dsi0_node;
 	struct device_node *dsi1_node;
@@ -52,6 +54,7 @@ struct lt9611uxc {
 
 	bool hpd_supported;
 	bool edid_read;
+	bool hdmi_connected;
 	uint8_t fw_version;
 };
 
@@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 	}
 
 	if (irq_status & BIT(1)) {
-		if (lt9611uxc->connector.dev)
-			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-		else
-			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
+		lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));
+		schedule_work(&lt9611uxc->work);
 	}
 
 	return IRQ_HANDLED;
 }
 
+void lt9611uxc_hpd_work(struct work_struct *work)
+{
+	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
+
+	if (lt9611uxc->connector.dev)
+		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	else
+		drm_bridge_hpd_notify(&lt9611uxc->bridge,
+				      lt9611uxc->hdmi_connected ?
+				      connector_status_connected :
+				      connector_status_disconnected);
+}
+
 static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
 {
 	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
@@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	unsigned int reg_val = 0;
 	int ret;
-	int connected = 1;
+	bool connected = true;
 
 	if (lt9611uxc->hpd_supported) {
 		lt9611uxc_lock(lt9611uxc);
@@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 		if (ret)
 			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
 		else
-			connected  = reg_val & BIT(1);
+			connected  = !!(reg_val & BIT(1));
 	}
+	lt9611uxc->hdmi_connected = connected;
 
 	return connected ?  connector_status_connected :
 				connector_status_disconnected;
@@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
 	lt9611uxc->fw_version = ret;
 
 	init_waitqueue_head(&lt9611uxc->wq);
+	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					lt9611uxc_irq_thread_handler,
 					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
@@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
+	flush_scheduled_work();
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

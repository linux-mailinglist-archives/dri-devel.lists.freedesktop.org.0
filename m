Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF42F8CE5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0FE6E55C;
	Sat, 16 Jan 2021 10:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5DA6E250
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 11:02:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id n11so9945407lji.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 03:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVcjRs+Ok7w3SNArmcDX5s4jqseIUriYsAY++usO/v4=;
 b=fIxlssTjF9bpwqr0geCcR+J3tdYEWhq7wPNyJHJbQiSukYyUEqXPwA9D0TkaDkzxMA
 zG4lXbdrCx5FT9VSkj2NGhulPDcPyq8fUrXdmTi4VkmvR7UHnuj3rklnQsZE7YYlH6zS
 cSGJZhD72bBP1DXw12/+s1gAJMnHBdUMme0fyiQG+f3iYu+BPZar4Okhl172YtCc/sFy
 iczY+MN9pFkpLtNSojxEmFzTIyu46LfHwNLEszbKsNjqIrIyoE0LP/PjItp0vsJ+VC5T
 GVWib6T2i+uqQacta7ngU6eXf3W2uas4ZXMzy0dC2p4TMs7PlC0evbUip1FWLVqSWn6U
 CA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVcjRs+Ok7w3SNArmcDX5s4jqseIUriYsAY++usO/v4=;
 b=NtQmS84w1NfGSxdIWqh+bK2vbY1HynvWl5HfNbo5Qc4hesYk6I5+cfznabO9Q+zhV6
 RFSD+Uf0R6ta8yHIye59uyQrRtHkoeqhrBCmkwi3DCGa/SF65HoKpZDe3d/6b1JNx4cA
 YUrAQzFAkVlvZ2jqBOJ1vhbzUbWC3fxzObryRfgRRiiNnMGrgQiGnH7kea0xVtqw6XqX
 9RLqo8disEH0XHKrRT1MrbnQwDbE53t8u9UBdJdbFkrW7b0d2dDPdycNc/gHR5dwpukz
 5y0oBihynn+3mbZClQhqhRXmOwWLiaIOPSSGwc6O0KZE8FQW++9QrwQxsFrwxtmm2vDr
 GiWQ==
X-Gm-Message-State: AOAM532I65MQGHJ/UnISj3WUSyFTu301cHXvaBQL+HVUmMvjIswMcpDE
 eUXx0W7GlpAT5OyqdYkfpIluSGdBUMS/dJkRo0A=
X-Google-Smtp-Source: ABdhPJx+vSidLuf7CEXA+qiT7NNvlmkvI2jBc+mmViJfgFuO4vTXlBlMitK8hF/Is63y7O0BETr0SQ==
X-Received: by 2002:a05:651c:228:: with SMTP id
 z8mr5408367ljn.310.1610708554557; 
 Fri, 15 Jan 2021 03:02:34 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
 by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:02:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] drm/bridge/lontium-lt9611uxc: move HPD notification
 out of IRQ handler
Date: Fri, 15 Jan 2021 14:02:25 +0300
Message-Id: <20210115110225.127075-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

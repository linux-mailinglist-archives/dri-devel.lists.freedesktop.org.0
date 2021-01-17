Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3562F9B30
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7926D6E18E;
	Mon, 18 Jan 2021 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380589B49
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 00:24:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id m13so14409821ljo.11
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 16:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeCW5WaAEi/f4EYCyZpY7fzTU42ZpJ70cz2rIQ84WDo=;
 b=SQlq/fZ3LehILywvHkujzKUD3DB1RvQPPRmLTp5KedWA6Mutn95xJf+wPC1hQZhODH
 66tDrDdp/hwpEt/7cgwdgSkk7Vj9HIk7ykvvCUyef4ibE0SuxHCwyvKedQBXr/Nw9D+B
 5QMkU8Ur531FiQQiwpbljW8q+utVFxG1UGm2QE9YOWboyBst4mjUoo0yKZYXPiRSYghl
 jlvEHfvii2PteQWtZEt4TczWWEGkjGhx6kG19fJUSF6qzDRmUf7IkDX3A3agbMwC7EUC
 k/Xv8g/cuP0/dcv4UINNeqC6tDsutIzOROvl5Q3BSgggyJmqGlTnNRe2z0UAHIK8e9ay
 GBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeCW5WaAEi/f4EYCyZpY7fzTU42ZpJ70cz2rIQ84WDo=;
 b=LxgYkPuInYm0Z2Uy3wUwZy8KOe/Wmqqfl2kSlxuAIHyy4QYfLoFn30CcjhFK7dCarQ
 LFYafCqmZvImd7bg/E2m5P7u7nVmrJcyMRkNuhG7qwGXIDsiM55dmQukGycaG5C43XfA
 3fzzWn1DFzln9alpNsm2i83cjsUJH6M/mXosl2ZjLYMJwFu84U1tE1T0Ld8L6dAlJ7jj
 IxKzILZ8ivJkRAyCNCeFCiB55E/6ajLQ/uVS1nrcggp3g2GuzwHKAmRXdGPs76LH89c7
 S1Kx6ZvI54Qz+JEAvxzs5zFQmgsCPoOgfoTlUASSOcVPK0dfNTKjAUQQ6EWq+ekbes9O
 4uJA==
X-Gm-Message-State: AOAM531eBJSo1ud92Dx8VPo4v0dczyj1DoRLlafiFvxI9D3HqL1+shDS
 DtfajOXCDGy8e99COriisTkPrajboAD5VaNb
X-Google-Smtp-Source: ABdhPJwp+3c4UawnfMfiibpSuOeBivbcydMHbWe7SDn4oYEPLEsvlmM2fMkBplA4OrxhFJSJdRMnrQ==
X-Received: by 2002:a2e:9053:: with SMTP id n19mr8372241ljg.283.1610843041342; 
 Sat, 16 Jan 2021 16:24:01 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
 by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 16:24:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] drm/bridge/lontium-lt9611uxc: move HPD notification
 out of IRQ handler
Date: Sun, 17 Jan 2021 03:23:55 +0300
Message-Id: <20210117002355.435860-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b708700e182d..209e39923914 100644
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
 
+static void lt9611uxc_hpd_work(struct work_struct *work)
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

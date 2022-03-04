Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251714CCB27
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 02:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A2A10E416;
	Fri,  4 Mar 2022 01:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46010E41B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 01:06:40 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id k2so6471194oia.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 17:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3nWe6fM1HVkjBUMHf+CEsn0gIjJiNshvBUlw4zjlyA=;
 b=i5APB157kDLH4uugQLkW+WkhLxdZwPfQVwcwK501fx9upDZvwwlFYv8llMCQHJJ+Q1
 kVyKqLvBaFvvnD0ftWnH9Ve/tEv68SUr988i3iLC4T//ZgB6H+2FI+qV8odSfMb9wYHU
 PmoKw9idfKa67meyFAm0sWAOJiBuMXWR72dEziYskZbAbsyRJeLfWfDnoD6ccf8nfpPv
 w1G6QDXFJ9CX/l3s8dTaZjwMuzQtvVSprZUGzdZDLyJOCnB1YNz+qCjNoQ9ubv/OrpwO
 cGGK1+MUeKgoFiysDeOAd1SHgKpHAxCKG6daaWnvRUR7SMwplRMQ8359+XCjsCULbduy
 0jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3nWe6fM1HVkjBUMHf+CEsn0gIjJiNshvBUlw4zjlyA=;
 b=HyFJcWPia+avPLxRPXXOuO4cpXp7uyNi7BTGZAfoAd4QOvpVlTFAhb2zBlhKAtQEvu
 f51e53eWybcSNmNUxeEShkxKXEUWM8jiAOPFrU3f35IRI8IXAYdJuBDiMw1sq3m5hjyQ
 GAWE0OyWhbNUXIYlvEBmajICWLEmn7ilVDbtcOug1YEbWBldWMsJgAQlPPFvwFySVIP6
 5rcWdJuCuxVQUIfrD6yWME6U9452ggksXBYdcxnW5YOnFTUWS1XOg+wSG1k106BDlsyK
 fR5/7ZlOP2a7fuPxNbKk8z1FUA2l7FK3vKX7r5oNiGoh2c7EQ/5MRAMGeXuEu+fiBCBi
 JcjA==
X-Gm-Message-State: AOAM530GcKEphbwzsjKqfTpSOTSC6wF9PsWegCov/EZP4MIYd/u+UWO0
 bN8B6fPAVlIreQk96hi697gBZQ==
X-Google-Smtp-Source: ABdhPJzBW6NhSImLIQGWIXESHt/Soyu/H4xnVElo6ZgoPx6e1MiwPxrDZcYL/A+g7+o36t3OX+tdjw==
X-Received: by 2002:aca:1807:0:b0:2cf:216:3d5b with SMTP id
 h7-20020aca1807000000b002cf02163d5bmr7220144oih.18.1646355999802; 
 Thu, 03 Mar 2022 17:06:39 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a4ac60e000000b002e0e75dcb82sm1709080ooq.12.2022.03.03.17.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 17:06:39 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/2] drm/msm/dp: Implement oob_hotplug_event()
Date: Thu,  3 Mar 2022 17:08:27 -0800
Message-Id: <20220304010827.998080-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220304010827.998080-1-bjorn.andersson@linaro.org>
References: <20220304010827.998080-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm DisplayPort driver contains traces of the necessary
plumbing to hook up USB HPD, in the form of the dp_hpd module and the
dp_usbpd_cb struct. Use this as basis for implementing the
oob_hotplug_event() callback, by amending the dp_hpd module with the
missing logic.

Overall the solution is similar to what's done downstream, but upstream
all the code to disect the HPD notification lives on the calling side of
drm_connector_oob_hotplug_event().

drm_connector_oob_hotplug_event() performs the lookup of the
drm_connector based on fwnode, hence the need to assign the fwnode in
dp_drm_connector_init().

Changes in v2:
- Adopt enum drm_connector_hpd_state

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hpd.h     |  5 +++++
 5 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..3d9d754a75f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -449,6 +449,14 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 	return dp_display_process_hpd_high(dp);
 }
 
+void dp_display_oob_hotplug_event(struct msm_dp *dp_display,
+				  enum drm_connector_hpd_state hpd_state)
+{
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	dp->usbpd->oob_event(dp->usbpd, hpd_state);
+}
+
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
@@ -1296,6 +1304,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.dev = &pdev->dev;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7af2b186d2d9..16658270df2c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -11,6 +11,7 @@
 #include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
@@ -40,5 +41,7 @@ bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
+void dp_display_oob_hotplug_event(struct msm_dp *dp_display,
+				  enum drm_connector_hpd_state hpd_state);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..76904b1601b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -123,6 +123,14 @@ static enum drm_mode_status dp_connector_mode_valid(
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
 
+static void dp_oob_hotplug_event(struct drm_connector *connector,
+				 enum drm_connector_hpd_state hpd_state)
+{
+	struct msm_dp *dp_disp = to_dp_connector(connector)->dp_display;
+
+	dp_display_oob_hotplug_event(dp_disp, hpd_state);
+}
+
 static const struct drm_connector_funcs dp_connector_funcs = {
 	.detect = dp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -130,6 +138,7 @@ static const struct drm_connector_funcs dp_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.oob_hotplug_event = dp_oob_hotplug_event,
 };
 
 static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
@@ -160,6 +169,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 	if (ret)
 		return ERR_PTR(ret);
 
+	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
+
 	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index db98a1d431eb..cdb1feea5ebf 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -7,6 +7,8 @@
 
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_print.h>
 
 #include "dp_hpd.h"
 
@@ -45,6 +47,24 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 	return rc;
 }
 
+static void dp_hpd_oob_event(struct dp_usbpd *dp_usbpd,
+			     enum drm_connector_hpd_state hpd_state)
+{
+	struct dp_hpd_private *hpd_priv = container_of(dp_usbpd, struct dp_hpd_private, dp_usbpd);
+
+	DRM_DEBUG_DP("hpd_state: %d connected: %d\n", hpd_state, dp_usbpd->connected);
+
+	if (!dp_usbpd->connected && hpd_state == DRM_CONNECTOR_HPD_HIGH) {
+		dp_usbpd->connected = true;
+		hpd_priv->dp_cb->configure(hpd_priv->dev);
+	} else if (hpd_state == DRM_CONNECTOR_HPD_LOW) {
+		dp_usbpd->connected = false;
+		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
+	} else {
+		hpd_priv->dp_cb->attention(hpd_priv->dev);
+	}
+}
+
 struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 {
 	struct dp_hpd_private *dp_hpd;
@@ -62,6 +82,7 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 	dp_hpd->dp_cb = cb;
 
 	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
+	dp_hpd->dp_usbpd.oob_event = dp_hpd_oob_event;
 
 	return &dp_hpd->dp_usbpd;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index 8feec5aa5027..4166e5fd3156 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -29,7 +29,9 @@ enum plug_orientation {
  * @hpd_irq: Change in the status since last message
  * @alt_mode_cfg_done: bool to specify alt mode status
  * @debug_en: bool to specify debug mode
+ * @connected: cable currently connected
  * @connect: simulate disconnect or connect for debug mode
+ * @oob_event: deliver oob event to the usbpd code
  */
 struct dp_usbpd {
 	enum plug_orientation orientation;
@@ -41,8 +43,11 @@ struct dp_usbpd {
 	bool hpd_irq;
 	bool alt_mode_cfg_done;
 	bool debug_en;
+	bool connected;
 
 	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
+	void (*oob_event)(struct dp_usbpd *dp_usbpd,
+			  enum drm_connector_hpd_state hpd_state);
 };
 
 /**
-- 
2.33.1


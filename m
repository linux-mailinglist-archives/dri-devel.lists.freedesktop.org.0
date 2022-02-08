Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3C4AD06F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 05:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306FC10E197;
	Tue,  8 Feb 2022 04:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2947D10E283
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 04:41:10 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 n6-20020a9d6f06000000b005a0750019a7so12442622otq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 20:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esjcw5J1950tYULEo1Mi5rlx0creI3trE/Z1yqFmq9U=;
 b=ip03ry5nqNDMKLD/txk0cpnpGu1BvjmtduHQhiYMDZpn5vJRKhomQqMBgVAUV9p5PV
 3xrn4cnCiRNPB/VaCfnqZhPnd6KJm6T6p/Qwoo2K8DYmR59WBKOjBe05u/COnPxqKiJu
 EqlHzDIxVCoDeopGi4kwr0th6q3BXHzubpSmeCksw9GLws5mb3eY4eRv5Z4+QKWjOS0Y
 KPeWUeFJFh6xDAyoWwt5pNIypf7EQ2wDAripNLU9/qsxjaW8t6yQrxYqf/j41O4nfDV+
 Y+mDQYBT/pqa9wJDrE85riLOVO73QXylarUrOvwHg7M7L1Kpu8vh4YtdNTS7uY5knGR9
 pv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esjcw5J1950tYULEo1Mi5rlx0creI3trE/Z1yqFmq9U=;
 b=GMw5K7fzA3mYJFVoQlJdVanZ8xzuRyAqHDSFKm21qoC9Ioi/7wNFNfoerJ+AB7ymS8
 UdpbqmGIic6Xwkcm07QkJ6BDEMtHzZoqAdYJRaQFI5mO0s5qPH5ajOjMnjBlrfcLRMBi
 o3QBdoPxRW5x/6CdkcxKnKkh0Ff8dOocAblGfH1caC61402+C5m0XkmyXpLtIO5O1vKh
 uXBzcx+dJuTgAXI7NMf1ivPqewafL5FiZ+GZN12Ceq5mTlvtwYW7rJItnGp/KTeHLZst
 dV4BqEahxTRlt+NOrtqb5+Sx6HG5qrz021yvYb7taEaO1HVtG8RJp598I8O5jNfgsBqS
 ovjA==
X-Gm-Message-State: AOAM530rumup5zw3ColSkpGhNiKSUHYUviHCmtVxiWwFif3BEQfBs+4g
 fDs9mbjEJIXnhS7bbzPjYRFbLA==
X-Google-Smtp-Source: ABdhPJweY3q0vp0/f4DbyZgWE7ZXp0PpJrKT96m0Flrtcs1E/0Ff8vVW1yzoCSR4VtmcCjJaJS6RUQ==
X-Received: by 2002:a9d:2c28:: with SMTP id f37mr1162716otb.65.1644295269183; 
 Mon, 07 Feb 2022 20:41:09 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l14sm4709367ooq.12.2022.02.07.20.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 20:41:08 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] drm: Add HPD state to drm_connector_oob_hotplug_event()
Date: Mon,  7 Feb 2022 20:43:27 -0800
Message-Id: <20220208044328.588860-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

In some implementations, such as the Qualcomm platforms, the display
driver has no way to query the current HPD state and as such it's
impossible to distinguish between disconnect and attention events.

Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
state.

Also push the test for unchanged state in the displayport altmode driver
into the i915 driver, to allow other drivers to act upon each update.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Note that the Intel driver has only been compile tested with this patch.

 drivers/gpu/drm/drm_connector.c          |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c  | 14 +++++++++++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/usb/typec/altmodes/displayport.c |  9 ++-------
 include/drm/drm_connector.h              |  5 +++--
 5 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..ad7295597c0f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 /**
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
+ * @hpd_state: number of data lanes available
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     bool hpd_state)
 {
 	struct drm_connector *connector;
 
@@ -2843,7 +2845,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector);
+		connector->funcs->oob_hotplug_event(connector, hpd_state);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 146b83916005..00520867d37b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4816,15 +4816,23 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	return intel_modeset_synced_crtcs(state, conn);
 }
 
-static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
+static void intel_dp_oob_hotplug_event(struct drm_connector *connector, bool hpd_state)
 {
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
 	struct drm_i915_private *i915 = to_i915(connector->dev);
+	bool need_work = false;
 
 	spin_lock_irq(&i915->irq_lock);
-	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
+	if (hpd_state != i915->hotplug.oob_hotplug_state) {
+		i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
+
+		i915->hotplug.oob_hotplug_state = hpd_state;
+		need_work = true;
+	}
 	spin_unlock_irq(&i915->irq_lock);
-	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
+
+	if (need_work)
+		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
 }
 
 static const struct drm_connector_funcs intel_dp_connector_funcs = {
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 8c1706fd81f9..543ebf1cfcf4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -149,6 +149,9 @@ struct i915_hotplug {
 	/* Whether or not to count short HPD IRQs in HPD storms */
 	u8 hpd_short_storm_enabled;
 
+	/* Last state reported by oob_hotplug_event */
+	bool oob_hotplug_state;
+
 	/*
 	 * if we get a HPD irq from DP and a HPD irq from non-DP
 	 * the non-DP HPD could block the workqueue on a mode config
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index c1d8c23baa39..a4596be4d34a 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -59,7 +59,6 @@ struct dp_altmode {
 	struct typec_displayport_data data;
 
 	enum dp_state state;
-	bool hpd;
 
 	struct mutex lock; /* device lock */
 	struct work_struct work;
@@ -143,10 +142,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 		if (!ret)
 			dp->state = DP_STATE_CONFIGURE;
 	} else {
-		if (dp->hpd != hpd) {
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
-			dp->hpd = hpd;
-		}
+		drm_connector_oob_hotplug_event(dp->connector_fwnode, hpd);
 	}
 
 	return ret;
@@ -573,8 +569,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 
 	if (dp->connector_fwnode) {
-		if (dp->hpd)
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		drm_connector_oob_hotplug_event(dp->connector_fwnode, false);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 64cf5f88c05b..7c90b8eb2ace 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1141,7 +1141,7 @@ struct drm_connector_funcs {
 	 * This will get called when a hotplug-event for a drm-connector
 	 * has been received from a source outside the display driver / device.
 	 */
-	void (*oob_hotplug_event)(struct drm_connector *connector);
+	void (*oob_hotplug_event)(struct drm_connector *connector, bool hpd_state);
 };
 
 /**
@@ -1742,7 +1742,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     bool hpd_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.33.1


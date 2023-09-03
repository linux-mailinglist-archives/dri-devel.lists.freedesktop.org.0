Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A2790E30
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B883510E08A;
	Sun,  3 Sep 2023 21:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF010E20E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:29:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso1447264e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693776579; x=1694381379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrvqJ3c9sQ1JCB3sZd7945Qvt9YqGwY/lI1sp/YeO8w=;
 b=f+FQWy3YULc0VJpD2BapLwgNTab3EnnXgh245ybTNIKqlHAKuDHqQHjCIOvlBVFaDo
 mKX114RbnqbK51b50GlXAxxl2VHJCTpU++vO7O0cFISib56yD2fZU4TvcAcg1s58OHNc
 cMOH21Apjxwaj+gXnAhR1DZN2pD/TWoqStqduj6BXeZi6rbLJFKKtmOWhwMMDgYYCaqd
 2PMXmwODAJEgvxEbwUMhBylNGeCbbg02rm/ghVOuQ6RimvKjsGAlwbrxfDhOzgiWIYD2
 2tbv/eW9yjumv15adD1f/yC92JlVFqvNUeXGG5LtoE46WSZ26CVYPNyfth/0lmeWuQFI
 7oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693776579; x=1694381379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrvqJ3c9sQ1JCB3sZd7945Qvt9YqGwY/lI1sp/YeO8w=;
 b=RKJqDBRmRcn9RG9lNVCCM5Nd0ktBCcgcMI0gRl5hF8LXrteg66UXhuFgUi7WCRXBxy
 UOt3NkeCFeJiQK9qoT3btV2ge6d9qKhR7DXVhc2swaGAv/j5nwAReCJ+z/YY3fF48RkS
 UAbX8XhM90Q4hIaCHueKKrRtI09B//FSuQ12f7ZZYCgM1vH8Bs5TC96gt7q2He0uG5Wo
 04uwGNQ+tk1O81CXslyFQ77SEO2gbhGoQdr07a5xD7BVw2Qm3l5wbk6K98wbbuHW1km9
 JRoSARTliDrZPCOqMrTDqyzMikiu9y1ZH/69eckjhTbZgdrntffvIom1q2sPP1/ouliI
 31lA==
X-Gm-Message-State: AOJu0Yza1MAu4OEbwVi8tV2SEZl5gGtw5XHEsqnXQgVqALIBbDAOm9iO
 0KM4c+LIN8j2/3QAsASAy/y84g==
X-Google-Smtp-Source: AGHT+IG8Jmh8P0iyl44gIl9qubzKl5aZ/eUbSsytTsFO7kh8ocYNSpfL5nu8e1Ica3/jCzLsKZTtmw==
X-Received: by 2002:a05:6512:238d:b0:4fe:181f:2736 with SMTP id
 c13-20020a056512238d00b004fe181f2736mr6211669lfv.33.1693776579452; 
 Sun, 03 Sep 2023 14:29:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 eq11-20020a056512488b00b004ff8d9ed368sm1412352lfb.258.2023.09.03.14.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:29:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 1/3] drm: Add HPD state to drm_connector_oob_hotplug_event()
Date: Mon,  4 Sep 2023 00:29:35 +0300
Message-Id: <20230903212937.2876815-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
References: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

In some implementations, such as the Qualcomm platforms, the display
driver has no way to query the current HPD state and as such it's
impossible to distinguish between disconnect and attention events.

Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
state.

Also push the test for unchanged state in the displayport altmode driver
into the i915 driver, to allow other drivers to act upon each update.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c                 |  6 ++++--
 .../gpu/drm/i915/display/intel_display_core.h   |  3 +++
 drivers/gpu/drm/i915/display/intel_dp.c         | 17 ++++++++++++++---
 drivers/usb/typec/altmodes/displayport.c        | 17 +++++++++--------
 include/drm/drm_connector.h                     |  6 ++++--
 5 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c44d5bcf1284..05fc29a54801 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3051,6 +3051,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 /**
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
+ * @status: hot plug detect logical state
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -3060,7 +3061,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_status status)
 {
 	struct drm_connector *connector;
 
@@ -3069,7 +3071,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector);
+		connector->funcs->oob_hotplug_event(connector, status);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 53e5c33e08c3..ccfe27630fb6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -175,6 +175,9 @@ struct intel_hotplug {
 	/* Whether or not to count short HPD IRQs in HPD storms */
 	u8 hpd_short_storm_enabled;
 
+	/* Last state reported by oob_hotplug_event for each encoder */
+	unsigned long oob_hotplug_last_state;
+
 	/*
 	 * if we get a HPD irq from DP and a HPD irq from non-DP
 	 * the non-DP HPD could block the workqueue on a mode config
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 12bd2f322e62..2af815b5c22b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5253,15 +5253,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	return intel_modeset_synced_crtcs(state, conn);
 }
 
-static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
+static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
+				       enum drm_connector_status hpd_state)
 {
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
 	struct drm_i915_private *i915 = to_i915(connector->dev);
+	bool hpd_high = hpd_state == connector_status_connected;
+	unsigned int hpd_pin = encoder->hpd_pin;
+	bool need_work = false;
 
 	spin_lock_irq(&i915->irq_lock);
-	i915->display.hotplug.event_bits |= BIT(encoder->hpd_pin);
+	if (hpd_high != test_bit(hpd_pin, &i915->display.hotplug.oob_hotplug_last_state)) {
+		i915->display.hotplug.event_bits |= BIT(hpd_pin);
+
+		__assign_bit(hpd_pin, &i915->display.hotplug.oob_hotplug_last_state, hpd_high);
+		need_work = true;
+	}
 	spin_unlock_irq(&i915->irq_lock);
-	queue_delayed_work(i915->unordered_wq, &i915->display.hotplug.hotplug_work, 0);
+
+	if (need_work)
+		queue_delayed_work(i915->unordered_wq, &i915->display.hotplug.hotplug_work, 0);
 }
 
 static const struct drm_connector_funcs intel_dp_connector_funcs = {
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 426c88a516e5..29f40e658772 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -153,11 +153,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 			}
 		}
 	} else {
-		if (dp->hpd != hpd) {
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
-			dp->hpd = hpd;
-			sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
-		}
+		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+						hpd ? connector_status_connected :
+						      connector_status_disconnected);
+		dp->hpd = hpd;
+		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 	}
 
 	return ret;
@@ -173,7 +173,8 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+						connector_status_connected);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 	}
@@ -618,8 +619,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 
 	if (dp->connector_fwnode) {
-		if (dp->hpd)
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+						connector_status_disconnected);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..5a8115dca359 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1327,7 +1327,8 @@ struct drm_connector_funcs {
 	 * This will get called when a hotplug-event for a drm-connector
 	 * has been received from a source outside the display driver / device.
 	 */
-	void (*oob_hotplug_event)(struct drm_connector *connector);
+	void (*oob_hotplug_event)(struct drm_connector *connector,
+				  enum drm_connector_status status);
 
 	/**
 	 * @debugfs_init:
@@ -1971,7 +1972,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_status status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.39.2


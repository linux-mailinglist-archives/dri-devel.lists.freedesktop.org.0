Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33075174F6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FE610F13B;
	Mon,  2 May 2022 16:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395710F14E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:51:34 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-d39f741ba0so14796062fac.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=083NsRblbzEQ87LGTO+L08IA3IGSXzJoRYSgZZZrf6k=;
 b=S4Fr5c/7eGQbkWSwsgPaQcWk2YXkPfkDZTZRK8fwui3zinAcUQW8y01G7vjYt/hDUB
 OWvLpbxcW3zNMwX0rtpv16LA5PB7LqC9ymSHsLk/h4Tz0Lz3OK9sohA7X3k+k3yD8gRT
 Z+WBOyUl51lDUzo3MxCWGjwoSlRB3vySZUr/wqK6yetbik6u4h3XciV3sTNrwkyfbvXU
 iBDmoMn/fh2CpJK13twRuIYMViam4VMrJkeEOvH6g+H+9aaXP1z1YyRAXiVOJAkA2yjr
 Ur4oCgMMNsXYMRrQeE7ljhqNw2dPi082fsvdNcdmnQKDJvW5X92o3fHVq7zf7hG+wUmy
 OysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=083NsRblbzEQ87LGTO+L08IA3IGSXzJoRYSgZZZrf6k=;
 b=yBeYUbKk15hmE4xhmv5rgXCQnSyX06SzJJj3YKm3BgJBjeISKo6VLZuFrpnmOQk+FI
 YremW4PR0GrqGMAkISaPW+wN9b6Ee5o2JLz9X3r21ZL62gTLjCgcxpoPumrWVBstY4hV
 fFxwOfbM0Fpa0ZUmXNjfk0y16Ut8xKgnPvi+tZjuBq3wtGlf6iMLl2+zb1LilV2rW1ce
 d0Jl/jaymCB2uqQwYjYF8AXM5YdjeafHxxPrpfPfvezgz2so0iUByW9TL59Jjgm+UA91
 Cxq5T9o68FZjSHUKr2FwbGLFH2/pOTRBinr9TNdGHYq3obFY3iffgbGX0tpxCMMs8fJG
 h4jg==
X-Gm-Message-State: AOAM530EP44lxt3rFnyYAIazlOD6JxgBLTLnNgS4PHPv8sKzOnUSsymT
 cOck6zFWiVzL0y/EWokqAUo57Q==
X-Google-Smtp-Source: ABdhPJyWrn5TyBZsDMqJkPF2ef2E3cA9vrWmhPamNgg0C9OtRrCbHSIxDAIjTDle/BB2nCxhOxW/+w==
X-Received: by 2002:a05:6870:63a7:b0:ed:9ab5:2916 with SMTP id
 t39-20020a05687063a700b000ed9ab52916mr18971oap.288.1651510293401; 
 Mon, 02 May 2022 09:51:33 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:51:32 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v4 2/5] drm: Add HPD state to drm_connector_oob_hotplug_event()
Date: Mon,  2 May 2022 09:53:13 -0700
Message-Id: <20220502165316.4167199-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
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

Changes since v3:
- Transition to drm_connector_status instead of custom hpd_state 

 drivers/gpu/drm/drm_connector.c          |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/usb/typec/altmodes/displayport.c | 10 +++-------
 include/drm/drm_connector.h              |  6 ++++--
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..e86c69f0640f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2794,6 +2794,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 /**
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
+ * @status: hot plug detect logical state
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -2803,7 +2804,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_status status)
 {
 	struct drm_connector *connector;
 
@@ -2812,7 +2814,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector);
+		connector->funcs->oob_hotplug_event(connector, status);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e4a79c11fd25..56cc023f7bbd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4951,15 +4951,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
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
-	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
+	if (hpd_high != test_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state)) {
+		i915->hotplug.event_bits |= BIT(hpd_pin);
+
+		__assign_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state, hpd_high);
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
index 24111bf42ce0..96c088bb5522 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -135,6 +135,9 @@ struct i915_hotplug {
 	/* Whether or not to count short HPD IRQs in HPD storms */
 	u8 hpd_short_storm_enabled;
 
+	/* Last state reported by oob_hotplug_event for each encoder */
+	unsigned long oob_hotplug_last_state;
+
 	/*
 	 * if we get a HPD irq from DP and a HPD irq from non-DP
 	 * the non-DP HPD could block the workqueue on a mode config
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index c1d8c23baa39..9360ca177c7d 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -59,7 +59,6 @@ struct dp_altmode {
 	struct typec_displayport_data data;
 
 	enum dp_state state;
-	bool hpd;
 
 	struct mutex lock; /* device lock */
 	struct work_struct work;
@@ -143,10 +142,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 		if (!ret)
 			dp->state = DP_STATE_CONFIGURE;
 	} else {
-		if (dp->hpd != hpd) {
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
-			dp->hpd = hpd;
-		}
+		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+						hpd ? connector_status_connected : connector_status_disconnected);
 	}
 
 	return ret;
@@ -573,8 +570,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 
 	if (dp->connector_fwnode) {
-		if (dp->hpd)
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		drm_connector_oob_hotplug_event(dp->connector_fwnode, connector_status_disconnected);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..886aa1861ed9 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1141,7 +1141,8 @@ struct drm_connector_funcs {
 	 * This will get called when a hotplug-event for a drm-connector
 	 * has been received from a source outside the display driver / device.
 	 */
-	void (*oob_hotplug_event)(struct drm_connector *connector);
+	void (*oob_hotplug_event)(struct drm_connector *connector,
+				  enum drm_connector_status status);
 
 	/**
 	 * @debugfs_init:
@@ -1749,7 +1750,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_status status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.35.1


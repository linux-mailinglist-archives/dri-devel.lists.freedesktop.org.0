Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A394CCB23
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 02:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512B10E41B;
	Fri,  4 Mar 2022 01:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADA110E413
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 01:06:39 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 u17-20020a056830231100b005ad13358af9so6107834ote.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 17:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S5t4rbaYih60HQLQG00cH7GkHoQ2b0pMi3XAEtckmE8=;
 b=pex35ksJ1RmL6raNCdLtvz2rZNpkKoewNNIB6VzZUOsWqRNYLQzy8uahH1EQ3gTUs6
 3JEjp5Rv5UooZGIGDxl1XUNj5sdWwUXjShAyNm3a45yFgdUG7N3ifbgeCIewoj5plual
 TngJrLkrP7rik5aa4GlA/Ypnx7cJ3MgmeMT1wEz/Qwb5CqagoJe2Ry4Wyq94ugz+UpOr
 CDkV3Jb/U69QHXOAIkv68kYt2PM+cM7Mcka0A3zx0/b1CqKN5b8GhCU+/PQQxNk4GuIg
 JuOLs54lWVog3R8yQ9vP+X8JYrdLQjZB37f3xZ/Rz4aLjUcTkw4cfk5H/uu8rZjAE7hY
 fkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S5t4rbaYih60HQLQG00cH7GkHoQ2b0pMi3XAEtckmE8=;
 b=JPfuvUUiR7PViV+AzGhLRweURCWkA+UKjKBRaoCnRaNVqBh+bsndsabkWwDHqLTny3
 zrEXKGUYlacQUjxiPKUBdRtxkFyPJvnpa1iGG0gAh1ZpOhUZ6us4W7L75PCArGqsKA+f
 uryB1JtvJssnYYtP7z6AynYCygP4HbfeylUZN7psPQb6dnILcjqLLslXr4+RELpeI7Bb
 36/pL7rF6/7RPvmtc1xNecnCZA2y246lyHMI+T9/F0FBB9itav5xdTpQcAmEcVZBrFw4
 hMsHLrm5+jQfxZg44omjW6Zhb1urCfpAOqwbm6dFtTIVeXkkm3p1gPGnCZwSCUs+pGJK
 2OsA==
X-Gm-Message-State: AOAM530pU+aVwYo1j855CMK8JE6DQCMlVwTrson26gm4fFa0AfImQhy1
 oXX+5DPVjrjGB1xb5I+Cc9KYmw==
X-Google-Smtp-Source: ABdhPJytLNNdMMTPErv9vZo/RqVdSG9bZ+EjlBsEkVgN7+X2TRNTpYHgyz2ZTSewepBTpUOKWvZERA==
X-Received: by 2002:a9d:734b:0:b0:5b1:ff8f:710 with SMTP id
 l11-20020a9d734b000000b005b1ff8f0710mr1027991otk.65.1646355998639; 
 Thu, 03 Mar 2022 17:06:38 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a4ac60e000000b002e0e75dcb82sm1709080ooq.12.2022.03.03.17.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 17:06:38 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/2] drm: Add HPD state to drm_connector_oob_hotplug_event()
Date: Thu,  3 Mar 2022 17:08:26 -0800
Message-Id: <20220304010827.998080-1-bjorn.andersson@linaro.org>
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

Changes in v2:
- Replace bool with drm_connector_hpd_state enum to represent "state" better
- Track old hpd state per encoder in i915

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/drm_connector.c          |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/usb/typec/altmodes/displayport.c | 10 +++-------
 include/drm/drm_connector.h              | 11 +++++++++--
 5 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..a44f082ebd9d 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 /**
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
  * @connector_fwnode: fwnode_handle to report the event on
+ * @hpd_state: hot plug detect logical state
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
@@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_hpd_state hpd_state)
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
index 1046e7fe310a..a3c9dbae5cee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4825,15 +4825,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	return intel_modeset_synced_crtcs(state, conn);
 }
 
-static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
+static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
+				       enum drm_connector_hpd_state hpd_state)
 {
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
 	struct drm_i915_private *i915 = to_i915(connector->dev);
+	bool hpd_high = hpd_state == DRM_CONNECTOR_HPD_HIGH;
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
index 5cfe69b30841..80a4615a38e2 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -138,6 +138,9 @@ struct i915_hotplug {
 	/* Whether or not to count short HPD IRQs in HPD storms */
 	u8 hpd_short_storm_enabled;
 
+	/* Last state reported by oob_hotplug_event for each encoder */
+	unsigned long oob_hotplug_last_state;
+
 	/*
 	 * if we get a HPD irq from DP and a HPD irq from non-DP
 	 * the non-DP HPD could block the workqueue on a mode config
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index c1d8c23baa39..ea9cb1d71fd2 100644
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
+						hpd ? DRM_CONNECTOR_HPD_HIGH : DRM_CONNECTOR_HPD_LOW);
 	}
 
 	return ret;
@@ -573,8 +570,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	cancel_work_sync(&dp->work);
 
 	if (dp->connector_fwnode) {
-		if (dp->hpd)
-			drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		drm_connector_oob_hotplug_event(dp->connector_fwnode, DRM_CONNECTOR_HPD_LOW);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 64cf5f88c05b..bd2f305fa670 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -142,6 +142,11 @@ enum subpixel_order {
 
 };
 
+enum drm_connector_hpd_state {
+	DRM_CONNECTOR_HPD_LOW,
+	DRM_CONNECTOR_HPD_HIGH
+};
+
 /**
  * struct drm_scrambling: sink's scrambling support.
  */
@@ -1141,7 +1146,8 @@ struct drm_connector_funcs {
 	 * This will get called when a hotplug-event for a drm-connector
 	 * has been received from a source outside the display driver / device.
 	 */
-	void (*oob_hotplug_event)(struct drm_connector *connector);
+	void (*oob_hotplug_event)(struct drm_connector *connector,
+				  enum drm_connector_hpd_state hpd_state);
 };
 
 /**
@@ -1742,7 +1748,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     enum drm_connector_hpd_state hpd_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.33.1


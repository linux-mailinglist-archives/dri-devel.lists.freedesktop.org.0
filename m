Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD16E5F52ED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 12:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC2910E46B;
	Wed,  5 Oct 2022 10:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6010E46B;
 Wed,  5 Oct 2022 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664967121; x=1696503121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ciuAKtGTW6uZVPEpxLUypZwPONSF3ZVJef6Opp4wa7c=;
 b=GxoGSxnh0dMhBjfvk/y6hhfiyJoe+xkOg6zG4PwZ0qptRvzO7CFDozNw
 vd0iUbdv+X/IPXBSupLf7r8Q995XcmjlTMx6h14bIc67Zp+7zqhO/DXfh
 0U4X3BhvXqGFHMeutPopv7eo5JACddxBvFBRoUdRuMDHRjwx8TveNcK/L
 DNiqBGOyMZNdtLpI0Rln+3/u6O+GedCPBJrLkdcgeykPeZqkuVKdc6T7Z
 vlb0/+b+PEQ1MeNFpVWkxL8e7/9+Y5zKmsPTppRd5bD/nf5mCXZk+ZOGW
 x+2LocZGnEzx5x0ZV1zKZetEpn9/VFmJhPc6D9jE+y04FvbneJ+Ve4yVC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304699849"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="304699849"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:52:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="655131165"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="655131165"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.173])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:51:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 2/2] drm/i915: iterate intel_connectors only
Date: Wed,  5 Oct 2022 13:51:44 +0300
Message-Id: <37625095998bff9c4f191a8b5a7f4780b90eb408.1664966047.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664966047.git.jani.nikula@intel.com>
References: <cover.1664966047.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_connectors that are embedded in writeback connectors won't be
embedded in intel_connectors, so we can't assume being able to convert a
drm_connector to intel_connector when iterating all the connectors we
have. Use the drm connector list filtering to skip writeback connectors.

Note: We could also wrap the begin/end calls to intel specific macros to
hide the boilerplate.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c       |  3 ++-
 drivers/gpu/drm/i915/display/intel_display_types.h |  7 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c            |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  3 ++-
 drivers/gpu/drm/i915/display/intel_hotplug.c       | 12 ++++++++----
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  6 ++++--
 drivers/gpu/drm/i915/display/intel_opregion.c      |  9 ++++++---
 8 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 8c3bd9ba0d74..892a86c86fb4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8960,7 +8960,8 @@ static void intel_hpd_poll_fini(struct drm_i915_private *i915)
 	struct drm_connector_list_iter conn_iter;
 
 	/* Kill all the work that may have been queued by hpd. */
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		if (connector->modeset_retry_work.func)
 			cancel_work_sync(&connector->modeset_retry_work);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e2b853e9e51d..49a5a1ddc4df 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -612,6 +612,13 @@ struct intel_connector {
 	struct intel_hdcp hdcp;
 };
 
+static inline bool is_intel_connector(const struct drm_connector *connector,
+				      void *unused_filter_context)
+{
+	/* writeback connectors aren't embedded in intel_connector */
+	return connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK;
+}
+
 struct intel_digital_connector_state {
 	struct drm_connector_state base;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 70b06806ec0d..4cf934c51290 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4044,7 +4044,8 @@ static int intel_dp_prep_link_retrain(struct intel_dp *intel_dp,
 	if (!intel_dp_needs_link_retrain(intel_dp))
 		return 0;
 
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		struct drm_connector_state *conn_state =
 			connector->base.state;
@@ -4173,7 +4174,8 @@ static int intel_dp_prep_phy_test(struct intel_dp *intel_dp,
 
 	*pipe_mask = 0;
 
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		struct drm_connector_state *conn_state =
 			connector->base.state;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index cd4e61026d98..e4f98cee8d81 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -272,7 +272,8 @@ intel_dp_mst_atomic_master_trans_check(struct intel_connector *connector,
 	if (!intel_connector_needs_modeset(state, &connector->base))
 		return 0;
 
-	drm_connector_list_iter_begin(&dev_priv->drm, &connector_list_iter);
+	drm_connector_list_iter_filter_begin(&dev_priv->drm, &connector_list_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector_iter, &connector_list_iter) {
 		struct intel_digital_connector_state *conn_iter_state;
 		struct intel_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6406fd487ee5..36167e42a537 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -83,7 +83,8 @@ intel_hdcp_required_content_stream(struct intel_digital_port *dig_port)
 	if (dig_port->hdcp_auth_status)
 		return 0;
 
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		if (connector->base.status == connector_status_disconnected)
 			continue;
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 352a1b53b63e..3a9bf87907f5 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -185,7 +185,8 @@ intel_hpd_irq_storm_switch_to_polling(struct drm_i915_private *dev_priv)
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_filter_begin(dev, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		enum hpd_pin pin;
 
@@ -232,7 +233,8 @@ static void intel_hpd_irq_storm_reenable_work(struct work_struct *work)
 
 	spin_lock_irq(&dev_priv->irq_lock);
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_filter_begin(dev, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		pin = intel_connector_hpd_pin(connector);
 		if (pin == HPD_NONE ||
@@ -392,7 +394,8 @@ static void i915_hotplug_work_func(struct work_struct *work)
 
 	spin_unlock_irq(&dev_priv->irq_lock);
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_filter_begin(dev, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		enum hpd_pin pin;
 		u32 hpd_bit;
@@ -624,7 +627,8 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
 
 	enabled = READ_ONCE(dev_priv->display.hotplug.poll_enabled);
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_filter_begin(dev, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		enum hpd_pin pin;
 
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index cbfabd58b75a..0bd145ad8f17 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -114,7 +114,8 @@ static void intel_modeset_update_connector_atomic_state(struct drm_i915_private
 	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		struct drm_connector_state *conn_state = connector->base.state;
 		struct intel_encoder *encoder =
@@ -498,7 +499,8 @@ static void intel_modeset_readout_hw_state(struct drm_i915_private *i915)
 
 	intel_dpll_readout_hw_state(i915);
 
-	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&i915->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		if (connector->get_hw_state(connector)) {
 			struct intel_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index caa07ef34f21..697d902a8d79 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -488,7 +488,8 @@ static u32 asle_set_backlight(struct drm_i915_private *dev_priv, u32 bclp)
 	 */
 	drm_dbg_kms(&dev_priv->drm, "updating opregion backlight %d/255\n",
 		    bclp);
-	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_connector_list_iter_filter_begin(dev, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter)
 		intel_backlight_set_acpi(connector->base.state, bclp, 255);
 	drm_connector_list_iter_end(&conn_iter);
@@ -709,7 +710,8 @@ static void intel_didl_outputs(struct drm_i915_private *dev_priv)
 
 	intel_acpi_device_id_update(dev_priv);
 
-	drm_connector_list_iter_begin(&dev_priv->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&dev_priv->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		if (i < max_outputs)
 			set_did(opregion, i, connector->acpi_device_id);
@@ -746,7 +748,8 @@ static void intel_setup_cadls(struct drm_i915_private *dev_priv)
 	 * Note that internal panels should be at the front of the connector
 	 * list already, ensuring they're not left out.
 	 */
-	drm_connector_list_iter_begin(&dev_priv->drm, &conn_iter);
+	drm_connector_list_iter_filter_begin(&dev_priv->drm, &conn_iter,
+					     is_intel_connector, NULL);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		if (i >= ARRAY_SIZE(opregion->acpi->cadl))
 			break;
-- 
2.34.1


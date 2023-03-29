Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED36CF0CC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7DE10EBD0;
	Wed, 29 Mar 2023 17:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644E810EBD6;
 Wed, 29 Mar 2023 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680110049; x=1711646049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a/oAkn7vAHFINNWHMRvp+WT+kIAvJm5Ahc0IuF9GAn0=;
 b=jPWIxSqz60g6vzsDXDmYB/6LYFFWqJG7IzLlxoIIUpgq/fuDt9/+sELU
 D5iG1Nq/MLKyQ/LoKqrPYxGtURFytUkDD4d80k4jl6NMaHHLu6XLWuJoa
 Tqe7+3Y5MH8vGFnZFDzAumoSiPNaPrhqPtnUOsygXiS0PvahFFRE7NJOh
 ylI2TtgRy8hgcSTi6fE8KH/siBzJHtiSX2QCMsKPZ4NvJ5lBMBohvZATP
 5soTw4M++NkTk6aqTlIAKeBijI05GAUi4zapidcYAJqT/3rEj+bW7Ebmh
 YFymDqPx+vzQFZkqLzV+0zb+rGSVMHXDgBNjeh9RRB1IEPXEhjqPqJ2km g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329422546"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="329422546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773648962"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="773648962"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 29 Mar 2023 10:14:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 Mar 2023 20:14:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scdc-helper: Pimp SCDC debugs
Date: Wed, 29 Mar 2023 20:14:02 +0300
Message-Id: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Include the device and connector information in the SCDC
debugs. Makes it easier to figure out who did what.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  8 ++---
 drivers/gpu/drm/display/drm_scdc_helper.c | 36 ++++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_ddi.c  |  4 +--
 drivers/gpu/drm/i915/display/intel_hdmi.c |  4 +--
 drivers/gpu/drm/tegra/sor.c               | 10 +++----
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 21 +++++++------
 include/drm/display/drm_scdc_helper.h     | 12 ++++++--
 7 files changed, 62 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa51c61a78c7..7f57ca168ab6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1426,9 +1426,9 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi,
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
 	if (dw_hdmi_support_scdc(hdmi, display)) {
 		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
-			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
+			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, hdmi->ddc, 1);
 		else
-			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 0);
+			drm_scdc_set_high_tmds_clock_ratio(&hdmi->connector, hdmi->ddc, 0);
 	}
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_high_tmds_clock_ratio);
@@ -2116,7 +2116,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 				min_t(u8, bytes, SCDC_MIN_SOURCE_VERSION));
 
 			/* Enabled Scrambling in the Sink */
-			drm_scdc_set_scrambling(hdmi->ddc, 1);
+			drm_scdc_set_scrambling(&hdmi->connector, hdmi->ddc, 1);
 
 			/*
 			 * To activate the scrambler feature, you must ensure
@@ -2132,7 +2132,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
 			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
 				    HDMI_MC_SWRSTZ);
-			drm_scdc_set_scrambling(hdmi->ddc, 0);
+			drm_scdc_set_scrambling(&hdmi->connector, hdmi->ddc, 0);
 		}
 	}
 
diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index c3ad4ab2b456..2b124152384c 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -26,6 +26,8 @@
 #include <linux/delay.h>
 
 #include <drm/display/drm_scdc_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 
 /**
@@ -140,6 +142,7 @@ EXPORT_SYMBOL(drm_scdc_write);
 
 /**
  * drm_scdc_get_scrambling_status - what is status of scrambling?
+ * @connector: connector
  * @adapter: I2C adapter for DDC channel
  *
  * Reads the scrambler status over SCDC, and checks the
@@ -148,14 +151,17 @@ EXPORT_SYMBOL(drm_scdc_write);
  * Returns:
  * True if the scrambling is enabled, false otherwise.
  */
-bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
+bool drm_scdc_get_scrambling_status(struct drm_connector *connector,
+				    struct i2c_adapter *adapter)
 {
 	u8 status;
 	int ret;
 
 	ret = drm_scdc_readb(adapter, SCDC_SCRAMBLER_STATUS, &status);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to read scrambling status: %d\n", ret);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Failed to read scrambling status: %d\n",
+			    connector->base.id, connector->name, ret);
 		return false;
 	}
 
@@ -165,6 +171,7 @@ EXPORT_SYMBOL(drm_scdc_get_scrambling_status);
 
 /**
  * drm_scdc_set_scrambling - enable scrambling
+ * @connector: connector
  * @adapter: I2C adapter for DDC channel
  * @enable: bool to indicate if scrambling is to be enabled/disabled
  *
@@ -175,14 +182,18 @@ EXPORT_SYMBOL(drm_scdc_get_scrambling_status);
  * Returns:
  * True if scrambling is set/reset successfully, false otherwise.
  */
-bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable)
+bool drm_scdc_set_scrambling(struct drm_connector *connector,
+			     struct i2c_adapter *adapter,
+			     bool enable)
 {
 	u8 config;
 	int ret;
 
 	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to read TMDS config: %d\n", ret);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
+			    connector->base.id, connector->name, ret);
 		return false;
 	}
 
@@ -193,7 +204,9 @@ bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable)
 
 	ret = drm_scdc_writeb(adapter, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to enable scrambling: %d\n", ret);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Failed to enable scrambling: %d\n",
+			    connector->base.id, connector->name, ret);
 		return false;
 	}
 
@@ -203,6 +216,7 @@ EXPORT_SYMBOL(drm_scdc_set_scrambling);
 
 /**
  * drm_scdc_set_high_tmds_clock_ratio - set TMDS clock ratio
+ * @connector: connector
  * @adapter: I2C adapter for DDC channel
  * @set: ret or reset the high clock ratio
  *
@@ -230,14 +244,18 @@ EXPORT_SYMBOL(drm_scdc_set_scrambling);
  * Returns:
  * True if write is successful, false otherwise.
  */
-bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set)
+bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
+					struct i2c_adapter *adapter,
+					bool set)
 {
 	u8 config;
 	int ret;
 
 	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to read TMDS config: %d\n", ret);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
+			    connector->base.id, connector->name, ret);
 		return false;
 	}
 
@@ -248,7 +266,9 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set)
 
 	ret = drm_scdc_writeb(adapter, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to set TMDS clock ratio: %d\n", ret);
+		drm_dbg_kms(connector->dev,
+			    "[CONNECTOR:%d:%s] Failed to set TMDS clock ratio: %d\n",
+			    connector->base.id, connector->name, ret);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 73240cf78c8b..d8a9790f9d36 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3988,8 +3988,8 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 
 	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_err(&dev_priv->drm, "Failed to read TMDS config: %d\n",
-			ret);
+		drm_err(&dev_priv->drm, "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
+			connector->base.base.id, connector->base.name, ret);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c7e9e1fbed37..1835df94616a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2661,9 +2661,9 @@ bool intel_hdmi_handle_sink_scrambling(struct intel_encoder *encoder,
 		    str_yes_no(scrambling), high_tmds_clock_ratio ? 40 : 10);
 
 	/* Set TMDS bit clock ratio to 1/40 or 1/10, and enable/disable scrambling */
-	return drm_scdc_set_high_tmds_clock_ratio(adapter,
+	return drm_scdc_set_high_tmds_clock_ratio(connector, adapter,
 						  high_tmds_clock_ratio) &&
-		drm_scdc_set_scrambling(adapter, scrambling);
+		drm_scdc_set_scrambling(connector, adapter, scrambling);
 }
 
 static u8 chv_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..6cfdb2dec561 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2142,8 +2142,8 @@ static void tegra_sor_hdmi_scdc_disable(struct tegra_sor *sor)
 {
 	struct i2c_adapter *ddc = sor->output.ddc;
 
-	drm_scdc_set_high_tmds_clock_ratio(ddc, false);
-	drm_scdc_set_scrambling(ddc, false);
+	drm_scdc_set_high_tmds_clock_ratio(&sor->output.connector, ddc, false);
+	drm_scdc_set_scrambling(&sor->output.connector, ddc, false);
 
 	tegra_sor_hdmi_disable_scrambling(sor);
 }
@@ -2170,8 +2170,8 @@ static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
 {
 	struct i2c_adapter *ddc = sor->output.ddc;
 
-	drm_scdc_set_high_tmds_clock_ratio(ddc, true);
-	drm_scdc_set_scrambling(ddc, true);
+	drm_scdc_set_high_tmds_clock_ratio(&sor->output.connector, ddc, true);
+	drm_scdc_set_scrambling(&sor->output.connector, ddc, true);
 
 	tegra_sor_hdmi_enable_scrambling(sor);
 }
@@ -2181,7 +2181,7 @@ static void tegra_sor_hdmi_scdc_work(struct work_struct *work)
 	struct tegra_sor *sor = container_of(work, struct tegra_sor, scdc.work);
 	struct i2c_adapter *ddc = sor->output.ddc;
 
-	if (!drm_scdc_get_scrambling_status(ddc)) {
+	if (!drm_scdc_get_scrambling_status(&sor->output.connector, ddc)) {
 		DRM_DEBUG_KMS("SCDC not scrambled\n");
 		tegra_sor_hdmi_scdc_enable(sor);
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 464c3cc8e6fb..ca27fe092679 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -885,7 +885,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 	int idx;
@@ -903,8 +904,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
-	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+	drm_scdc_set_high_tmds_clock_ratio(connector, vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(connector, vc4_hdmi->ddc, true);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
@@ -922,7 +923,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *drm = connector->dev;
 	unsigned long flags;
 	int idx;
 
@@ -944,8 +946,8 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
-	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
+	drm_scdc_set_scrambling(connector, vc4_hdmi->ddc, false);
+	drm_scdc_set_high_tmds_clock_ratio(connector, vc4_hdmi->ddc, false);
 
 	drm_dev_exit(idx);
 }
@@ -955,12 +957,13 @@ static void vc4_hdmi_scrambling_wq(struct work_struct *work)
 	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
 						 struct vc4_hdmi,
 						 scrambling_work);
+	struct drm_connector *connector = &vc4_hdmi->connector;
 
-	if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
+	if (drm_scdc_get_scrambling_status(connector, vc4_hdmi->ddc))
 		return;
 
-	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
-	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+	drm_scdc_set_high_tmds_clock_ratio(connector, vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(connector, vc4_hdmi->ddc, true);
 
 	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
index ded01fd948b4..9ad523b45454 100644
--- a/include/drm/display/drm_scdc_helper.h
+++ b/include/drm/display/drm_scdc_helper.h
@@ -28,6 +28,7 @@
 
 #include <drm/display/drm_scdc.h>
 
+struct drm_connector;
 struct i2c_adapter;
 
 ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
@@ -71,9 +72,14 @@ static inline int drm_scdc_writeb(struct i2c_adapter *adapter, u8 offset,
 	return drm_scdc_write(adapter, offset, &value, sizeof(value));
 }
 
-bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter);
+bool drm_scdc_get_scrambling_status(struct drm_connector *connector,
+				    struct i2c_adapter *adapter);
 
-bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable);
-bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set);
+bool drm_scdc_set_scrambling(struct drm_connector *connector,
+			     struct i2c_adapter *adapter,
+			     bool enable);
+bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
+					struct i2c_adapter *adapter,
+					bool set);
 
 #endif
-- 
2.39.2


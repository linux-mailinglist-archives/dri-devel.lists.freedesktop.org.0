Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46D78C377
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7DC10E2AC;
	Tue, 29 Aug 2023 11:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987AC10E2AC;
 Tue, 29 Aug 2023 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309200; x=1724845200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0AEMY9uRGxkL1M0dEXvG1BaP5GA3KRVTmIFxZqr0/Ys=;
 b=arKzylL4gYJ7cn2P3qwQUj8Kqb60TkbVEkGjdqbe9p3RWmvwqYfNIJoD
 9caZN/LWi00BqdbK94sl8736qgxu7ssnk03LlNTg9P0y1bzSAjHHt5qes
 Kn9jOUxFwaM2XoobOcbsFlxvyvW0u3dyCgbtJ+iDfg1BwmBAkqaIJx6AA
 o4HucMPAiCgnydA4MY0RH6n0vmOprG+8ez3q+MpyTnPot8UgaUJso33hF
 Qhti0CFccB1ya+rS68h0MnErRKmryn19XupRKAPuaHH6Yv0X21AMB2WqS
 R8YQDElkryo/p1iK1HP797MZX0At8baURjGQzuS+eChPsjmYPahXpIcep Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063957"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063957"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669110"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669110"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/i915/hdmi: Nuke hdmi->ddc_bus
Date: Tue, 29 Aug 2023 14:39:18 +0300
Message-ID: <20230829113920.13713-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove the mostly redundant hdmi->ddc_bus. The only thing that needs
it anymore is get_encoder_by_ddc_bus(), but that can be replaced with
a slight detour through attached_connector+intel_gmbus_get_adapter().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  1 -
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 13 +++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c62f4ec315e8..363b6573a5f9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1581,7 +1581,6 @@ struct intel_watermark_params {
 
 struct intel_hdmi {
 	i915_reg_t hdmi_reg;
-	int ddc_bus;
 	struct {
 		enum drm_dp_dual_mode_type type;
 		int max_tmds_clock;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index efa9bb93cfb1..6b8754290304 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2900,13 +2900,17 @@ get_encoder_by_ddc_pin(struct intel_encoder *encoder, u8 ddc_pin)
 	struct intel_encoder *other;
 
 	for_each_intel_encoder(&i915->drm, other) {
+		struct intel_connector *connector;
+
 		if (other == encoder)
 			continue;
 
 		if (!intel_encoder_is_dig_port(other))
 			continue;
 
-		if (enc_to_dig_port(other)->hdmi.ddc_bus == ddc_pin)
+		connector = enc_to_dig_port(other)->hdmi.attached_connector;
+
+		if (connector && connector->base.ddc == intel_gmbus_get_adapter(i915, ddc_pin))
 			return other;
 	}
 
@@ -3000,6 +3004,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
 	struct cec_connector_info conn_info;
+	u8 ddc_pin;
 
 	drm_dbg_kms(&dev_priv->drm,
 		    "Adding HDMI connector on [ENCODER:%d:%s]\n",
@@ -3014,14 +3019,14 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 		     intel_encoder->base.name))
 		return;
 
-	intel_hdmi->ddc_bus = intel_hdmi_ddc_pin(intel_encoder);
-	if (!intel_hdmi->ddc_bus)
+	ddc_pin = intel_hdmi_ddc_pin(intel_encoder);
+	if (!ddc_pin)
 		return;
 
 	drm_connector_init_with_ddc(dev, connector,
 				    &intel_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus));
+				    intel_gmbus_get_adapter(dev_priv, ddc_pin));
 
 	drm_connector_helper_add(connector, &intel_hdmi_connector_helper_funcs);
 
-- 
2.41.0


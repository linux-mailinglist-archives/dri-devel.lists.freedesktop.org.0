Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7478C36C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA78A10E27F;
	Tue, 29 Aug 2023 11:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CCB10E264;
 Tue, 29 Aug 2023 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309179; x=1724845179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L8iCtU3oGxybyifSiYIwNLyNXDXSOS6ICLAa3tUmwL4=;
 b=Qo7IvoYydIetZNqRQIGHPyY5u+p4iJlPsUvn84afoMF6b5ogxo8lmYWP
 PJCMRw0WVgZEa/QnYpS3hCXU7dwexJPQqkw80nqWDlTBdWR5EhO/6KdG8
 4w+42jYw8hskC15JI0m+QkLdC2BNykpkZhwkt0vVFP5mP+8NKRXHvqeP+
 Asolw90T7VTdG5/svRbyYlDfRR37jby0d6G0pZTjd4gcizEcGMZJq8sum
 aOBsp+97EwAiJT7y/OaGXKBtwTpuLgKJJesNp7jAC0aZFqRJJd1NIMQ5F
 pVbSz7GsSTt5WvaMz0NeuW4cnkHbaRP9p4OqaIuC7UMDjrLKtBGLzbSJS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063923"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063923"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669042"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669042"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/12] drm/i915/lvds: Populate connector->ddc
Date: Tue, 29 Aug 2023 14:39:12 +0300
Message-ID: <20230829113920.13713-5-ville.syrjala@linux.intel.com>
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

Populate connector->ddc, and thus create the "ddc" symlink
in sysfs for the LVDS port.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_lvds.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 3ace56979b70..2306e133e3f6 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -837,7 +837,7 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	struct intel_encoder *encoder;
 	i915_reg_t lvds_reg;
 	u32 lvds;
-	u8 pin;
+	u8 ddc_pin;
 
 	/* Skip init on machines we know falsely report LVDS */
 	if (dmi_check_system(intel_no_lvds)) {
@@ -864,8 +864,8 @@ void intel_lvds_init(struct drm_i915_private *i915)
 			return;
 	}
 
-	pin = GMBUS_PIN_PANEL;
-	if (!intel_bios_is_lvds_present(i915, &pin)) {
+	ddc_pin = GMBUS_PIN_PANEL;
+	if (!intel_bios_is_lvds_present(i915, &ddc_pin)) {
 		if ((lvds & LVDS_PORT_EN) == 0) {
 			drm_dbg_kms(&i915->drm,
 				    "LVDS is not present in VBT\n");
@@ -888,8 +888,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	lvds_encoder->attached_connector = connector;
 	encoder = &lvds_encoder->base;
 
-	drm_connector_init(&i915->drm, &connector->base, &intel_lvds_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
+	drm_connector_init_with_ddc(&i915->drm, &connector->base,
+				    &intel_lvds_connector_funcs,
+				    DRM_MODE_CONNECTOR_LVDS,
+				    intel_gmbus_get_adapter(i915, ddc_pin));
 
 	drm_encoder_init(&i915->drm, &encoder->base, &intel_lvds_enc_funcs,
 			 DRM_MODE_ENCODER_LVDS, "LVDS");
@@ -943,13 +945,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	 * preferred mode is the right one.
 	 */
 	mutex_lock(&i915->drm.mode_config.mutex);
-	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
-		drm_edid = drm_edid_read_switcheroo(&connector->base,
-						    intel_gmbus_get_adapter(i915, pin));
-	} else {
-		drm_edid = drm_edid_read_ddc(&connector->base,
-					     intel_gmbus_get_adapter(i915, pin));
-	}
+	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
+		drm_edid = drm_edid_read_switcheroo(&connector->base, connector->base.ddc);
+	else
+		drm_edid = drm_edid_read_ddc(&connector->base, connector->base.ddc);
 	if (drm_edid) {
 		if (drm_edid_connector_update(&connector->base, drm_edid) ||
 		    !drm_edid_connector_add_modes(&connector->base)) {
-- 
2.41.0


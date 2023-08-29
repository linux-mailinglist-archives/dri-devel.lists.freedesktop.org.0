Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FE78C36F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B41310E290;
	Tue, 29 Aug 2023 11:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE0010E27A;
 Tue, 29 Aug 2023 11:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309183; x=1724845183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sDfwIxMbQDLbfGyJGcQbYEFGrLX46flP8xOWodlohm4=;
 b=AdPDG3cw9XlCTvWFM8XoheT8RY2ABThuS53U025UnbMrjAh9u/2Z8dQ1
 YNF8uQprX53LWqR29JuCWknnLv7xoaxLoic5kG4VWhTHXL+kuaTyjT+dv
 B9Oh97Kx5VygWJoHfK8l1Z0zeVKWw4tiqaCqyAkAjrjY55hSmlnh/+Ym7
 coRflenUPgxyQuljKhUn/t/PXfdk2GKVs1X3jiKmxt4UsO5/PP7a951eW
 OQZn0W9o4lJwKhzDRdOZJ7KHKAz/KVptmXWmdLgzzV+aho6YoPbI53ddC
 fLTpiTk7gSyaE7/aP8JtN14EK1zq6REFSpH75LgmdnxldtgsPk90EtMtz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063931"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063931"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669052"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669052"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/12] drm/i915/crt: Populate connector->ddc
Date: Tue, 29 Aug 2023 14:39:13 +0300
Message-ID: <20230829113920.13713-6-ville.syrjala@linux.intel.com>
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
in sysfs for analog VGA connectors.

As a bonus we can replace a bunch of intel_gmbus_get_adapter()
lookups with just the connector->ddc pointer. Sadly one extra
lookup still remains due to the g4x DVI-I shenanigans. We could
perhaps consider borrowing the ddc proxy idea from SDVO to deal
with that in a perhaps nicer way, but can't really be bothered
right now at least. Also not sure exposing such a dual ddc bus
to userspace would be quite wise.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 8145511bd5c3..ea3908fd2505 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -650,11 +650,9 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
 	struct drm_i915_private *dev_priv = to_i915(crt->base.base.dev);
 	const struct drm_edid *drm_edid;
-	struct i2c_adapter *ddc;
 	bool ret = false;
 
-	ddc = intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc_pin);
-	drm_edid = intel_crt_get_edid(connector, ddc);
+	drm_edid = intel_crt_get_edid(connector, connector->ddc);
 
 	if (drm_edid) {
 		const struct edid *edid = drm_edid_raw(drm_edid);
@@ -923,8 +921,7 @@ static int intel_crt_get_modes(struct drm_connector *connector)
 	wakeref = intel_display_power_get(dev_priv,
 					  intel_encoder->power_domain);
 
-	ddc = intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc_pin);
-	ret = intel_crt_ddc_get_modes(connector, ddc);
+	ret = intel_crt_ddc_get_modes(connector, connector->ddc);
 	if (ret || !IS_G4X(dev_priv))
 		goto out;
 
@@ -988,6 +985,7 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
 	struct intel_crt *crt;
 	struct intel_connector *intel_connector;
 	i915_reg_t adpa_reg;
+	u8 ddc_pin;
 	u32 adpa;
 
 	if (HAS_PCH_SPLIT(dev_priv))
@@ -1024,10 +1022,14 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
 		return;
 	}
 
+	ddc_pin = dev_priv->display.vbt.crt_ddc_pin;
+
 	connector = &intel_connector->base;
 	crt->connector = intel_connector;
-	drm_connector_init(&dev_priv->drm, &intel_connector->base,
-			   &intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
+	drm_connector_init_with_ddc(&dev_priv->drm, connector,
+				    &intel_crt_connector_funcs,
+				    DRM_MODE_CONNECTOR_VGA,
+				    intel_gmbus_get_adapter(dev_priv, ddc_pin));
 
 	drm_encoder_init(&dev_priv->drm, &crt->base.base, &intel_crt_enc_funcs,
 			 DRM_MODE_ENCODER_DAC, "CRT");
-- 
2.41.0


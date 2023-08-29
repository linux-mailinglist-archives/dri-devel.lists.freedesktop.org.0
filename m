Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AA78C371
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030D10E296;
	Tue, 29 Aug 2023 11:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18810E264;
 Tue, 29 Aug 2023 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309190; x=1724845190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bD5NCIaIULeJVNg/8Vi+jxYXNOwaNx56mPRYVWwIyas=;
 b=THU+SOfYsp2CHgn5cBo4Fuvy/nq8GtXFVkbt41lgijyBb9rOlEKRTxLK
 FCcJkVKwagAsvJ54x2kUnFgnj2XheuAIugqNBOR85E0dAmeLW03NsPwxJ
 DXS4g/o6HRXIZW6UhHxzkUZakI3CHQ6iCjDUCnLwnqQp89oxZsJwk/70J
 E7bD2KJch4HoL6Mx3TPNreYaG/HGSg9GJ6l/TayouIRaW58aIlSrWU4tn
 r7HjRfJlapa2eiTJWRRNo/jPkLEKGwNJ7YeuL9gqgLH/KizLm4TIjR2wb
 h/netDbjdYRP1wVdsoBvqv4cEtvnHAqr04DlqQ1M3+cVJ6C/Fpioiv+p8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063944"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063944"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669068"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669068"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/12] drm/i915/dp: Populate connector->ddc
Date: Tue, 29 Aug 2023 14:39:15 +0300
Message-ID: <20230829113920.13713-8-ville.syrjala@linux.intel.com>
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
in sysfs for analog DP SST connectors.

Let's also reorder intel_dp_aux_init() vs. drm_connector_init_with_ddc()
a bit to make sure the i2c aux ch is at least somewhat populated
before we pass it on, though drm_connector_init_with_ddc() does
not actually do anything with it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 05694e0b6143..9b35b1d6adbb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5914,7 +5914,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	}
 
 	mutex_lock(&dev_priv->drm.mode_config.mutex);
-	drm_edid = drm_edid_read_ddc(connector, &intel_dp->aux.ddc);
+	drm_edid = drm_edid_read_ddc(connector, connector->ddc);
 	if (!drm_edid) {
 		/* Fallback to EDID from ACPI OpRegion, if any */
 		drm_edid = intel_opregion_get_edid(intel_connector);
@@ -6053,12 +6053,15 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		intel_dp->pps.active_pipe = vlv_active_pipe(intel_dp);
 
+	intel_dp_aux_init(intel_dp);
+
 	drm_dbg_kms(&dev_priv->drm,
 		    "Adding %s connector on [ENCODER:%d:%s]\n",
 		    type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
 		    intel_encoder->base.base.id, intel_encoder->base.name);
 
-	drm_connector_init(dev, connector, &intel_dp_connector_funcs, type);
+	drm_connector_init_with_ddc(dev, connector, &intel_dp_connector_funcs,
+				    type, &intel_dp->aux.ddc);
 	drm_connector_helper_add(connector, &intel_dp_connector_helper_funcs);
 
 	if (!HAS_GMCH(dev_priv) && DISPLAY_VER(dev_priv) < 12)
@@ -6066,8 +6069,6 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 
 	intel_connector->polled = DRM_CONNECTOR_POLL_HPD;
 
-	intel_dp_aux_init(intel_dp);
-
 	intel_connector_attach_encoder(intel_connector, intel_encoder);
 
 	if (HAS_DDI(dev_priv))
-- 
2.41.0


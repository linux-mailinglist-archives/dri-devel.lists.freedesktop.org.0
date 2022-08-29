Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234415A4AE4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672DB10F170;
	Mon, 29 Aug 2022 12:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3973810F170;
 Mon, 29 Aug 2022 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661774539; x=1693310539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UB8IYCqT/2nNIe3wUPB580V7qhf/z2LtCQBPejaofk8=;
 b=LoeeZ65CJyBCQQGXdTvb9p5LNTFngDQy3EkMrbs8mhKI6vPusurpfTZD
 j0YCBoa2tbyLOn0eusFxtc7bUO4HhSDoRk+58dfQTtSb59jr0GP1lu49I
 t/GII1NyBuqoqaVYy/fVZDaNitg6keKAXq3xqx29eoCsrCpoKuxTbl+3t
 zAxJ5s6eOv1l+eqGaMi9ZO+pg8mQWrlxLhqqDotqh0S9j5iFS8cuvZvoI
 pmUfKqRCFXf7gCRnjIJV2ayRrcarZSxrEigZUlza1vrgqxFtdFW0vc10K
 5n2YRofVkIxYWmjIvBZmGZG3Le9cJY5y8RREpZz8EgTfgABGhwsUlcwC9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="295652642"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="295652642"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 05:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="588141159"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 29 Aug 2022 05:02:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 15:02:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/i915: Infer vrefresh range for eDP if the EDID
 omits it
Date: Mon, 29 Aug 2022 15:02:15 +0300
Message-Id: <20220829120215.7127-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-12-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-12-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A bunch of machines seem to have eDP panels where the EDID
indicates continuous frequency support but fails to actually
include the range descirptor. This violates the EDID 1.4
spec, but looks like the Windows driver just hacks around
this by just assuming that the panel supports a continuous
refresh rate range that covers all EDID reported modes.

Do the same so that we get VRR support on these machines.

v2: connector->edid may be an error pointer (Jani)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6323
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8d1559323412..df2b2064ce50 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5207,6 +5207,49 @@ intel_edp_add_properties(struct intel_dp *intel_dp)
 						       fixed_mode->vdisplay);
 }
 
+/*
+ * Some VRR eDP panels violate the EDID spec and neglect
+ * to include the monitor range descriptor in the EDID.
+ * Cook up the VRR refresh rate limits based on the modes
+ * reported by the panel.
+ */
+static void
+intel_edp_infer_vrr_range(struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_display_info *info = &connector->base.display_info;
+	const struct edid *edid = connector->edid;
+	const struct drm_display_mode *mode;
+
+	if (!HAS_VRR(i915))
+		return;
+
+	if (IS_ERR_OR_NULL(edid) || edid->revision < 4 ||
+	    !(edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) ||
+	    info->vrr_range.min_vfreq || info->vrr_range.max_vfreq)
+		return;
+
+	if (list_empty(&connector->base.probed_modes))
+		return;
+
+	info->vrr_range.min_vfreq = ~0;
+	info->vrr_range.max_vfreq = 0;
+
+	list_for_each_entry(mode, &connector->base.probed_modes, head) {
+		int vrefresh = drm_mode_vrefresh(mode);
+
+		info->vrr_range.min_vfreq = min_t(int, vrefresh,
+						  info->vrr_range.min_vfreq);
+		info->vrr_range.max_vfreq = max_t(int, vrefresh,
+						  info->vrr_range.max_vfreq);
+	}
+
+	drm_dbg_kms(&i915->drm,
+		    "[CONNECTOR:%d:%s] does not report refresh rate range, assuming: %d Hz - %d Hz\n",
+		    connector->base.base.id, connector->base.name,
+		    info->vrr_range.min_vfreq, info->vrr_range.max_vfreq);
+}
+
 static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 				     struct intel_connector *intel_connector)
 {
@@ -5271,6 +5314,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	}
 	intel_connector->edid = edid;
 
+	intel_edp_infer_vrr_range(intel_connector);
+
 	intel_bios_init_panel(dev_priv, &intel_connector->panel,
 			      encoder->devdata, IS_ERR(edid) ? NULL : edid);
 
-- 
2.35.1


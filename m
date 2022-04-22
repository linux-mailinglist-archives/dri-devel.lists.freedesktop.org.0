Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52150B218
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15272112207;
	Fri, 22 Apr 2022 07:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB51112201;
 Fri, 22 Apr 2022 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650614285; x=1682150285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fp4T4UYCxghpLMysqML2JwzbCGdMPLGoU75Q0I5jeRo=;
 b=BiKv58Cc3GIu9QuQEJnt7dpjnfLnTisWuzIKkEVti+vI5k0RiaX+RHE5
 rtgy5uWEcERoXmyjZA2IVQ3AaK92EifeNZKUXl4xABO5pnGlx/xKnLxi7
 0LBWzy1v3sI1m2W3r8FSJtwP7LATdK9EXH1FliRZZjhwbaj7gK898xWZy
 huLveoBzjw6DcjitoV3oxyqjwkkpyJH8sIuTWvkBFbwefQ1f0vfcJP5rZ
 OKl74kUq8ZNHK3Bm+rYboMjyaEY71CguxHl+8GjUSFK3vl1k58hmaQ3UV
 y82LpCcG49WfCJsADB42pvHYglaCC6fjgRM6cZdMzaAvvKNa5DfO9Nzuw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="325062226"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="325062226"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:58:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="703447976"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:58:02 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC 2/2] drm/i915/vrr: Attach and set drm crtc vrr_enabled property
Date: Fri, 22 Apr 2022 13:25:36 +0530
Message-Id: <20220422075536.2792833-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422075536.2792833-1-bhanuprakash.modem@intel.com>
References: <20220422075536.2792833-1-bhanuprakash.modem@intel.com>
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function attaches & sets the vrr_enabled property for crtc
based on the platform support and the request from userspace.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 drivers/gpu/drm/i915/display/intel_vrr.c  | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 4442aa355f86..36deaca9af66 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -366,6 +366,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_attach_vrr_enabled_property(&crtc->base);
+
 	intel_color_init(crtc);
 
 	intel_crtc_drrs_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 396f2f994fa0..6cb8410bd4a0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -160,8 +160,11 @@ void intel_vrr_enable(struct intel_encoder *encoder,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl;
 
-	if (!crtc_state->vrr.enable)
+	if (!crtc_state->vrr.enable) {
+		drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc, false);
 		return;
+	}
+	drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc, true);
 
 	if (DISPLAY_VER(dev_priv) >= 13)
 		trans_vrr_ctl = VRR_CTL_VRR_ENABLE |
@@ -211,6 +214,8 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
+	drm_mode_crtc_set_vrr_enabled_property(old_crtc_state->uapi.crtc, false);
+
 	if (!old_crtc_state->vrr.enable)
 		return;
 
-- 
2.35.1


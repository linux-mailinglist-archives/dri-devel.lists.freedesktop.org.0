Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD892848E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8110E278;
	Fri,  5 Jul 2024 09:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXlf06T1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D710E278;
 Fri,  5 Jul 2024 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720170246; x=1751706246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFCoj4LX5feepLjrJLX36WT2pUrSKDwPldjNU03al0A=;
 b=EXlf06T1/A4abzqBK33qzKIjFCh58N//flzkA4daVfkmJZDYZ/etQokr
 urTdHvHoDCHDmvzZgU57JnRqA/6NJF/7Pmbwa3Xd+0DuQvTNrpfrsQJbU
 QI6XOXhBCtY7RUgOTCNU5nHgwUttq3LDNkB96atRNBxFrtaSlBIkwO0vx
 QfuTAL8xDEmdfAr/6VLiZt3s3sZ2utqlXZ9XAqcHgpj/iWlbQdOEtxArn
 yQTPppohQrdO7oTJVvAed5UF3WBTRWjaffNoWrCbn9L2olDLOPmQ6m50L
 ++VGt7zsc4wujUL1FdAghrjUqskFyyU3pbX6kDhyPAXTwYjGa02g0WAKg A==;
X-CSE-ConnectionGUID: Qd0VYryQSuik0w48G4CGOA==
X-CSE-MsgGUID: WKkdjJDnTcq/iSbfPEDKHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17324198"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="17324198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 02:04:06 -0700
X-CSE-ConnectionGUID: ZvtiS6+zQX2FQOmIRJlPfQ==
X-CSE-MsgGUID: DoZ8nKwhTMqmhlk+6QmlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="51676222"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 05 Jul 2024 02:04:04 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/5] drm/i915/display: Load the lut values and enable sharpness
Date: Fri,  5 Jul 2024 14:32:05 +0530
Message-Id: <20240705090205.72302-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240705090205.72302-1-nemesa.garg@intel.com>
References: <20240705090205.72302-1-nemesa.garg@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Load the lut values during pipe enable.

v2: Add the display version check

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c |  6 ++++++
 drivers/gpu/drm/i915/display/skl_scaler.c    | 13 ++++++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 968fa61af9ee..05f8d4b61ca5 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -483,6 +483,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (DISPLAY_VER(dev_priv) >= 20)
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4c734c557ea8..7ccfb90e7c82 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1774,6 +1774,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 			intel_crtc_wait_for_next_vblank(wa_crtc);
 		}
 	}
+
+	if (new_crtc_state->hw.casf_params.strength_changed)
+		intel_filter_lut_load(crtc, new_crtc_state);
 }
 
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
@@ -6971,6 +6974,9 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
+	if (intel_sharpness_strength_changed(state))
+		intel_sharpness_filter_enable(new_crtc_state);
+
 	intel_fbc_update(state, crtc);
 
 	drm_WARN_ON(&i915->drm, !intel_display_power_is_enabled(i915, POWER_DOMAIN_DC_OFF));
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 9d8bc6c0ab2c..be0ad6ce90b2 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -931,7 +931,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 	/* find scaler attached to this pipe */
 	for (i = 0; i < crtc->num_scalers; i++) {
-		u32 ctl, pos, size;
+		u32 ctl, pos, size, sharp;
 
 		ctl = intel_de_read(dev_priv, SKL_PS_CTRL(crtc->pipe, i));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
@@ -939,6 +939,17 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 		id = i;
 
+		if (DISPLAY_VER(dev_priv) >= 20) {
+			sharp = intel_de_read(dev_priv, SHARPNESS_CTL(crtc->pipe));
+			if (sharp & FILTER_EN) {
+				crtc_state->hw.casf_params.strength =
+					REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
+				crtc_state->hw.casf_params.need_scaler = true;
+				crtc_state->hw.casf_params.win_size =
+					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
+			}
+		}
+
 		if (!crtc_state->hw.casf_params.need_scaler)
 			crtc_state->pch_pfit.enabled = true;
 
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B155A887B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3015A10E505;
	Wed, 31 Aug 2022 21:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8D10E3EB;
 Wed, 31 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982633; x=1693518633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhfoVFmAQIWkcNu0Wkax7GkHG7e4vmagjC97LX0fUjM=;
 b=ZycHDV7sj9omr7UBYEacP2aOiHHkwWEsQwWG8u+e+uvdYjYg3GqV0EBh
 v7AiT+y4xewDxh2j0mhZw6T1qFrdoER3tCNrhbaQxO7eahYd8aP175r7s
 1LyrenoHctbPTbyrvyLLQNxhV0MV5FWWu1Z++Ja5WB6LrbUmIx8rkJUZv
 eLNsamjFHc19j8AosL/QobAyxlKfZBdsiQDMe5fkFG+XDBFnAxeayAZF5
 Q7tvvmMfFwquO4ypyfxGK8jg+pggkeoV6gpA6bkDBRJA55Q+5Al3fU/9r
 /IpLY+uFrp++9oUk9171kvdiD89x3V7JGUlZ8ggHtvtYIucIwzP5tKESz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="357270165"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="357270165"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586231"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 07/11] drm/i915/mtl: Add DP AUX support on TypeC ports
Date: Wed, 31 Aug 2022 14:49:54 -0700
Message-Id: <20220831214958.109753-8-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

On MTL TypeC ports the AUX_CH_CTL and AUX_CH_DATA addresses have
changed wrt. previous platforms, adjust the code accordingly.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 45 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h             |  9 +++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 98bd33645b43..48c375c65a41 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -637,6 +637,46 @@ static i915_reg_t tgl_aux_data_reg(struct intel_dp *intel_dp, int index)
 	}
 }
 
+static i915_reg_t xelpdp_aux_ctl_reg(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum aux_ch aux_ch = dig_port->aux_ch;
+
+	switch (aux_ch) {
+	case AUX_CH_A:
+	case AUX_CH_B:
+	case AUX_CH_USBC1:
+	case AUX_CH_USBC2:
+	case AUX_CH_USBC3:
+	case AUX_CH_USBC4:
+		return XELPDP_DP_AUX_CH_CTL(aux_ch);
+	default:
+		MISSING_CASE(aux_ch);
+		return XELPDP_DP_AUX_CH_CTL(AUX_CH_A);
+	}
+}
+
+static i915_reg_t xelpdp_aux_data_reg(struct intel_dp *intel_dp, int index)
+{
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum aux_ch aux_ch = dig_port->aux_ch;
+
+	switch (aux_ch) {
+	case AUX_CH_A:
+	case AUX_CH_B:
+	case AUX_CH_USBC1:
+	case AUX_CH_USBC2:
+	case AUX_CH_USBC3:
+	case AUX_CH_USBC4:
+		return XELPDP_DP_AUX_CH_DATA(aux_ch, index);
+	default:
+		MISSING_CASE(aux_ch);
+		return XELPDP_DP_AUX_CH_DATA(AUX_CH_A, index);
+	}
+}
+
 void intel_dp_aux_fini(struct intel_dp *intel_dp)
 {
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
@@ -652,7 +692,10 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 	struct intel_encoder *encoder = &dig_port->base;
 	enum aux_ch aux_ch = dig_port->aux_ch;
 
-	if (DISPLAY_VER(dev_priv) >= 12) {
+	if (DISPLAY_VER(dev_priv) >= 14) {
+		intel_dp->aux_ch_ctl_reg = xelpdp_aux_ctl_reg;
+		intel_dp->aux_ch_data_reg = xelpdp_aux_data_reg;
+	} else if (DISPLAY_VER(dev_priv) >= 12) {
 		intel_dp->aux_ch_ctl_reg = tgl_aux_ctl_reg;
 		intel_dp->aux_ch_data_reg = tgl_aux_data_reg;
 	} else if (DISPLAY_VER(dev_priv) >= 9) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 42e26057f44a..18adfd8126a2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3470,6 +3470,15 @@
 						       _XELPDP_USBC3_AUX_CH_CTL, \
 						       _XELPDP_USBC4_AUX_CH_CTL))
 
+#define XELPDP_DP_AUX_CH_DATA(aux_ch, i)	_MMIO(_PICK(aux_ch, \
+						       _DPA_AUX_CH_DATA1, \
+						       _DPB_AUX_CH_DATA1, \
+						       0, /* port/aux_ch C is non-existent */ \
+						       _XELPDP_USBC1_AUX_CH_DATA1, \
+						       _XELPDP_USBC2_AUX_CH_DATA1, \
+						       _XELPDP_USBC3_AUX_CH_DATA1, \
+						       _XELPDP_USBC4_AUX_CH_DATA1) + (i) * 4)
+
 #define   DP_AUX_CH_CTL_SEND_BUSY	    (1 << 31)
 #define   DP_AUX_CH_CTL_DONE		    (1 << 30)
 #define   DP_AUX_CH_CTL_INTERRUPT	    (1 << 29)
-- 
2.25.1


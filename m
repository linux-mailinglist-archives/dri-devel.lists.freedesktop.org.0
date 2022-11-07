Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FF61EBAC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197F10E206;
	Mon,  7 Nov 2022 07:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7135A10E204;
 Mon,  7 Nov 2022 07:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805619; x=1699341619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4fKwezadCgeqlHMuPkiK8kyR22ma2YAggmI1tnhUzNk=;
 b=Q8vlPQ4yE8Zhh3A+TI0Qt1pu3ViYQAtlqugbWLd0CgbChyEi9JOg8KAX
 z2PP78jX2mSP6C3UnXaafJFwZ3U5By19eEvsYoTzoDrYgHtRBl9z7KG7g
 3M4wKeeJhVquazTaQnFA71Mu/0xa/hFdILL3GmiiYnZXogPn+TVmosEUu
 4CIEylWV+hwaHYav+/yRpF4ZVOHbNANafZOHN4AmzqSKfj7nBtBNFKzFX
 B/uMOktTuPlYvNKzds4s+/R5Irs2di3df+Wq0msF6m5WP4Ue/nGzd7eu6
 sCpv7O0xIOxLjmlTkmWuDQ6tJqbTNE32Mmmop5trpk8NkP9/4qP8gQIkk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463341"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463341"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767249"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767249"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:16 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 04/15] drm/i915/hdmi21/mtl: Parse frl max link rate from vbt
Date: Mon,  7 Nov 2022 12:50:34 +0530
Message-Id: <20221107072045.628895-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vandita Kulkarni <vandita.kulkarni@intel.com>

From the max_frl_rate field of vbt parse the maxfrl_rate.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     | 51 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h     |  1 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  7 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index c2987f2c2b2e..14008fc4c9bf 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2621,6 +2621,42 @@ static bool is_port_valid(struct drm_i915_private *i915, enum port port)
 	return true;
 }
 
+static int _intel_bios_hdmi_max_frl_rate(const struct intel_bios_encoder_data *devdata)
+{
+	struct drm_i915_private *i915 = devdata->i915;
+
+	if (i915->display.vbt.version >= 237 &&
+	    devdata->child.hdmi_max_frl_rate_valid) {
+		switch (devdata->child.hdmi_max_frl_rate) {
+		default:
+		case HDMI_MAX_FRL_RATE_PLATFORM:
+			drm_dbg_kms(&i915->drm, "HDMI2.1 is limited to support only TMDS modes\n");
+			return 0;
+		case HDMI_MAX_FRL_RATE_3G:
+			return 3000000;
+		case HDMI_MAX_FRL_RATE_6G:
+			return 6000000;
+		case HDMI_MAX_FRL_RATE_8G:
+			return 8000000;
+		case HDMI_MAX_FRL_RATE_10G:
+			return 10000000;
+		case HDMI_MAX_FRL_RATE_12G:
+			return 12000000;
+		}
+	}
+
+	/*
+	 * When hdmi_max_frl_rate_valid is 0
+	 * Don't consider the hdmi_max_frl_rate for
+	 * limiting the FrlRates on HDMI2.1 displays
+	 */
+	if (i915->display.vbt.version >= 237 &&
+	    IS_METEORLAKE(i915))
+		return 12000000;
+
+	return 0;
+}
+
 static void print_ddi_port(const struct intel_bios_encoder_data *devdata,
 			   enum port port)
 {
@@ -2628,6 +2664,7 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata,
 	const struct child_device_config *child = &devdata->child;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_crt, supports_typec_usb, supports_tbt;
 	int dp_boost_level, dp_max_link_rate, hdmi_boost_level, hdmi_level_shift, max_tmds_clock;
+	int hdmi_max_frl_rate;
 
 	is_dvi = intel_bios_encoder_supports_dvi(devdata);
 	is_dp = intel_bios_encoder_supports_dp(devdata);
@@ -2677,6 +2714,12 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata,
 			    "Port %c VBT DP max link rate: %d\n",
 			    port_name(port), dp_max_link_rate);
 
+	hdmi_max_frl_rate = _intel_bios_hdmi_max_frl_rate(devdata);
+	if (hdmi_max_frl_rate)
+		drm_dbg_kms(&i915->drm,
+			    "VBT HDMI max frl rate for port %c: %d\n",
+			    port_name(port), hdmi_max_frl_rate);
+
 	/*
 	 * FIXME need to implement support for VBT
 	 * vswing/preemph tables should this ever trigger.
@@ -3679,6 +3722,14 @@ int intel_bios_max_tmds_clock(struct intel_encoder *encoder)
 	return _intel_bios_max_tmds_clock(devdata);
 }
 
+int intel_bios_hdmi_max_frl_rate(struct intel_encoder *encoder)
+{
+	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	const struct intel_bios_encoder_data *devdata = i915->display.vbt.ports[encoder->port];
+
+	return _intel_bios_hdmi_max_frl_rate(devdata);
+}
+
 /* This is an index in the HDMI/DVI DDI buffer translation table, or -1 */
 int intel_bios_hdmi_level_shift(struct intel_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index e375405a7828..e3a8e8198881 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -273,5 +273,6 @@ bool intel_bios_encoder_supports_typec_usb(const struct intel_bios_encoder_data
 bool intel_bios_encoder_supports_tbt(const struct intel_bios_encoder_data *devdata);
 int intel_bios_encoder_dp_boost_level(const struct intel_bios_encoder_data *devdata);
 int intel_bios_encoder_hdmi_boost_level(const struct intel_bios_encoder_data *devdata);
+int intel_bios_hdmi_max_frl_rate(struct intel_encoder *encoder);
 
 #endif /* _INTEL_BIOS_H_ */
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index a9f44abfc9fc..f7ecb82b0b3f 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -320,6 +320,13 @@ struct bdb_general_features {
 #define HDMI_MAX_DATA_RATE_340		4			/* 249+ */
 #define HDMI_MAX_DATA_RATE_300		5			/* 249+ */
 
+#define HDMI_MAX_FRL_RATE_PLATFORM	0			/* 237 */
+#define HDMI_MAX_FRL_RATE_3G		1			/* 237 */
+#define HDMI_MAX_FRL_RATE_6G		2			/* 237 */
+#define HDMI_MAX_FRL_RATE_8G		3			/* 237 */
+#define HDMI_MAX_FRL_RATE_10G		4			/* 237 */
+#define HDMI_MAX_FRL_RATE_12G		5			/* 237 */
+
 #define LEGACY_CHILD_DEVICE_CONFIG_SIZE		33
 
 /* DDC Bus DDI Type 155+ */
-- 
2.25.1


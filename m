Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDF27A966
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 10:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75DA6E3C1;
	Mon, 28 Sep 2020 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A456E3B2;
 Mon, 28 Sep 2020 08:17:40 +0000 (UTC)
IronPort-SDR: zofc/KB7ADY38hBXh97FiXxD6eYE7J0/njD95I/NoMYOMTD2quUvTDckgM1u/pULUSzHDozDwy
 73w88F9mMHYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="226107881"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="226107881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 01:17:40 -0700
IronPort-SDR: exQE82wr/osaiut7OEpShbNm+1m7/wafk/cNqQ184l8U82y4U9ztthXd1kPFdvcF4wjre5ilYL
 t2VFUlQgtISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="414908925"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2020 01:17:36 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, james.ausmus@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Subject: [PATCH 2/2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Date: Mon, 28 Sep 2020 13:39:31 +0530
Message-Id: <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

JSL has update in vswing table for eDP

BSpec: 21257
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4d06178cd76c..fa08463bcf2e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -582,6 +582,34 @@ static const struct cnl_ddi_buf_trans ehl_combo_phy_ddi_translations_dp[] = {
 	{ 0x6, 0x7F, 0x3F, 0x00, 0x00 },	/* 900   900      0.0   */
 };
 
+static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp_hbr[] = {
+						/* NT mV Trans mV db    */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
+	{ 0x8, 0x7F, 0x38, 0x00, 0x07 },	/* 200   250      1.9   */
+	{ 0x1, 0x7F, 0x33, 0x00, 0x0C },	/* 200   300      3.5   */
+	{ 0xA, 0x35, 0x36, 0x00, 0x09 },	/* 200   350      4.9   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
+	{ 0x1, 0x7F, 0x38, 0x00, 0x07 },	/* 250   300      1.6   */
+	{ 0xA, 0x35, 0x35, 0x00, 0x0A },	/* 250   350      2.9   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
+	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
+};
+
+static const struct cnl_ddi_buf_trans jsl_combo_phy_ddi_translations_edp_hbr2[] = {
+						/* NT mV Trans mV db    */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   200      0.0   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 200   250      1.9   */
+	{ 0x1, 0x7F, 0x3D, 0x00, 0x02 },	/* 200   300      3.5   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 200   350      4.9   */
+	{ 0x8, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   250      0.0   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 250   300      1.6   */
+	{ 0xA, 0x35, 0x3A, 0x00, 0x05 },	/* 250   350      2.9   */
+	{ 0x1, 0x7F, 0x3F, 0x00, 0x00 },	/* 300   300      0.0   */
+	{ 0xA, 0x35, 0x38, 0x00, 0x07 },	/* 300   350      1.3   */
+	{ 0xA, 0x35, 0x3F, 0x00, 0x00 },	/* 350   350      0.0   */
+};
+
 struct icl_mg_phy_ddi_buf_trans {
 	u32 cri_txdeemph_override_11_6;
 	u32 cri_txdeemph_override_5_0;
@@ -1069,7 +1097,6 @@ icl_get_mg_buf_trans(struct intel_encoder *encoder, int type, int rate,
 	*n_entries = ARRAY_SIZE(icl_mg_phy_ddi_translations_rbr_hbr);
 	return icl_mg_phy_ddi_translations_rbr_hbr;
 }
-
 static const struct cnl_ddi_buf_trans *
 ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
 			int *n_entries)
@@ -1098,6 +1125,34 @@ ehl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
 	}
 }
 
+static const struct cnl_ddi_buf_trans *
+jsl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
+			int *n_entries)
+{
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+
+	switch (type) {
+	case INTEL_OUTPUT_HDMI:
+		*n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_hdmi);
+		return icl_combo_phy_ddi_translations_hdmi;
+	case INTEL_OUTPUT_EDP:
+		if (dev_priv->vbt.edp.low_vswing) {
+			if (rate > 270000) {
+				*n_entries = ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr2);
+				return jsl_combo_phy_ddi_translations_edp_hbr2;
+			} else {
+				*n_entries = ARRAY_SIZE(jsl_combo_phy_ddi_translations_edp_hbr);
+				return jsl_combo_phy_ddi_translations_edp_hbr;
+			}
+		}
+		/* fall through */
+	default:
+		/* All combo DP and eDP ports that do not support low_vswing */
+		*n_entries = ARRAY_SIZE(icl_combo_phy_ddi_translations_dp_hbr2);
+		return icl_combo_phy_ddi_translations_dp_hbr2;
+	}
+}
+
 static const struct cnl_ddi_buf_trans *
 tgl_get_combo_buf_trans(struct intel_encoder *encoder, int type, int rate,
 			int *n_entries)
@@ -2265,9 +2320,12 @@ static u8 intel_ddi_dp_voltage_max(struct intel_dp *intel_dp)
 			tgl_get_dkl_buf_trans(encoder, encoder->type,
 					      intel_dp->link_rate, &n_entries);
 	} else if (INTEL_GEN(dev_priv) == 11) {
-		if (IS_ELKHARTLAKE(dev_priv))
+		if (IS_JASPERLAKE(dev_priv))
+			jsl_get_combo_buf_trans(encoder, encoder->type,
+					intel_dp->link_rate, &n_entries);
+		else if (IS_ELKHARTLAKE(dev_priv))
 			ehl_get_combo_buf_trans(encoder, encoder->type,
-						intel_dp->link_rate, &n_entries);
+					intel_dp->link_rate, &n_entries);
 		else if (intel_phy_is_combo(dev_priv, phy))
 			icl_get_combo_buf_trans(encoder, encoder->type,
 						intel_dp->link_rate, &n_entries);
@@ -2454,6 +2512,9 @@ static void icl_ddi_combo_vswing_program(struct intel_encoder *encoder,
 	if (INTEL_GEN(dev_priv) >= 12)
 		ddi_translations = tgl_get_combo_buf_trans(encoder, type, rate,
 							   &n_entries);
+	else if (IS_JASPERLAKE(dev_priv))
+		ddi_translations = jsl_get_combo_buf_trans(encoder, type, rate,
+							   &n_entries);
 	else if (IS_ELKHARTLAKE(dev_priv))
 		ddi_translations = ehl_get_combo_buf_trans(encoder, type, rate,
 							   &n_entries);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064037B2DA8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CEE10E6D0;
	Fri, 29 Sep 2023 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0510A10E6CE;
 Fri, 29 Sep 2023 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975468; x=1727511468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kDRqsOLUfAsQerIn/yFF/BmNNogU/1Jey16CPzf0ZDE=;
 b=l1G+3Bex2sCPH+xMuuoQYZ3pfmP2HR5LykUw3CFwkqGF9yzHIcrcQL+R
 Pof/ObXKTqk2UiVQCORl/PHFs26D7AeDfY4u0Ld30b0RaY0R1YIj1OU03
 RsKfzfkG15AZPi4se9j+l54JqJW/z4jOJ2x9eTaCPONETTzdWIxAgWacc
 muQ/7bGm1Wa+IVFyCczp0tm5jNEpLQX2seYpMkDQ0YSocDacS8eCIp1MG
 wVeNBTxHEglP40eIY1jFWzJav2zB7BZ6Rtz/nHgkNnzBqNSzo3+xR7cIS
 AGYZvpk9uqgYN7sR12Lv6jbql0O7QfcMEevnpQyJcnMvA2XcVw4qIO1Xm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379520285"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="379520285"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815517428"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="815517428"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 00:19:19 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/dsc/mtl: Add support for fractional bpp
Date: Fri, 29 Sep 2023 12:43:19 +0530
Message-Id: <20230929071322.945521-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230929071322.945521-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 swati2.sharma@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 mripard@kernel.org, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vandita Kulkarni <vandita.kulkarni@intel.com>

Consider the fractional bpp while reading the qp values.

v2: Use helpers for fractional, integral bits of bits_per_pixel. (Suraj)

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 .../gpu/drm/i915/display/intel_qp_tables.c    |  3 ---
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 25 +++++++++++++++----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.c b/drivers/gpu/drm/i915/display/intel_qp_tables.c
index 543cdc46aa1d..600c815e37e4 100644
--- a/drivers/gpu/drm/i915/display/intel_qp_tables.c
+++ b/drivers/gpu/drm/i915/display/intel_qp_tables.c
@@ -34,9 +34,6 @@
  * These qp tables are as per the C model
  * and it has the rows pointing to bpps which increment
  * in steps of 0.5
- * We do not support fractional bpps as of today,
- * hence we would skip the fractional bpps during
- * our references for qp calclulations.
  */
 static const u8 rc_range_minqp444_8bpc[DSC_NUM_BUF_RANGES][RC_RANGE_QP444_8BPC_MAX_NUM_BPP] = {
 	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 142c886f4776..e9f90c2c2ec4 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -78,8 +78,8 @@ intel_vdsc_set_min_max_qp(struct drm_dsc_config *vdsc_cfg, int buf,
 static void
 calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 {
+	int bpp = intel_fractional_bpp_from_x16(vdsc_cfg->bits_per_pixel);
 	int bpc = vdsc_cfg->bits_per_component;
-	int bpp = vdsc_cfg->bits_per_pixel >> 4;
 	int qp_bpc_modifier = (bpc - 8) * 2;
 	int uncompressed_bpg_rate;
 	int first_line_bpg_offset;
@@ -149,7 +149,13 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 		static const s8 ofs_und8[] = {
 			10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
 		};
-
+		/*
+		 * For 420 format since bits_per_pixel (bpp) is set to target bpp * 2,
+		 * QP table values for target bpp 4.0 to 4.4375 (rounded to 4.0) are
+		 * actually for bpp 8 to 8.875 (rounded to 4.0 * 2 i.e 8).
+		 * Similarly values for target bpp 4.5 to 4.8375 (rounded to 4.5)
+		 * are for bpp 9 to 9.875 (rounded to 4.5 * 2 i.e 9), and so on.
+		 */
 		bpp_i  = bpp - 8;
 		for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
 			u8 range_bpg_offset;
@@ -179,6 +185,9 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 				range_bpg_offset & DSC_RANGE_BPG_OFFSET_MASK;
 		}
 	} else {
+		/* fractional bpp part * 10000 (for precision up to 4 decimal places) */
+		int fractional_bits = intel_fractional_bpp_decimal(vdsc_cfg->bits_per_pixel);
+
 		static const s8 ofs_und6[] = {
 			0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
 		};
@@ -192,7 +201,14 @@ calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 			10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
 		};
 
-		bpp_i  = (2 * (bpp - 6));
+		/*
+		 * QP table rows have values in increment of 0.5.
+		 * So 6.0 bpp to 6.4375 will have index 0, 6.5 to 6.9375 will have index 1,
+		 * and so on.
+		 * 0.5 fractional part with 4 decimal precision becomes 5000
+		 */
+		bpp_i  = ((bpp - 6) + (fractional_bits < 5000 ? 0 : 1));
+
 		for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
 			u8 range_bpg_offset;
 
@@ -280,8 +296,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	/* Gen 11 does not support VBR */
 	vdsc_cfg->vbr_enable = false;
 
-	/* Gen 11 only supports integral values of bpp */
-	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
+	vdsc_cfg->bits_per_pixel = pipe_config->dsc.compressed_bpp_x16;
 
 	/*
 	 * According to DSC 1.2 specs in Section 4.1 if native_420 is set
-- 
2.25.1


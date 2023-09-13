Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39D79DFBD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C5410E460;
	Wed, 13 Sep 2023 06:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042CB10E3D7;
 Wed, 13 Sep 2023 06:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585516; x=1726121516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0odbL+xp263LT5oRLoQNalNalzJc6+Tuwy/r6oSn/M=;
 b=oIFEIlUW9RAwbCw/NocIcV71nluVh2wAsD+km7NSl6VF8yi7AzJsABWe
 8MYjlpnos7vZxbL1NE7bb45SCchtZlUNQ3bnKJCZex7WjUpzdI7fipwQT
 eHym7RdUoVettwFRglC4HzP300kki8Mq41Dye8iUs+pJyJytxZ2wP/PCL
 PCqmTPS5Wnz8JZrhgkiDX2XvPlxIVayd9eqdvV5WmHrFMbiRkTo+OnV7g
 4Ep2QbZtlnNos3nYkjgb4Ffezn5KAXgTrt9L/ktbIfHe26n0X3WFvX53V
 4tlitBJIVoy/hV81/XNPN4YTNbl+GIxiec6Y2OaTkVxVdVKIjTQOhDTfi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377482575"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377482575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693741733"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693741733"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 23:11:39 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/dsc/mtl: Add support for fractional bpp
Date: Wed, 13 Sep 2023 11:36:03 +0530
Message-Id: <20230913060606.1105349-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vandita Kulkarni <vandita.kulkarni@intel.com>

Consider the fractional bpp while reading the qp values.

v2: Use helpers for fractional, integral bits of bits_per_pixel. (Suraj)

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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
index 1bd9391a6f5a..2c19078fbce8 100644
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


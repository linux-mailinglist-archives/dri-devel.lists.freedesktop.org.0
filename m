Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400FA91C402
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6355910ECAA;
	Fri, 28 Jun 2024 16:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UguyX8NQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECDE10ECA7;
 Fri, 28 Jun 2024 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593088; x=1751129088;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=R/rbOnNaX6/wc2J7UbzA06+CFjN/lsJAUYOq5M8wqIQ=;
 b=UguyX8NQciiGrcVYKGbdlgSWsgjqrDcKYKT5YKzrcXXkVzXkVCbJ0teH
 Q+8I9npEXH3Gu97S2SO4T3acU3MAAMKSroAXIkVcwlQ4RLYgAlG/RVxpb
 wJiQuPRmS9cqeTbAA/lvf5jJG7d0wzMUXCtOIRe+p2YrSEOEwawU4HIsg
 Dux+2B988YrBThiulyTFPBzUmsTR1JBqlaboAx0is4pxISlxBZQEOVuBs
 roSRKDl6y5TsCABezzvWwPWFarAzFL+Ff7B/1sxkwuqRh60sQbUEw37/2
 4u4K3iTi3m/Tlw7VTZSZIPM/oaCFFMDJchz43Nm1FSGGwtTRCVi/XyDBd w==;
X-CSE-ConnectionGUID: YD/T6WrMT/q9F6M98LQyKQ==
X-CSE-MsgGUID: SHi4ZRmqRF+zd+WbYFgLqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620067"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:48 -0700
X-CSE-ConnectionGUID: zbcmJjYSR12FbQ0Cy2laTw==
X-CSE-MsgGUID: t9gjXuLLTNai2iukyVyhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519914"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:47 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/display/dsc: Add a helper to dump the DSC
 configuration
Date: Fri, 28 Jun 2024 19:44:43 +0300
Message-ID: <20240628164451.1177612-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240628164451.1177612-1-imre.deak@intel.com>
References: <20240628164451.1177612-1-imre.deak@intel.com>
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

Add a helper to dump the Display Stream Compression configuration, taken
into use in the i915 driver by a later patch.

v2:
- Rebase on the s/DRM_X16/FXP_Q4 change.
- s/DSC configration/DSC configuration in the function documentation.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 91 ++++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |  3 +
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 4424380c6cb63..6900f4dac520d 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -14,6 +14,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
 /**
@@ -1472,3 +1473,93 @@ u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
 	return 2 << (dsc->bits_per_component - 8);
 }
 EXPORT_SYMBOL(drm_dsc_flatness_det_thresh);
+
+static void drm_dsc_dump_config_main_params(struct drm_printer *p, int indent,
+					    const struct drm_dsc_config *cfg)
+{
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: version: %d.%d, picture: w=%d, h=%d, slice: count=%d, w=%d, h=%d, size=%d\n",
+			  cfg->dsc_version_major, cfg->dsc_version_minor,
+			  cfg->pic_width, cfg->pic_height,
+			  cfg->slice_count, cfg->slice_width, cfg->slice_height, cfg->slice_chunk_size);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: mode: block-pred=%s, vbr=%s, rgb=%s, simple-422=%s, native-422=%s, native-420=%s\n",
+			  str_yes_no(cfg->block_pred_enable), str_yes_no(cfg->vbr_enable),
+			  str_yes_no(cfg->convert_rgb),
+			  str_yes_no(cfg->simple_422), str_yes_no(cfg->native_422), str_yes_no(cfg->native_420));
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: color-depth: uncompressed-bpc=%d, compressed-bpp=" FXP_Q4_FMT " line-buf-bpp=%d\n",
+			  cfg->bits_per_component, FXP_Q4_ARGS(cfg->bits_per_pixel), cfg->line_buf_depth);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-model: size=%d, bits=%d, mux-word-size: %d, initial-delays: xmit=%d, dec=%d\n",
+			  cfg->rc_model_size, cfg->rc_bits, cfg->mux_word_size,
+			  cfg->initial_xmit_delay, cfg->initial_dec_delay);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: offsets: initial=%d, final=%d, slice-bpg=%d\n",
+			  cfg->initial_offset, cfg->final_offset, cfg->slice_bpg_offset);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: line-bpg-offsets: first=%d, non-first=%d, second=%d, non-second=%d, second-adj=%d\n",
+			  cfg->first_line_bpg_offset, cfg->nfl_bpg_offset,
+			  cfg->second_line_bpg_offset, cfg->nsl_bpg_offset, cfg->second_line_offset_adj);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-tgt-offsets: low=%d, high=%d, rc-edge-factor: %d, rc-quant-incr-limits: [0]=%d, [1]=%d\n",
+			  cfg->rc_tgt_offset_low, cfg->rc_tgt_offset_high,
+			  cfg->rc_edge_factor, cfg->rc_quant_incr_limit0, cfg->rc_quant_incr_limit1);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: initial-scale: %d, scale-intervals: increment=%d, decrement=%d\n",
+			  cfg->initial_scale_value, cfg->scale_increment_interval, cfg->scale_decrement_interval);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: flatness: min-qp=%d, max-qp=%d\n",
+			  cfg->flatness_min_qp, cfg->flatness_max_qp);
+}
+
+static void drm_dsc_dump_config_rc_params(struct drm_printer *p, int indent,
+					  const struct drm_dsc_config *cfg)
+{
+	const u16 *bt = cfg->rc_buf_thresh;
+	const struct drm_dsc_rc_range_parameters *rp = cfg->rc_range_params;
+
+	BUILD_BUG_ON(ARRAY_SIZE(cfg->rc_buf_thresh) != 14);
+	BUILD_BUG_ON(ARRAY_SIZE(cfg->rc_range_params) != 15);
+
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-level:         0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14\n");
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-buf-thresh:  %3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d\n",
+			  bt[0], bt[1], bt[2],  bt[3],  bt[4],  bt[5], bt[6], bt[7],
+			  bt[8], bt[9], bt[10], bt[11], bt[12], bt[13]);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-min-qp:      %3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d\n",
+			  rp[0].range_min_qp,  rp[1].range_min_qp,  rp[2].range_min_qp,  rp[3].range_min_qp,
+			  rp[4].range_min_qp,  rp[5].range_min_qp,  rp[6].range_min_qp,  rp[7].range_min_qp,
+			  rp[8].range_min_qp,  rp[9].range_min_qp,  rp[10].range_min_qp, rp[11].range_min_qp,
+			  rp[12].range_min_qp, rp[13].range_min_qp, rp[14].range_min_qp);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-max-qp:      %3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d\n",
+			  rp[0].range_max_qp,  rp[1].range_max_qp,  rp[2].range_max_qp,  rp[3].range_max_qp,
+			  rp[4].range_max_qp,  rp[5].range_max_qp,  rp[6].range_max_qp,  rp[7].range_max_qp,
+			  rp[8].range_max_qp,  rp[9].range_max_qp,  rp[10].range_max_qp, rp[11].range_max_qp,
+			  rp[12].range_max_qp, rp[13].range_max_qp, rp[14].range_max_qp);
+	drm_printf_indent(p, indent,
+			  "dsc-cfg: rc-bpg-offset:  %3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d,%3d\n",
+			  rp[0].range_bpg_offset,  rp[1].range_bpg_offset,  rp[2].range_bpg_offset,  rp[3].range_bpg_offset,
+			  rp[4].range_bpg_offset,  rp[5].range_bpg_offset,  rp[6].range_bpg_offset,  rp[7].range_bpg_offset,
+			  rp[8].range_bpg_offset,  rp[9].range_bpg_offset,  rp[10].range_bpg_offset, rp[11].range_bpg_offset,
+			  rp[12].range_bpg_offset, rp[13].range_bpg_offset, rp[14].range_bpg_offset);
+}
+
+/**
+ * drm_dsc_dump_config - Dump the provided DSC configuration
+ * @p: The printer used for output
+ * @indent: Tab indentation level (max 5)
+ * @cfg: DSC configuration to print
+ *
+ * Print the provided DSC configuration in @cfg.
+ */
+void drm_dsc_dump_config(struct drm_printer *p, int indent,
+			 const struct drm_dsc_config *cfg)
+{
+	drm_dsc_dump_config_main_params(p, indent, cfg);
+	drm_dsc_dump_config_rc_params(p, indent, cfg);
+}
+EXPORT_SYMBOL(drm_dsc_dump_config);
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 913aa20712322..2c2b9033f60f3 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -17,6 +17,8 @@ enum drm_dsc_params_type {
 	DRM_DSC_1_2_420,
 };
 
+struct drm_printer;
+
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
@@ -28,6 +30,7 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
 u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
 u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg);
+void drm_dsc_dump_config(struct drm_printer *p, int indent, const struct drm_dsc_config *cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
 
-- 
2.43.3


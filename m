Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616539091CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5620D10EE07;
	Fri, 14 Jun 2024 17:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdKBtFF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628BA10EE04;
 Fri, 14 Jun 2024 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386747; x=1749922747;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J0WSdqr/b4+F+YMoNkkOGHUCkrj+9arxfW/r4aga18M=;
 b=FdKBtFF4dg3XOxXawRqViJ6XhhiRkzGwb+9a2cjR8RLVZwQq7/TJvFOY
 fTW0Q+ORkGocu4sgGzG0AQit2C1FTanh7LXmDOoF6WX7skTH4XlUR8H7s
 Bc0u13TyIcVX43lWsmlQAoRo3dhHhge8ZsnIJPsYGLcN06s5H/GGHIBQ5
 K5acN5ASG0DQ7LC3rhvriuzZQfIj4E+N7YCfkYpYR66EW/irrDAXketIM
 NN+wWzFiymbC3odjwAx188StdlDhIbeCxeHMebok7sEYIT5ZWi2vJ5/U5
 tFhoF3t+ogCIiiANKu5ijA2K9B02eyr38kFStPIN/O1xnhvmghdqxb/8z A==;
X-CSE-ConnectionGUID: Q2fDOiwsTzudcUxaOEX4QA==
X-CSE-MsgGUID: lzdxyrUGSxqKo8lX3R3eew==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069304"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:06 -0700
X-CSE-ConnectionGUID: LlVmuTsjTqCWaN42nGQAWA==
X-CSE-MsgGUID: R3HrgygcQ9GLUVoK29t8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712431"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:04 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/display/dsc: Add a helper to dump the DSC
 configuration
Date: Fri, 14 Jun 2024 20:39:02 +0300
Message-ID: <20240614173911.3743172-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240614173911.3743172-1-imre.deak@intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
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

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 91 ++++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |  3 +
 2 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 4424380c6cb63..ef2237f2b8630 100644
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
+			  "dsc-cfg: color-depth: uncompressed-bpc=%d, compressed-bpp=" DRM_X16_FMT " line-buf-bpp=%d\n",
+			  cfg->bits_per_component, DRM_X16_ARGS(cfg->bits_per_pixel), cfg->line_buf_depth);
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
+ * Print the provided DSC configration in @cfg.
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


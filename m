Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EECC9E458
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5810E75F;
	Wed,  3 Dec 2025 08:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8euE9sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4B10E755;
 Wed,  3 Dec 2025 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751277; x=1796287277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9LHPN/FCPX49WTtpbes5drhr9K83RidCv59u6W792WE=;
 b=j8euE9schiSanHgb64HCsGDXIaTahB/NkcvBLIuPSi+acLVky1lg7wqD
 o8GMip7FA9IGWBCPc6qwp29jzFnzBBU3A1b4wNKZRLRwuT20frpF7R8N7
 eagtAcQNwCv61Nmg5MTnYo1O+s0p0F+W3zW+j4nmL+UVko8Kej8k7G8Ce
 Sx+OLBpoRXf0Aznjvmll+6qy3de4LRosj3xQoAcVUuBKJzSnp/eQ0IZXe
 HWQZQMpGQ00GmQUqfI0BBpDKLJX7otjjq+/zmiHNsepaY3bJOfsI6tzFJ
 4V8P4m9oWvgIrNwBiAJmEyUqQ+yT1+L7NQxBuO+Cxrkgg5ZdDQM23qkmX Q==;
X-CSE-ConnectionGUID: OyFzdyT1RD67PSPcc2J8EQ==
X-CSE-MsgGUID: trOHX1qlSjGxeoHJESZaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812211"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:41:16 -0800
X-CSE-ConnectionGUID: SaICBvx+SfCbpIvxYdBlgA==
X-CSE-MsgGUID: /l9WLgTLT7+Aw2vF3L9JzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945561"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:41:08 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 11/15] drm/i915/color: Program Pre-CSC registers
Date: Wed,  3 Dec 2025 14:22:07 +0530
Message-ID: <20251203085211.3663374-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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

Add callback to program Pre-CSC LUT for TGL and beyond

v2: Add DSB support
v3: Add support for single segment 1D LUT color op
v4:
- s/drm_color_lut_32/drm_color_lut32/ (Simon)
- Change commit message (Suraj)
- Improve comments (Suraj)
- Remove multisegmented programming, to be added later
- Remove dead code for SDR planes, add when needed

BSpec: 50411, 50412, 50413, 50414
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4ca359d68730..2a114d2964fa 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3943,6 +3943,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
 			   ctm_to_twos_complement(input[11], 0, 12));
 }
 
+static void
+xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
+				const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_plane_state *state = &plane_state->uapi;
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(display, plane)) {
+		lut_size = 128;
+
+		intel_de_write_dsb(display, dsb,
+				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++) {
+				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			/* TODO: Restrict to 0x7ffffff */
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   (1 << 24));
+			} while (i++ > 130);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   1 << 24);
+			} while (i++ < 130);
+		}
+
+		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	}
+}
+
+static void
+xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *plane_state)
+{
+	if (plane_state->hw.degamma_lut)
+		xelpd_program_plane_pre_csc_lut(dsb, plane_state);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3991,6 +4051,7 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.50.1


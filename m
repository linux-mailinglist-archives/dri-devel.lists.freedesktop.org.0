Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13EAF0F29
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E8710E6A7;
	Wed,  2 Jul 2025 09:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvyqlQzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69410E6CA;
 Wed,  2 Jul 2025 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447335; x=1782983335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tlK+o75J3dgwz4BODH4vfgX5XUSsbETtD6zi6LvRaww=;
 b=JvyqlQzZX0gOyKgYyLsOLwq805ObFmLC3f3AFCKBybKwfvSHQcrEpkog
 oMjV/D2FNnfMwfbgEtNcD4oYCOeaOZgLMq6uzvn+TEK37Yd30qOE0KcqR
 9OpltBEt1N5rzO8ax+Pg6UNCmdK9Yr4dEoyoGxTfuMzRfEiUZdiAan7sY
 rPkLKKC4RskVSfci5FNok2WG2r/Vk2OE++hD9cnQY94PFYkW1ozLcvxmc
 liCASUF9d5H0ibq5LUi8lNRubxHs38+CBYgL6dYcJBGOOy1HEO4LQt97o
 n90HeUT/Lq1ZQafktbAOawujcN3xjTnIYb5T2FOydlLG37V0tQTIO/XNE Q==;
X-CSE-ConnectionGUID: 1Iwq8Q6JRUaOjzNwdNo7FQ==
X-CSE-MsgGUID: HddB493dT8mmPC9kIsFYsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427230"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427230"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:54 -0700
X-CSE-ConnectionGUID: KOkLD/NuQb6/8Lk9iuCZig==
X-CSE-MsgGUID: fyckl9mpSnmUGmrBJOwSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536738"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:50 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Date: Wed,  2 Jul 2025 14:49:32 +0530
Message-ID: <20250702091936.3004854-21-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add callback for programming Pre-CSC LUT for TGL and beyond

v2: Add DSB support
v3: Add support for single segment 1D LUT color op

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index c7378af8fbdf..75981fe232bf 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3945,6 +3945,109 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
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
+	const struct drm_color_lut_32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
+	u32 i, lut_size;
+	bool is_single_seg = drm_color_lut_32_size(plane_state->hw.degamma_lut) == 128 ?
+			     true : false;
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
+				u32 lut_val = is_single_seg ?
+					  drm_color_lut_32_extract(pre_csc_lut[i].green, 24) :
+					  (pre_csc_lut[i].green & 0xffffff);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   lut_val);
+			}
+
+			/* Program the max register to clamp values > 1.0. */
+			/* ToDo: Restrict to 0x7ffffff*/
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+						   is_single_seg ? (1 << 24) :
+						   pre_csc_lut[i].green);
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
+	} else {
+		lut_size = 32;
+
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+				   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (pre_csc_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						   pre_csc_lut[i].green);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						   pre_csc_lut[i++].green);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write_dsb(display, dsb,
+						   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+						   1 << 16);
+			} while (i++ < 34);
+		}
+
+		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
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
@@ -4004,6 +4107,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
 	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
+	.load_plane_luts = xelpd_plane_load_luts,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.42.0


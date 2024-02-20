Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3585C7FA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0972110E557;
	Tue, 20 Feb 2024 21:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9ZfgtKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5030910E15C;
 Tue, 20 Feb 2024 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463903; x=1739999903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xskorStuFxaVHm51h13UjuY5OKbSm4sedAGllaVNlfE=;
 b=T9ZfgtKR0maIzQT5ucTVPoUSN+jbXlB93MaLyze/TrMQ9GcwPt9Fm9XE
 1mkThZMk8SlM2EY71WlwQqpp/DrwtLQbwIG0su3sesUTCT2y9A6GabqIj
 sfe8OCx5PnpwOtd1LJQi1v1sp3q9F8CaTrHr51xI2Ot7tq6Z7u6KKhWaQ
 4eB6VVG0mDYNn7rTMHxWzKDqSD+w+2ACOMNooAYPUlvF/YaSz5WaeGn4y
 TdgaWROTmZjEUdLuomfLZGPs2S2VMo0SPE48ejIbKdoIQyN/PkGp4wXee
 OKQPmEha2/b1vz3e5AYnLxCc0DtgJ+8hVP9NHrL9HE61DyNyMmUBoulHS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738642"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061574"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:21 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 01/21] drm/dp: Add drm_dp_max_dprx_data_rate()
Date: Tue, 20 Feb 2024 23:18:21 +0200
Message-Id: <20240220211841.448846-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Copy intel_dp_max_data_rate() to DRM core. It will be needed by a
follow-up DP tunnel patch, checking the maximum rate the DPRX (sink)
supports. Accordingly use the drm_dp_max_dprx_data_rate() name for
clarity. This patchset will also switch calling the new DRM function
in i915 instead of intel_dp_max_data_rate().

While at it simplify the function documentation/comments, removing
parts described already by drm_dp_bw_channel_coding_efficiency().

v2: (Ville)
- Remove max_link_rate_kbps.
- Simplify the function documentation.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 30 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8d6ce46471ae6..d046dfa79504f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4055,3 +4055,33 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
 		return 800000;
 }
 EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
+
+/**
+ * drm_dp_max_dprx_data_rate - Get the max data bandwidth of a DPRX sink
+ * @max_link_rate: max DPRX link rate in 10kbps units
+ * @max_lanes: max DPRX lane count
+ *
+ * Given a link rate and lanes, get the data bandwidth.
+ *
+ * Data bandwidth is the actual payload rate, which depends on the data
+ * bandwidth efficiency and the link rate.
+ *
+ * Note that protocol layers above the DPRX link level considered here can
+ * further limit the maximum data rate. Such layers are the MST topology (with
+ * limits on the link between the source and first branch device as well as on
+ * the whole MST path until the DPRX link) and (Thunderbolt) DP tunnels -
+ * which in turn can encapsulate an MST link with its own limit - with each
+ * SST or MST encapsulated tunnel sharing the BW of a tunnel group.
+ *
+ * Returns the maximum data rate in kBps units.
+ */
+int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes)
+{
+	int ch_coding_efficiency =
+		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(max_link_rate));
+
+	return DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate * 10 * max_lanes,
+					      ch_coding_efficiency),
+				  1000000 * 8);
+}
+EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d02014a87f127..65dae9a9f2fb6 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -812,4 +812,6 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int bpp_x16, unsigned long flags);
 int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 
+int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.39.2


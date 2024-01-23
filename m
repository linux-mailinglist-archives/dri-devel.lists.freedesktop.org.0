Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3E838BCF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBFA10E767;
	Tue, 23 Jan 2024 10:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A450310E766;
 Tue, 23 Jan 2024 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005718; x=1737541718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMNVZr1oLQvtaKFI0D5yAGpyJxKRX9F/sWObsoGIBLg=;
 b=Y5p51JeeOQRPiqaOItrD0tE/URwIqG76tncIjZBpPEnUlHysf2rL4d+/
 ieUUBcz1D9XGGSzETpjCUod/l62ZcsUA9tWEAv7zZRgMm5domCdIjHkva
 Zsycxbq7lOGtMEmH/IWymoaIvxzmsnDgEx+rPdj3kechPGg3gsps49FUB
 UJ+K3rjvuOLwcSFJRaBC/gm0ou3JLIIlHUnL45yngSOfekhQQuPk7Rd73
 FvQAiePbFYfHlwP1YfD4kbFxZVN10fBfyRUBHVvPJcobCpiDsMCCNKSg7
 hIjtCEGeuqj8WtEzpexDUVM+bVludb4AvG+qQnYFX7TLiF3UZKm6YE/g/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134091"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134091"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283360"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283360"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:37 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/19] drm/dp: Add drm_dp_max_dprx_data_rate()
Date: Tue, 23 Jan 2024 12:28:32 +0200
Message-Id: <20240123102850.390126-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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

Copy intel_dp_max_data_rate() to DRM core. It will be needed by a
follow-up DP tunnel patch, checking the maximum rate the DPRX (sink)
supports. Accordingly use the drm_dp_max_dprx_data_rate() name for
clarity. This patchset will also switch calling the new DRM function
in i915 instead of intel_dp_max_data_rate().

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 58 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b1ca3a1100dab..24911243d4d3a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4058,3 +4058,61 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
 		return 800000;
 }
 EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
+
+/*
+ * Given a link rate and lanes, get the data bandwidth.
+ *
+ * Data bandwidth is the actual payload rate, which depends on the data
+ * bandwidth efficiency and the link rate.
+ *
+ * For 8b/10b channel encoding, SST and non-FEC, the data bandwidth efficiency
+ * is 80%. For example, for a 1.62 Gbps link, 1.62*10^9 bps * 0.80 * (1/8) =
+ * 162000 kBps. With 8-bit symbols, we have 162000 kHz symbol clock. Just by
+ * coincidence, the port clock in kHz matches the data bandwidth in kBps, and
+ * they equal the link bit rate in Gbps multiplied by 100000. (Note that this no
+ * longer holds for data bandwidth as soon as FEC or MST is taken into account!)
+ *
+ * For 128b/132b channel encoding, the data bandwidth efficiency is 96.71%. For
+ * example, for a 10 Gbps link, 10*10^9 bps * 0.9671 * (1/8) = 1208875
+ * kBps. With 32-bit symbols, we have 312500 kHz symbol clock. The value 1000000
+ * does not match the symbol clock, the port clock (not even if you think in
+ * terms of a byte clock), nor the data bandwidth. It only matches the link bit
+ * rate in units of 10000 bps.
+ *
+ * Note that protocol layers above the DPRX link level considered here can
+ * further limit the maximum data rate. Such layers are the MST topology (with
+ * limits on the link between the source and first branch device as well as on
+ * the whole MST path until the DPRX link) and (Thunderbolt) DP tunnels -
+ * which in turn can encapsulate an MST link with its own limit - with each
+ * SST or MST encapsulated tunnel sharing the BW of a tunnel group.
+ *
+ * TODO: Add support for querying the max data rate with the above limits as
+ * well.
+ *
+ * Returns the maximum data rate in kBps units.
+ */
+int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes)
+{
+	int ch_coding_efficiency =
+		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(max_link_rate));
+	int max_link_rate_kbps = max_link_rate * 10;
+
+	/*
+	 * UHBR rates always use 128b/132b channel encoding, and have
+	 * 97.71% data bandwidth efficiency. Consider max_link_rate the
+	 * link bit rate in units of 10000 bps.
+	 */
+	/*
+	 * Lower than UHBR rates always use 8b/10b channel encoding, and have
+	 * 80% data bandwidth efficiency for SST non-FEC. However, this turns
+	 * out to be a nop by coincidence:
+	 *
+	 *	int max_link_rate_kbps = max_link_rate * 10;
+	 *	max_link_rate_kbps = DIV_ROUND_DOWN_ULL(max_link_rate_kbps * 8, 10);
+	 *	max_link_rate = max_link_rate_kbps / 8;
+	 */
+	return DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate_kbps * max_lanes,
+					      ch_coding_efficiency),
+				  1000000 * 8);
+}
+EXPORT_SYMBOL(drm_dp_max_dprx_data_rate);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 863b2e7add29e..454ae7517419a 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -813,4 +813,6 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int bpp_x16, unsigned long flags);
 int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 
+int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.39.2


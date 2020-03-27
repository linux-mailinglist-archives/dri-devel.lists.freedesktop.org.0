Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F78195751
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 13:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681C06EA13;
	Fri, 27 Mar 2020 12:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697326EA13;
 Fri, 27 Mar 2020 12:42:52 +0000 (UTC)
IronPort-SDR: kAuOYZT33VorWvH9wnUtUJUYU+gdsezqaYxD/mmLKLRZAGKBHyK4Nu8ApFRfZJE+37fom3FzyR
 KuLpwk70pd+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:51 -0700
IronPort-SDR: dPiewRiBaftbZM9YK8A3r+XY6nDZb0ShRdNDvqLpcEjy7hvEvBWs0K9rGUqfr2gDwr3gBbt1ko
 4Xqj9O/sVjmQ==
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="421091109"
Received: from defretin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 3/7] drm/amd/display: use drm_dsc_dp_rc_buffer_size()
 to get rc buffer size
Date: Fri, 27 Mar 2020 14:42:25 +0200
Message-Id: <20200327124229.26461-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327124229.26461-1-jani.nikula@intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Manasi Navare <manasi.d.navare@intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new drm_dsc_dp_rc_buffer_size() helper to simplify rc buffer
size computation. No functional changes.

Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 37 ++++-----------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 87d682d25278..290acff273ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -85,31 +85,6 @@ static uint32_t dc_dsc_bandwidth_in_kbps_from_timing(
 
 }
 
-static bool dsc_buff_block_size_from_dpcd(int dpcd_buff_block_size, int *buff_block_size)
-{
-
-	switch (dpcd_buff_block_size) {
-	case DP_DSC_RC_BUF_BLK_SIZE_1:
-		*buff_block_size = 1024;
-		break;
-	case DP_DSC_RC_BUF_BLK_SIZE_4:
-		*buff_block_size = 4 * 1024;
-		break;
-	case DP_DSC_RC_BUF_BLK_SIZE_16:
-		*buff_block_size = 16 * 1024;
-		break;
-	case DP_DSC_RC_BUF_BLK_SIZE_64:
-		*buff_block_size = 64 * 1024;
-		break;
-	default: {
-			dm_error("%s: DPCD DSC buffer size not recognized.\n", __func__);
-			return false;
-		}
-	}
-
-	return true;
-}
-
 
 static bool dsc_line_buff_depth_from_dpcd(int dpcd_line_buff_bit_depth, int *line_buff_bit_depth)
 {
@@ -773,14 +748,16 @@ bool dc_dsc_parse_dsc_dpcd(const struct dc *dc, const uint8_t *dpcd_dsc_basic_da
 	dsc_sink_caps->dsc_version = dpcd_dsc_basic_data[DP_DSC_REV - DP_DSC_SUPPORT];
 
 	{
-		int buff_block_size;
-		int buff_size;
+		u8 buff_block_size = dpcd_dsc_basic_data[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT];
+		u8 buff_size = dpcd_dsc_basic_data[DP_DSC_RC_BUF_SIZE - DP_DSC_SUPPORT];
+		int size = drm_dsc_dp_rc_buffer_size(buff_block_size, buff_size);
 
-		if (!dsc_buff_block_size_from_dpcd(dpcd_dsc_basic_data[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT], &buff_block_size))
+		if (!size) {
+			dm_error("%s: DPCD DSC buffer size not recognized.\n", __func__);
 			return false;
+		}
 
-		buff_size = dpcd_dsc_basic_data[DP_DSC_RC_BUF_SIZE - DP_DSC_SUPPORT] + 1;
-		dsc_sink_caps->rc_buffer_size = buff_size * buff_block_size;
+		dsc_sink_caps->rc_buffer_size = size;
 	}
 
 	dsc_sink_caps->slice_caps1.raw = dpcd_dsc_basic_data[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

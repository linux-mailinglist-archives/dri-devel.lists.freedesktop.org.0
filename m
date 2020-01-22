Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37204145703
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC216F511;
	Wed, 22 Jan 2020 13:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48446F510;
 Wed, 22 Jan 2020 13:45:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 05:45:42 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="374926136"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 05:45:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/amd/display: use drm_dsc_dp_rc_buffer_size() to get
 rc buffer size
Date: Wed, 22 Jan 2020 15:45:09 +0200
Message-Id: <ad7548e3da4abc03f1dd05ff0d0c1ad926e3eebb.1579700414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579700414.git.jani.nikula@intel.com>
References: <cover.1579700414.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new drm_dsc_dp_rc_buffer_size() helper to simplify rc buffer
size computation. No functional changes.

Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 37 ++++-----------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 8b78fcbfe746..6dcfe049e5b8 100644
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
@@ -772,14 +747,16 @@ bool dc_dsc_parse_dsc_dpcd(const struct dc *dc, const uint8_t *dpcd_dsc_basic_da
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

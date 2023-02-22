Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93D69EE53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0DE10E3C2;
	Wed, 22 Feb 2023 05:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5310E3C1;
 Wed, 22 Feb 2023 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677043983; x=1708579983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gRBdfu8mjx4n0K/RpufzRuZXf1TxCLymhO6OPIDIvzw=;
 b=JZCXjgQrnT5UGZwCIMb48Y0r729BRS3KdJXUJ6X+VUpa32BfwPDbokVz
 KZCUPN3m76THH/qtlEcL3k0a/iV7+ihSmE+1OOdOb0edTksPoEZA+V9+7
 r1RWeSBvgueN7yiqK7gaeuFNvt8YcuydVgAQYCblKzrJ7otPkIHpwng5a
 nfARxeIxu2azr+A6s++A/xOR8mrdl5aHNKsfJLt1EsTG4R5OOEhqbguYr
 2deEN1kkliNyJwp48+1R1Szyxjm6daPnEfoXowRsemzYeeseezG+UTTJW
 V15m2YhZxQyjNbuWZ53twtdiwgz14bUsKTUnbpjOHIw7pTovfsLFuSkk2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332843192"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="332843192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 21:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="917450490"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="917450490"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 21:33:01 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/dp_helper: Add helper to check DSC support with given
 o/p format
Date: Wed, 22 Feb 2023 11:01:47 +0530
Message-Id: <20230222053153.3658345-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222053153.3658345-1-suraj.kandpal@intel.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Add helper to check if the DP sink supports DSC with the given
o/p format.

v2: Add documentation for the helper. (Uma Shankar)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp_helper.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..41da8eb4801e 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -194,6 +194,19 @@ drm_dp_dsc_sink_max_slice_width(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 		DP_DSC_SLICE_WIDTH_MULTIPLIER;
 }
 
+/*
+ * drm_dp_dsc_sink_supports_format() - check if sink supports DSC with given output format
+ * @dsc_dpcd : DSC-capability DPCDs of the sink
+ * @output_format: output_format which is to be checked
+ *
+ * Returns true if the sink supports DSC with the given output_format, false otherwise.
+ */
+static inline bool
+drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
+{
+	return dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & output_format;
+}
+
 /* Forward Error Correction Support on DP 1.4 */
 static inline bool
 drm_dp_sink_supports_fec(const u8 fec_capable)
-- 
2.25.1


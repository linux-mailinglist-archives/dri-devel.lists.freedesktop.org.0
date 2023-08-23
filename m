Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F0785748
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 13:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB92D10E410;
	Wed, 23 Aug 2023 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2252E10E080;
 Wed, 23 Aug 2023 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692791857; x=1724327857;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lilMg51HHiQc3R2SBaj6W2IomcGqfqmIQdFVK+Sq7OQ=;
 b=AxY6L5mpnNm2V4WGwAkNMZbPCGDzy6qjovUsjtTcItPGsEAgVkWAP201
 DtQnzSyVDYx2969X0RspCF41rv4TyJYu83sTQulqQ33aBekiJyU+dICoc
 qYFsvfmcbGr1Cabc4L7TzdGymcQOw2wzxMf9Gy5KqT5kT2MRmS4/AfYYb
 nk8JSTNRkjSH4pvWxYKhOnRK/YMkS9+xqFEYnVNATP0N5bU6DArJFBn0U
 KOsFLrHhGuvo0OsvtoHmK9smyg8FCalZ2YqA9JxLgvfj73h6WBPw70bOX
 kGlbCX7Pd+lyr8f9auPu93bv9yVq8vjup9wiMOoLHD960gUZ7xopE6xnC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354472215"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="354472215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="851019789"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="851019789"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:35 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
Date: Wed, 23 Aug 2023 17:24:24 +0530
Message-Id: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
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

As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
Apparently some panels that do support DSC, are not setting the bit for
8bpc.

So always assume 8bpc support by DSC decoder, when DSC is claimed to be
supported.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e6a78fd32380..0aa4ce17420c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2447,14 +2447,19 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 					 u8 dsc_bpc[3])
 {
 	int num_bpc = 0;
+
+	if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
+		return 0;
+
 	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
 
 	if (color_depth & DP_DSC_12_BPC)
 		dsc_bpc[num_bpc++] = 12;
 	if (color_depth & DP_DSC_10_BPC)
 		dsc_bpc[num_bpc++] = 10;
-	if (color_depth & DP_DSC_8_BPC)
-		dsc_bpc[num_bpc++] = 8;
+
+	/* A DP DSC Sink devices shall support 8 bpc. */
+	dsc_bpc[num_bpc++] = 8;
 
 	return num_bpc;
 }
-- 
2.40.1


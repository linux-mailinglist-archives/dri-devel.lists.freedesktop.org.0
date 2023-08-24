Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E996B78663F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250CC10E4DB;
	Thu, 24 Aug 2023 03:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E05810E4DB;
 Thu, 24 Aug 2023 03:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692849017; x=1724385017;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gfdooW3BWd+cwTfR8taRfX3TOSIpgbXsHr1jVz9nWag=;
 b=G1Ouhtht/65ASn1d92iBcw+ZJyl6xIL3kDvFBhDYK6u1tz/tT1MKZg1s
 KpmPPRKjpac5/mqNztHb0/t92N9ubRu6MPBV951EYC38/IdzyUN4MIiwS
 WYWWDIxQ4TyoKTt/+JSzqJU52MqfhI4n3a5buVBaX36Fhv8W3zrv3XzEm
 mgFnT2l+VEA5LaLINbzqZGloLZs+U0hhEHbzSm2Ghx7INvedug0c0EWBK
 ZGhm9pA4lpw6v8y9BUd7ogfA6KfR9jrBQQV9mw9u8VbosxO91QbENq/oZ
 P1xbs49SzJXBAW2RhbxsGTcWYrHR9uvifRvQtcZjZ8qmU4ntgFzY5P748 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373221432"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="373221432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 20:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686704084"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="686704084"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 20:50:15 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
Date: Thu, 24 Aug 2023 09:17:05 +0530
Message-Id: <20230824034705.755243-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
References: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
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

v2: Use helper to check dsc support. (Ankit)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e6a78fd32380..309fc10cde78 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2447,14 +2447,19 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 					 u8 dsc_bpc[3])
 {
 	int num_bpc = 0;
+
+	if(!drm_dp_sink_supports_dsc(dsc_dpcd))
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FE786FBB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4065A10E54C;
	Thu, 24 Aug 2023 12:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5D010E547;
 Thu, 24 Aug 2023 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692881672; x=1724417672;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tj6AE0OEJFYMdp3bJrSIa9DbTHuparu8AuXGSvlonxE=;
 b=bl5zF5N+EocpbFMlmcS9Rkon3qG2kz81ctBzJN+svlL001/p9HmV07U1
 9yf502X6zPxM38TqeZCps/9bghLZCkHzEvHeXd188tx/hx2ZMuKWkrOAh
 9Ghpy9+dvvdC+zM9cNFjdnR1vYSQAYBtJ7c0avnEJQHCYR/U3fmn3vriQ
 4sb36/TR5ZNWgEyC+dzHuUVFx3c+HGjO5lmJbC2aNL0QApgk9eY2uNYf2
 HJB1sTxJWDQMkYp+2LWxDV4jux8K74F9acjW/tshWSVI0yNnlDSphpRbE
 ECbtpIo9dfgM46E0fz9MlNOIshKCEzucp5CV4hrD0SY8Mlrr6BUKO0EVC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377160109"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377160109"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860688643"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="860688643"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/display/dp: Assume 8 bpc support when DSC is supported
Date: Thu, 24 Aug 2023 18:21:20 +0530
Message-Id: <20230824125121.840298-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
References: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
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

v2: Use helper to get check dsc support. (Ankit)
v3: Fix styling and other typos. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e6a78fd32380..8a1b64c57dfd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2449,12 +2449,16 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 	int num_bpc = 0;
 	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
 
+	if (!drm_dp_sink_supports_dsc(dsc_dpcd))
+		return 0;
+
 	if (color_depth & DP_DSC_12_BPC)
 		dsc_bpc[num_bpc++] = 12;
 	if (color_depth & DP_DSC_10_BPC)
 		dsc_bpc[num_bpc++] = 10;
-	if (color_depth & DP_DSC_8_BPC)
-		dsc_bpc[num_bpc++] = 8;
+
+	/* A DP DSC Sink device shall support 8 bpc. */
+	dsc_bpc[num_bpc++] = 8;
 
 	return num_bpc;
 }
-- 
2.40.1


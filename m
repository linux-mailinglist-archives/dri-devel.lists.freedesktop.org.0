Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB890843CD2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3699113B14;
	Wed, 31 Jan 2024 10:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8D9113B2C;
 Wed, 31 Jan 2024 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706697233; x=1738233233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vNR2f1kvwlmj65LDk9wvVGrMmCJtkKPK9rpti39qRX8=;
 b=SaeitCwwj8N5MB0X7YKxh8GHdHFZ3aVPKWIpxcD15bkBNfDQ2vy0IPBe
 39S+Uf2tUXykfdw4GX94OwtFBWM+XkYFfyJf98PlTYJofQvYC1KKyNGUQ
 u2iXuh6mNlAEWHMrHbEqBwBGRIUF5P0EbAwtsMRyHCDcZX5ye6qCAPV9x
 Q3U6L0Q/iWnKuosc/gYy5F6HCbikAs/oAGqQKqQRFK28THYnedLgRxq1I
 qErpkNb+3xRqpYe/3ZMFvGn1wtu5VIxkSJ8m+ootkeAqCs9E+7okMp/tl
 lXITVrRBffG3YsP4EC3tHSgA84LcUdbbPEIjKewY6gLwt3ofCkqj7LchF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407278657"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="407278657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="22747031"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 02:33:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCHv2 2/2] drm/i915/display/dp: 128/132b DP-capable with SST
Date: Wed, 31 Jan 2024 15:53:44 +0530
Message-Id: <20240131102344.1671929-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131102344.1671929-1-arun.r.murthy@intel.com>
References: <20240131102344.1671929-1-arun.r.murthy@intel.com>
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
Cc: jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With a value of '0' read from MSTM_CAP register MST to be enabled.
DP2.1 SCR updates the spec for 128/132b DP capable supporting only one
stream and not supporting single stream sideband MSG.
The underlying protocol will be MST to enable use of MTP.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9ff0cbd9c0df..05722f10cdd7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4037,9 +4037,15 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
 
 	if (!intel_dp_mst_source_support(intel_dp))
 		return;
-
-	intel_dp->is_mst = sink_can_mst &&
-		i915->display.params.enable_dp_mst;
+	/*
+	 * Even if dpcd reg MSTM_CAP is 0, if the sink supports UHBR rates then
+	 * DP2.1 can be enabled with underlying protocol using MST for MTP
+	 * TODO: Need to accommodate MSTM_CAP bit[0]=0, bit[1]=1 condition, i.e
+	 * one stream with single stream sideband msg.
+	 */
+	intel_dp->is_mst = (sink_can_mst || (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] &
+					     DP_CAP_ANSI_128B132B)) &&
+			    i915->display.params.enable_dp_mst;
 
 	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
 					intel_dp->is_mst);
-- 
2.25.1


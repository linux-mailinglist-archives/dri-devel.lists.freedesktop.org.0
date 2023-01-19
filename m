Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85020673775
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1998210E915;
	Thu, 19 Jan 2023 11:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36B610E915;
 Thu, 19 Jan 2023 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129160; x=1705665160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=trNCxGnSP4ZToFQVZRvV2mLowfUfMjvj7+tgltCb35Q=;
 b=Jt8gkmP7iie3+QR/qQAjQL2Am3dQ/zQM4MhR70LKgLqhbuUpQLBGeDYH
 MSfqFs1X6aZcAvYAbBCTCN96oOq41lqvph03dNAqR/gIu9TxDGU3afvP2
 UyNiQy9czhxejpgkrt98mT3bRifGP5Gw8mWx157/bfc/XIKueVWi34Fgm
 rm/JOJxV2x8hAFj3YJbYrb1HY+/cA5CZITVwZ5owWJ6KVBAQQ/XZvRWoz
 7VX5b81K5B0KVsqZHlWagH1qpMsSYCt17h7w8Oa5Rf9tuFO+lFo1mq8Pa
 Ik+EF7Myh7YAYwAP/X+x38ccnxwkvEUVg+18wG8hbf5QUJB+lW+RK7Y5x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305636627"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305636627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692392485"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="692392485"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 03:52:38 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Date: Thu, 19 Jan 2023 17:17:07 +0530
Message-Id: <20230119114707.1425501-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119114707.1425501-1-arun.r.murthy@intel.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230119114707.1425501-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable SDP error detection configuration, this will set CRC16 in
128b/132b link layer.
For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
added to enable/disable SDP CRC applicable for DP2.0 only, but the
default value of this bit will enable CRC16 in 128b/132b hence
skipping this write.
Corrective actions on SDP corruption is yet to be defined.

v2: Moved the CRC enable to link training init(Jani N)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 3d3efcf02011..7064e465423b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1453,4 +1453,16 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
 
 	if (!passed)
 		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
+
+	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
+	if (intel_dp_is_uhbr(crtc_state) && passed)
+		drm_dp_dpcd_writeb(&intel_dp->aux,
+				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
+				   DP_SDP_CRC16_128B132B_EN);
+		/*
+		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
+		 * disable SDP CRC. This is applicable for Display version 13.
+		 * Default value of bit 31 is '0' hence discarding the write
+		 */
+		/* TODO: Corrective actions on SDP corruption yet to be defined */
 }
-- 
2.25.1


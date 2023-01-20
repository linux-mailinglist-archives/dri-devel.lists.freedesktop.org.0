Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA380674CFF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 07:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F710EA4C;
	Fri, 20 Jan 2023 06:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DC410EA49;
 Fri, 20 Jan 2023 06:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674194685; x=1705730685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=trNCxGnSP4ZToFQVZRvV2mLowfUfMjvj7+tgltCb35Q=;
 b=MynkQOruHekU+tn2NESyM3HHGpVgSaktLiabrB17ETWnoWCRg5skqQVf
 zuIOUa/0lSkziZa9sI1W9AVrkzS6F/ykyoPIhdbn2yk73ZeuqipNiG4u2
 ap8CvOMUAKQwVLZUuG2tPZKlGvZBUuQ2iV3PZiilgtRE/ZLPzqdWJ0m5X
 YRB2ao5FjaLtQSTilkQqG5gAVubFUhJhF4+JNbuh8bOYHfjio85qRTSCg
 nTcyJxn1F4hmEom1mzmdbgdOYhJRxK/nIUpNkz3ws5zOpfVeUuZakwtwe
 1vZo0YTVMMSEL0SIqm9mKg+qWSRQN/iPZDJ0kHiM61f6FP9bzRW4/Wt7v g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305880040"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="305880040"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 22:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784408782"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="784408782"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 22:04:43 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [RESEND PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link
 layer
Date: Fri, 20 Jan 2023 11:29:12 +0530
Message-Id: <20230120055912.1450647-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120055912.1450647-1-arun.r.murthy@intel.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
 <20230120055912.1450647-1-arun.r.murthy@intel.com>
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


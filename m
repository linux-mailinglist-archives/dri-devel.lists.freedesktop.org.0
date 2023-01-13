Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6586668AFA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 05:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192D010E989;
	Fri, 13 Jan 2023 04:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8F510E986;
 Fri, 13 Jan 2023 04:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673584947; x=1705120947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0nEypF832E5Aa60hAqo51Felu0owHclhsv/xdyXnbs=;
 b=HgViJv7XCHukz37KbZXzLHCq7BazS/Y103pyb4WrdyltSimadZ0yiEhL
 8MXlhQU2hhdgVSqYHHSaNWGq5+TG93i6QOw4V6KtXpFBgj4tysTzLcBMH
 05vpzKHhrX4PriCzaKHwyIvieQyFxCsYqkbsAb6MysWMhtPCTGR5XOvZm
 tDVKyomMK0e6Qw+H8fLpyYgvklXcwyEMIC/N7C1MnU7lJn9oe842nYbs1
 1gWnIr5fX8I5yfYpMbNpJ4lwnSYp8Rixh87M8lpvvMO4X+VS0pc7ljvNH
 AmBtQXyDAMArG5tioTwireARfbQ0bszveCQ350scJd9nwUJMAnOma2rbN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325969974"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="325969974"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 20:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608043043"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="608043043"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2023 20:42:25 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Date: Fri, 13 Jan 2023 10:06:53 +0530
Message-Id: <20230113043653.795183-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113043653.795183-1-arun.r.murthy@intel.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
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
For DISPLAY13 a hardware bit31 in register VIDEO_DIP_CTL is added to
enable/disable SDP CRC applicable for DP2.0 only, but the default value
of this bit will enable CRC16 in 128b/132b hence skipping this write.
Corrective actions on SDP corruption is yet to be defined.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_reg.h         |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 30c55f980014..6096825a27ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -133,6 +133,7 @@ static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
 /* update sink rates from dpcd */
 static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	static const int dp_rates[] = {
 		162000, 270000, 540000, 810000
 	};
@@ -196,6 +197,18 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 			intel_dp->sink_rates[i++] = 1350000;
 		if (uhbr_rates & DP_UHBR20)
 			intel_dp->sink_rates[i++] = 2000000;
+
+		/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
+		if (HAS_DP20(i915))
+			drm_dp_dpcd_writeb(&intel_dp->aux,
+					   DP_SDP_ERROR_DETECTION,
+					   DP_SDP_CRC16_128B132B_EN);
+		/*
+		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
+		 * disable SDP CRC. This is applicable for DISPLAY 13. Default
+		 * value of bit 31 is '0' hence discarging the write
+		 */
+		/* TODO: Corrective actions on SDP corruption yet to be defined */
 	}
 
 	intel_dp->num_sink_rates = i;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8b2cf980f323..77e265f59978 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2674,6 +2674,7 @@
 #define   VIDEO_DIP_FREQ_2VSYNC		(2 << 16)
 #define   VIDEO_DIP_FREQ_MASK		(3 << 16)
 /* HSW and later: */
+#define	  VIDEO_DISABLE_SDP_CRC		(1 << 31)
 #define   VIDEO_DIP_ENABLE_DRM_GLK	(1 << 28)
 #define   PSR_VSC_BIT_7_SET		(1 << 27)
 #define   VSC_SELECT_MASK		(0x3 << 25)
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEDB345CF8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8F6E8C4;
	Tue, 23 Mar 2021 11:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1B6E0F3;
 Tue, 23 Mar 2021 11:33:36 +0000 (UTC)
IronPort-SDR: +s3UxaX/fZ1BEtbOfxzU0Qk+yZb4LTe1AoaAsEys8UqOZHJ7GJ98YJuvOqaHQMHxFaWQhms7Ix
 i8NBtu1pbgvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="188140865"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="188140865"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 04:33:35 -0700
IronPort-SDR: vEAuuBl49BFElW9IFezGrd90zw1JRrejJdlo0UbaqGdTJ2FKC5PhzlB/ZHIT9xx3HiYm2mbPzV
 jX59KyrfcYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="408277069"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2021 04:33:35 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/2] drm/i915/display: Configure HDMI2.1 Pcon for FRL only
 if Src-Ctl mode is available
Date: Tue, 23 Mar 2021 16:54:22 +0530
Message-Id: <20210323112422.1211-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
References: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the check if source control mode is supported by the
PCON, before starting configuring PCON for FRL training,
as per spec VESA DP2.0-HDMI2.1 PCON Draft-1 Sec-7.

v2: Added spec details for the change. (Uma)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1f6f4d0c8e2d..76024452e434 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2155,8 +2155,13 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
-	/* Always go for FRL training if supported */
-	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
+	/*
+	 * Always go for FRL training if:
+	 * -PCON supports SRC_CTL_MODE (VESA DP2.0-HDMI2.1 PCON Spec Draft-1 Sec-7)
+	 * -sink is HDMI2.1
+	 */
+	if (!(intel_dp->dpcd[2] & DP_PCON_SOURCE_CTL_MODE) ||
+	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
 	    intel_dp->frl.is_trained)
 		return;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

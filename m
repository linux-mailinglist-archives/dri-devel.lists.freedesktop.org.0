Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F31674AFC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7410EA2E;
	Fri, 20 Jan 2023 04:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C15E10EA1F;
 Fri, 20 Jan 2023 04:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189724; x=1705725724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hTuGa9sIsPJ43drCS4ds+uVC/iIWfeHtQ/Loi6F9B+o=;
 b=PPG8J0Au1K7VSMQM+ldxh3Q7cw4FPmi/7rkWuxtr6XkqRAuoEdPzHuxj
 fSgZnsZeHepyVloqQ/WtHQBslBIMZ1PbxRhLl7koYhRwVEqNZ71BXiZya
 JR1/Q3ZLB8rNhZqcgENEOJ3lGg68xq//w0dUes7glKJXP/xiFtioN3/+0
 ULIa2vIPaTE2HCgdncyohj/AHoycnrTaLD/BUg7E1Jkj5d2UPI+FPgU1Z
 Jxam6Fy6mi/S+B38/L0jAeRLe7gen36YtJd4rFnRZ+a+Ew7vF4bgR4JaK
 1vqQ7sZHk3pYtpYjOmJRUN7PCmgGFudusPi5J8RzyrS4iJpiNVID4/3XR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195499"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195499"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734933"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734933"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:01 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/16] drm/i915/dp: Check if dsc forced bpc is in allowed
 limits
Date: Fri, 20 Jan 2023 10:08:32 +0530
Message-Id: <20230120043844.3761895-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a check to use force DSC bpc only if it, along with the
corresponding bpp are within allowed limits.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d061fc3fa402..354dbd1d3164 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1510,19 +1510,20 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		int forced_bpc = intel_dp->force_dsc_bpc;
 		int forced_bpp = forced_bpc * 3;
 
-		/* Min Input BPC for ICL+ is 8 */
-		if (forced_bpc < 8) {
+		if (forced_bpc < 8 ||  /* Min Input BPC for ICL+ is 8 */
+		    forced_bpc > conn_state->max_requested_bpc ||
+		    forced_bpp < limits->min_bpp ||
+		    forced_bpp > limits->max_bpp) {
 			drm_dbg_kms(&dev_priv->drm,
-				    "Cannot force dsc bpc:%d, due to dsc bpc limits\n",
+				    "Cannot force dsc bpc:%d, due to bpc/bpp limits\n",
 				    intel_dp->force_dsc_bpc);
 			return -EINVAL;
 		}
 		pipe_config->pipe_bpp = forced_bpp;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n",
-			    pipe_config->pipe_bpp);
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_config->pipe_bpp);
 	} else if (compute_pipe_bpp) {
-		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
-							conn_state->max_requested_bpc);
+		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
+
 		if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "No DSC support for less than 8bpc\n");
@@ -1530,7 +1531,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		}
 		pipe_config->pipe_bpp = pipe_bpp;
 	}
-
 	/*
 	 * For now enable DSC for max link rate, max lane count.
 	 * Optimize this later for the minimum possible link rate/lane count
-- 
2.25.1


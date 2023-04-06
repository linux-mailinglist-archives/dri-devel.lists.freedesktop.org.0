Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280D6D9882
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3210EA45;
	Thu,  6 Apr 2023 13:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C310E65B;
 Thu,  6 Apr 2023 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680788841; x=1712324841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rx6NRwCG3zzfbrT+I88OAD+AeQRS8XmAJrho0BU1D98=;
 b=ARsdCWytbAj2rhTnDhx4LUyASE9sql+wep9HfYxCAw6UxHZJkWPKrKOA
 v5R+vQfao9IvDn9xgNbXbgy/Nib4ANH3uTj4q/HHm0I6ibOohHG+WHALG
 abJTBG3wzLDUfkdJZo5NozMUheJ1/oWS5ZxKDKZwYwAxNUhLP+HgwWqEe
 92z9MmOtgsiMrdSAV4I3e1TSQ5YRs2r52ulNg2eECjNn2RghZq8N0MKWe
 yFMjZQuh5USbqLPssNtVc7Ls/CEMhRNRby6ezqULpOME1tc1a6097q84a
 jDDD34pedIrMNFrUrjYAxaVI6NctyjjWh7JNtK58MnsywFPPLQtrxwfTO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331372143"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="331372143"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 06:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798328155"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="798328155"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 06:46:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dsc: fix drm_edp_dsc_sink_output_bpp() DPCD high byte
 usage
Date: Thu,  6 Apr 2023 16:46:14 +0300
Message-Id: <20230406134615.1422509-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Manasi Navare <navaremanasi@google.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The operator precedence between << and & is wrong, leading to the high
byte being completely ignored. For example, with the 6.4 format, 32
becomes 0 and 24 becomes 8. Fix it, and remove the slightly confusing
and unnecessary DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT macro while at it.

Fixes: 0575650077ea ("drm/dp: DRM DP helper/macros to get DP sink DSC parameters")
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Manasi Navare <navaremanasi@google.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: <stable@vger.kernel.org> # v5.0+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/display/drm_dp.h        | 1 -
 include/drm/display/drm_dp_helper.h | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 358db4a9f167..89d5a700b04d 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -286,7 +286,6 @@
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
-# define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
 # define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
 # define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 533d3ee7fe05..86f24a759268 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -181,9 +181,8 @@ static inline u16
 drm_edp_dsc_sink_output_bpp(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
 	return dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_LOW - DP_DSC_SUPPORT] |
-		(dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] &
-		 DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK <<
-		 DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT);
+		((dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] &
+		  DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK) << 8);
 }
 
 static inline u32
-- 
2.39.2


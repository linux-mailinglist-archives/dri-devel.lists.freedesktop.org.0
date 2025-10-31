Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D0C267EE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EFA10E2F5;
	Fri, 31 Oct 2025 17:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrKLz5K6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC42E10E06D;
 Fri, 31 Oct 2025 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761933461; x=1793469461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U1SJEHv77UlVmQIwfYx3kPtQgJj8QTjOlyY+o3sqETU=;
 b=RrKLz5K6YyY2z2iQwDmq3c/38tijcrdJNPsqWdXgF6yESMXkoIs+kgTq
 TS6i7ljqLUNL86rdmJXQBNUg0bJk0JDLL584JvbEQox4pPgr5kIU4ulg/
 b8LceE9PDfVtNuFNWhCX+ZHZX0hhnzLcB5ccU6EJkK+J/mYKgJHe3BJLL
 L13EHcQkS2jrz7Obn4utAnaFGG+WjPKBTxW2Z4WvJxmX5+zzVu7SlEpqQ
 6Bvvdikts4Qi2boXa5/9UUaessV0bE94qABh+IXm930c6dIzztMaBnabh
 Po9RcCJrc4Zt4ZotSF0U2w7C9jFwVPQPZ/pvLedVVvT0lltsmP6GNQvpG A==;
X-CSE-ConnectionGUID: wgDrTKoPTPGzLGGczsOsHQ==
X-CSE-MsgGUID: wBks1JGZROaQNuzU6tb0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64197819"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64197819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 10:57:41 -0700
X-CSE-ConnectionGUID: gOmtIhR0Snmk1PIgUlTCxA==
X-CSE-MsgGUID: OdM79Rh1TAqwOU7/K0rLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186171943"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
 by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 10:57:40 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match
 DP2.1 spec
Date: Fri, 31 Oct 2025 10:57:38 -0700
Message-ID: <20251031175738.3430347-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.43.0
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

The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
Update its name to align with the DP 2.1 definition and reflect its
actual use in the code. No functional changes.

v2: Comment about spec version where the bit was introduced (Konrad)

Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Sean Paul <sean@poorly.run>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 include/drm/display/drm_dp.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3..5d465cf4dbc2 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 		return rlen;
 	}
 
-	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
 		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
 		goto end;
 	}
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..e299a66e698d 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -849,7 +849,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4) /* DP 2.1 */
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.43.0


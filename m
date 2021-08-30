Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B263FB3E1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C5F89DEC;
	Mon, 30 Aug 2021 10:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC49089DEC;
 Mon, 30 Aug 2021 10:29:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="205379173"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="205379173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="689212090"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/5] drm/i915/edp: postpone MSO init until after EDID read
Date: Mon, 30 Aug 2021 13:29:02 +0300
Message-Id: <ad82dc721bef296ebf2f37967f37b3b090d87ce1.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630319138.git.jani.nikula@intel.com>
References: <cover.1630319138.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSO will require segment pixel overlap information from the
EDID. Postpone MSO init until after we've read and cached the EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f8e8865048f..8e75543334c2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2575,8 +2575,6 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	 */
 	intel_edp_init_source_oui(intel_dp, true);
 
-	intel_edp_mso_init(intel_dp);
-
 	return true;
 }
 
@@ -5269,6 +5267,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	if (fixed_mode)
 		downclock_mode = intel_dp_drrs_init(intel_connector, fixed_mode);
 
+	/* MSO requires information from the EDID */
+	intel_edp_mso_init(intel_dp);
+
 	/* multiply the mode clock and horizontal timings for MSO */
 	intel_edp_mso_mode_fixup(intel_connector, fixed_mode);
 	intel_edp_mso_mode_fixup(intel_connector, downclock_mode);
-- 
2.20.1


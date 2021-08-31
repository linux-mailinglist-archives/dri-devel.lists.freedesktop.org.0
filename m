Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4373FC993
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC96C6E07B;
	Tue, 31 Aug 2021 14:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298CA6E07B;
 Tue, 31 Aug 2021 14:18:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="205701269"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="205701269"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:18:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="541026345"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:18:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 5/6] drm/i915/edp: postpone MSO init until after EDID read
Date: Tue, 31 Aug 2021 17:17:34 +0300
Message-Id: <7a360fca01be0f971337b3635f4e4752922ffebe.1630419362.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630419362.git.jani.nikula@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
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
index 64e8151d13a4..df402f63b741 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2536,8 +2536,6 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	 */
 	intel_edp_init_source_oui(intel_dp, true);
 
-	intel_edp_mso_init(intel_dp);
-
 	return true;
 }
 
@@ -4804,6 +4802,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	if (fixed_mode)
 		downclock_mode = intel_drrs_init(intel_connector, fixed_mode);
 
+	/* MSO requires information from the EDID */
+	intel_edp_mso_init(intel_dp);
+
 	/* multiply the mode clock and horizontal timings for MSO */
 	intel_edp_mso_mode_fixup(intel_connector, fixed_mode);
 	intel_edp_mso_mode_fixup(intel_connector, downclock_mode);
-- 
2.30.2


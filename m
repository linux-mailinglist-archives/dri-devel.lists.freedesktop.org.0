Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABDA3F4E2E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 18:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B777189B97;
	Mon, 23 Aug 2021 16:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C63D89B7D;
 Mon, 23 Aug 2021 16:18:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="280854822"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="280854822"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:18:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="493068095"
Received: from todonova-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.44.47])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:18:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 manasi.d.navare@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/19] drm/dp: add DP 2.0 UHBR link rate and bw code
 conversions
Date: Mon, 23 Aug 2021 19:18:02 +0300
Message-Id: <d5a83c4e33b400b094606ff2dc5b2ad88124347e.1629735412.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629735412.git.jani.nikula@intel.com>
References: <cover.1629735412.git.jani.nikula@intel.com>
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

The bw code equals link_rate / 0.27 Gbps only for 8b/10b link
rates. Handle DP 2.0 UHBR rates as special cases, though this is not
pretty.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 6d0f2c447f3b..9b2a2961fca8 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -207,15 +207,33 @@ EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
 
 u8 drm_dp_link_rate_to_bw_code(int link_rate)
 {
-	/* Spec says link_bw = link_rate / 0.27Gbps */
-	return link_rate / 27000;
+	switch (link_rate) {
+	case 1000000:
+		return DP_LINK_BW_10;
+	case 1350000:
+		return DP_LINK_BW_13_5;
+	case 2000000:
+		return DP_LINK_BW_20;
+	default:
+		/* Spec says link_bw = link_rate / 0.27Gbps */
+		return link_rate / 27000;
+	}
 }
 EXPORT_SYMBOL(drm_dp_link_rate_to_bw_code);
 
 int drm_dp_bw_code_to_link_rate(u8 link_bw)
 {
-	/* Spec says link_rate = link_bw * 0.27Gbps */
-	return link_bw * 27000;
+	switch (link_bw) {
+	case DP_LINK_BW_10:
+		return 1000000;
+	case DP_LINK_BW_13_5:
+		return 1350000;
+	case DP_LINK_BW_20:
+		return 2000000;
+	default:
+		/* Spec says link_rate = link_bw * 0.27Gbps */
+		return link_bw * 27000;
+	}
 }
 EXPORT_SYMBOL(drm_dp_bw_code_to_link_rate);
 
-- 
2.20.1


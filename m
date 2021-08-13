Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D63EB432
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 12:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757C6E5BD;
	Fri, 13 Aug 2021 10:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E086E5B9;
 Fri, 13 Aug 2021 10:43:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212426204"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="212426204"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:43:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="528489244"
Received: from cgearing-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:43:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Manasi Navare <manasi.d.navare@intel.com>
Subject: [PATCH 1/4] drm/dp: add DP 2.0 UHBR link rate and bw code conversions
Date: Fri, 13 Aug 2021 13:43:19 +0300
Message-Id: <a2ca874e8a7fe593c4ba120879d990a77f8603a1.1628851334.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628851334.git.jani.nikula@intel.com>
References: <cover.1628851334.git.jani.nikula@intel.com>
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

Cc: Manasi Navare <manasi.d.navare@intel.com>
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


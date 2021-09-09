Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE25405396
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600A26E853;
	Thu,  9 Sep 2021 12:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8C76E857;
 Thu,  9 Sep 2021 12:52:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="207888864"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="207888864"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="466478495"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.52])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:52:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [PATCH v3 04/13] drm/dp: add helper for extracting adjust 128b/132b
 TX FFE preset
Date: Thu,  9 Sep 2021 15:51:56 +0300
Message-Id: <4ba129c51aeb01a5f210de7026abe704a554a178.1631191763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The DP 2.0 128b/132b channel coding uses TX FFE presets instead of
vswing and pre-emphasis.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 14 ++++++++++++++
 include/drm/drm_dp_helper.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 2e74b02ed96b..4d0d1e8e51fa 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -130,6 +130,20 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
 
+/* DP 2.0 128b/132b */
+u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
+				   int lane)
+{
+	int i = DP_ADJUST_REQUEST_LANE0_1 + (lane >> 1);
+	int s = ((lane & 1) ?
+		 DP_ADJUST_TX_FFE_PRESET_LANE1_SHIFT :
+		 DP_ADJUST_TX_FFE_PRESET_LANE0_SHIFT);
+	u8 l = dp_link_status(link_status, i);
+
+	return (l >> s) & 0xf;
+}
+EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
+
 u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
 					 unsigned int lane)
 {
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index f3a61341011d..3ee0b3ffb8a5 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1494,6 +1494,8 @@ u8 drm_dp_get_adjust_request_voltage(const u8 link_status[DP_LINK_STATUS_SIZE],
 				     int lane);
 u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SIZE],
 					  int lane);
+u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
+				   int lane);
 u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
 					 unsigned int lane);
 
-- 
2.30.2


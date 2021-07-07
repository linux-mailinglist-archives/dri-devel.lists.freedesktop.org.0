Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B841D3BEAA7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7906E03E;
	Wed,  7 Jul 2021 15:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA56E03E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 15:26:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196601175"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="196601175"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="497976957"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.12])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2021 08:26:40 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/dp: follow DP link CTS spec to read link status back
Date: Wed,  7 Jul 2021 23:33:18 +0800
Message-Id: <20210707153318.13903-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707150042.6376-1-shawn.c.lee@intel.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 William Tseng <william.tseng@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refer to DP link CTS 1.2/1.4 spec, the following test case request
source read DPCD 200h - 205h to get latest link status from sink.

(4.3.2.4) Handling of IRQ HPD Pulse with No Error Status Bits Set
(400.3.2.1) Successful Link Re-training After IRQ HPD Pulse
            Due to Loss of Symbol Lock: HBR2 Extension
(400.3.2.2) Successful Link Re-training After IRQ HPD Pulse Due
            to Loss of Clock Recovery Lock: HBR2 Extension
(400.3.2.3) Successful Link Re-training After IRQ HPD Pulse Due
            to Loss of Inter-lane Alignment Lock: HBR2 Extension

So far, DRM DP driver just read back the link status from 202h
to 207h. DPR-120 would judge source can't pass these cases and
shows below error messages.

"Test FAILED, Source DUT does not read DPCD registers 200h-205h
within 100 ms".

v2: Use sizeof() to retrieve array size.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Cooper Chiou <cooper.chiou@intel.com>
Cc: William Tseng <william.tseng@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 24bbc710c825..4f03df317d62 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -410,17 +410,19 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 				     u8 link_status[DP_LINK_STATUS_SIZE])
 {
 	int ret;
+	u8 full_link_stat[DP_LINK_STATUS_SIZE + 2];
 
 	if (dp_phy == DP_PHY_DPRX) {
 		ret = drm_dp_dpcd_read(aux,
-				       DP_LANE0_1_STATUS,
-				       link_status,
-				       DP_LINK_STATUS_SIZE);
+				       DP_SINK_COUNT,
+				       full_link_stat,
+				       sizeof(full_link_stat));
 
 		if (ret < 0)
 			return ret;
 
-		WARN_ON(ret != DP_LINK_STATUS_SIZE);
+		memcpy(link_status, full_link_stat + 2, DP_LINK_STATUS_SIZE);
+		WARN_ON(ret != DP_LINK_STATUS_SIZE + 2);
 
 		return 0;
 	}
-- 
2.17.1


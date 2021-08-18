Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F93F0AD2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEBF6E89B;
	Wed, 18 Aug 2021 18:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA826E895;
 Wed, 18 Aug 2021 18:11:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="213269186"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="213269186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 11:11:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="449859373"
Received: from jcarwana-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.249.42.192])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 11:11:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 02/17] drm/dp: use more of the extended receiver cap
Date: Wed, 18 Aug 2021 21:10:37 +0300
Message-Id: <08326b089b80e394989128f3f3dd362f1972caa8.1629310010.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629310010.git.jani.nikula@intel.com>
References: <cover.1629310010.git.jani.nikula@intel.com>
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

Extend the use of extended receiver cap at 0x2200 to cover
MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation hides
the DP 2.0 128b/132b channel encoding cap.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 9b2a2961fca8..9389f92cb944 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-	u8 dpcd_ext[6];
+	u8 dpcd_ext[DP_MAIN_LINK_CHANNEL_CODING + 1];
 	int ret;
 
 	/*
-- 
2.20.1


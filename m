Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F4695F6C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B73B10E83E;
	Tue, 14 Feb 2023 09:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EE910E84A;
 Tue, 14 Feb 2023 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676367634; x=1707903634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AASS0FwnVNe/OPJgQFOtVGbVsH7cgW31yZ998Bbq/EI=;
 b=QjTnTYGqNiYj5RnK//LT7u2Q37TLIxhEMs4O2oZw5SqsmBjOHP+q15Xy
 zAnXR7VS4G0gbyaz0iP0uQyW4GZSusc2djACHSjjcCgnzNnQCQGhxYruh
 UruALOixTizK82GX1y5+FLW0UevgKEXx1wHUl6V9oqpzW8FabzT/GICaw
 vGqrZ8PS1eSi8RCOmVBBs2XVYogECgu1EUiE0Nh1E0b39VlL/mFmUlkYu
 hqy7rqy+tiEEKkzoQ3x2S20sxx5mfd1cAvuQRE8ls7m7YTDbwMTslXzZq
 ts/VKuzIuFxMvaRIncJfwZihlTip7ChIcVQotd8Ww+GrZyTsM/UDwEsHG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328831630"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328831630"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757924086"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="757924086"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 01:40:26 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv2 1/2] drm: Add SDP Error Detection Configuration Register
Date: Tue, 14 Feb 2023 15:04:58 +0530
Message-Id: <20230214093459.3617293-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214093459.3617293-1-arun.r.murthy@intel.com>
References: <20230214093459.3617293-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP2.0 E11 defines a new register to facilitate SDP error detection by a
128B/132B capable DPRX device.

v2: Update the macro name to reflect the DP spec(Harry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 632376c291db..358db4a9f167 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -692,6 +692,9 @@
 # define DP_FEC_LANE_2_SELECT		    (2 << 4)
 # define DP_FEC_LANE_3_SELECT		    (3 << 4)
 
+#define DP_SDP_ERROR_DETECTION_CONFIGURATION	0x121	/* DP 2.0 E11 */
+#define DP_SDP_CRC16_128B132B_EN		BIT(0)
+
 #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
 
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77EA2A0F7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3704510E42E;
	Thu,  6 Feb 2025 06:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4ffWexu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156E310E42C;
 Thu,  6 Feb 2025 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823592; x=1770359592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AxVjKrGt7lFch1AHXL0EKcb8cyryluaX8/E+kxJnyK8=;
 b=h4ffWexuc2pCaxwZAj8/1D7N1YRXjaz2IcPbBhYFfluZmnmil60iG5+A
 GNZU9jWc1ivgBt3csBhJkBBPfaE/B/x+dWf0VwBDqBM9F4sCZgFpyZcs1
 gF/DR6HbdCyDGmA13bvL8CE66BxNaGRE/DPzBLR1I2ZrABcqssuhL88Tk
 15BqTVZaS3bvf4DtLXC9CMEFknPTrKHNI1p7I9G9dLfXKhMRUMLf6AoYv
 VlDRrdSZR14444ct8KFOjEQ3R685mSU2o/EjanRJlpkRtuJRysVFWr/NW
 55FpzUXk790pnVDTmHlZYCM2donLexE7c6hLAkQeUPghqqSYEO0IV3h6Z g==;
X-CSE-ConnectionGUID: ZdznImWxScG6AXpaqHoUKQ==
X-CSE-MsgGUID: E1YDa7wdQCC7o5OWBpCa3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014215"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="27014215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:11 -0800
X-CSE-ConnectionGUID: W+P7OYj2Q3qP87lEf0Q5MQ==
X-CSE-MsgGUID: AQfoX/GtSdGTy2uHiY2V+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112013677"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:10 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/8] drm/dp: Increase eDP display control capability size
Date: Thu,  6 Feb 2025 12:02:47 +0530
Message-Id: <20250206063253.2827017-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206063253.2827017-1-suraj.kandpal@intel.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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

Increase the eDP display control capability size to take into
account the general capability register 703 and 704 that have
recently been added.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/drm/display/drm_dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 05e16f0144ff..784a32bfbad8 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1670,7 +1670,7 @@ enum drm_dp_phy {
 #define DP_RECEIVER_CAP_SIZE		0xf
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
-#define EDP_DISPLAY_CTL_CAP_SIZE	3
+#define EDP_DISPLAY_CTL_CAP_SIZE	5
 #define DP_LTTPR_COMMON_CAP_SIZE	8
 #define DP_LTTPR_PHY_CAP_SIZE		3
 
-- 
2.34.1


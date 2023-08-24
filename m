Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B070F78695B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F078410E4C7;
	Thu, 24 Aug 2023 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B0610E4BC;
 Thu, 24 Aug 2023 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692864313; x=1724400313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AtkxhPpqyWJeCD20FN7ggGFiIRbG1f9rz/OOwXLEy3Q=;
 b=HlTCjVpnnU5MVbC2uJg4CCvU9CicY8eTMaRYALsQriO1PIGE0Eku/Oro
 6kvLJ/virqq+Ttai7brL7nzhlxCkRoU7kazHL771lzdplJ9BnFwEzAKxL
 PK4MoAuorXW7x3Mlztzkow1gArbQGj6X0zsjhYU22Mxp1+JbkwF5dHUlf
 /Oss7OhoLK0XBvR7zccnHG3AmReCXjGXYk54o+f52JKeAKLqV3jM+4X60
 1u7KpUFVxvG6LoyiBZPE4Cp0X3wPsXxy4MfV+LlrgtkdOuqPA6IMTEE2Z
 yapUEE97pgYW4b5g4cbfCDuyOCMvIQdjcP6bABCUfE8UxtV3uRXWzhQs1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374345864"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374345864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880710316"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 01:05:16 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/22] drm/dp_mst: Fix fractional bpp scaling in
 drm_dp_calc_pbn_mode()
Date: Thu, 24 Aug 2023 11:05:04 +0300
Message-Id: <20230824080517.693621-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230824080517.693621-1-imre.deak@intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For fractional bpp values passed to the function in a .4 fixed point
format, the fractional part is currently ignored due to scaling bpp too
early. Fix this by scaling the overhead factor instead and to avoid an
overflow multiplying bpp with the overhead factor instead of the clock
rate.

While at it simplify the formula, and pass the expected fixed point bpp
values in the kunit tests.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c  | 7 ++-----
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c | 8 ++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ed96cfcfa3040..bd0f35a0ea5fb 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4712,12 +4712,9 @@ int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
 	 * factor in the numerator rather than the denominator to avoid
 	 * integer overflow
 	 */
+	u32 bpp_m = (dsc ? 64 / 16 : 64) * 1006 * bpp;
 
-	if (dsc)
-		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006),
-					8 * 54 * 1000 * 1000);
-
-	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
+	return DIV_ROUND_UP_ULL(mul_u32_u32(clock, bpp_m),
 				8 * 54 * 1000 * 1000);
 }
 EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index 545beea33e8c7..ea2182815ebe8 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -40,15 +40,15 @@ static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases
 	},
 	{
 		.clock = 332880,
-		.bpp = 24,
+		.bpp = 24 << 4,
 		.dsc = true,
-		.expected = 50
+		.expected = 1191
 	},
 	{
 		.clock = 324540,
-		.bpp = 24,
+		.bpp = 24 << 4,
 		.dsc = true,
-		.expected = 49
+		.expected = 1161
 	},
 };
 
-- 
2.37.2


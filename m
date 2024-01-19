Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C60832F6A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 20:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEC010EA62;
	Fri, 19 Jan 2024 19:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2411110EA5D;
 Fri, 19 Jan 2024 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705692951; x=1737228951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hEfwMF5g8zz2N0Y17lIN3FDeW78Qu57IzEn+eZJYJJs=;
 b=NjJ7bPE/CqRUXcXHwv3jSwNThQfiZC+cG7pi9+Pk7SxqayL077YezUjn
 wsP/bQ4CI++3GOC/vXPvR9u1XSd278GvPFICWezcvVSNjOC4fe5g0QzDi
 6wWFlme9fBfUSAXZbYLavZEkuhhv0OPjZ3RK0FobGBMBHWS1J7DA+N4WI
 A3YcWYCyrDP2ZLpF3tQIX3eua44Fk4PxNlZpQU3gWrtT+cZKZ4a1za4nD
 esb4j+CBp9M8OKtmN75/YF0tUh48K1FrnrOFZH707UVq7uxIRA4h9AmSp
 DtosbXFyJRjBE1LLK+MoJOlZ4VzS/sZZauoHwgjPwhPFYOZVRuSWEI4VP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14344279"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="14344279"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 11:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="654211"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2024 11:35:50 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mtl: Wake GT before sending H2G message
Date: Fri, 19 Jan 2024 11:35:13 -0800
Message-Id: <20240119193513.221730-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of waiting until the interrupt reaches GuC, we can grab a
forcewake while triggering the H2G interrupt. GEN11_GUC_HOST_INTERRUPT
is inside sgunit and is not affected by forcewakes. However, there
could be some delays when platform is entering/exiting some higher
level platform sleep states and a H2G is triggered. A forcewake
ensures those sleep states have been fully exited and further
processing occurs as expected. The hysteresis timers for C6 and
higher sleep states will ensure there is no unwanted race between the
wake and processing of the interrupts by GuC.

This will have an official WA soon so adding a FIXME in the comments.

v2: Make the new ranges watertight to address BAT failures and update
commit message (Matt R).

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index dfefad5a5fec..76400e9c40f0 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1800,7 +1800,10 @@ static const struct intel_forcewake_range __mtl_fw_ranges[] = {
 	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
 		0x24000 - 0x2407f: always on
 		0x24080 - 0x2ffff: reserved */
-	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT)
+	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x40000, 0x1901ef, 0),
+	GEN_FW_RANGE(0x1901f0, 0x1901f3, FORCEWAKE_GT)
+		/* FIXME: WA to wake GT while triggering H2G */
 };
 
 /*
-- 
2.38.1


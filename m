Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBD7FD90A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945A10E205;
	Wed, 29 Nov 2023 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 14:14:23 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A16710E205;
 Wed, 29 Nov 2023 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701267264; x=1732803264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ryc//f0Tr8NZrn+ndoBq8HJgd/JE509ZE3xh0cOmymI=;
 b=VPHFv5DlR75R19KEuiE206faOWTU/Sf+eXCMMZulvG6bMI1x/Ze80bmi
 H3yEJwAyK4UflKt77jS4ku705bJiv23bflwgqe1dEZsGNjRoDNph4DRoW
 bmC9KnXtQlINUtdz7Z7fhn9I/ZMvW6e6LQrCswnieourd7DGpk2pcf1VK
 ESgfixlbifYd/bTrorKB6Ziwul58pgrcEGeNW7EipfdrB7Nmxx+wh0dfL
 pVd9EcX/PjXnp3V0YRLJ47Tg0vLHUJah2hWPnyBj5LIxoHz5RnvmxPCYH
 bSJHIGYmouNOZUXVRSfIIhG2LKSPwNe1L91K3O4Jw6d51G9VhuVzinX76 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="152635"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="152635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912865021"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="912865021"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 06:07:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 607DF4D4; Wed, 29 Nov 2023 16:01:37 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm/i915/display: Don't use "proxy" headers
Date: Wed, 29 Nov 2023 16:01:28 +0200
Message-ID: <20231129140129.699767-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses math.h and not util_macros.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
index ce5a73a4cc89..bc61e736f9b3 100644
--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
@@ -3,7 +3,7 @@
  * Copyright © 2019 Intel Corporation
  */
 
-#include <linux/util_macros.h>
+#include <linux/math.h>
 
 #include "i915_reg.h"
 #include "intel_ddi.h"
-- 
2.43.0.rc1.1.gbec44491f096


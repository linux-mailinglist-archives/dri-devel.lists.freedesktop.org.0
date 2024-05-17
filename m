Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5D8C85A5
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B2C10EE78;
	Fri, 17 May 2024 11:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRJd+3Nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DCC10EE78;
 Fri, 17 May 2024 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715945199; x=1747481199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6B9qTx8nmCoezSLzzcMRXr+s4VwpY77QrMPmH6L3Fzs=;
 b=IRJd+3NrQKpxrwQ7d7tSu9u7+v4AL6YZ5Knn3vSuNeOohb8Fm6YYVdI6
 UeHV7Y6stNkagzhGbkwwuYi1zvo1OY2evdT4tiiTqUrtKys4l03oNoRf1
 F3f1WAxVadNfaDGfUFoG3dG0Ho1M1MLx4s1UYdgXX7qIorW5b7IRExZk9
 f2fsUUyPVTg/MRUAa/vEPABIHRTqwqc8e0xaIxomnHfCTV5wkvLMweeiJ
 uOaAVbbTE1CUh2LurvZkZo3IAcAqLCmUrjGcJ6YAFNW9B6nh5E+q1/w1v
 Kwhs6y2WqyBjMKNotofh+VlT+HTjSWnayN1o3ndsK5sLBxqhqmkAKQ3Dq w==;
X-CSE-ConnectionGUID: U2mhwmvtRtqJbdtMV/k6LA==
X-CSE-MsgGUID: IH8t64CUTgupcfOtxwR7+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11571494"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11571494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:38 -0700
X-CSE-ConnectionGUID: iiqb8KNNTyeMyCJHY40w4g==
X-CSE-MsgGUID: 1pqjHUOdQ5SBOcCGum2rJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31904167"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.247.118.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:33 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/2] drm/i915: Don't treat FLR resets as errors
Date: Fri, 17 May 2024 13:25:50 +0200
Message-ID: <20240517112550.251955-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517112550.251955-1-andi.shyti@linux.intel.com>
References: <20240517112550.251955-1-andi.shyti@linux.intel.com>
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

If we timeout while waiting for an FLR reset, there is nothing we
can do and i915 doesn't have any control on it. In any case the
system is still perfectly usable and the function returns void.

We don't need to be alarmed, therefore, print the timeout
expiration as a debug message instead of an error.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10955
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 2eba289d88ad..a3fa2ed91aae 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2637,7 +2637,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 	 */
 	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
 	if (ret) {
-		drm_err(&i915->drm,
+		drm_dbg(&i915->drm,
 			"Failed to wait for Driver-FLR bit to clear! %d\n",
 			ret);
 		return;
@@ -2652,7 +2652,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 					 DRIVERFLR, 0,
 					 flr_timeout_ms);
 	if (ret) {
-		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		drm_dbg(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
 		return;
 	}
 
@@ -2661,7 +2661,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
 					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 					 flr_timeout_ms);
 	if (ret) {
-		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
+		drm_dbg(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
 		return;
 	}
 
-- 
2.43.0


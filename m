Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB88C85A0
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C670A10EE76;
	Fri, 17 May 2024 11:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPrk+aFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762A410EE76;
 Fri, 17 May 2024 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715945183; x=1747481183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1kCACN8hRFGzdaw/N5tccKsL9YjfyvxlsDeImPqYpns=;
 b=iPrk+aFjp26i7BNR1paq0gv3TqKtmRTGbw9Ypvn6a2WSRmEmLrqTBcFT
 K07Qtyc5qOfF0ZkP6bU+qgs0rTxL20GRvwIfTasVElgR0omsdBqR7h3bq
 8QrlQmAKIfzWZC5u7Pxcxl53IlNAOAFdzUV+43gF13jzCRzo2sKym0C9E
 uZlSCayC0h2jgjJJN3fsS1UgqATkLtqT0C6vfpNREoYckDTLy5y55nfnq
 2Bs8M+A5M8S12Wlwp5/f9913KSP7IVE6X4ECn4pcvSOmvf2SBKJhevy0e
 m+sXuwTP6lnIeqc2i5zuutebfr3T0Tdxxjq7SaJRkNb43zqtCVn5vUZ8u A==;
X-CSE-ConnectionGUID: 082X+viOSyW/NZ8RAcGbhA==
X-CSE-MsgGUID: nYP0/Y1HTI+k8HMBA6J0ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11921346"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11921346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:23 -0700
X-CSE-ConnectionGUID: L87CEbNVRCqqOCwEIMmR5g==
X-CSE-MsgGUID: NoC4mb9cTgWow3Zm7GI4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31700787"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.247.118.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:26:16 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 1/2] drm/i915: Increase FLR timeout from 3s to 9s
Date: Fri, 17 May 2024 13:25:49 +0200
Message-ID: <20240517112550.251955-2-andi.shyti@linux.intel.com>
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

Following the guidelines it takes 3 seconds to perform an FLR
reset. Let's give it a bit more slack because this time can
change depending on the platform and on the firmware

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10955
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 729409a4bada..2eba289d88ad 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2614,11 +2614,18 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 static void driver_initiated_flr(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
-	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
+	unsigned int flr_timeout_ms;
 	int ret;
 
 	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
 
+	/*
+	 * The specification recommends a 3 seconds FLR reset timeout. To be
+	 * cautious, we will extend this to 9 seconds, three times the specified
+	 * timeout.
+	 */
+	flr_timeout_ms = 9000;
+
 	/*
 	 * Make sure any pending FLR requests have cleared by waiting for the
 	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
-- 
2.43.0


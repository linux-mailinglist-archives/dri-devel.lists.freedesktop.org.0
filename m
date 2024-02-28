Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A888786B317
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A909410E698;
	Wed, 28 Feb 2024 15:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYDeFpMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C2A10E698;
 Wed, 28 Feb 2024 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709133937; x=1740669937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXQpmtipgtjBO4sYkFOxboXA1pY/k2kWg4CRTcJLzec=;
 b=WYDeFpMtVHvRdrHmBvxdmu/RZ20TfEcYEI41WOqHUKqNj2Hd8Y3zc5w0
 jOTPP/prm0pIXzx1q0YQso0oWKqSIM8lTRXWjOooH+cC7oi6zsmMwuqSb
 aUbGUHomYKpxmie251G2if347Cw2CL0qo39QG/BPMIn9rylfy8WU780Q1
 b1fY+D128q8oShwiM9Zo4ZLz17UPETSV8jwo0NbR1bDjQ59c6uNmJkIXO
 X0HhyMt/3fRkTQODGgY+xgVoc1JifLAoGLw9BbFxlpyyXvL1LUOq+99PW
 Wkz25yeDtBchTfPDQz5pqT/h/5Q6k99Aiw9Yv71eZujaxTuJmCIUNHv/H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="4110851"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4110851"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8031763"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.24.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:25:33 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/selftest_hangcheck: Check sanity with more patience
Date: Wed, 28 Feb 2024 16:24:41 +0100
Message-ID: <20240228152500.38267-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

While trying to reproduce some other issues reported by CI for i915
hangcheck live selftest, I found them hidden behind timeout failures
reported by igt_hang_sanitycheck -- the very first hangcheck test case
executed.

Feb 22 19:49:06 DUT1394ACMR kernel: calling  mei_gsc_driver_init+0x0/0xff0 [mei_gsc] @ 121074
Feb 22 19:49:06 DUT1394ACMR kernel: i915 0000:03:00.0: [drm] DRM_I915_DEBUG enabled
Feb 22 19:49:06 DUT1394ACMR kernel: i915 0000:03:00.0: [drm] Cannot find any crtc or sizes
Feb 22 19:49:06 DUT1394ACMR kernel: probe of i915.mei-gsc.768 returned 0 after 1475 usecs
Feb 22 19:49:06 DUT1394ACMR kernel: probe of i915.mei-gscfi.768 returned 0 after 1441 usecs
Feb 22 19:49:06 DUT1394ACMR kernel: initcall mei_gsc_driver_init+0x0/0xff0 [mei_gsc] returned 0 after 3010 usecs
Feb 22 19:49:06 DUT1394ACMR kernel: i915 0000:03:00.0: [drm] DRM_I915_DEBUG_GEM enabled
Feb 22 19:49:06 DUT1394ACMR kernel: i915 0000:03:00.0: [drm] DRM_I915_DEBUG_RUNTIME_PM enabled
Feb 22 19:49:06 DUT1394ACMR kernel: i915: Performing live selftests with st_random_seed=0x4c26c048 st_timeout=500
Feb 22 19:49:07 DUT1394ACMR kernel: i915: Running hangcheck
Feb 22 19:49:07 DUT1394ACMR kernel: calling  mei_hdcp_driver_init+0x0/0xff0 [mei_hdcp] @ 121074
Feb 22 19:49:07 DUT1394ACMR kernel: i915: Running intel_hangcheck_live_selftests/igt_hang_sanitycheck
Feb 22 19:49:07 DUT1394ACMR kernel: probe of 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04 returned 0 after 1398 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: probe of i915.mei-gsc.768-b638ab7e-94e2-4ea2-a552-d1c54b627f04 returned 0 after 97 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: initcall mei_hdcp_driver_init+0x0/0xff0 [mei_hdcp] returned 0 after 101960 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: calling  mei_pxp_driver_init+0x0/0xff0 [mei_pxp] @ 121094
Feb 22 19:49:07 DUT1394ACMR kernel: probe of 0000:00:16.0-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1 returned 0 after 435 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: mei_pxp i915.mei-gsc.768-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: bound 0000:03:00.0 (ops i915_pxp_tee_component_ops [i915])
Feb 22 19:49:07 DUT1394ACMR kernel: 100ms wait for request failed on rcs0, err=-62
Feb 22 19:49:07 DUT1394ACMR kernel: probe of i915.mei-gsc.768-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1 returned 0 after 158425 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: initcall mei_pxp_driver_init+0x0/0xff0 [mei_pxp] returned 0 after 224159 usecs
Feb 22 19:49:07 DUT1394ACMR kernel: i915/intel_hangcheck_live_selftests: igt_hang_sanitycheck failed with error -5
Feb 22 19:49:07 DUT1394ACMR kernel: i915: probe of 0000:03:00.0 failed with error -5

Those request waits, once timed out after 100ms, have never been
confirmed to still persist over another 100ms, always being able to
complete within the originally requested wait time doubled.

Taking into account potentially significant additional concurrent workload
generated by new auxiliary drivers that didn't exist before and now are
loaded in parallel with the i915 module also when loaded in selftest mode,
relax our expectations on time consumed by the sanity check request before
it completes.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 0dd4d00ee894e..9ce8ff1c04fe5 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -319,7 +319,7 @@ static int igt_hang_sanitycheck(void *arg)
 		i915_request_add(rq);
 
 		timeout = 0;
-		intel_wedge_on_timeout(&w, gt, HZ / 10 /* 100ms */)
+		intel_wedge_on_timeout(&w, gt, HZ / 5 /* 200ms */)
 			timeout = i915_request_wait(rq, 0,
 						    MAX_SCHEDULE_TIMEOUT);
 		if (intel_gt_is_wedged(gt))
-- 
2.43.0


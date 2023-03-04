Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D086AA743
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B979F10E78E;
	Sat,  4 Mar 2023 01:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8EF10E16E;
 Sat,  4 Mar 2023 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677893231; x=1709429231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7dpECU4MqObJRz0NzkxNZ7JG9chBk9PRUu+NmDoady4=;
 b=XiLZ6SXVuher3QocpjGlnDQ0AL2HQZb2ZbaVspQmaCBH+E+f3kgcFji4
 sDNo6xGLc78paopcey99azILoY+e0DdvdsdATFQwNmIu604QfxCsmSrb4
 SqTjUKqdehPVM/9D/gxet5bMNa9jEY5aX6B8Ic0fH7n6LxLo0fFKhSqJ+
 6Vgx5xjOExUmAJ8pbmKFHN3f9ZGUceI9ZKvsf2FVcLSv0PWVBZyvVakfW
 ueK0ygxctD40XnXa3MBnTdTj3IwAqlr4RkXdF+/7K17SSrcxK8Um908Dw
 1htT+IzUVfYb8kJprX0NwPwN9oq+2uipQMA40l974zuW/gYGts+UTWV39 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323504929"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="323504929"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849684693"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="849684693"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:27:10 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/pmu: Use correct requested freq for SLPC
Date: Fri,  3 Mar 2023 17:27:05 -0800
Message-Id: <20230304012705.70003-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230304012705.70003-1-ashutosh.dixit@intel.com>
References: <20230304012705.70003-1-ashutosh.dixit@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SLPC does not use 'struct intel_rps'. Use UNSLICE_RATIO bits from
GEN6_RPNSWREQ for SLPC. See intel_rps_get_requested_frequency.

Bspec: 52745

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index f0a1e36915b8..5ee836610801 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -394,8 +394,13 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
 		val = intel_rps_get_cagf(rps, intel_rps_read_rpstat_fw(rps));
-		if (!val)
-			val = rps->cur_freq;
+		if (!val) {
+			if (intel_uc_uses_guc_slpc(&gt->uc))
+				val = intel_rps_read_punit_req(rps) >>
+						GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
+			else
+				val = rps->cur_freq;
+		}
 
 		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
 				intel_gpu_freq(rps, val), period_ns / 1000);
-- 
2.38.0


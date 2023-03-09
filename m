Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75B36B1A14
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 04:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3010E138;
	Thu,  9 Mar 2023 03:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4955410E138;
 Thu,  9 Mar 2023 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678333586; x=1709869586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gyv1n1/HVMu6dQAmDj8+WCA53iPH5TlKaYEqLNv5m4=;
 b=mAn8H8qo+eQbthmku5vmlapJ5mKxRw9J5pEqsydfmXMUoFffx0CPf6RD
 9ibbIZadgswrkSr7tyJTRq5ASUbhrGwkt7Xm03XWGO/GQmBjVc2GodE47
 SWFwZ6MPUBAKzPwLSHxwkjzIuoEHJyWcxD2pLakBKbEyhZCHCvS6B498D
 1p3W3E7lNMrVVWolkp+0HuzpcFb1+uCbQVY+IJ2Jcpc69UbPGuMEbWubF
 dvcUoJLSjstzqcQbYy82Zdy1G1SrnIiJsbNn/phwT9QSqk+XoGJsyp4sk
 66rfii/g+A56RNvQUbJ/LDhSjq3h9/UExGSU19ul27wqeyRem0Kbgfd3V w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320173790"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="320173790"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820462278"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="820462278"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/pmu: Remove fallback to requested freq for SLPC
Date: Wed,  8 Mar 2023 19:46:21 -0800
Message-Id: <20230309034621.1008458-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
References: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fallback to requested freq does not work for SLPC because SLPC does not
use 'struct intel_rps'. Also for SLPC requested freq can only be obtained
from a hw register after acquiring forcewake which we don't want to do for
PMU. Therefore remove fallback to requested freq for SLPC. The actual freq
will be 0 when gt is in RC6 which is correct. Also this is rare since PMU
freq sampling happens only when gt is unparked.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 7ece883a7d95..f697fabed64a 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -393,7 +393,14 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
 		val = intel_rps_read_actual_frequency_fw(rps);
-		if (!val)
+
+		/*
+		 * SLPC does not use 'struct intel_rps'. Also for SLPC
+		 * requested freq can only be obtained after acquiring
+		 * forcewake and reading a hw register. For SLPC just
+		 * let val be 0
+		 */
+		if (!val && !intel_uc_uses_guc_slpc(&gt->uc))
 			val = intel_gpu_freq(rps, rps->cur_freq);
 
 		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
-- 
2.38.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99F6B3369
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6EB10E912;
	Fri, 10 Mar 2023 00:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8710E909;
 Fri, 10 Mar 2023 00:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678409988; x=1709945988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gyv1n1/HVMu6dQAmDj8+WCA53iPH5TlKaYEqLNv5m4=;
 b=f8GT5uY7PACqgC8powCWbp9PHgzMgRm1FlzEhIBpOkBYwpAeZixr4ytn
 kkYXR9waBZZtM5F+AI3Tg7TwAc+BunBYGAjJXSTGfuYWhwXimSBs3jRgS
 9uQzr7Gpae0gtjP3qYRDDAFl7E4clUhlLNoBRS4fdj9OheHpK3hZMV7PP
 ql898mvnJ7ql4Je4MMXGOlmrujRrtldwsA+HieRsl+oKEeNlzEi0Co7mv
 QlCY2W/yyp99D1mgETJx9oREyfUlrtZmmWxkoYqlxV0KW75JNEvLEd9y6
 8SlBWDuXMYTdQHWnoj/9vbkW0qEGaGy7ZWI+uHgALoA0Pl4Lj0DzS6/5Q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324964508"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="324964508"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 16:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677616403"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="677616403"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 16:59:47 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/pmu: Remove fallback to requested freq for SLPC
Date: Thu,  9 Mar 2023 16:59:43 -0800
Message-Id: <20230310005943.1029333-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230310005943.1029333-1-ashutosh.dixit@intel.com>
References: <20230310005943.1029333-1-ashutosh.dixit@intel.com>
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


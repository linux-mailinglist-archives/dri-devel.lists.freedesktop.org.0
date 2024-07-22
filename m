Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF6939518
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19EE10E31A;
	Mon, 22 Jul 2024 21:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RstZZjE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87510E310;
 Mon, 22 Jul 2024 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682422; x=1753218422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nCWirGS4RNaVcvVR02+jAYuMtNUcmS9KoGdmjQU7cuo=;
 b=RstZZjE9cumo6yOXRrdZxIHcKBm+0nVj8rLPzY4Pgciy8cyuEGEPe6Gn
 nOh/cEQKfLFF4WdEAylw4LcU94IDoHgUGSgIhBayzrI3AxfTvtPziOdmX
 lJbkApgJSwwdPoc8Vr779SSm3IGbMQRDcpu2U+Epxhpfwj/OH83Pkw+BK
 D2t9FuJlfsWsPqrW42nAr9/TCC/5y32sxX++Kq8VBIbFKFxZBdqAjTcAr
 1yKla3VuNKWvG8oCZB5SK/C2U7647HK8l6g0Vl7+SkkQbQeqnNdOs9wP7
 cKiBkMI5P2GQHUVgSX6gBfKdrFhBgSKPO0PsI24DSJ3z6ui8/Jwwrbu6j g==;
X-CSE-ConnectionGUID: iitCh+QKRdGGczhGzAK5cA==
X-CSE-MsgGUID: buGSdYkRS8CWtcOfidsrQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428308"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:02 -0700
X-CSE-ConnectionGUID: krU/uHwVR3O9O5JSh/ylmA==
X-CSE-MsgGUID: DMCosN1SRa24cuA9dxzvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653296"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/7] drm/i915/pmu: Drop is_igp()
Date: Mon, 22 Jul 2024 14:06:45 -0700
Message-ID: <20240722210648.80892-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722210648.80892-1-lucas.demarchi@intel.com>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
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

There's no reason to hardcode checking for integrated graphics on a
specific pci slot. That information is already available per platform an
can be checked with IS_DGFX().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 3a8bd11b87e7..b5d14dd318e4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1235,17 +1235,6 @@ static void i915_pmu_unregister_cpuhp_state(struct i915_pmu *pmu)
 	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
 }
 
-static bool is_igp(struct drm_i915_private *i915)
-{
-	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
-
-	/* IGP is 0000:00:02.0 */
-	return pci_domain_nr(pdev->bus) == 0 &&
-	       pdev->bus->number == 0 &&
-	       PCI_SLOT(pdev->devfn) == 2 &&
-	       PCI_FUNC(pdev->devfn) == 0;
-}
-
 void i915_pmu_register(struct drm_i915_private *i915)
 {
 	struct i915_pmu *pmu = &i915->pmu;
@@ -1269,7 +1258,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	pmu->cpuhp.cpu = -1;
 	init_rc6(pmu);
 
-	if (!is_igp(i915)) {
+	if (IS_DGFX(i915)) {
 		pmu->name = kasprintf(GFP_KERNEL,
 				      "i915_%s",
 				      dev_name(i915->drm.dev));
@@ -1323,7 +1312,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	pmu->base.event_init = NULL;
 	free_event_attributes(pmu);
 err_name:
-	if (!is_igp(i915))
+	if (IS_DGFX(i915))
 		kfree(pmu->name);
 err:
 	drm_notice(&i915->drm, "Failed to register PMU!\n");
@@ -1351,7 +1340,7 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 	perf_pmu_unregister(&pmu->base);
 	pmu->base.event_init = NULL;
 	kfree(pmu->base.attr_groups);
-	if (!is_igp(i915))
+	if (IS_DGFX(i915))
 		kfree(pmu->name);
 	free_event_attributes(pmu);
 }
-- 
2.43.0


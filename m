Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0A1C45C8
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27E26E463;
	Mon,  4 May 2020 18:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11DD6E461;
 Mon,  4 May 2020 18:24:53 +0000 (UTC)
IronPort-SDR: Vb3RicII126FYzxQAIVjw+RxvX/idiZk/ulGVeHE/wRq+xwm160UlcPaBheVuF72d2LUU99z5s
 TvOqwzubGlmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:24:53 -0700
IronPort-SDR: cXCXuckvFxR9pLUOMKqbMh7SbrlOnUkp8iOjsU5bt8YCyMEDsYRWdeNHF5a9OmWxdu6YbAil9F
 oz/gsk+N4V1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172226"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:24:50 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 7/9] drm/i915/pmu: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  4 May 2020 23:45:58 +0530
Message-Id: <20200504181600.18503-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index e991a707bdb7..f6f44ad5e335 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -441,7 +441,11 @@ static u64 count_interrupts(struct drm_i915_private *i915)
 
 static void i915_pmu_event_destroy(struct perf_event *event)
 {
-	WARN_ON(event->parent);
+	struct drm_i915_private *i915 =
+		container_of(event->pmu, typeof(*i915), pmu.base);
+
+	drm_WARN_ON(&i915->drm, event->parent);
+
 	module_put(THIS_MODULE);
 }
 
@@ -1058,8 +1062,10 @@ static int i915_pmu_register_cpuhp_state(struct i915_pmu *pmu)
 
 static void i915_pmu_unregister_cpuhp_state(struct i915_pmu *pmu)
 {
-	WARN_ON(pmu->cpuhp.slot == CPUHP_INVALID);
-	WARN_ON(cpuhp_state_remove_instance(pmu->cpuhp.slot, &pmu->cpuhp.node));
+	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
+
+	drm_WARN_ON(&i915->drm, pmu->cpuhp.slot == CPUHP_INVALID);
+	drm_WARN_ON(&i915->drm, cpuhp_state_remove_instance(pmu->cpuhp.slot, &pmu->cpuhp.node));
 	cpuhp_remove_multi_state(pmu->cpuhp.slot);
 	pmu->cpuhp.slot = CPUHP_INVALID;
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

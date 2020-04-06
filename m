Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345B19F4D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85126E362;
	Mon,  6 Apr 2020 11:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032E6E384;
 Mon,  6 Apr 2020 11:38:46 +0000 (UTC)
IronPort-SDR: bShdmEUNifJcKugJHSvsiRUl8PyhNGKIZirAEBotL16Vsu0xDqYgTi6VAONBfHzO5KS1qTf5rE
 UXe58z78e+Jw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:46 -0700
IronPort-SDR: efBS72rl7CNXxb14VSlj6nHrY3zHWpcjfTCfJH7lrSa6q68grGgfsDbjSBz6MzOcMoHJVMdSl3
 F8wQqpqW2s/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192546"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:43 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 16/18] drm/i915/pmu: Prefer drm_WARN_ON over WARN_ON
Date: Mon,  6 Apr 2020 16:57:58 +0530
Message-Id: <20200406112800.23762-17-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
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
 drivers/gpu/drm/i915/i915_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 2c062534eac1..1d7fffdd938a 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -458,7 +458,10 @@ static void engine_event_destroy(struct perf_event *event)
 
 static void i915_pmu_event_destroy(struct perf_event *event)
 {
-	WARN_ON(event->parent);
+	struct drm_i915_private *i915 =
+		container_of(event->pmu, typeof(*i915), pmu.base);
+
+	drm_WARN_ON(&i915->drm, event->parent);
 
 	if (is_engine_event(event))
 		engine_event_destroy(event);
@@ -1085,8 +1088,10 @@ static int i915_pmu_register_cpuhp_state(struct i915_pmu *pmu)
 
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

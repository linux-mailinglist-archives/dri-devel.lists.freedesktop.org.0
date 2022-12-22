Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29665487D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE4910E5C6;
	Thu, 22 Dec 2022 22:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45B810E5A2;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YVDkS72J5nCci1TnZK+1+7nnKYcpSMqxFI40iGbTHBQ=;
 b=Mev7ow+DP5o9nl74mQjAwhD204uw5rTx42Vs0xp1l18ZggAZH80Ipgev
 RcuPqzOR82JlsbhA724bAWeuJFnEipMfDRpdCJUD+Rid/5CrgHv1DBUj8
 rbxpRYbuPV9RwcuLtUtqFaJex95XLYm/AOjf2C9yICgFbQem66edYRh7Q
 LEsT2/iQgSbZJCa4O3fnzoZzm6k39pVv1K5t03A6sQdGmvow56RnKNyDw
 vf27EqY5CH9O5OKTZOeTawLZ6+ImIaydG2AU/5nxxXEce50Nd6hnvAW35
 qDywbPQJzoUYH8agBRaMVCgzL1OKJObbM7cqq6H9ERMVTkigiWqjrJMlb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472865"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472865"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412331"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412331"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 17/20] drm/i915/display: Fix a use-after-free when
 intel_edp_init_connector fails
Date: Thu, 22 Dec 2022 14:21:24 -0800
Message-Id: <20221222222127.34560-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

We enable the DP aux channel during probe, but may free the connector
soon afterwards. Ensure the DP aux display power put is completed before
everything is freed, to prevent a use-after-free in icl_aux_pw_to_phy(),
called from icl_combo_phy_aux_power_well_disable.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index fd0fedb65e42..cdb36e3f96cd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -786,7 +786,7 @@ void intel_display_power_flush_work(struct drm_i915_private *i915)
  * Like intel_display_power_flush_work(), but also ensure that the work
  * handler function is not running any more when this function returns.
  */
-static void
+void
 intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 2154d900b1aa..d220f6b16e00 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -195,6 +195,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     enum intel_display_power_domain domain,
 				     intel_wakeref_t wakeref);
 void intel_display_power_flush_work(struct drm_i915_private *i915);
+void intel_display_power_flush_work_sync(struct drm_i915_private *i915);
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
 void intel_display_power_put(struct drm_i915_private *dev_priv,
 			     enum intel_display_power_domain domain,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 91c93c93e5fc..220aa88c67ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -680,6 +680,8 @@ void intel_dp_aux_fini(struct intel_dp *intel_dp)
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
 		cpu_latency_qos_remove_request(&intel_dp->pm_qos);
 
+	/* Ensure async work from intel_dp_aux_xfer() is flushed before we clean up */
+	intel_display_power_flush_work_sync(dp_to_i915(intel_dp));
 	kfree(intel_dp->aux.name);
 }
 
-- 
2.37.3


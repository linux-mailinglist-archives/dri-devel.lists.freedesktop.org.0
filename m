Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56C5F7071
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2D10E8CE;
	Thu,  6 Oct 2022 21:37:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A67410E680;
 Thu,  6 Oct 2022 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665092229; x=1696628229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fKNINJziH14mrq6rqONZzOQjt8pAMg4W1LNSjeeIw8g=;
 b=maypy4+6+iSMRP4NGxa+CnI/GxMt3m94GOKrKDuVPrg5+9sl0OjvFKqG
 8nyx8eU+hBW7+oPz/tLTF1yz1E4t7sMmZiEjgE17cp8CJZaDAk3kekhIh
 GFmkjdXCT3qP3yml59JwoHEh3jDtkeaIv0e+Qfs61VFN2LRSO1exbk6l+
 brDWWJcvkip+0kidhuua/1/t9CACJ10blVWsFkoFmqeKqTNN3iVPP3AWz
 sGNqfR5T0pONHRInk8FOV9v3Pgh+HVdp1X3iZmLdOh6ZWsGoE+WuqPhFn
 Tc5iQduC6own0xCWJx5l5zip/qPsYXwGZECeoP4tNP4sHXi31Ks2KPikQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283945775"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="283945775"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 14:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="627176775"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="627176775"
Received: from relo-linux-5.jf.intel.com ([10.165.21.188])
 by fmsmga007.fm.intel.com with ESMTP; 06 Oct 2022 14:37:08 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 4/4] drm/i915: Improve long running compute w/a for GuC
 submission
Date: Thu,  6 Oct 2022 14:38:13 -0700
Message-Id: <20221006213813.1563435-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Michal Mrozek <michal.mrozek@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A workaround was added to the driver to allow compute workloads to run
'forever' by disabling pre-emption on the RCS engine for Gen12.
It is not totally unbound as the heartbeat will kick in eventually
and cause a reset of the hung engine.

However, this does not work well in GuC submission mode. In GuC mode,
the pre-emption timeout is how GuC detects hung contexts and triggers
a per engine reset. Thus, disabling the timeout means also losing all
per engine reset ability. A full GT reset will still occur when the
heartbeat finally expires, but that is a much more destructive and
undesirable mechanism.

The purpose of the workaround is actually to give compute tasks longer
to reach a pre-emption point after a pre-emption request has been
issued. This is necessary because Gen12 does not support mid-thread
pre-emption and compute tasks can have long running threads.

So, rather than disabling the timeout completely, just set it to a
'long' value.

v2: Review feedback from Tvrtko - must hard code the 'long' value
instead of determining it algorithmically. So make it an extra CONFIG
definition. Also, remove the execlist centric comment from the
existing pre-emption timeout CONFIG option given that it applies to
more than just execlists.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 39328567c2007..7cc38d25ee5c8 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
 	default 640 # milliseconds
 	help
 	  How long to wait (in milliseconds) for a preemption event to occur
-	  when submitting a new context via execlists. If the current context
-	  does not hit an arbitration point and yield to HW before the timer
-	  expires, the HW will be reset to allow the more important context
-	  to execute.
+	  when submitting a new context. If the current context does not hit
+	  an arbitration point and yield to HW before the timer expires, the
+	  HW will be reset to allow the more important context to execute.
+
+	  This is adjustable via
+	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
+
+	  May be 0 to disable the timeout.
+
+	  The compiled in default may get overridden at driver probe time on
+	  certain platforms and certain engines which will be reflected in the
+	  sysfs control.
+
+config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
+	int "Preempt timeout for compute engines (ms, jiffy granularity)"
+	default 7500 # milliseconds
+	help
+	  How long to wait (in milliseconds) for a preemption event to occur
+	  when submitting a new context to a compute capable engine. If the
+	  current context does not hit an arbitration point and yield to HW
+	  before the timer expires, the HW will be reset to allow the more
+	  important context to execute.
 
 	  This is adjustable via
 	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index fcbccd8d244e9..c1257723d1949 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -508,9 +508,14 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->props.timeslice_duration_ms =
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
-	/* Override to uninterruptible for OpenCL workloads. */
+	/*
+	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
+	 * some compute workloads run quite long threads. That means they get
+	 * reset due to not pre-empting in a timely manner. So, bump the
+	 * pre-emption timeout value to be much higher for compute engines.
+	 */
 	if (GRAPHICS_VER(i915) == 12 && (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
-		engine->props.preempt_timeout_ms = 0;
+		engine->props.preempt_timeout_ms = CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
 
 	/* Cap properties according to any system limits */
 #define CLAMP_PROP(field) \
-- 
2.37.3


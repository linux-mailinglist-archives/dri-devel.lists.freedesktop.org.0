Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22CA4CE128
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 00:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E310F961;
	Fri,  4 Mar 2022 23:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3D610F047;
 Fri,  4 Mar 2022 23:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646437605; x=1677973605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nJeE5ga6pJ23aN2MKhrNAYY7um3FoXmF8c9XEEI25UQ=;
 b=Qh9bNtSrVAm6e7Q4zHxNZkzaZQDueV4ZkEc2y1lGpC/fm018jHfqFsc+
 GL+pMZ//v4ghtoJZcAbxaCsMkv5LAvFvAxmDtOyVsYc2QE9mm4YXn7u3Q
 lj+7iTO8pcb3vKxLi2PRwYCR7Ku8Cbb/2We+glAj5+HPrDFEfi582SQcF
 cjCq1k5s6+RMOpxUfJxqtefDpBaw1eeErSi/K/silPqMGXmnqwW1JwRNS
 ZjNOQ4EVK1+DhEp2bYbQV77L1ZyPE6G5wSnUPc6pynIbnOgeeb5BOHknj
 wWZUczZEh+dc9//3h/uMLLjIfbSRwanqQ6EmWJi4iZ0BGe60GbPW1s1C0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254280746"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="254280746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 15:46:44 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="687024879"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 15:46:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/dg2: Add preemption changes for Wa_14015141709
Date: Fri,  4 Mar 2022 15:46:38 -0800
Message-Id: <20220304234639.3231617-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

Starting with DG2, preemption can no longer be controlled using userspace
on a per-context basis. Instead, the hardware only allows us to enable or
disable preemption in a global, system-wide basis.  Also, we lose the
ability to specify the preemption granularity (such as batch-level vs
command-level vs object-level).

v2 (MattR):
 - Move debugfs interface to a separate patch.  (Jani)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index beca8735bae5..f695a9c96c8d 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2310,7 +2310,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
-	if (IS_GRAPHICS_VER(i915, 9, 12)) {
+	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
 		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
 		wa_masked_en(wal,
 			     GEN7_FF_SLICE_CS_CHICKEN1,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 943267393ecb..afefb3bd2714 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1396,6 +1396,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_GUC_DEPRIVILEGE(dev_priv) \
 	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
 
+#define HAS_PERCTX_PREEMPT_CTRL(i915) \
+	((GRAPHICS_VER(i915) >= 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 55))
+
 static inline bool run_as_guest(void)
 {
 	return !hypervisor_is_type(X86_HYPER_NATIVE);
-- 
2.34.1


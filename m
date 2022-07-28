Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FD583714
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913010E086;
	Thu, 28 Jul 2022 02:42:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBFC10E070;
 Thu, 28 Jul 2022 02:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976147; x=1690512147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xHVpB6zkDipSCn0X1Zi2jWukcxVUmAzUsjYeZHrSmk0=;
 b=ZD8U2Ue6c+KZcECXX2sMQ8vnGTBWo+5ji47nvxp1Z03abF0lFDmOni9i
 CYpIBr0Xr1KsdYaOU4UMdsMLp2wOQgSQW7ysP0s69YtxAbbMW7no/7s7C
 2mxdmSJkxb1nRPLP/tBEx8M3DefEbyfZgab5y9iUTpNTqZq3xD542knOX
 qmm5dfHzd+ubqT71OX3va26IJP8QdihvIs9ObuuH6D7KTlQQXM7VyYx4F
 8qBS7WOdu9Xj/s7ZNzhDBQoz9Id3Kxq444drU/yXbP83/8KlKH9OdfrI/
 5PV4Zq3SwjX5MRGq6FNSmguTE6/FpalfgXMS7LCI9mnuJlwoKDcmTlqt4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="271443539"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="271443539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="690096039"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2022 19:42:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/6] drm/i915/guc: Route semaphores to GuC for Gen12+
Date: Wed, 27 Jul 2022 19:42:20 -0700
Message-Id: <20220728024225.2363663-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

In GuC submission mode, there is an option to use auto-switch out
semaphores and have GuC auto-switch in a waiting context. This
requires routing the semaphore interrupt to GuC.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h        |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index 8dc063f087eb1..a7092f711e9cd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -102,6 +102,10 @@
 #define   GUC_SEND_TRIGGER		  (1<<0)
 #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
 
+#define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
+#define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)
+#define   GUC_SEM_INTR_ENABLE_ALL	(0xff)
+
 #define GUC_NUM_DOORBELLS		256
 
 /* format of the HW-monitored doorbell cacheline */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 76916aed897ad..0b8c6450fa344 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4191,13 +4191,27 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 
 void intel_guc_submission_enable(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	/* Enable and route to GuC */
+	if (GRAPHICS_VER(gt->i915) >= 12)
+		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
+				   GUC_SEM_INTR_ROUTE_TO_GUC |
+				   GUC_SEM_INTR_ENABLE_ALL);
+
 	guc_init_lrc_mapping(guc);
 	guc_init_engine_stats(guc);
 }
 
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+
 	/* Note: By the time we're here, GuC may have already been reset */
+
+	/* Disable and route to host */
+	if (GRAPHICS_VER(gt->i915) >= 12)
+		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
 }
 
 static bool __guc_submission_supported(struct intel_guc *guc)
-- 
2.37.1


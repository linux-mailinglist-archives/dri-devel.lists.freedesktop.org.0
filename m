Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED25729F8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82A976CC;
	Tue, 12 Jul 2022 23:31:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D97976B9;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFqMe0j+S44jZw9uqafpjDNUbGUGAOF3nDONWQ0Vxp4=;
 b=TbttHTuumy8IGUpxqODJ0KqYg3O6B4/8dBhJzPmL13v78Rrk/+Te6qli
 KKYOBOjYR0h7m93OdU7PpwEqfSF8vTv/YrGlaujV9HDybpDwizegjXwVm
 3zI2whq5VICsWJi9Nyq2YQ6gO8mr3vnB+0xmuY+qOV2F2xTjNn8zu3xzI
 vqcTi77wDAzkrmqqHDVBJRAwucFcXLT8LPjGyAH2Z5jzCuRkFcXUwvsDD
 8BctcD8VsZj0z9II8xgkzAl9zMQ1Q6SmppYkB3VtJrI2XW8s9WuaVZxWo
 Jus2C2Vfa9R2jfGUAJuoK95DyxSz3m7c83Ss0J1je49TuzKb6Dsf/wUxe g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812567"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137776"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 07/12] drm/i915/guc: Route semaphores to GuC for Gen12+
Date: Tue, 12 Jul 2022 16:31:31 -0700
Message-Id: <20220712233136.1044951-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

Since we're going to use semaphores in selftests (and eventually in
regular GuC submission), let's route semaphores to GuC.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
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
index 40f726c61e951..7537459080278 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3953,13 +3953,27 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 
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
2.36.0


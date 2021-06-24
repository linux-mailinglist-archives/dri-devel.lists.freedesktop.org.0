Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4253B27E7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3946B6EA56;
	Thu, 24 Jun 2021 06:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343196EA09;
 Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
IronPort-SDR: XyrVT9iwcHrCd1uIfizt+Tqtri1Dt8GH8OhLk7XiqgfIpj1a9utUNOePkkwG8VmBNSrApumr7/
 lZS4qT8tYIKg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346771"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: RYOHhY4GEQGznowZd1rncVv9tddXErH/Zun6YLxym9sP55pclqWxfdQ27EKKeQQmDzjo0N0tvv
 YlTp5ByluX3w==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390963"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/47] drm/i915/guc: Add disable interrupts to guc sanitize
Date: Thu, 24 Jun 2021 00:05:02 -0700
Message-Id: <20210624070516.21893-34-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add disable GuC interrupts to intel_guc_sanitize(). Part of this
requires moving the guc_*_interrupt wrapper function into header file
intel_guc.h.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 21 +++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 40c9868762d7..85ef6767f13b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -217,9 +217,25 @@ static inline bool intel_guc_is_ready(struct intel_guc *guc)
 	return intel_guc_is_fw_running(guc) && intel_guc_ct_enabled(&guc->ct);
 }
 
+static inline void intel_guc_reset_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.reset(guc);
+}
+
+static inline void intel_guc_enable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.enable(guc);
+}
+
+static inline void intel_guc_disable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.disable(guc);
+}
+
 static inline int intel_guc_sanitize(struct intel_guc *guc)
 {
 	intel_uc_fw_sanitize(&guc->fw);
+	intel_guc_disable_interrupts(guc);
 	intel_guc_ct_sanitize(&guc->ct);
 	guc->mmio_msg = 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index f0b02200aa01..ab11fe731ee7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -207,21 +207,6 @@ static void guc_handle_mmio_msg(struct intel_guc *guc)
 	spin_unlock_irq(&guc->irq_lock);
 }
 
-static void guc_reset_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.reset(guc);
-}
-
-static void guc_enable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.enable(guc);
-}
-
-static void guc_disable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.disable(guc);
-}
-
 static int guc_enable_communication(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -242,7 +227,7 @@ static int guc_enable_communication(struct intel_guc *guc)
 	guc_get_mmio_msg(guc);
 	guc_handle_mmio_msg(guc);
 
-	guc_enable_interrupts(guc);
+	intel_guc_enable_interrupts(guc);
 
 	/* check for CT messages received before we enabled interrupts */
 	spin_lock_irq(&gt->irq_lock);
@@ -265,7 +250,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_clear_mmio_msg(guc);
 
-	guc_disable_interrupts(guc);
+	intel_guc_disable_interrupts(guc);
 
 	intel_guc_ct_disable(&guc->ct);
 
@@ -463,7 +448,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (ret)
 		goto err_out;
 
-	guc_reset_interrupts(guc);
+	intel_guc_reset_interrupts(guc);
 
 	/* WaEnableuKernelHeaderValidFix:skl */
 	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
-- 
2.28.0


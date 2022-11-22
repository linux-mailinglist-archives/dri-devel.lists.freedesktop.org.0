Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848463484A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B47510E46B;
	Tue, 22 Nov 2022 20:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CDE10E1D0;
 Tue, 22 Nov 2022 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149408; x=1700685408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oXwjMh/A6QuL7LWvBGoJ1iZZFCyWKVCyIId+nziit9s=;
 b=D6lokjYrVvbFV11/GZclAgbMVD052F2xRIdz/tmZXndI2dBG5tC+M9Ws
 UM6JsSWK3WUVYx2zAA6MHbbuQ03W7MaOfwC+upDe/522CDTzf6fXtyeSb
 KCEeVKxR9qa/amwPIAt9k+Z0XOzL8qdK9gPDmeZycQrzg7Ll/cwKN/PQY
 yx1GauIu3524KzD7JlMTj0qjvBTRyiKtHChit+pHDy19GLeuuTMvOX9tL
 Z12r8wjj1Hzi/r0ef5j0TEHjypjvz4Og7AEL/wTE1anvKKHn1Fkj4pQW3
 DzEdqJW4lZiVOwZmoaP1w6eilHRKFGDwVb+HSJRPjXRhFO+ZWU4sz4pZX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294298885"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294298885"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730535762"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730535762"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gt: Pass gt rather than uncore to lowest-level
 reads/writes
Date: Tue, 22 Nov 2022 12:33:59 -0800
Message-Id: <20221122203401.3172897-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203401.3172897-1-matthew.d.roper@intel.com>
References: <20221122203401.3172897-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Passing the GT rather than uncore to the lowest level MCR read and write
functions will make it easier to introduce dedicated MCR locking in a
folling patch.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index ea86c1ab5dc5..f4484bb18ec9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -221,7 +221,7 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
 
 /*
  * rw_with_mcr_steering_fw - Access a register with specific MCR steering
- * @uncore: pointer to struct intel_uncore
+ * @gt: GT to read register from
  * @reg: register being accessed
  * @rw_flag: FW_REG_READ for read access or FW_REG_WRITE for write access
  * @group: group number (documented as "sliceid" on older platforms)
@@ -232,10 +232,11 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
  *
  * Caller needs to make sure the relevant forcewake wells are up.
  */
-static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
+static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
 				   i915_mcr_reg_t reg, u8 rw_flag,
 				   int group, int instance, u32 value)
 {
+	struct intel_uncore *uncore = gt->uncore;
 	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
 
 	lockdep_assert_held(&uncore->lock);
@@ -308,11 +309,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 	return val;
 }
 
-static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
+static u32 rw_with_mcr_steering(struct intel_gt *gt,
 				i915_mcr_reg_t reg, u8 rw_flag,
 				int group, int instance,
 				u32 value)
 {
+	struct intel_uncore *uncore = gt->uncore;
 	enum forcewake_domains fw_domains;
 	u32 val;
 
@@ -325,7 +327,7 @@ static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
 	spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
 
-	val = rw_with_mcr_steering_fw(uncore, reg, rw_flag, group, instance, value);
+	val = rw_with_mcr_steering_fw(gt, reg, rw_flag, group, instance, value);
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irq(&uncore->lock);
@@ -347,7 +349,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
 		      i915_mcr_reg_t reg,
 		      int group, int instance)
 {
-	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ, group, instance, 0);
+	return rw_with_mcr_steering(gt, reg, FW_REG_READ, group, instance, 0);
 }
 
 /**
@@ -364,7 +366,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
 void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
 				int group, int instance)
 {
-	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE, group, instance, value);
+	rw_with_mcr_steering(gt, reg, FW_REG_WRITE, group, instance, value);
 }
 
 /**
@@ -588,7 +590,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
 		if (reg_needs_read_steering(gt, reg, type)) {
 			get_nonterminated_steering(gt, type, &group, &instance);
-			return rw_with_mcr_steering_fw(gt->uncore, reg,
+			return rw_with_mcr_steering_fw(gt, reg,
 						       FW_REG_READ,
 						       group, instance, 0);
 		}
@@ -615,7 +617,7 @@ u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
 	for (type = 0; type < NUM_STEERING_TYPES; type++) {
 		if (reg_needs_read_steering(gt, reg, type)) {
 			get_nonterminated_steering(gt, type, &group, &instance);
-			return rw_with_mcr_steering(gt->uncore, reg,
+			return rw_with_mcr_steering(gt, reg,
 						    FW_REG_READ,
 						    group, instance, 0);
 		}
-- 
2.38.1


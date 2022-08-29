Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220555A539B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9EF10EAF5;
	Mon, 29 Aug 2022 17:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBD10EABC;
 Mon, 29 Aug 2022 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661795691; x=1693331691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+W8c6Q2l2+MEvSCQbmgOZfhOIwYolBVLFUbyIDJ7M6k=;
 b=QNFAx/LQGcWGgInFy2toV9pUv2oiUuBCryegQqupruF+ZUosWv6KGKvE
 li6IfDdL4ERUb8zb2sSTg6ml7rauQQLl/3iNugtygdHDjTeh38UJYLtFf
 rinx2VEh5P4W/UXwim7vzmtZn45HNMS9YJ66jQAde4/9Lqla0XObzQ3Yl
 zm+6NB4vMxcIoWhXi/YKg1lTGqneCtnqwdl7CCwte/vZGZtO7aQL2X2s9
 Kw9ZFFdb775y2SjL/54jUa6Cr2o6jUviqwgWZdakUgSY/1DnrNZdVfUST
 ORTmIkcWlZTTYL/IqZCwQ2nTLDRFkYrFe8AhJGtk/SW2u2cdVYBDP0EbR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381246658"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; d="scan'208";a="381246658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="562297206"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 10:02:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Date: Mon, 29 Aug 2022 10:02:31 -0700
Message-Id: <20220829170238.969875-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829170238.969875-1-matthew.d.roper@intel.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the locking for MMIO debug (and the final check for unclaimed
accesses when resuming debug after a userspace-initiated forcewake) will
make it simpler to completely skip MMIO debug handling on uncores that
don't support it in future patches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 41 +++++++++++++++--------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 9b81b2543ce2..e717ea55484a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -50,23 +50,33 @@ intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug)
 	mmio_debug->unclaimed_mmio_check = 1;
 }
 
-static void mmio_debug_suspend(struct intel_uncore_mmio_debug *mmio_debug)
+static void mmio_debug_suspend(struct intel_uncore *uncore)
 {
-	lockdep_assert_held(&mmio_debug->lock);
+	spin_lock(&uncore->debug->lock);
 
 	/* Save and disable mmio debugging for the user bypass */
-	if (!mmio_debug->suspend_count++) {
-		mmio_debug->saved_mmio_check = mmio_debug->unclaimed_mmio_check;
-		mmio_debug->unclaimed_mmio_check = 0;
+	if (!uncore->debug->suspend_count++) {
+		uncore->debug->saved_mmio_check = uncore->debug->unclaimed_mmio_check;
+		uncore->debug->unclaimed_mmio_check = 0;
 	}
+
+	spin_unlock(&uncore->debug->lock);
 }
 
-static void mmio_debug_resume(struct intel_uncore_mmio_debug *mmio_debug)
+static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
+
+static void mmio_debug_resume(struct intel_uncore *uncore)
 {
-	lockdep_assert_held(&mmio_debug->lock);
+	spin_lock(&uncore->debug->lock);
+
+	if (!--uncore->debug->suspend_count)
+		uncore->debug->unclaimed_mmio_check = uncore->debug->saved_mmio_check;
 
-	if (!--mmio_debug->suspend_count)
-		mmio_debug->unclaimed_mmio_check = mmio_debug->saved_mmio_check;
+	if (check_for_unclaimed_mmio(uncore))
+		drm_info(&uncore->i915->drm,
+			 "Invalid mmio detected during user access\n");
+
+	spin_unlock(&uncore->debug->lock);
 }
 
 static const char * const forcewake_domain_names[] = {
@@ -677,9 +687,7 @@ void intel_uncore_forcewake_user_get(struct intel_uncore *uncore)
 	spin_lock_irq(&uncore->lock);
 	if (!uncore->user_forcewake_count++) {
 		intel_uncore_forcewake_get__locked(uncore, FORCEWAKE_ALL);
-		spin_lock(&uncore->debug->lock);
-		mmio_debug_suspend(uncore->debug);
-		spin_unlock(&uncore->debug->lock);
+		mmio_debug_suspend(uncore);
 	}
 	spin_unlock_irq(&uncore->lock);
 }
@@ -695,14 +703,7 @@ void intel_uncore_forcewake_user_put(struct intel_uncore *uncore)
 {
 	spin_lock_irq(&uncore->lock);
 	if (!--uncore->user_forcewake_count) {
-		spin_lock(&uncore->debug->lock);
-		mmio_debug_resume(uncore->debug);
-
-		if (check_for_unclaimed_mmio(uncore))
-			drm_info(&uncore->i915->drm,
-				 "Invalid mmio detected during user access\n");
-		spin_unlock(&uncore->debug->lock);
-
+		mmio_debug_resume(uncore);
 		intel_uncore_forcewake_put__locked(uncore, FORCEWAKE_ALL);
 	}
 	spin_unlock_irq(&uncore->lock);
-- 
2.37.2


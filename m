Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D005AF88A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431B10E098;
	Tue,  6 Sep 2022 23:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177910E086;
 Tue,  6 Sep 2022 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508186; x=1694044186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QP/62W3/f2TqfdCnqaUd57b762HZIJDWu2jZP9nGWjk=;
 b=Qp5BsgARTHIcWG0L+OpQwB0kCp5gcAypqthQeNLC+++HuMMnPrucfgEF
 hIbOV4xtbl8QfCLYquLf8Hr56D23W7rHAI8ZdJ8pwRRnXMjKMjhDnC/6e
 wmxXEVpt646IQyV3WgBAPrb55mGSboR87jOK1F6g6gIVgDUWufMrL6ZsY
 gak3qFfTHG1ceyUkgsbnGESL8hgSTPVodC2S5yPRvjMD91eUZ11znt2kf
 7rpF2L8BptCr3aofeI4+E/FA3bNOTnpeduVX5KGF71jk68RoWw3lS0xmG
 WLY8KfJqh60DdXZ53sYOUZFqgMZo7sIEAV2ScYImB9dhxeOQc4dDqE5ht A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298053140"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="298053140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920306"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/14] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Date: Tue,  6 Sep 2022 16:49:21 -0700
Message-Id: <20220906234934.3655440-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the locking for MMIO debug (and the final check for unclaimed
accesses when resuming debug after a userspace-initiated forcewake) will
make it simpler to completely skip MMIO debug handling on uncores that
don't support it in future patches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
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


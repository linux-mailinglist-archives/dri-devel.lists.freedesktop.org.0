Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D64F9B00
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247410E30E;
	Fri,  8 Apr 2022 16:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095210E2DD;
 Fri,  8 Apr 2022 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649436542; x=1680972542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HuAQW7rKDuiqFl8WHGqncM6dNUW96BclvUx8oJhOfsU=;
 b=dav9H/o45APQ5VSHK4ACJ9SrLgI6pKLBzsxmyniMS5MPaLtdcYyvNPz3
 WPdgD6c92UZ4FOVzK251pD4FNDBKudgtqZKJhHDvWjjP/VOWZTn0wA1vF
 YuRJAKHLu7KGNQK1VsY9MJGMyaS+vLfGGKywiOZbjzHsMCFbOJhd0Q7O6
 66J1PO9Th1FaC3PbUt5P9KniBXu6UUqsiZzzqnL0nFJuHV1b7IxQ8svGO
 cHtnxB+DDt/60mewd7ZgF4JmwvHgV+pAr9lpO7N1nPRrjaoo8uZI8D+OQ
 Cg4cPBPNDVALj83H6WG4JotEOjBr8DRGcCMGgmcwCdj7EHHjBWiNHVO+P g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261325875"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="261325875"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 09:48:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="524844904"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 09:48:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/uncore: Warn only if unclaimed access remains flagged
Date: Fri,  8 Apr 2022 09:48:37 -0700
Message-Id: <20220408164837.3845786-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 4b276ed3c7ac ("drm/i915/uncore: Warn on previous unclaimed
accesses") tried to improve our report of unclaimed register access,
however it unveiled cases that were not previously causing any harm.

Downgrade the first message to debug so we can still see them and
eventually fix, but don't warn.

Fixes: 4b276ed3c7ac ("drm/i915/uncore: Warn on previous unclaimed accesses")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Tested on top of intel/CI_DRM_11471 as drm-tip is currently broken by
other things.

 drivers/gpu/drm/i915/intel_uncore.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index df59ec88459e..83517a703eb6 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1518,13 +1518,11 @@ __unclaimed_previous_reg_debug(struct intel_uncore *uncore,
 			       const i915_reg_t reg,
 			       const bool read)
 {
-	if (drm_WARN(&uncore->i915->drm,
-		     check_for_unclaimed_mmio(uncore),
-		     "Unclaimed access detected before %s register 0x%x\n",
-		     read ? "read from" : "write to",
-		     i915_mmio_reg_offset(reg)))
-		/* Only report the first N failures */
-		uncore->i915->params.mmio_debug--;
+	if (check_for_unclaimed_mmio(uncore))
+		drm_dbg(&uncore->i915->drm,
+			"Unclaimed access detected before %s register 0x%x\n",
+			read ? "read from" : "write to",
+			i915_mmio_reg_offset(reg));
 }
 
 static inline void
-- 
2.35.1


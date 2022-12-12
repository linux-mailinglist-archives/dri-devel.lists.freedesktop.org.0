Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5C64A4A0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 17:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1B510E086;
	Mon, 12 Dec 2022 16:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A310E086;
 Mon, 12 Dec 2022 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670861669; x=1702397669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VrzWj9lWfykGiVQkbkT7RF/HzKw+iPf7nBZwnVXRAiw=;
 b=S+rFQFz2v9jN5oRU3wglW3tYyZ8LV1Ajam4fMNgCP14SndRv9KSo4yfp
 5FHuuDp45t/XXFk06s5whtBc8uGbKNIba7EPjYt0vOL+TKWn+F/kOYBvM
 CUKJLs7SxKkfyRY6zRoOvUkSUzFYQKdNpdTPx5IGZn3O0lJVMgKH6ryj0
 B+nxpVY/G0atn6Pq9jbKCZDI249rVB9OO4Ieqd3mlPMUr5NNjpotyAJ1f
 AL7XA+m+wdYlU++s1nSannOT08e4o6xogCOzc2PjA2ZdQhqVExaYkPxhn
 oqzouEjAcS+R8nrqW3xtJukVu+SiQFLmyhHbKNY8bYoGKTJ6cvcLhvlDW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="297572292"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="297572292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 08:14:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="680728030"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="680728030"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.59.70])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 08:14:09 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Reset twice
Date: Mon, 12 Dec 2022 17:13:38 +0100
Message-Id: <20221212161338.1007659-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

After applying an engine reset, on some platforms like Jasperlake, we
occasionally detect that the engine state is not cleared until shortly
after the resume. As we try to resume the engine with volatile internal
state, the first request fails with a spurious CS event (it looks like
it reports a lite-restore to the hung context, instead of the expected
idle->active context switch).

Signed-off-by: Chris Wilson <hris@chris-wilson.co.uk>
Cc: stable@vger.kernel.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 34 ++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index ffde89c5835a4..88dfc0c5316ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -268,6 +268,7 @@ static int ilk_do_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask,
 static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
 {
 	struct intel_uncore *uncore = gt->uncore;
+	int loops = 2;
 	int err;
 
 	/*
@@ -275,18 +276,39 @@ static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
 	 * for fifo space for the write or forcewake the chip for
 	 * the read
 	 */
-	intel_uncore_write_fw(uncore, GEN6_GDRST, hw_domain_mask);
+	do {
+		intel_uncore_write_fw(uncore, GEN6_GDRST, hw_domain_mask);
 
-	/* Wait for the device to ack the reset requests */
-	err = __intel_wait_for_register_fw(uncore,
-					   GEN6_GDRST, hw_domain_mask, 0,
-					   500, 0,
-					   NULL);
+		/*
+		 * Wait for the device to ack the reset requests.
+		 *
+		 * On some platforms, e.g. Jasperlake, we see see that the
+		 * engine register state is not cleared until shortly after
+		 * GDRST reports completion, causing a failure as we try
+		 * to immediately resume while the internal state is still
+		 * in flux. If we immediately repeat the reset, the second
+		 * reset appears to serialise with the first, and since
+		 * it is a no-op, the registers should retain their reset
+		 * value. However, there is still a concern that upon
+		 * leaving the second reset, the internal engine state
+		 * is still in flux and not ready for resuming.
+		 */
+		err = __intel_wait_for_register_fw(uncore, GEN6_GDRST,
+						   hw_domain_mask, 0,
+						   2000, 0,
+						   NULL);
+	} while (err == 0 && --loops);
 	if (err)
 		GT_TRACE(gt,
 			 "Wait for 0x%08x engines reset failed\n",
 			 hw_domain_mask);
 
+	/*
+	 * As we have observed that the engine state is still volatile
+	 * after GDRST is acked, impose a small delay to let everything settle.
+	 */
+	udelay(50);
+
 	return err;
 }
 
-- 
2.38.1


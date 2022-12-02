Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C009E6410BB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 23:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E42810E734;
	Fri,  2 Dec 2022 22:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C001D10E72D;
 Fri,  2 Dec 2022 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670020545; x=1701556545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/Vhykh0WnbAASfSaYpYzAajfQZQRl91Y6Fij/vAYxBk=;
 b=BN8LF13qtBZ2tl7zJN+wMeP52FQX9FznaCU57SuQxn4LAclytWX7uwZ6
 fJZGN+UF3p5CSMTUUnX9ek98U01YxJZjnLsGB1QNJcJ/bvbIJcpQim2D6
 cI1xQXLabPaYjCcowthY9dWOegau21R23hE4CfbXk4KMdP+DdV4w+3A6g
 TY1CR3urf2FqbuT5trVrcDR2TYmqq+ukIfmKqCGNssAWQZnr62D0xXAEt
 s0Q/k66Ytl1pol/Sj+lS7Ebv2EUKspuLf26GwFfklHangSlClceadDgdM
 aVp+HlFggL/mXrU0v5l+8EOr8q8mpVGyKzOfdg8g3Z0pFPfP0g309dSrm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="316085487"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="316085487"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 14:35:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="645185982"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="645185982"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 14:35:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Check full IP version when applying hw steering
 semaphore
Date: Fri,  2 Dec 2022 14:35:28 -0800
Message-Id: <20221202223528.714491-1-matthew.d.roper@intel.com>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When determining whether the platform has a hardware-level steering
semaphore (i.e., MTL and beyond), we need to use GRAPHICS_VER_FULL() to
compare the full version rather than just the major version number
returned by GRAPHICS_VER().

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3100240bf846 ("drm/i915/mtl: Add hardware-level lock for steering")
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 087e4ac5b68d..41a237509dcf 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -367,7 +367,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
 	 * driver threads, but also with hardware/firmware agents.  A dedicated
 	 * locking register is used.
 	 */
-	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
 		err = wait_for(intel_uncore_read_fw(gt->uncore,
 						    MTL_STEER_SEMAPHORE) == 0x1, 100);
 
@@ -407,7 +407,7 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
 {
 	spin_unlock_irqrestore(&gt->mcr_lock, flags);
 
-	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
 		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
 }
 
-- 
2.38.1


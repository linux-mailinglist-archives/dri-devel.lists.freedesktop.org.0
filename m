Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4DF63DB8E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 18:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1EB10E0EB;
	Wed, 30 Nov 2022 17:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA3B10E0EB;
 Wed, 30 Nov 2022 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669828008; x=1701364008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qb6/iCbkvbsuxaPQyFaZbyV/b+l7zRc4JAPXmM4HZ14=;
 b=lIU3OqV6odx7ZTwSaUWYFsqbt9sXN9V1irnPFGNamPVwJgv+EVoH2TQD
 1oKyMWD4UEZ13j8XR39UeBRI4xGdF+o5Fj2vFb6qkx9luL8IxXrw0pfOM
 5qTudxxlHR0hq2yDa6cepRGT9aI7pDE7aGKu4LKSa39VFrStWqxsqUJ98
 gq2PrnR574+phUcTUM+Zl4Z6XOOMWLmcheVqOzO1eDvSF4aWZ9xeHeaHA
 EL2jEVrLWRouk1ftYXBkUEF5SmJFkxWAg6OhojNAu8hEQOd9oVLMNUPM8
 Cytlu+ZLx7p2UByuPBgyQNbOB7L2dsDNc56E7hgK5ejDcwHh0EtiE1lyo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="401729562"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="401729562"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 09:06:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973178867"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="973178867"
Received: from wboyer-ubuntu01.jf.intel.com ([10.54.75.13])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 09:06:47 -0800
From: Wayne Boyer <wayne.boyer@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [linux-gfx] [PATCH] drm/i915/pvc: Implement recommended caching policy
Date: Wed, 30 Nov 2022 09:07:23 -0800
Message-Id: <20221130170723.2460014-1-wayne.boyer@intel.com>
X-Mailer: git-send-email 2.37.3
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

As per the performance tuning guide, set the HOSTCACHEEN bit to
implement the recommended caching policy on PVC.

Signed-off-by: Wayne Boyer <wayne.boyer@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 784152548472..f96570995cfc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -973,6 +973,7 @@
 #define   GEN7_L3AGDIS				(1 << 19)
 
 #define XEHPC_LNCFMISCCFGREG0			_MMIO(0xb01c)
+#define   XEHPC_HOSTCACHEEN			REG_BIT(1)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
 #define GEN7_L3CNTLREG2				_MMIO(0xb020)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 1b0e40e68a9d..35e3f43e8b06 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2903,6 +2903,7 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 	if (IS_PONTEVECCHIO(i915)) {
 		wa_write(wal, XEHPC_L3SCRUB,
 			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
+		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
 	}
 
 	if (IS_DG2(i915)) {
-- 
2.37.3


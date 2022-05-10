Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C178521B34
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 16:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA57810E4AE;
	Tue, 10 May 2022 14:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2CC10EE55;
 Tue, 10 May 2022 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652191529; x=1683727529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JTmayJQXofxRK1YjFl+ZsCmvDuvInG1owZ8vPyDE/+w=;
 b=hwDhF7NH5NPvtoOWLAyyPUrxcRs7XTNG/rsGn0rdwFHCVyryfJ+JgzfI
 lovb2A+8M1REMfWxJZAIskFxGqcRMwcEJPzHwXP27uWf10cnX0CZbmOK5
 C9Mb+jGxqMWo2YrMuiBTj2fcyJ0UFK5+oE7IZ0bm8hH/iMlgiJgwI2lmt
 pIimaR3OKIbocSvBdPd/T8H5Kd5KAjPCqSUnv31fk5ZG44cPgCLRjqm7s
 1zsBH2zNB7XF8CKbD4viyjdzEIKebEWs7AS91aYf8MgLV7BWtYpKg/GVi
 BJLut49GjoLVNKwgqTlLLntTmLQnx7ZuQzAOgUbrQhCTfbDRI7/xHZ6Rk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332417295"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="332417295"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 07:05:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593527938"
Received: from brauta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 07:05:08 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gt: Fix use of static in macro mismatch
Date: Tue, 10 May 2022 16:04:47 +0200
Message-Id: <20220510140447.80200-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The INTEL_GT_RPS_SYSFS_ATTR was creating to different structures
but. When called with the "static" keyword this is affecting only
the first structure, while the second is created as non static.

Move the static keyword inside the macros to affect both the
structures.

Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Fixes: 56a709cf77468 ("drm/i915/gt: Create per-tile RPS sysfs interfaces")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index e92990d514b24..f76b6cf8040ec 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -457,22 +457,23 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
 }
 
 #define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
-	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
-	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
+	static struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
+	static struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
 
 #define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
 		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
 #define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
 		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
 
-static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
-static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
+/* The below macros generate static structures */
+INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
+INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
 
 static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
 
-- 
2.36.0


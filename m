Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2F49559BF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409010E102;
	Sat, 17 Aug 2024 21:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jx/prvm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADA410E101;
 Sat, 17 Aug 2024 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928497; x=1755464497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydHaBVt9Wv9aXb17X/Pty4DxELrLNccHNHiRK1Sc318=;
 b=Jx/prvm3fR3tG8Zt8R1CEN2ek7Oh1fe20GzJQxE3Z0/PBZaiIIuaXIbq
 CLccjiBp6vsz97LrNfHr1OEt+d71+mPKZ4d/ETzb67Doqt4MqCZLPJwe6
 iZN65MujZ8/WFPOzzlwe+E4hvP+hGn9ONuja45R/Pda7XfnH5XnF8FREx
 GpXCzkbaGrNWcAmYIY5Y3BULFU6cHzeD8MLTQU4yaPa+XTC5iRedL67kw
 jdfV08jKXSkQHTzY08UZMzMRdbYfGIRPvU9g0Z4P1tEOGBILrjkfxKDo9
 N8lFSI3Ptw08E74joGPueaNY0WEJ450hW4G9kUWJfz2M82fCfxn8FeD68 A==;
X-CSE-ConnectionGUID: AOBGPzU0QbyhfYhDKXUXZQ==
X-CSE-MsgGUID: AQ8ZH+R1SD+xBm6v3KdQGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32775445"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="32775445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:37 -0700
X-CSE-ConnectionGUID: a//IdLayRl6SMMwgDQE4/w==
X-CSE-MsgGUID: RPVlaKHoQN6EsNvilvut3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64382559"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 08/11] drm/i915/gt: Store active CCS mask
Date: Sat, 17 Aug 2024 23:00:23 +0200
Message-ID: <20240817210026.310645-9-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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

To support upcoming patches, we need to store the current mask
for active CCS engines.

Active engines refer to those exposed to userspace via the UABI
engine list.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 49493928f714..01ce719cf475 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -9,6 +9,23 @@
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
 
+static void update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
+{
+	unsigned long cslices_mask = CCS_MASK(gt);
+	int i;
+
+	/* Mask off all the CCS engines */
+	gt->ccs.ccs_mask = 0;
+
+	for_each_set_bit(i, &cslices_mask, I915_MAX_CCS) {
+		gt->ccs.ccs_mask |= BIT(i);
+
+		ccs_mode--;
+		if (!ccs_mode)
+			break;
+	}
+}
+
 void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
 {
 	unsigned long cslices_mask = CCS_MASK(gt);
@@ -91,6 +108,9 @@ void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
 void intel_gt_ccs_mode_init(struct intel_gt *gt)
 {
 	mutex_init(&gt->ccs.mutex);
+
+	/* Set CCS balance mode 1 in the ccs_mask */
+	update_ccs_mask(gt, 1);
 }
 
 static ssize_t num_cslices_show(struct device *dev,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index a833b395237b..235b4b81eecd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -220,6 +220,7 @@ struct intel_gt {
 	struct {
 		struct mutex mutex;
 		u32 mode_reg_val;
+		intel_engine_mask_t ccs_mask;
 	} ccs;
 
 	/*
-- 
2.45.2


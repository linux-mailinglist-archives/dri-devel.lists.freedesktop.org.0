Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3147DE77B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC8210E7C4;
	Wed,  1 Nov 2023 21:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B33210E7C4;
 Wed,  1 Nov 2023 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698875091; x=1730411091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZaA7IxXU/oMekj93c2wiLKiIpcyWamm5CLLsoXMKL6E=;
 b=bw3Rpdj5k6cboHg0TVbhw8n8m24Df2HZxl2zpoyLb6CkqW9fcqgKGrZ1
 bdgZ6KxUtZi4Za5Ap4bf1qT3Rsk2Wa0SMoZ7wRykG63bV96ovxoFsFwvr
 tDu6G4z2TYHozOrJe+AFrMPxzHo+1+AXyLT0hGysFkZUGNyAohjIgqWj6
 HGqJ97mPcIaPOeJdFbhOrXP5RwCerNOByiCpfaaBBSaFigvMMoaKDGG8c
 3VH9kT7v3f2m47TIi1ut/Qsh0/r5Hv/opm4WJUcuI2IvUPDoaLUi9PJnA
 z9olfeHtXoC67J9ItEKBqMsW65kDmtUmUHSlRqVq+7uGyqZY8itRK2iO8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="392458689"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="392458689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 14:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="790209700"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="790209700"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orsmga008.jf.intel.com with ESMTP; 01 Nov 2023 14:44:50 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Skip pxp init if gt is wedged
Date: Wed,  1 Nov 2023 14:44:46 -0700
Message-Id: <20231101214446.600290-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gt wedged could be triggered by missing guc firmware file, HW not
working, etc. Once triggered, it means all gt usage is dead, therefore we
can't enable pxp under this fatal error condition.

v2: Updated commit message.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index dc327cf40b5a..923f233c91e1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -212,6 +212,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
 	if (!gt)
 		return -ENODEV;
 
+	if (intel_gt_is_wedged(gt))
+		return -ENODEV;
+
 	/*
 	 * At this point, we will either enable full featured PXP capabilities
 	 * including session and object management, or we will init the backend tee
-- 
2.34.1


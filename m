Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E003F665943
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABF10E6FE;
	Wed, 11 Jan 2023 10:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091D210E6FE;
 Wed, 11 Jan 2023 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673433911; x=1704969911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=exL/2C0X7BsFVMhU6qIdFRUxqlkL7NLXD/xjEpkD/NE=;
 b=HDGEcgyaf2AkV/bWQVbe2X7o6bAjVRHYuStOAEqaeEUlxjEvq3Wt7K1s
 FTKMGNTfl7n6o54TYFlIMelHKsl4/j48o3clA6IR6EaTkdXdHq/XiV6HY
 IZvesMCCdSWdZsSnARkbvc+y2enBXAxoQHz7Oab08Q1ByIau0oKY3IguO
 E5oXPPZ2Ml1wbOJ0XURE+7MIwP1R2aDfS/JYnFYrYwAU60By2duq1Hxct
 wqZiDafSd2AE+rbzCtFGhzwp73uGGF/k/lYdKBcrQ6iHNpJwOAWYG2zlX
 fLEKTZvhqhJazGB4SIzEC0jsWVXKe7pHOQq8NKkAwApaSamP8IRXeXPxD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409624761"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="409624761"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 02:45:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607305151"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="607305151"
Received: from silin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.53.16])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 02:45:06 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Date: Wed, 11 Jan 2023 11:44:47 +0100
Message-Id: <20230111104447.338136-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

During module load not all the punit transaction have completed
and we might end up timing out, as shown by the following
warning:

   i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)

Wait 10 seconds for the punit to settle and complete any
outstanding transactions upon module load.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
index a234d9b4ed14..3db2ba439bb5 100644
--- a/drivers/gpu/drm/i915/intel_pcode.c
+++ b/drivers/gpu/drm/i915/intel_pcode.c
@@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
 #undef COND
 }
 
+static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
+{
+	if (__intel_wait_for_register_fw(uncore,
+					 GEN6_PCODE_MAILBOX,
+					 GEN6_PCODE_READY, 0,
+					 500, timeout_ms,
+					 NULL))
+		return -EPROBE_DEFER;
+
+	return skl_pcode_request(uncore,
+				 DG1_PCODE_STATUS,
+				 DG1_UNCORE_GET_INIT_STATUS,
+				 DG1_UNCORE_INIT_STATUS_COMPLETE,
+				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
+}
+
 int intel_pcode_init(struct intel_uncore *uncore)
 {
+	int err;
+
 	if (!IS_DGFX(uncore->i915))
 		return 0;
 
-	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
-				 DG1_UNCORE_GET_INIT_STATUS,
-				 DG1_UNCORE_INIT_STATUS_COMPLETE,
-				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
+	/*
+	 * Wait 10 seconds so that the punit to settle and complete
+	 * any outstanding transactions upon module load
+	 */
+	err = pcode_init_wait(uncore, 10000);
+
+	if (err) {
+		drm_notice(&uncore->i915->drm,
+			   "Waiting for HW initialisation...\n");
+		err = pcode_init_wait(uncore, 180000);
+	}
+
+	return err;
 }
 
 int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
-- 
2.34.1


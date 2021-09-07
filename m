Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF10403181
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 01:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE526E0E1;
	Tue,  7 Sep 2021 23:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A716E0E1;
 Tue,  7 Sep 2021 23:27:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="242632326"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="242632326"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 16:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="503278036"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2021 16:27:28 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/i915: Get PM ref before accessing HW register
Date: Tue,  7 Sep 2021 16:27:04 -0700
Message-Id: <20210907232704.12982-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
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

Seeing these errors when GT is likely in suspend state-
"RPM wakelock ref not held during HW access"

Ensure GT is awake before trying to access HW registers. Avoid
reading the register if that is not the case.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 3489f5f0cac1..e1a198bbd135 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1969,8 +1969,14 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 u32 intel_rps_read_punit_req(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
+	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
+	intel_wakeref_t wakeref;
+	u32 freq = 0;
 
-	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
+	with_intel_runtime_pm_if_in_use(rpm, wakeref)
+		freq = intel_uncore_read(uncore, GEN6_RPNSWREQ);
+
+	return freq;
 }
 
 static u32 intel_rps_get_req(u32 pureq)
-- 
2.25.0


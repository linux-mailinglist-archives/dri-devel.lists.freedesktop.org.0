Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C961773A842
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83CE10E5A7;
	Thu, 22 Jun 2023 18:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55710E597;
 Thu, 22 Jun 2023 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687458487; x=1718994487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7i915zSnstzNKPvIzxztfUBfh9qOyfI3qCeFZGXamoM=;
 b=QEE+9TRuzQd5enQ3oiOQKFp/andFnt3r+tYtLdsYSLdYCjWKGJceMVR9
 kyrrAtOFTrhthjPSYb+Oo0IsCfyC64qZjyiTjB0Te+B+AXMbtowG+qlFg
 xs2W6mBAND8Nqq9FolSwxVg24DPgBtjJyzB+JWeg7Ijk7eRGkmnsQ5LCo
 RwAa9OSkW+L+Kyhodl5G/7INcfgQZ5JWy2yDpgnwsHK8U33e8y2Jp4g9u
 l2kIQwODD0F5RTiMCiU0yNsn90E98BMHIXX46j6oKaP2V03Obx3azLkAj
 K3TFogC5q6qPmUdeRAi8fZHD2LjKEUnkI4iSiSzyPxLSPorvmFj8lalVg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359437771"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="359437771"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780345380"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="780345380"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gt: Move wal_get_fw_for_rmw()
Date: Thu, 22 Jun 2023 11:27:29 -0700
Message-Id: <20230622182731.3765039-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move helper function to get all the forcewakes required by the wa list
to the top, so it can be re-used by other functions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4d2dece96011..0578fc2c9e60 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -123,6 +123,22 @@ static void wa_init_finish(struct i915_wa_list *wal)
 		wal->wa_count, wal->name, wal->engine_name);
 }
 
+static enum forcewake_domains
+wal_get_fw_for_rmw(struct intel_uncore *uncore, const struct i915_wa_list *wal)
+{
+	enum forcewake_domains fw = 0;
+	struct i915_wa *wa;
+	unsigned int i;
+
+	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
+		fw |= intel_uncore_forcewake_for_reg(uncore,
+						     wa->reg,
+						     FW_REG_READ |
+						     FW_REG_WRITE);
+
+	return fw;
+}
+
 static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 {
 	unsigned int addr = i915_mmio_reg_offset(wa->reg);
@@ -1850,22 +1866,6 @@ void intel_gt_init_workarounds(struct intel_gt *gt)
 	wa_init_finish(wal);
 }
 
-static enum forcewake_domains
-wal_get_fw_for_rmw(struct intel_uncore *uncore, const struct i915_wa_list *wal)
-{
-	enum forcewake_domains fw = 0;
-	struct i915_wa *wa;
-	unsigned int i;
-
-	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
-		fw |= intel_uncore_forcewake_for_reg(uncore,
-						     wa->reg,
-						     FW_REG_READ |
-						     FW_REG_WRITE);
-
-	return fw;
-}
-
 static bool
 wa_verify(struct intel_gt *gt, const struct i915_wa *wa, u32 cur,
 	  const char *name, const char *from)
-- 
2.40.1


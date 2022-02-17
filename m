Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF44BA97A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106DC10E42C;
	Thu, 17 Feb 2022 19:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530089022;
 Thu, 17 Feb 2022 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645125355; x=1676661355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WrESnc37Mcir1l5huQ5ArCGZzhqwCriM6SDAJy8Gqps=;
 b=Q2yIiwcvLPsZu84OHx9SB+sohOJ9oBQkcvQV5S8bnSpY+8TQIU4m5KXp
 bWrLBcGSlUJ1UGEQ5hIueoj+VvUrYAkP7SFrqrlelGywfNUBc5jQZP+3X
 Aq35j20Y506ytJfLeiOwG74Y8P92Llvun3x31YHw3eYSe5+96Vmf1MDXl
 Qmnqa89WHGzf4SAwEX/WeWVaNBTGtOIr0K6eMrGW+ZNE3vUhdlIv0eDm7
 fUWTww6MhT4EWAksrvJaSHVpVw+85wt7nuKOtKCueVry9BNjMgJxXIGiN
 Ii2kb9AWcEDygjkUxIc73+boo20XEMlXCJv32Chr216HPH/cpolH0ah87 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="275546121"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="275546121"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530452610"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2022 11:15:48 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use wrapper for reading RP_STATE_CAP
Date: Thu, 17 Feb 2022 11:15:25 -0800
Message-Id: <20220217191525.2531-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will ensure correct values for Gen12+ platforms.

v2: Rebase

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> 
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index b3d28b003b73..8a473b2f754f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -11,6 +11,7 @@
 #include "intel_mchbar_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
+#include "gt/intel_rps.h"
 
 static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
 {
@@ -579,10 +580,10 @@ static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 
 static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
 {
+	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
 	u32 rp_state_cap;
 
-	rp_state_cap = intel_uncore_read(slpc_to_gt(slpc)->uncore,
-					 GEN6_RP_STATE_CAP);
+	rp_state_cap = intel_rps_read_state_cap(rps);
 
 	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
 					GT_FREQUENCY_MULTIPLIER;
-- 
2.34.0


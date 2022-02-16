Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A64B7E05
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918CA10E610;
	Wed, 16 Feb 2022 02:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B610E619;
 Wed, 16 Feb 2022 02:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644980318; x=1676516318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WcZ5wQxnj7s4JkrC7w5HmAaLbXoG3rHRUfS4DF2WYAQ=;
 b=htv18oXCAYn3AWaINzRSLfvMRJb5gRl4OxrO0GSkkNH6G3K1jXevJW56
 5MwMEFyvzLthBO0Pt7rlmlNwj7g3p6D5YcYYcP16HH7dHBmRDhKoMzwfq
 T959cQyenCEgCvLngIL0vfpJFr5mGxVXoNvn1o7PXJskQwwY/JeGxuSeL
 vD7gfZiUDXVvWNpaZRGKL3MG/zal/ar0+odRSDDsg3VAjN5sVo3v7N1DE
 CGNQGu2tUIZCUgu+ER2dFXgpM2Cu6NNaqSzjS8PCYE7OHNYD5E4bunORk
 JzFNvIf1vrEgrQD8J6HZuMM2NeGwEaHAdhjlbB6Oe+E66KfedStHItjrs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250246726"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="250246726"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 18:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="604143651"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2022 18:58:37 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Use wrapper for reading RP_STATE_CAP
Date: Tue, 15 Feb 2022 18:58:17 -0800
Message-Id: <20220216025817.890-1-vinay.belgaumkar@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 13b27b8ff74e..cf075e726699 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 #include "intel_guc_slpc.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_rps.h"
 
 static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
 {
@@ -574,10 +575,10 @@ static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B17348286
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B036EA90;
	Wed, 24 Mar 2021 20:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F286EA70;
 Wed, 24 Mar 2021 20:05:29 +0000 (UTC)
IronPort-SDR: cVO51B9oVWMepmD1FyQzb40H076OIhOf1DagqEaJIVOUDpaa2fZ6O/A9HaBd/WGhiRTJthw2X0
 9hfJBuV9U99g==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188482327"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188482327"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:23 -0700
IronPort-SDR: 4PfRrnoPL1WbxbTUJE6YijE/MMo4UBt4miw9lUsgTZ4a7gKrKVO5bTUJOqsJyZrCBRNqVLiKP3
 /AJ/YxAOufJQ==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="391423637"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/icl: add Wa_22010271021 for all gen11
Date: Wed, 24 Mar 2021 13:05:00 -0700
Message-Id: <20210324200502.1731265-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200502.1731265-1-lucas.demarchi@intel.com>
References: <20210324200502.1731265-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Caz Yokoyama <caz.yokoyama@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Caz Yokoyama <caz.yokoyama@intel.com>

Wa_22010271021 does not apply only to EHL, but to all gen11 and other
gen12 platforms. Gen12 is already covered in another code path, but we
need to stop checking for EHL when handling gen11.

Bspec: 33450, 52887

v2: Remove "gen11" suffix as it also applies to gen12 platforms

Cc: Clinton Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Caz Yokoyama <caz.yokoyama@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 2e367f95b989..3c609adca2ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1820,11 +1820,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			    GEN7_FF_THREAD_MODE,
 			    GEN12_FF_TESSELATION_DOP_GATE_DISABLE);
 
-		/* Wa_22010271021:ehl */
-		if (IS_JSL_EHL(i915))
-			wa_masked_en(wal,
-				     GEN9_CS_DEBUG_MODE1,
-				     FF_DOP_CLOCK_GATE_DISABLE);
+		/* Wa_22010271021 */
+		wa_masked_en(wal,
+			     GEN9_CS_DEBUG_MODE1,
+			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
 	if (IS_GEN_RANGE(i915, 9, 12)) {
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

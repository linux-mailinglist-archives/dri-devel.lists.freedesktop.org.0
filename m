Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718C6ACF89
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9183410E475;
	Mon,  6 Mar 2023 20:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304710E241;
 Mon,  6 Mar 2023 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678135820; x=1709671820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDULKDkwrhK8DHMjbkq0f8ugFFxbkTVWK+C7rTd/2D0=;
 b=JAdpFZQXfcc+x4XrYLXoxcvBBpe1dx9hxha30aS75zREBSltK6Rvy/4M
 1En7KZdx9ptvrnKPJr7exOZ+ZQ9x06++0Z1o9xtla9LWN39ptxMT46rYd
 cPc7Rte1ga1DGDKt0jRohOV8DBn1jyUBEvzqP+m2ShitwIOuK1rZxWvED
 I8L+BcLWszcCLMrz7JNkD5WNf3y3DAuPkFsTd8m8WJrAkc5Sed1ept8FI
 GScEVKswOwI/w1xc1jFie7Gp1P5IrSLhYRo6St84JpRZ2U2DHq04BrWBt
 FIUzl3ecc86oUn/my8bzRi/V6aW0A5vIQBvTvGmU5CWnfXjZqX4Y6fsAM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319499961"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="319499961"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669615314"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="669615314"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:50:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/dg1: Move Wa_1806527549 to the right function
Date: Mon,  6 Mar 2023 12:49:54 -0800
Message-Id: <20230306204954.753739-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230306204954.753739-1-lucas.demarchi@intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dg1_ctx_workarounds_init() is DG1-only, while
gen12_ctx_workarounds_init() is shared with other platforms. Move the
workaround to the former so there is no additional platform check
needed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 389bfcd299af..f68fe64f63a6 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -707,8 +707,6 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 				       struct i915_wa_list *wal)
 {
-	struct drm_i915_private *i915 = engine->i915;
-
 	gen12_ctx_gt_tuning_init(engine, wal);
 
 	/*
@@ -742,10 +740,6 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 	       FF_MODE2_GS_TIMER_MASK,
 	       FF_MODE2_GS_TIMER_224,
 	       0, false);
-
-	if (!IS_DG1(i915))
-		/* Wa_1806527549 */
-		wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
 }
 
 static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
@@ -760,6 +754,9 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
 	/* Wa_22010493298 */
 	wa_masked_en(wal, HIZ_CHICKEN,
 		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
+
+	/* Wa_1806527549 */
+	wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
 }
 
 static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
-- 
2.39.0


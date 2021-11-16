Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355A45390F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 18:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EB36E064;
	Tue, 16 Nov 2021 17:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32E66E0DF;
 Tue, 16 Nov 2021 17:58:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233606397"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="233606397"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="672056357"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/i915/dg2: Add Wa_16013000631
Date: Tue, 16 Nov 2021 09:48:17 -0800
Message-Id: <20211116174818.2128062-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211116174818.2128062-1-matthew.d.roper@intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Invalidate IC cache through pipe control command as part of the ctx
restore flow through indirect ctx pointer.

v2:
 - Move pipe control from xcs indirect context to the rcs indirect
   context.  We'll eventually need this on the CCS engines too, but
   support for those hasn't landed yet.

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 56156cf18c41..b3489599e4de 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1167,6 +1167,11 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 	cs = gen12_emit_cmd_buf_wa(ce, cs);
 	cs = gen12_emit_restore_scratch(ce, cs);
 
+	/* Wa_16013000631:dg2 */
+	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
+	    IS_DG2_G11(ce->engine->i915))
+		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
+
 	return cs;
 }
 
-- 
2.33.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28F756331
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 14:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861FC10E23B;
	Mon, 17 Jul 2023 12:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8F010E23B;
 Mon, 17 Jul 2023 12:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689598341; x=1721134341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Uj+LTT0sFOA/D7jLmH/fKbLZv+iHGJouZ2yQrdtBnE=;
 b=KAkv4yKhj13+XfqaMFDBpHDlEqp+SCCQsLhp0TKk1G/TgiBrHi5DOt+m
 cqFm2DwmIc9RR4A6O3XiEbrz1IhBGbP3RPDIqnEB2PqlxyeeVMCBqFgY6
 mhOO8P4FRv5heXTdvOA7RZVdUOFr2uY4PvRXCAHdDMmPVyTZjflYebUuf
 81GZ5u0JDJqMHs0x4E/ytpUquCd/OUFc0K9fZoPok14EWHV7vw7pCLM4p
 CH5FQqMBsDGG3VZ9awolfzT/ivpDxh3qWjeRj/C8TA1+xb35a0I2roTFo
 lCUkHogWu/gB/DEvLD0lqvBGqESnK0aHtAs7GNVW9nRmm+/D2FzlKdgGb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="365963278"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365963278"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="1053896873"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="1053896873"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:52:09 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 3/5] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Date: Mon, 17 Jul 2023 14:51:32 +0200
Message-Id: <20230717125134.399115-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717125134.399115-1-andi.shyti@linux.intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the CCS_FLUSH bit 13 in the control pipe for render and
compute engines in platforms starting from Meteor Lake (BSPEC
43904 and 47112).

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 12 +++++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index bee3b7dc595cf..04484385189ad 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -207,7 +207,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 	 * memory traffic is quiesced prior.
 	 */
 	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
-		mode |= EMIT_FLUSH;
+		mode |= EMIT_FLUSH | EMIT_CCS_FLUSH;
 
 	if (mode & EMIT_FLUSH) {
 		u32 flags = 0;
@@ -232,6 +232,16 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
+		/*
+		 * When required, in MTL+ platforms, in the render and compute
+		 * engines we need to set the CCS_FLUSH bit in the pipe control
+		 */
+		if (mode & EMIT_CCS_FLUSH &&
+		    GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70) &&
+		    (engine->class == RENDER_CLASS ||
+		     engine->class == COMPUTE_CLASS))
+			flags |= PIPE_CONTROL_CCS_FLUSH;
+
 		if (!HAS_3D_PIPELINE(engine->i915))
 			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
 		else if (engine->class == COMPUTE_CLASS)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index e99a6fa03d453..e2cae9d02bd62 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -514,6 +514,7 @@ struct intel_engine_cs {
 	int		(*emit_flush)(struct i915_request *request, u32 mode);
 #define EMIT_INVALIDATE	BIT(0)
 #define EMIT_FLUSH	BIT(1)
+#define EMIT_CCS_FLUSH	BIT(2) /* MTL+ */
 #define EMIT_BARRIER	(EMIT_INVALIDATE | EMIT_FLUSH)
 	int		(*emit_bb_start)(struct i915_request *rq,
 					 u64 offset, u32 length,
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 5d143e2a8db03..5df7cce23197c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -299,6 +299,7 @@
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
+#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
 #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
 #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
-- 
2.40.1


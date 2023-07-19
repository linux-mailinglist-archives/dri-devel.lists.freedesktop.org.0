Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9277593E8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0310E474;
	Wed, 19 Jul 2023 11:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E5F10E473;
 Wed, 19 Jul 2023 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764906; x=1721300906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=38AwnkN0YumeQq7fsgxzoNRm6OrTqRhepcQQhd9/NFA=;
 b=bxfF5Lk7CiCLRVp5mh9qLGi9Fr+4lOg9UQzFze3do/OwTWBOPNkUvQFg
 0gcpf4lVBPNmaKT7YEQgOCPcJiESFo3EywYxkFvBC0f8OS8Y4PMkeQX8Y
 hPXIAl/xsk4dhz6C3ldtUMKZQUYctObXT8RMzvMIJPR7lo1nho9cQIp4s
 xpkaVvPq69I4NF9K1iWb9IAc9cb+zMKR8RYZ4LacLilIz8V4GSFC+u0gr
 I2YbOwkUvoRcVOrFaj/4v+YOwd2ySXGcvUrUs3shpvsFph/XaBvgGfmbO
 rxlOwNgJRldWYMBoSWXfKpM+IjVpDvqY938blmezWCM3iibvfOeItPhRD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366474642"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366474642"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="759141690"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="759141690"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 7/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Date: Wed, 19 Jul 2023 13:07:27 +0200
Message-Id: <20230719110729.618733-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719110729.618733-1-andi.shyti@linux.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
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
43904 and 47112). The VE and BCS engines need to add the flush
part in their command streamer.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 31 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 3bedab8d61db1..78bbd55262a2d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -225,6 +225,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 
+		/*
+		 * When required, in MTL+ platforms we need to
+		 * set the CCS_FLUSH bit in the pipe control
+		 */
+		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
 		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
@@ -309,6 +316,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
 	intel_engine_mask_t aux_inv = 0;
+	u32 cmd_flush = 0;
 	u32 cmd = 4;
 	u32 *cs;
 
@@ -339,6 +347,13 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 			bit_group_1 |= PIPE_CONTROL_CS_STALL;
 
+			/*
+			 * When required, in MTL+ platforms we need to
+			 * set the CCS_FLUSH bit in the pipe control
+			 */
+			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+
 			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
 						   LRC_PPHWSP_SCRATCH_ADDR);
 
@@ -346,7 +361,18 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 
 		case VIDEO_ENHANCEMENT_CLASS:
 		case COMPUTE_CLASS:
+			cmd += 2;
+			cmd_flush = MI_FLUSH_DW;
+
+			break;
+
 		case COPY_ENGINE_CLASS:
+			cmd += 2;
+			/*
+			 * When required, in MTL+ platforms we need to
+			 * set the CCS_FLUSH bit in the pipe control
+			 */
+			cmd_flush = MI_FLUSH_DW | MI_FLUSH_DW_CCS;
 			break;
 		}
 	}
@@ -355,6 +381,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
+	if (cmd_flush) {
+		*cs++ = cmd_flush;
+		*cs++ = 0;
+	}
+
 	if (mode & EMIT_INVALIDATE)
 		*cs++ = preparser_disable(true);
 
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


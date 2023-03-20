Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB36C21C7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766D610E633;
	Mon, 20 Mar 2023 19:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30FE10E305;
 Mon, 20 Mar 2023 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679341375; x=1710877375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Mzb0xTBaRkrSUwKI1nnIKmONDPxWVTbqCVgucsm2e4=;
 b=TWBmYomwVQEmNNGjUY1YpI+EjBkNXKs0Xcy8Ji9Dyhh7kNHfMHxB+scX
 b6hdoSbcBbiR2LQBUoYRfizVEgmP9uz5i2CqEHvY1zxv2wOYHK1IltSnj
 eu44epbaV32T2TrvGmGtZpljxu17Y2NTrihGqUPGWGlvtRKNVENKwsdWq
 4SVXW4ElgsZZHlB+9sV7l6iHRStSwfGA0IBPgzpx98pt6jfxW8x5TXclI
 uEd5W6tYikielz9rVLchFSxD5tZzT7ZUXggjvpn9f0yD3XyKVhSiZs19E
 09RwFrOm26dCuZtg6eBpCeKkVc20HGHkIUksjVvwDHjlYsqB7MOmj9bob A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338790425"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="338790425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 12:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="745518012"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="745518012"
Received: from ggranovs-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.60.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 12:42:53 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/i915/gt: Poll aux invalidation register bit on
 invalidation
Date: Mon, 20 Mar 2023 20:41:19 +0100
Message-Id: <20230320194119.290561-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320194119.290561-1-andi.shyti@linux.intel.com>
References: <20230320194119.290561-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

For platforms that use Aux CCS, we must wait for aux
invalidation to complete by checking the aux
invalidation register bit is cleared.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 17 +++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 6f830f80eb0f8..d93484211abdb 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -174,6 +174,16 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
 	*cs++ = AUX_INV;
 	*cs++ = MI_NOOP;
 
+	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
+		MI_SEMAPHORE_REGISTER_POLL |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	*cs++ = 0;
+	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
+	*cs++ = 0;
+	*cs++ = 0;
+	*cs++ = MI_NOOP;
+
 	return cs;
 }
 
@@ -243,10 +253,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine->class == COMPUTE_CLASS)
 			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+		count = 8;
 		if (!HAS_FLAT_CCS(rq->engine->i915))
-			count = 8 + 4;
-		else
-			count = 8;
+			count += 10;
 
 		cs = intel_ring_begin(rq, count);
 		if (IS_ERR(cs))
@@ -289,7 +298,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 			aux_inv = rq->engine->mask &
 				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
 			if (aux_inv)
-				cmd += 4;
+				cmd += 10;
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index e10507fa71ce6..8026b6a891923 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -121,6 +121,7 @@
 #define   MI_SEMAPHORE_TARGET(engine)	((engine)<<15)
 #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
 #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
 #define   MI_SEMAPHORE_POLL		(1 << 15)
 #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
 #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
-- 
2.39.2


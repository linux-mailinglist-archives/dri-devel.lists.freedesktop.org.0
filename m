Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1D756A9E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C3C10E29C;
	Mon, 17 Jul 2023 17:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B2610E291;
 Mon, 17 Jul 2023 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615101; x=1721151101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J8EY9v0ITMn3oK/UlhyvVd2iZUcQUur9AIPUKvH74vo=;
 b=YFJ6Pv3kwbrqy/d6NlAOSCLJ3g1hq6Sk7TTybWe01DbvJoTVDYfL4aM4
 zhnPccXR/IAuJKpzipmLOp+JOieUa02w5hibb1nnTDXabM0OmNOvUFJhU
 pUpDEPl9yVbaz2gzNN4WWO+0oXE2O5Ld7EhqMN/Ko/gG3LGbSruKwPCk3
 OdA638rWTOATxycNd0d4+41ClsDf3hgjmaAxODtJs1SL19YvFKPu9Bepl
 cGTmqwqru3AbfrsN3MN5TDIT4k8KFiQtSaE/w3KZNv4OjXFEdoLX4PS4o
 dUN1XpjpbdTtjX7yObxK+naTUH7pHkvuG+wRyEMGS/gZnKVUq7Ym5qvhv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396822052"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396822052"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836958362"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836958362"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:31:26 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 3/6] drm/i915/gt: Rename flags with bit_group_X according
 to the datasheet
Date: Mon, 17 Jul 2023 19:30:56 +0200
Message-Id: <20230717173059.422892-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717173059.422892-1-andi.shyti@linux.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
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

In preparation of the next patch allign with the datasheet (BSPEC
47112) with the naming of the pipe control set of flag values.
The variable "flags" in gen12_emit_flush_rcs() is applied as a
set of flags called Bit Group 1.

Define also the Bit Group 0 as bit_group_0 where currently only
PIPE_CONTROL0_HDC_PIPELINE_FLUSH bit is set.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 34 +++++++++++++-----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index bee3b7dc595cf..3c935d6b68bf0 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -210,7 +210,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		mode |= EMIT_FLUSH;
 
 	if (mode & EMIT_FLUSH) {
-		u32 flags = 0;
+		u32 bit_group_0 = 0;
+		u32 bit_group_1 = 0;
 		int err;
 		u32 *cs;
 
@@ -218,32 +219,33 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		if (err)
 			return err;
 
-		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;
-		flags |= PIPE_CONTROL_FLUSH_L3;
-		flags |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
-		flags |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
+		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+
+		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
+		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
+		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
+		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
 		/* Wa_1409600907:tgl,adl-p */
-		flags |= PIPE_CONTROL_DEPTH_STALL;
-		flags |= PIPE_CONTROL_DC_FLUSH_ENABLE;
-		flags |= PIPE_CONTROL_FLUSH_ENABLE;
+		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
+		bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
+		bit_group_1 |= PIPE_CONTROL_FLUSH_ENABLE;
 
-		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
-		flags |= PIPE_CONTROL_QW_WRITE;
+		bit_group_1 |= PIPE_CONTROL_STORE_DATA_INDEX;
+		bit_group_1 |= PIPE_CONTROL_QW_WRITE;
 
-		flags |= PIPE_CONTROL_CS_STALL;
+		bit_group_1 |= PIPE_CONTROL_CS_STALL;
 
 		if (!HAS_3D_PIPELINE(engine->i915))
-			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+			bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
 		else if (engine->class == COMPUTE_CLASS)
-			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 		cs = intel_ring_begin(rq, 6);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
 
-		cs = gen12_emit_pipe_control(cs,
-					     PIPE_CONTROL0_HDC_PIPELINE_FLUSH,
-					     flags, LRC_PPHWSP_SCRATCH_ADDR);
+		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
+					     LRC_PPHWSP_SCRATCH_ADDR);
 		intel_ring_advance(rq, cs);
 	}
 
-- 
2.40.1


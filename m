Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB0358ABA6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE027B02D4;
	Fri,  5 Aug 2022 13:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD9B04BC;
 Fri,  5 Aug 2022 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659705830; x=1691241830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mi4O+OVOGbpBfWqRUDxCGwRvU18sBzxwy2R7o7uzqOE=;
 b=K3j+jofGQyCTSX2i2bDiLSnQMa3mbjJ7K0yb1hwPzYHFhIJEL0gP4ETc
 pRyHs8/zheelIPa2ezQKOzYc3tUScRmR1eOmwpsUw2rH7T3Dt3pDz5yvM
 brBTm2oFR89fkg+OTIzmke3oQyZcKDpdnjGS8hjLGURTKo4P6z3g7iuuH
 PpPAvTGBUicbW25mcsDIOyINKBfDPSeiIux1LnsfjGs+PLIeNrH3u6Q7e
 pmE/Q6T4fzzAMes/bEhiTguFUN4X9/QsCM463LjvwFy8SWUbhBGBDhmEK
 QatRGJ0KfwVGLasZzURFs0sSS11CRV8oUDBLnThKLYKlrlQ76VDdf6bAn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="316089232"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="316089232"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:23:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="579497665"
Received: from namitaga-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.224.55])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:23:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/ttm: remove calc_ctrl_surf_instr_size
Date: Fri,  5 Aug 2022 14:22:39 +0100
Message-Id: <20220805132240.442747-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We only ever need to emit one ccs block copy command.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 35 +++----------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 9a0814422ba4..1bbed7aa436a 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -511,44 +511,16 @@ static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
 	return cmd;
 }
 
-static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
-{
-	u32 num_cmds, num_blks, total_size;
-
-	if (!GET_CCS_BYTES(i915, size))
-		return 0;
-
-	/*
-	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
-	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
-	 * transfer upto 1024 blocks.
-	 */
-	num_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
-				NUM_CCS_BYTES_PER_BLOCK);
-	num_cmds = DIV_ROUND_UP(num_blks, NUM_CCS_BLKS_PER_XFER);
-	total_size = XY_CTRL_SURF_INSTR_SIZE * num_cmds;
-
-	/*
-	 * Adding a flush before and after XY_CTRL_SURF_COPY_BLT
-	 */
-	total_size += 2 * MI_FLUSH_DW_SIZE;
-
-	return total_size;
-}
-
 static int emit_copy_ccs(struct i915_request *rq,
 			 u32 dst_offset, u8 dst_access,
 			 u32 src_offset, u8 src_access, int size)
 {
 	struct drm_i915_private *i915 = rq->engine->i915;
 	int mocs = rq->engine->gt->mocs.uc_index << 1;
-	u32 num_ccs_blks, ccs_ring_size;
+	u32 num_ccs_blks;
 	u32 *cs;
 
-	ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
-	WARN_ON(!ccs_ring_size);
-
-	cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
+	cs = intel_ring_begin(rq, 12);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -583,8 +555,7 @@ static int emit_copy_ccs(struct i915_request *rq,
 		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
 
 	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
-	if (ccs_ring_size & 1)
-		*cs++ = MI_NOOP;
+	*cs++ = MI_NOOP;
 
 	intel_ring_advance(rq, cs);
 
-- 
2.37.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A74C832A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 06:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B1110EBB8;
	Tue,  1 Mar 2022 05:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4323710EBBA;
 Tue,  1 Mar 2022 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646112598; x=1677648598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uuMvsHyMm8yBOXSqa1nXTs4W2MY9lM67nexETJtXIlA=;
 b=RsZTyvKFGdS2NHEujVTUwD+xz9mtsbQNq8fgNzVPh89dr7WhFozOM0T3
 6WEnVASK3JPjb8Glf7z8yyxTuVi5tjMxAv8HFy4OtCkbTSy8Bv3uFSXw6
 m6NL7dNlbzl8VykMPm6I4A80ctD3KjvDi7beFJUMjlzrU6UPzGPnmMEN/
 zH0cjmE9jwkiuY/sTFVxXHR5oTQqrWHzmeDGfG4KEi62sPFT5JwCoJ3wg
 Z5ebI8iCKL2OnIhHeg4ewgnSO3fZYf/x2nPhzR4cKOZv25hwBH/jxkluF
 vSnwdkvIW8Rj52AfsUQuku61uH5Rke+UVNHZsrld3YBmB29jmacOmBxUp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316273570"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="316273570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 21:29:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="507680655"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 21:29:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/xehp: Drop aux table invalidation on FlatCCS
 platforms
Date: Mon, 28 Feb 2022 21:29:52 -0800
Message-Id: <20220301052952.1706597-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platforms with FlatCCS do not use auxiliary planes for compression
control data and thus do not need traditional aux table invalidation
(and the registers no longer even exist).

Original-author: CQ Tang
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 28 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1f8cf4f790b2..13bbbf5d9737 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -231,7 +231,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 	if (mode & EMIT_INVALIDATE) {
 		u32 flags = 0;
-		u32 *cs;
+		u32 *cs, count;
 
 		flags |= PIPE_CONTROL_COMMAND_CACHE_INVALIDATE;
 		flags |= PIPE_CONTROL_TLB_INVALIDATE;
@@ -246,7 +246,12 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		flags |= PIPE_CONTROL_CS_STALL;
 
-		cs = intel_ring_begin(rq, 8 + 4);
+		if (!HAS_FLAT_CCS(rq->engine->i915))
+			count = 8 + 4;
+		else
+			count = 8;
+
+		cs = intel_ring_begin(rq, count);
 		if (IS_ERR(cs))
 			return PTR_ERR(cs);
 
@@ -259,8 +264,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
 
-		/* hsdes: 1809175790 */
-		cs = gen12_emit_aux_table_inv(GEN12_GFX_CCS_AUX_NV, cs);
+		if (!HAS_FLAT_CCS(rq->engine->i915)) {
+			/* hsdes: 1809175790 */
+			cs = gen12_emit_aux_table_inv(GEN12_GFX_CCS_AUX_NV, cs);
+		}
 
 		*cs++ = preparser_disable(false);
 		intel_ring_advance(rq, cs);
@@ -275,12 +282,15 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	u32 cmd, *cs;
 
 	cmd = 4;
-	if (mode & EMIT_INVALIDATE)
+	if (mode & EMIT_INVALIDATE) {
 		cmd += 2;
-	if (mode & EMIT_INVALIDATE)
-		aux_inv = rq->engine->mask & ~BIT(BCS0);
-	if (aux_inv)
-		cmd += 2 * hweight32(aux_inv) + 2;
+
+		if (!HAS_FLAT_CCS(rq->engine->i915)) {
+			aux_inv = rq->engine->mask & ~BIT(BCS0);
+			if (aux_inv)
+				cmd += 2 * hweight32(aux_inv) + 2;
+		}
+	}
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214B7CCCA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 21:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F4610E325;
	Tue, 17 Oct 2023 19:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF2310E323;
 Tue, 17 Oct 2023 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697572418; x=1729108418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T68EjbHwk9Sm7n74sgDZIrugTLPv/8+eIWxTN9iCNEU=;
 b=ZvxO8nubPrVkdaiRx+yV8QQlZKqUJypANZXzp466Yl9K4iMcFnnzHQi4
 I+2NWUC+7lCAInxypUtnZgOzzr9DqkNNlk9gzurmPZD+0Nip7LPxizJRh
 WjZx+bF0p05RP3CFChoKk/JRRTH97bpbnm1p5R88BAbG+jokc8fKH/sIW
 Xx0AvcdY+1BxKlXbSH/DGHTGCKVXjp5oGJJXCsMafSmDZqy4/gNbNhfbK
 cIztWHcahM8LbXFw0yXTIzV/8dZ3n/uSyhOn7+oiy5TdMDjmyb8aJI6IE
 n599lCdaOQBN3gaAbgqcf1hROSmoykEJIEW/jRNh/RoiHx4plfsXIN4y0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388733670"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="388733670"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 12:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822120642"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="822120642"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2023 12:53:37 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Date: Tue, 17 Oct 2023 12:53:09 -0700
Message-Id: <20231017195309.2476088-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bit does not cause an explicit L3 flush. We already use
PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.

v2: Use FLUSH_L3 only pre-MTL since spec will likely remain
the same going forward.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index ba4c2422b340..86a04afff64b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -278,7 +278,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		 * deals with Protected Memory which is not needed for
 		 * AUX CCS invalidation and lead to unwanted side effects.
 		 */
-		if (mode & EMIT_FLUSH)
+		if ((mode & EMIT_FLUSH) &&
+		    GRAPHICS_VER_FULL(rq->i915) < IP_VER(12, 70))
 			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
@@ -812,12 +813,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 	u32 flags = (PIPE_CONTROL_CS_STALL |
 		     PIPE_CONTROL_TLB_INVALIDATE |
 		     PIPE_CONTROL_TILE_CACHE_FLUSH |
-		     PIPE_CONTROL_FLUSH_L3 |
 		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
 		     PIPE_CONTROL_DC_FLUSH_ENABLE |
 		     PIPE_CONTROL_FLUSH_ENABLE);
 
+	if (GRAPHICS_VER_FULL(rq->i915) < IP_VER(12, 70))
+		flags |= PIPE_CONTROL_FLUSH_L3;
+
 	/* Wa_14016712196 */
 	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
 		/* dummy PIPE_CONTROL + depth flush */
-- 
2.38.1


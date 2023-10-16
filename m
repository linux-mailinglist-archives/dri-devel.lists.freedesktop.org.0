Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893137CB6C6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 00:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6404610E1FD;
	Mon, 16 Oct 2023 22:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F5610E1FD;
 Mon, 16 Oct 2023 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697497026; x=1729033026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAdwF69eDgCYkmpus0wZD5IArgT9gOGlOSDK9GO+OhM=;
 b=LLCSxdtZeUr0aSo6T+B30sOyq4/RCTb4+xoB6+WswFPJcOU7MUmsbE3d
 JQ0P5YIUdi+G66qF+QLsKGuoC/9cdbLk8/Uy901ZqdhDpCFjhjo6xezur
 IurUifpNIOzKB6V9TV2MET04t3AgrARZTJK3GN5/BpP15o5egpwUGZ2mH
 mr6Hla3H73yc7vDIuFKbieUto5HbgikFbCDHQVy9GTofLZ28+iW8Bfm0F
 taq8Rxmc97+mWFAcGqnZ0ggnx5P5vm96sHy9BzNe8h4ackGkAtX/Ky09f
 Sb4n7b1b8ru4SCqncxVFCPuB/AY7NSYv7RlaSk6QskOymgYTXfYzZSvpd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384526982"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="384526982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 15:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="3680907"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 15:56:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Date: Mon, 16 Oct 2023 15:55:30 -0700
Message-Id: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
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
 Mikka Kuoppala <mika.kuoppala@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bit does not cause an explicit L3 flush. We already use
PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index ba4c2422b340..abbc02f3e66e 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct i915_request *rq)
 int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
+	struct intel_gt *gt = rq->engine->gt;
 
 	/*
 	 * On Aux CCS platforms the invalidation of the Aux
@@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		 * deals with Protected Memory which is not needed for
 		 * AUX CCS invalidation and lead to unwanted side effects.
 		 */
-		if (mode & EMIT_FLUSH)
+		if ((mode & EMIT_FLUSH) &&
+		    !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
 			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
@@ -812,12 +814,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 	u32 flags = (PIPE_CONTROL_CS_STALL |
 		     PIPE_CONTROL_TLB_INVALIDATE |
 		     PIPE_CONTROL_TILE_CACHE_FLUSH |
-		     PIPE_CONTROL_FLUSH_L3 |
 		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
 		     PIPE_CONTROL_DC_FLUSH_ENABLE |
 		     PIPE_CONTROL_FLUSH_ENABLE);
 
+	if (!(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
+		flags |= PIPE_CONTROL_FLUSH_L3;
+
 	/* Wa_14016712196 */
 	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
 		/* dummy PIPE_CONTROL + depth flush */
-- 
2.38.1


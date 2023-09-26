Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA467AEE6E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7210E120;
	Tue, 26 Sep 2023 14:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41910E120;
 Tue, 26 Sep 2023 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695738530; x=1727274530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S4X8JYWLkzEFTQc5uWVUhRG2/6e5VTT3T8Vo+VOzjS4=;
 b=dh7PWDC6n7ZqBSBMUD7lnjI5juqLQ0s56r/24WU1T14vfMLhpyw+SnaM
 Y8Cvx8qQuXgb49LKypWEa3aCuh+5ejYuX5ZLfAzMqHV68j3QB8bT5d0gm
 qqrBFw97q/oWZXfPJcPdJEg4c4vSOmmARsMWKDBmoR+Ayqr6Zg9zgldZG
 0MohGUqVdQgMl657KPCmCiPJg4cuZ/heOJNfXLa9T60a7onSQ83GindvD
 t6m9L/vrVZPHhws5Sfc584LVgJCukn86Emhu48tp7YgGg/5grafg4I0VP
 r1xwU8Urm3RFPD+P9KdKELhALBreT0FnWapX1L6aVrPRKjA1ofhrJkp1r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467867718"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="467867718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="783964714"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="783964714"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:24:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Date: Tue, 26 Sep 2023 16:24:01 +0200
Message-ID: <20230926142401.25687-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Janes <mark.janes@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
so don't set that.

Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Tapani Pälli <tapani.palli@intel.com>
Cc: Mark Janes <mark.janes@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0143445dba83..ba4c2422b340 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -271,8 +271,17 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
 			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
 
+		/*
+		 * L3 fabric flush is needed for AUX CCS invalidation
+		 * which happens as part of pipe-control so we can
+		 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
+		 * deals with Protected Memory which is not needed for
+		 * AUX CCS invalidation and lead to unwanted side effects.
+		 */
+		if (mode & EMIT_FLUSH)
+			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
+
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
-		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
 		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
 		/* Wa_1409600907:tgl,adl-p */
-- 
2.41.0


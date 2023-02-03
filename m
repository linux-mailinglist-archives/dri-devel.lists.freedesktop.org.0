Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E1688C4C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 02:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C1D10E6D4;
	Fri,  3 Feb 2023 01:10:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F423910E6DB;
 Fri,  3 Feb 2023 01:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675386641; x=1706922641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXf3vlTlkh+uMebUO8Z51WaJ27tJow59rytbzDrAliE=;
 b=XhqvUOYgOzuuVP3jIF5XwKeObaQZ4wqvtACkLEIU/Rfj4V60h8ef4yOT
 Ph7q0OoHaC5IqlCLigaB+CcNbaBruHSPpHiYFj6/4oHVcBGx76DVzs95L
 G6JzIJvmpYXGxGemBof5b6oRgL1dKcz0MBoXt8gyysGeMQECfostKTzn7
 JIGamUYPV6Wc7KqLLvzycP8ZzwuNZuk1F4SFEnNg/D7jrETiBFTyMfp9d
 y99j0dmwLndbWUYwi7KzmRrrblIVh6D9zWL2tdCCVOPCamEKaYwkWyp7a
 90NwPSmASLhOKTn8BxcHAq7/GWGUNS67pv9PuwFuOvlRuJ26x1DbXHOf3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="391021625"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="391021625"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 17:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665528239"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="665528239"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 17:10:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915: Include timelines in error capture
Date: Thu,  2 Feb 2023 17:10:43 -0800
Message-Id: <20230203011043.3427096-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
References: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The seqno value actually written out to memory is no longer in the
regular HWSP and therefore no longer visible in an error capture.
Instead, it is now in its own private timeline buffer. So include that
buffer in the capture too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 904f21e1380cd..66bd4c1162f79 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1550,6 +1550,7 @@ engine_coredump_add_context(struct intel_engine_coredump *ee,
 	 */
 	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
 	vma = capture_vma(vma, ce->state, "HW context", gfp);
+	vma = capture_vma(vma, ce->timeline->hwsp_ggtt, "ctxt timeline HWSP", gfp);
 
 	return vma;
 }
@@ -1572,6 +1573,8 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
 	 */
 	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
 	vma = capture_user(vma, rq, gfp);
+	if (rq->timeline != rq->context->timeline)
+		vma = capture_vma(vma, rq->timeline->hwsp_ggtt, "rq timeline HWSP", gfp);
 
 	ee->rq_head = rq->head;
 	ee->rq_post = rq->postfix;
-- 
2.39.1


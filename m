Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDD75CDFB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238F510E6C6;
	Fri, 21 Jul 2023 16:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8775E10E6CA;
 Fri, 21 Jul 2023 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689956189; x=1721492189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+HLvuIdRCsnRC0aiTPYNdljnJw5VH851e+nGMOJY6Y8=;
 b=EbjaUcd3R2u4i/2kkGbeB7jDl8TgDRZg/Nn8eYA7HW9CeQAIFSQayBTA
 anEh7X+Z1mreW2gt5THdo4SSz6UMFwwkQ+m2SN2OD44w8iAVbrCRM36Px
 Vr3ofrwfLcvf/grW4VNKbbSoWHnRW+BiCAeCw4Ofr1GR0LkP1dmXZL4P6
 CImxWePgSGTfl4II9FqItPJ+akohi6XDhd9kjDA3IN0H66tUmykSG8ojI
 v82krrlg+n7ciaViop35r4s3ORbVuybJBSs/OvIPWFmyHlhW1nsypJVbg
 YcjNnlyakEAXb83hB2n1n556dWyfIgVvrGTv4NyLy3HLZlEHEu94qaoHr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369730691"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="369730691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718877447"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718877447"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:16:07 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v8 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Date: Fri, 21 Jul 2023 18:15:12 +0200
Message-Id: <20230721161514.818895-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230721161514.818895-1-andi.shyti@linux.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit af9e423a8aae ("drm/i915/gt: Ensure memory quiesced before
invalidation") has made sure that the memory is quiesced before
invalidating the AUX CCS table. Do it for all the other engines
and not just RCS.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 36 ++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 5e19b45a5cabe..646151e1b5deb 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -331,26 +331,40 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
 	intel_engine_mask_t aux_inv = 0;
-	u32 cmd, *cs;
+	u32 cmd_flush = 0;
+	u32 cmd = 4;
+	u32 *cs;
 
-	cmd = 4;
-	if (mode & EMIT_INVALIDATE) {
+	if (mode & EMIT_INVALIDATE)
 		cmd += 2;
 
-		if (gen12_needs_ccs_aux_inv(rq->engine) &&
-		    (rq->engine->class == VIDEO_DECODE_CLASS ||
-		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask &
-				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-			if (aux_inv)
-				cmd += 4;
-		}
+	if (gen12_needs_ccs_aux_inv(rq->engine))
+		aux_inv = rq->engine->mask &
+			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
+
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand
+	 */
+	if (aux_inv) {
+		cmd += 4; /* for the AUX invalidation */
+		cmd += 2; /* for the engine quiescing */
+
+		cmd_flush = MI_FLUSH_DW;
+
+		if (rq->engine->class == COPY_ENGINE_CLASS)
+			cmd_flush |= MI_FLUSH_DW_CCS;
 	}
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
+	if (cmd_flush) {
+		*cs++ = cmd_flush;
+		*cs++ = 0;
+	}
+
 	if (mode & EMIT_INVALIDATE)
 		*cs++ = preparser_disable(true);
 
-- 
2.40.1


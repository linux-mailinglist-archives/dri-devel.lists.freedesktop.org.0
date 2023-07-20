Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1975B4E2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 18:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932310E5F3;
	Thu, 20 Jul 2023 16:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790E10E5F2;
 Thu, 20 Jul 2023 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689871550; x=1721407550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZKyXR21ywDPXXELptJ4wqF4vkxC84X1KeZO6mk2rZ0=;
 b=dXUDM1e5jqOkVrhSbNmUy3fRXHLa4y3ZfxKe5U1Tvvtxq9df4SY0u6LF
 dUOzX+qphFlr3Cr4n3hXS+pNanHocTOiJDMH1EfBdsmvjNSgmspy7zn/f
 jneF0VuCHtuRmYFK+z+49WQbaeDlU+24unQWXTTDN1g57iRILFNt7uOsS
 +Vsy6WrIb9O4SIBsfMK6WD+nuNKZfQkq4hKPkYG0rU1vLhqP9wU/QF1xv
 oDnvNcrWt56ijpFLXltI9nkTQpanrc/JKHoEpnVME7G0kZFGXxxjAeaQn
 kcqhZxoknh5xcgd5s+CpRXWL57yGcS/529GBro8HeSLABBISOf9KnREjT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351680824"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="351680824"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754115931"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754115931"
Received: from sdene1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:45:41 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 6/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Date: Thu, 20 Jul 2023 18:44:51 +0200
Message-Id: <20230720164454.757075-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720164454.757075-1-andi.shyti@linux.intel.com>
References: <20230720164454.757075-1-andi.shyti@linux.intel.com>
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
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 46 ++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1b1dadacfbf42..3bedab8d61db1 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -309,19 +309,45 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
 	intel_engine_mask_t aux_inv = 0;
-	u32 cmd, *cs;
+	u32 cmd = 4;
+	u32 *cs;
 
-	cmd = 4;
-	if (mode & EMIT_INVALIDATE) {
+	if (mode & EMIT_INVALIDATE)
 		cmd += 2;
 
-		if (HAS_AUX_CCS(rq->engine->i915) &&
-		    (rq->engine->class == VIDEO_DECODE_CLASS ||
-		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask &
-				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-			if (aux_inv)
-				cmd += 4;
+	if (HAS_AUX_CCS(rq->engine->i915))
+		aux_inv = rq->engine->mask &
+			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
+
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand
+	 */
+	if (aux_inv) {
+		u32 bit_group_0 = 0;
+		u32 bit_group_1 = 0;
+
+		cmd += 4;
+
+		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+
+		switch (rq->engine->class) {
+		case VIDEO_DECODE_CLASS:
+			bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
+			bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
+			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
+			bit_group_1 |= PIPE_CONTROL_CS_STALL;
+
+			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
+						   LRC_PPHWSP_SCRATCH_ADDR);
+
+			break;
+
+		case VIDEO_ENHANCEMENT_CLASS:
+		case COMPUTE_CLASS:
+		case COPY_ENGINE_CLASS:
+			break;
 		}
 	}
 
-- 
2.40.1


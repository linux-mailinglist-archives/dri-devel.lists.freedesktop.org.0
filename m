Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F27593E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22C10E471;
	Wed, 19 Jul 2023 11:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067E310E471;
 Wed, 19 Jul 2023 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764899; x=1721300899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZKyXR21ywDPXXELptJ4wqF4vkxC84X1KeZO6mk2rZ0=;
 b=NLK2RY+6kDhOOYZHiRyVgumBC1DYkxe6eMhUiZ2QKpJvhGuNqaO2eeNv
 o4dqzueYfm/xAeAOidX5w6bfNd1vS6a7uQe0Zo6mlK3ZmYT+dEkIyvR8+
 PvkWLIVTrTvqSkf8aQ/whSKf+H/EUTd9UzthWMsx/6bVjO9TL1kYuJ71J
 Ikmbun3a/hN2wLK1zegGIRE8+VpuH2z5EYR2pzXsUNyHBHm3ysbZODgjT
 XAF5Cbzfeg6wzC/O58gXMcP0AgbtKe/d6Uo2gpz7zKPZcRGBOQM9pHItW
 6oIB77pCriB97CCfPy3l4AKpe+e6mfgkuPRv3l2MFq9uRNu06DM6Lhji0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="432617142"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="432617142"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789382163"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="789382163"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:17 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 6/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Date: Wed, 19 Jul 2023 13:07:26 +0200
Message-Id: <20230719110729.618733-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719110729.618733-1-andi.shyti@linux.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
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


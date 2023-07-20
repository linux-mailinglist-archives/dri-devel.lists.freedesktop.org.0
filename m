Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3475B956
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA58B10E60B;
	Thu, 20 Jul 2023 21:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B8210E1C8;
 Thu, 20 Jul 2023 21:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689887332; x=1721423332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EoYKC9OsCTE8FBOzuj74SARGZf9U7AsAFTMuvBNgs0=;
 b=i0U+bzukZ/n1ZI4DEN2fWAPhJykCmDxSiDTVjC+wc7fjT+92Soo5j09E
 +vdbFHViRaHH+6sCPtl1oeX1lS/UOmctNMo/erbSYoEw6QfQr+FllsduD
 ofpwfM+xAgamN3VfkOAn8AcXAvLwWxLtp/MN0nnSb5HQcEawaKkNr3iLl
 r55+0VNccGHYbCSQ8uNpaRCo21RiAK3qL+5DtNT8x9eyEEsffv9YctQtd
 6pbtYdg4jEXvBqcFi0eqeROvRUa5a5iU3E1ajX739CcCy0jdZ5PbyJ8/K
 vMSvMav0dfGOEIYVFFU9zaxRQW5YsvW3MdV/Qiigln5WrboLi9eHthlNj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347167432"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="347167432"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754177987"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754177987"
Received: from sdene1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:32 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v7 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Date: Thu, 20 Jul 2023 23:07:35 +0200
Message-Id: <20230720210737.761400-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720210737.761400-1-andi.shyti@linux.intel.com>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
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
index 202d6ff8b5264..b6dd22eb2d9b2 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -316,26 +316,40 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
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
 
-		if (HAS_AUX_CCS(rq->engine->i915) &&
-		    (rq->engine->class == VIDEO_DECODE_CLASS ||
-		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask &
-				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-			if (aux_inv)
-				cmd += 4;
-		}
+	if (HAS_AUX_CCS(rq->engine->i915))
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


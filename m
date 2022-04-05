Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BED4F3AFB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 17:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531310E8DD;
	Tue,  5 Apr 2022 15:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7082310E715;
 Tue,  5 Apr 2022 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649171277; x=1680707277;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FH1vn4P3u+/zwqyrOOmlegQIVQF8V8aUPfEigCgaNUY=;
 b=ODnxJtn74OU/Hi4op0PbApNLCiTPi8SKTMCKnywnzBarcfZOQm8IFu/s
 MWisTcpIWGivr4CL9o5M2ix2CB6tfSSNpAfT/OTj8joSscUdZW92l0GD7
 /Wg0XZck9lddS9TQKR0o5yJ1oqEhinPUmT/N2j81M1Bk9r+MarY5q9xjU
 ViBlfj83I/SyCTauY3bdpTaw71OycOOERNE63YJiuI1FCBhcfTh9/PfAw
 I88rF3rfgvQ3iHNCUaFtIULFdN7EkYG0DgVdSlMHet0BWStJnFFdt1V6R
 0EklJjtttdbTAICGsSTfli93Dj/wssCaWMnsgneqrEKqF9wJsB3j/sGdL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="240706447"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="240706447"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:07:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="641644295"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:07:56 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 1/9] drm/i915/gt: use engine instance directly for offset
Date: Tue,  5 Apr 2022 20:38:32 +0530
Message-Id: <20220405150840.29351-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220405150840.29351-1-ramalingam.c@intel.com>
References: <20220405150840.29351-1-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make it uniform across copy and clear, use the engine offset directly
to calculate the offset in the cmd forming for emit_clear.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 950fd6da146c..9d852a570400 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -613,15 +613,13 @@ intel_context_migrate_copy(struct intel_context *ce,
 	return err;
 }
 
-static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
+static int emit_clear(struct i915_request *rq, u32 offset, int size, u32 value)
 {
 	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
-	offset += (u64)rq->engine->instance << 32;
-
 	cs = intel_ring_begin(rq, ver >= 8 ? 8 : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
@@ -631,17 +629,16 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = lower_32_bits(offset);
-		*cs++ = upper_32_bits(offset);
+		*cs++ = offset;
+		*cs++ = rq->engine->instance;
 		*cs++ = value;
 		*cs++ = MI_NOOP;
 	} else {
-		GEM_BUG_ON(upper_32_bits(offset));
 		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = lower_32_bits(offset);
+		*cs++ = offset;
 		*cs++ = value;
 	}
 
-- 
2.20.1


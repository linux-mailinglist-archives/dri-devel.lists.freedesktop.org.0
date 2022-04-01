Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2B4EED40
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7867110E14F;
	Fri,  1 Apr 2022 12:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D2A10E139;
 Fri,  1 Apr 2022 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648816631; x=1680352631;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FH1vn4P3u+/zwqyrOOmlegQIVQF8V8aUPfEigCgaNUY=;
 b=UZbNudcPMjT1Mrd9tH+MHTN8bkshLv6xAizaVGP1+kvQrguZRcWOHcqI
 6suYwtMWF+yyzehvgvNNEwiVS+9YDAuql2ehG3imE3GQz6JRApziuf9Hj
 zaSEbxDFT2L8d7gh8nJP2AGivP0rj6KzRg8iGCF+5+PXjftPdcqC3rJfM
 VQQecGqHNdNGadejPsGnuI1tHeFJEJKG5q6vloS6NGI7+XRgAs9kyKQT6
 7j6NBwPEs1QWVe4lVQAbBuptrcGbGnBSxMTlDXYf8LbwdGietnIZidG9t
 J08DjwpVdytRCIVjalOSsWGZPL/M9EEaRuH3Aj+0c/o7WuUpY5AUrLkB8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257708055"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257708055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="606725174"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:10 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/9] drm/i915/gt: use engine instance directly for offset
Date: Fri,  1 Apr 2022 18:07:43 +0530
Message-Id: <20220401123751.27771-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220401123751.27771-1-ramalingam.c@intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
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


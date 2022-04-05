Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40A4F3877
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA35810E660;
	Tue,  5 Apr 2022 14:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A34510E660;
 Tue,  5 Apr 2022 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649169252; x=1680705252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FH1vn4P3u+/zwqyrOOmlegQIVQF8V8aUPfEigCgaNUY=;
 b=EWpY4q26ZYBA2pFDzBu+WuHwRH2nG2Qw+fLzCnkznKU4fqfmUzHS4lTY
 upN3XKsAEncK+GNYbW3tIw5eq33t5xKjuzrnkPueP6lP5Oc0ny7fzmg5E
 7WbphSCfYQ6MCWlkmX9cHBaGmY+3Wu8QeCoNfFoIzeeAma2jy0BifMFdw
 WECuSt6GmAj040aLpeR53BAMbIT45QgU4IK/LF+arz6Jyd0tUT6Ctat/G
 ibcrPoP4/S+aHPf7XWZy1vRA6uRjsZmKDtpx48Zs9okKLnvSJLOLFdcUI
 F3Nvn++hAcJhALmBN4AgcYvzVvaYT63TUchfhochIt0FPqFI4d7izot/P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="285722168"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="285722168"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="657958962"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:10 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 1/9] drm/i915/gt: use engine instance directly for offset
Date: Tue,  5 Apr 2022 20:04:46 +0530
Message-Id: <20220405143454.16358-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220405143454.16358-1-ramalingam.c@intel.com>
References: <20220405143454.16358-1-ramalingam.c@intel.com>
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


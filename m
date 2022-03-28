Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D444E9F6E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B71910EC71;
	Mon, 28 Mar 2022 19:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9273B10E966;
 Mon, 28 Mar 2022 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494420; x=1680030420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJYkSdqMSQGUhDkpBZP0CF+XSEYizdkEirLyBVcuzK0=;
 b=ZGYNwRZNhUcamdXrmMdNQjrFU/ojFbcXvrqfnRMOi+PLwTzvuvJEwCNj
 KRsTl6xBPWKQVcR4Tjw3EBYBPSJ8b0dlnRhkEjnjQ12+2QGD8ul+L+/jV
 L6raOkGK/+yKOwT8rs9IOngIKFdBl3Dq3mN+SGByhh0rvC+V2gqoGflfe
 34GeemBI3JnTDrYISUaUOCAvslN+grKVnBw+nvxxAUyVBO5K0oggsK0Wq
 qsI4mLFJkvcBzHcbH+tf7nFQ+GuX9ghHD8A++83Yp5AgGxVMYzgTrZPKg
 uwlCdaunrxqg9YCVE3Zaapxsms0VOJ6zkauUblYyNkOXKMTG+XmNC/yzT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678670"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678670"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563920899"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:06:58 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/9] drm/i915/gt: use engine instance directly for offset
Date: Tue, 29 Mar 2022 00:37:28 +0530
Message-Id: <20220328190736.19697-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220328190736.19697-1-ramalingam.c@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make it uniform across copy and clear, use the engine offset directly
to calculate the offset in the cmd forming for emit_clear.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 20444d6ceb3c..9e6c98a17441 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -614,15 +614,13 @@ intel_context_migrate_copy(struct intel_context *ce,
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
@@ -632,17 +630,16 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size, u32 value)
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


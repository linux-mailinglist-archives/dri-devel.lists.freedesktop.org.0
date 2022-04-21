Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3D509EB9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF5C10F37D;
	Thu, 21 Apr 2022 11:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ECD10E8CB;
 Thu, 21 Apr 2022 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650541045; x=1682077045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OY1fSSw7HIOYHDbXIy/g+Rp7HZLnRJzV0lphouT4Ngg=;
 b=leonEFbwnnQsxQMc9bE2hzkhIOC+aql61iNMnxIZIG3e300iQNkBt84f
 zDY1gu9op0xuAFz4ag8ofLrTJVw6g9wR2R7aebH4QkqfXkF4I2LZruO0u
 c5n5NDyKmhDMi9Z92Tf8RgcHGcWN7uxiOgFEVouKOH7deHyCFZdm7LBvb
 9GEgKyGwS+UltPKJEAXtpKLYPccN4hbzbFlGDJWFFe/SDXkIxkhVh7gNn
 E93ix7L3Gyh2Zrn3ekLw1okm2q9VsBqRJ81X0jOlKeY6cTpOH18hJSR7g
 oBvHtLNvgen1VozR6Cgt94phW5Ld6tnL/wSKpJwAsZaVONjLsty5S/h7Z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324766836"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324766836"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="727952144"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/i915/gt: Extend doc on Flat-CCS obj eviction
Date: Thu, 21 Apr 2022 17:08:12 +0530
Message-Id: <20220421113813.30796-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421113813.30796-1-ramalingam.c@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture the eviction details for Flat-CCS capable lmem only objects and
lmem objects with smem residency. This also captures the impact of
eviction on  object's memory residency and Flat-CCS compression
state.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 36 ++++++++++++++++++-------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 463a6a14b5f9..9d0d18950e76 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -485,16 +485,34 @@ static bool wa_1209644611_applies(int ver, u32 size)
  * And CCS data can be copied in and out of CCS region through
  * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
  *
- * When we exhaust the lmem, if the object's placements support smem, then we can
- * directly decompress the compressed lmem object into smem and start using it
- * from smem itself.
+ * when we exhaust the lmem, we need to handle two types of flat-ccs capable
+ * objects for its eviction.
+ *   1) lmem only objects
+ *   2) lmem objects with smem residency option
  *
- * But when we need to swapout the compressed lmem object into a smem region
- * though objects' placement doesn't support smem, then we copy the lmem content
- * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
- * When the object is referred, lmem content will be swaped in along with
- * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
- * location.
+ * 1) lmem only objects:
+ *
+ * lmem backing memory can be temporarily evicted to smem, along with the
+ * auxiliary CCS state, where it can be potentially swapped-out at a later point,
+ * if required. If userspace later touches the evicted pages, then we always move
+ * the backing memory back to lmem, which includes restoring the saved CCS state,
+ * and potentially performing any required swap-in.
+ *
+ * In this scenario, objects' backing memory class and Flat-CCS state doesn't
+ * change.
+ *
+ * 2) lmem objects with smem residency option
+ *
+ * Lmem object with smem region in it's placement list, will be migrated into
+ * smem  by decompressing the content. I915 doesn't handle this kind of
+ * migration for Flat-CCS compressed objects yet.
+ *
+ * In this scenario, objects' backing memory class and Flat-CCS state changed,
+ * and userspace is not aware of it.
+ *
+ * In summary, when a userspace wants to be sure about the objects memory
+ * residency and flat-ccs compression state, then placement list can't have
+ * the lmem and smem together. Instead, object has to be lmem resident only.
  */
 
 static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
-- 
2.20.1


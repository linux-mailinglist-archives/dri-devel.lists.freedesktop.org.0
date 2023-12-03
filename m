Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6E80241A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BA210E2DA;
	Sun,  3 Dec 2023 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761A10E2C6;
 Sun,  3 Dec 2023 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609501; x=1733145501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKKa4BOOnEyA4HUJAkWqKp5uSW09uVdvjZ+3UJneSag=;
 b=jiAw4haweYfF3APpixtOUxgT8g7VMF0aQgK0kN8M12VhNZihyRdePYwS
 UVkvOmM/XjMvFGQPwcwX0WTyO2ZECVteor2fIcJetTaXe4yzPqvCAQyt7
 fVbgKyRLSqGMh+0Ad+ZCAtYsDoiBhcxMxL9YoriQNXwJVmF15f4Kirroc
 GwH9BZTT7aGNk86JCYqQGan3bY1b16RcZfVLQ1jTqAU26+DLdcBuSsBoz
 dYF/hfcMYI2p+P6D1OzCQkq5xkt+dxU10vtk2c4Tj4NdhZzOMrc/sodYK
 xt+qFylJpcOTUv7SFIkhk5qFyRqSgPcAF6zpb6nG+dh2iwwynVEjijd4s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498261"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498261"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262478"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262478"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:18:12 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ira Weiny <ira.weiny@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] drm/i915: Use kmap_local_page() in i915_cmd_parser.c
Date: Sun,  3 Dec 2023 21:29:46 +0800
Message-Id: <20231203132947.2328805-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
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
Cc: Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

The use of kmap_atomic() is being deprecated in favor of
kmap_local_page()[1], and this patch converts the call from
kmap_atomic() to kmap_local_page().

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults and preemption disables.

There're 2 reasons why function copy_batch() doesn't need to disable
pagefaults and preemption for mapping:

1. The flush operation is safe. In i915_cmd_parser.c, copy_batch() calls
drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu
in drm_clflush_virt_range(), the flush operation is global.

2. Any context switch caused by preemption or page faults (page fault
may cause sleep) doesn't affect the validity of local mapping.

Therefore, copy_batch() is a function where the use of
kmap_local_page() in place of kmap_atomic() is correctly suited.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation
       about cache flush.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index ddf49c2dbb91..2905df83e180 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1211,11 +1211,11 @@ static u32 *copy_batch(struct drm_i915_gem_object *dst_obj,
 		for (n = offset >> PAGE_SHIFT; remain; n++) {
 			int len = min(remain, PAGE_SIZE - x);
 
-			src = kmap_atomic(i915_gem_object_get_page(src_obj, n));
+			src = kmap_local_page(i915_gem_object_get_page(src_obj, n));
 			if (src_needs_clflush)
 				drm_clflush_virt_range(src + x, len);
 			memcpy(ptr, src + x, len);
-			kunmap_atomic(src);
+			kunmap_local(src);
 
 			ptr += len;
 			remain -= len;
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FF6CD304
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1210E4FC;
	Wed, 29 Mar 2023 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854F010E4FC;
 Wed, 29 Mar 2023 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074711; x=1711610711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yyQdMm9uqDdypEaS6stlmLE4TXLEkbMEIetdKqrgHwo=;
 b=bSyXGX8cxPQVQWKpTE/dinL+UwzUNj/aOKgjgwggttx3gWWQrLPSKoEL
 Qn2L0b6IQbdksNH01hWtMGK4zNrt4aKX5T5Go1qmAFSvjcpr4A50szHEq
 JfeEtTJa7H+ro73xACenAbnal/Q0ATXcI+XWfhKt9ezjs5GjJb5qJ+JXF
 i+hKH1tzuR2ZC0RUj5i4hqLPxST0FoZCWUBhdg0oD9RkB/akDZtt113Za
 EhPoHn9IEF3mD6qHL9j/nwvqJuDM1BXogxNoiNitMPRgSNAmwgfYIpDE5
 RoDOWsSF6HjBl5u2pNi3CegRWYduuj118zM6btY+NE+K3J1jWxEFGlflB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405746229"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405746229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160648"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160648"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:50 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] drm/i915: Use kmap_local_page() in i915_cmd_parser.c
Date: Wed, 29 Mar 2023 15:32:19 +0800
Message-Id: <20230329073220.3982460-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
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

v2:
* Dropped hot plug related description since it has nothing to do with
  kmap_local_page().
* No code change since v1, and added description of the motivation of
  using kmap_local_page().

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
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


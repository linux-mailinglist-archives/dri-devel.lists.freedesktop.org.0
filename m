Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CA802411
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2410E2B0;
	Sun,  3 Dec 2023 13:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D01810E29E;
 Sun,  3 Dec 2023 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609481; x=1733145481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cJdGxmzajRRQz6VtsFZACeu7sS9itYjQTzis7aoFYwU=;
 b=RQg7DJAJCXHMBpeuo3qU218KfQEM3NfMavqV7/F37KsecZtVuPWxlods
 2oKcKUfrVcQiOimAc5yqMQKHfH8hdTdt/Z9tn0Biz77vY33l3dTp8N9+F
 /MDbg3fBxkNfrqgGGKDRkkQVEFiAOqa2qhNIebi5DIbAizaXPRaHn8wYY
 0An+hpemBqT8FbhcZshL1znxDUOagHk9k9d/WW7zhkmBoIbBXAv7z8+di
 uMtpkWOaLfPd3TWUUgiLmcb4bFbDU7bskix4zV+WWNbqor1Ky5z9LZsX7
 4Mwg14J42Ae/lagO0d+eqFucefplioBZDApiRZnUGbaxo4nm55YF1TkFN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498232"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262401"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262401"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:17:56 -0800
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
Subject: [PATCH v3 4/9] drm/i915: Use kmap_local_page() in
 gem/selftests/huge_pages.c
Date: Sun,  3 Dec 2023 21:29:42 +0800
Message-Id: <20231203132947.2328805-5-zhao1.liu@linux.intel.com>
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
unnecessary page faults or preemption disables.

In drm/i915/gem/selftests/huge_pages.c, function __cpu_check_shmem()
mainly uses mapping to flush cache and check the value. There're
2 reasons why __cpu_check_shmem() doesn't need to disable pagefaults
and preemption for mapping:

1. The flush operation is safe. Function __cpu_check_shmem() calls
drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
drm_clflush_virt_range(), the flush operation is global.

2. Any context switch caused by preemption or page faults (page fault
may cause sleep) doesn't affect the validity of local mapping.

Therefore, __cpu_check_shmem() is a function where the use of
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
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 6b9f6cf50bf6..c9e6d77abab0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1082,7 +1082,7 @@ __cpu_check_shmem(struct drm_i915_gem_object *obj, u32 dword, u32 val)
 		goto err_unlock;
 
 	for (n = 0; n < obj->base.size >> PAGE_SHIFT; ++n) {
-		u32 *ptr = kmap_atomic(i915_gem_object_get_page(obj, n));
+		u32 *ptr = kmap_local_page(i915_gem_object_get_page(obj, n));
 
 		if (needs_flush & CLFLUSH_BEFORE)
 			drm_clflush_virt_range(ptr, PAGE_SIZE);
@@ -1090,12 +1090,12 @@ __cpu_check_shmem(struct drm_i915_gem_object *obj, u32 dword, u32 val)
 		if (ptr[dword] != val) {
 			pr_err("n=%lu ptr[%u]=%u, val=%u\n",
 			       n, dword, ptr[dword], val);
-			kunmap_atomic(ptr);
+			kunmap_local(ptr);
 			err = -EINVAL;
 			break;
 		}
 
-		kunmap_atomic(ptr);
+		kunmap_local(ptr);
 	}
 
 	i915_gem_object_finish_access(obj);
-- 
2.34.1


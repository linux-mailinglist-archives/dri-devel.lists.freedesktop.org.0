Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BA802424
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEA910E2C7;
	Sun,  3 Dec 2023 13:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAA210E2B1;
 Sun,  3 Dec 2023 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609501; x=1733145501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0RVul1j1ChdDPLa632W5FsA9VNrjI6ORXgE1LsiNbo=;
 b=i4OVqyvEVpEsDKJJ+77xMsib1QqWDXGldM+23oRAQApmh/3YXJ+NIE48
 3+SkFkXPj5vzj/RHnIK0q1EPUUiEk8PJz//+PdlzCa5B00bAqkrXOKC+D
 BM6O3L019R9p6xB7xyirMwXAAAevXQpMz0AMoSDTcxvl4k94WO41Gq0M4
 yjFbCjTYpvfOmh9xLsW4GETZN8NpqgcS+9UlxSt9QINrpYjrw0Q5R6Q7i
 vml0Q3hrd8HFdcbaMWMXq93XYB+0wyjd2LZ0FxvUHXSt4is5d3kFGbdCL
 NdGHdtYxHCUDfxnfTW/FCilQXjpPU+XbH0ho62kfh+RsYrEwwkpDkdIyz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498250"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498250"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262464"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262464"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:18:08 -0800
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
Subject: [PATCH v3 7/9] drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
Date: Sun,  3 Dec 2023 21:29:45 +0800
Message-Id: <20231203132947.2328805-8-zhao1.liu@linux.intel.com>
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
mappings doesn't disable page faults or preemption  (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults or preemption disables.

In drm/i915/gt/uc/intel_us_fw.c, the function intel_uc_fw_copy_rsa()
just use the mapping to do memory copy so it doesn't need to disable
pagefaults and preemption for mapping. Thus the local mapping without
atomic context (not disable pagefaults / preemption) is enough.

Therefore, intel_uc_fw_copy_rsa() is a function where the use of
memcpy_from_page() with kmap_local_page() in place of memcpy() with
kmap_atomic() is correctly suited.

Convert the calls of memcpy() with kmap_atomic() / kunmap_atomic() to
memcpy_from_page() which uses local mapping to copy.

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com/T/#u

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Ira: Referred to his task document and suggestions about using
       memcpy_from_page() directly.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 362639162ed6..756093eaf2ad 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1343,16 +1343,13 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
 
 		for_each_sgt_page(page, iter, uc_fw->obj->mm.pages) {
 			u32 len = min_t(u32, size, PAGE_SIZE - offset);
-			void *vaddr;
 
 			if (idx > 0) {
 				idx--;
 				continue;
 			}
 
-			vaddr = kmap_atomic(page);
-			memcpy(dst, vaddr + offset, len);
-			kunmap_atomic(vaddr);
+			memcpy_from_page(dst, page, offset, len);
 
 			offset = 0;
 			dst += len;
-- 
2.34.1


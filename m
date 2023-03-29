Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BD6CD302
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605B610EA2A;
	Wed, 29 Mar 2023 07:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4242110E4FC;
 Wed, 29 Mar 2023 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074709; x=1711610709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctlg4NjY5kelpxf9KaNbuOy8AYhBpUiiPegXpU79lsk=;
 b=IXeSWYKhMXZJGUviW+UGlsw7EQ/LenITdZnTDbWWuyd8Ew3q1GZv2WTp
 PMw+0OuQRC/kr8HBpSs+LW5EmKJsgDC/f60LTVrVHWfEhrDpgK5OPJ+si
 j9fY9btqjZHH2/DoJ0kAv2xFHsjHLELKSt15EY7XMClUmR8K2u+ooqiuy
 V/x2DZiYJhd8thWKQaG5YOao13E543xcU5RmHYEQa2PV+bbIJFgZOe1xk
 ZZl5/IqFmqHWgtE1Mrqn1Y21GIngA3ZkeqdMNXrfDmXZBYjbu0gwDq/SR
 yspKCJyrpJrgrmXbrV8cTOPm6j4CWttq69v+iiPxKW2LgnNcb0UuzArLN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405746207"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405746207"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160631"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160631"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:45 -0700
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
Subject: [PATCH v2 7/9] drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
Date: Wed, 29 Mar 2023 15:32:18 +0800
Message-Id: <20230329073220.3982460-8-zhao1.liu@linux.intel.com>
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

v2: No code change since v1, and added description of the motivation of
    using kmap_local_page().

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
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
index 65672ff82605..5bbde4abd565 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1152,16 +1152,13 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
 
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


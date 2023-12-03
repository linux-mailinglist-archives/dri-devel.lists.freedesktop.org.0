Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED7480241E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE78A10E2C6;
	Sun,  3 Dec 2023 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EADF10E2AC;
 Sun,  3 Dec 2023 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609477; x=1733145477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xk0v3edNgmlsBbxSQneTxOyfsCMSJWY4MBCAqYlM+Qk=;
 b=BcHlv1loRqlFTYqxluUKp5CmOQMrgURAVq5XJuhi6Uf94Fmpm4srF0AG
 pDk35EvghzaGqapiFQjSSxehqNLIRn0mbzw59xzTb/WDAzJrkNNiCPW/4
 umQaGd+kE76/XS0ktW42a8mxiPXJq+N9XFJNxFJtMKq/MTKQNtonhdSVk
 9yVaJsLYRcA0ovomPJNyuKJOi0IsRmoQcDYa7cY/GUAN2gdcKfdkdCcil
 WmhLk3+c2wFiRXAfK3ZqAwHq4NvI+zrnkpVtWATqpp9cbWAzlBlu+zk+l
 xmbM/Nif592bdWqiRP+e+9+ywHCqQAICq92MV+NMw2VyGSvttsR3Kpcnx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498222"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498222"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262372"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262372"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:17:52 -0800
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
Subject: [PATCH v3 3/9] drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
Date: Sun,  3 Dec 2023 21:29:41 +0800
Message-Id: <20231203132947.2328805-4-zhao1.liu@linux.intel.com>
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
kmap_local_page()[1].

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults or preemption disables.

In drm/i915/gem/i915_gem_shmem.c, the function shmem_pwrite() need to
disable pagefault to eliminate the potential recursion fault[2]. But
here __copy_from_user_inatomic() doesn't need to disable preemption and
local mapping is valid for sched in/out.

So it can use kmap_local_page() / kunmap_local() with
pagefault_disable() / pagefault_enable() to replace atomic mapping.

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
[2]: https://patchwork.freedesktop.org/patch/295840/

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Ira: Referred to his suggestions about keeping pagefault_disable().
  Fabio: Referred to his description about why kmap_local_page() should
         be preferred.
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 73a4a4eb29e0..38b72d86560f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -485,11 +485,13 @@ shmem_pwrite(struct drm_i915_gem_object *obj,
 		if (err < 0)
 			return err;
 
-		vaddr = kmap_atomic(page);
+		vaddr = kmap_local_page(page);
+		pagefault_disable();
 		unwritten = __copy_from_user_inatomic(vaddr + pg,
 						      user_data,
 						      len);
-		kunmap_atomic(vaddr);
+		pagefault_enable();
+		kunmap_local(vaddr);
 
 		err = aops->write_end(obj->base.filp, mapping, offset, len,
 				      len - unwritten, page, data);
-- 
2.34.1


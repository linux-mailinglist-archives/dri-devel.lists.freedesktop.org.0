Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D6602474
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70D10EE80;
	Tue, 18 Oct 2022 06:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3610ED0E;
 Mon, 17 Oct 2022 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665999151; x=1697535151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L0klkS76Kt8Hk/6E4tsClEGhD8s9Fs2w8vteQwCBE8U=;
 b=F3/6TfLJzL35a+a164pxBFAFgFAIRQKvmyBY5u6X8V5b2WfUFO+IqwNd
 t6nUkcRPMPdqLmUWJcKz3/MGF0yug1+MCybH0YMKFUkDh/riaa6/DY7sd
 FMhf5dj9cYbFIAXe3Ov7aDrlxxcI69egrFhP9Xz2KinFzujraqsf2WyEg
 2NrnWjnIv3UTIAkc4dyLsGKNGEFTkwWt/DCjgfRVYlibKxH1obKRHBKHz
 YK7B42adFL7E8sP673f3qV4aVqkrO8o4wdu/cCc3CvgMqNjbu1YujM1iP
 WNcNn4Lvbpty/VS2HDOLQi18lxKkZJHXGpdQmjH5uQonTAIHxFDtur3lY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286142604"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286142604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717431229"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717431229"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:32:27 -0700
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
Subject: [PATCH 2/9] drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
Date: Mon, 17 Oct 2022 17:37:18 +0800
Message-Id: <20221017093726.2070674-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
kmap_local_page()[1].

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption.

In drm/i915/gem/i915_gem_phys.c, the functions
i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
don't need to disable pagefaults and preemption for mapping because of
these 2 reasons:

1. The flush operation is safe for CPU hotplug when preemption is not
disabled. In drm/i915/gem/i915_gem_object.c, the functions
i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
calls drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
drm_clflush_virt_range(), the flush operation is global and any issue
with cpu's being added or removed can be handled safely.

2. Any context switch caused by preemption or sleep (pagefault may
cause sleep) doesn't affect the validity of local mapping.

Therefore, i915_gem_object_get_pages_phys() and
i915_gem_object_put_pages_phys() are two functions where the use of
kmap_local_page() in place of kmap_atomic() is correctly suited.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation about
       cache flush.
  Fabio: Referred to his boiler plate commit message.
---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 0d0e46dae559..d602ba19ecb2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -66,10 +66,10 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 		if (IS_ERR(page))
 			goto err_st;
 
-		src = kmap_atomic(page);
+		src = kmap_local_page(page);
 		memcpy(dst, src, PAGE_SIZE);
 		drm_clflush_virt_range(dst, PAGE_SIZE);
-		kunmap_atomic(src);
+		kunmap_local(src);
 
 		put_page(page);
 		dst += PAGE_SIZE;
@@ -114,10 +114,10 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 			if (IS_ERR(page))
 				continue;
 
-			dst = kmap_atomic(page);
+			dst = kmap_local_page(page);
 			drm_clflush_virt_range(src, PAGE_SIZE);
 			memcpy(dst, src, PAGE_SIZE);
-			kunmap_atomic(dst);
+			kunmap_local(dst);
 
 			set_page_dirty(page);
 			if (obj->mm.madv == I915_MADV_WILLNEED)
-- 
2.34.1


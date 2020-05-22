Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6C1DDF35
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 07:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0726E2E1;
	Fri, 22 May 2020 05:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9EA89167;
 Fri, 22 May 2020 05:19:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec760540000>; Thu, 21 May 2020 22:17:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 22:19:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 22:19:33 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 05:19:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 22 May 2020 05:19:33 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec760e40006>; Thu, 21 May 2020 22:19:32 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 4/4] drm/i915: convert get_user_pages() --> pin_user_pages()
Date: Thu, 21 May 2020 22:19:31 -0700
Message-ID: <20200522051931.54191-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522051931.54191-1-jhubbard@nvidia.com>
References: <20200522051931.54191-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590124628; bh=TYbuD5RgYulyxagO4AixT7wa6RlCT1nu+LHkKhXb+U4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=cdQD/956Uj8zxDJX68I1226jheY/giN2cXc6YxoAkGojYMIBjBOSqti8tVihqaU8i
 BCOupIc0lXwedQahSpEzQE1ix2Kj1kcWB4TQb4jOVT0dsYvmU9pHYmMGflUDi5zLOJ
 MUP7yHkx62FunLJL1KNYmaCjdBJlPsN3RITnu93V+Bjv2pyXhc9e6NTAMhFJB9DNIS
 QusxrgD/Z+P0Jc3MxV75GT4AHYNMMMoOHg02W8SaKfxJc/P68yWnawozzsRqT0XAOA
 DK5/ZVmsUIHnTkKX1kV+yjA0WZzt1IdEC6Ua6UjmYPzGcSRlkD3Qle1ZOJSUJKeCEb
 V+sYLIJrxDZOQ==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was using get_user_pages*(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages*() + put_page() calls to
pin_user_pages*() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 22 ++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7ffd7afeb7a5..b55ac7563189 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -471,7 +471,7 @@ __i915_gem_userptr_get_pages_worker(struct work_struct *_work)
 					down_read(&mm->mmap_sem);
 					locked = 1;
 				}
-				ret = get_user_pages_remote
+				ret = pin_user_pages_remote
 					(work->task, mm,
 					 obj->userptr.ptr + pinned * PAGE_SIZE,
 					 npages - pinned,
@@ -507,7 +507,7 @@ __i915_gem_userptr_get_pages_worker(struct work_struct *_work)
 	}
 	mutex_unlock(&obj->mm.lock);
 
-	release_pages(pvec, pinned);
+	unpin_user_pages(pvec, pinned);
 	kvfree(pvec);
 
 	i915_gem_object_put(obj);
@@ -564,6 +564,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	struct sg_table *pages;
 	bool active;
 	int pinned;
+	unsigned int gup_flags = 0;
 
 	/* If userspace should engineer that these pages are replaced in
 	 * the vma between us binding this page into the GTT and completion
@@ -598,11 +599,14 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 				      GFP_KERNEL |
 				      __GFP_NORETRY |
 				      __GFP_NOWARN);
-		if (pvec) /* defer to worker if malloc fails */
-			pinned = __get_user_pages_fast(obj->userptr.ptr,
-						       num_pages,
-						       !i915_gem_object_is_readonly(obj),
-						       pvec);
+		/* defer to worker if malloc fails */
+		if (pvec) {
+			if (!i915_gem_object_is_readonly(obj))
+				gup_flags |= FOLL_WRITE;
+			pinned = pin_user_pages_fast_only(obj->userptr.ptr,
+							  num_pages, gup_flags,
+							  pvec);
+		}
 	}
 
 	active = false;
@@ -620,7 +624,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 		__i915_gem_userptr_set_active(obj, true);
 
 	if (IS_ERR(pages))
-		release_pages(pvec, pinned);
+		unpin_user_pages(pvec, pinned);
 	kvfree(pvec);
 
 	return PTR_ERR_OR_ZERO(pages);
@@ -675,7 +679,7 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 		}
 
 		mark_page_accessed(page);
-		put_page(page);
+		unpin_user_page(page);
 	}
 	obj->mm.dirty = false;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

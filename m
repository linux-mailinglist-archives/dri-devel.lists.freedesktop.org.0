Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27F3985F6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAFC6EC3C;
	Wed,  2 Jun 2021 10:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1CB6EC36
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:09:20 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g8so3048847ejx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wM6uurAAEvuARNuZRkkPrMS6tYitYtlkWM7bsf0Tz0U=;
 b=ppHMEWH+ht6/dYEh3a3ihU9/M9bVq6lNjXcdIcsZhHlSgPBwx9Y65yq9pEFhZSwgzF
 pE8CsKXfxHVQvwt7DQCthmPoV86teX2oCJVpXzOfChaUL2B3q8SDuc0qJ5B3MZrGX4WH
 rDQoXXEwLKtfi+9U4xjDDM3plx3tN13XkpzmcxXgQ5LrkCWRz6wWgQuglFpQknoEqyfL
 vT5069eZgJdptGaR5z4twPufJUHv8EO7EtWeRKzUbvN4c04y6j0bOCWocsQxMPHiXgAg
 tEfT0txu1g6jqI70HNGi6W83fU2b8yh6hVmKk/IoKvIIYoxHf3LvBtTgnGGeQFKGfX2q
 wMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wM6uurAAEvuARNuZRkkPrMS6tYitYtlkWM7bsf0Tz0U=;
 b=UkhYs79O1kEmm/QYuHZvylaQV17mSAfJ+E+fq7G2tV8pPyv4l45ung91qE1RUNWWFy
 4z4r6kpuVhGnXRqM2m1QCJKATsNqR0Jl2apbsz/GGCNXFEj3q0FxOAUI1vwvGSQsUukL
 evOyt3dLiR3u2soVwZc0xrqwLWKK04BhU3R7ebxxklu6LKBlQJ7U3HJCa2F9Jp5VO9qi
 qWuCpjfryRp3cxuZXGSlTv8tshiUHkKMXRgEUVqXphBSBdhFGKItLWOOTRseZxkl/rYr
 PdCVe84kA1qPLqc4jZByzhWb+Ar9UhdNDCeNpb2cW5G6hjN//st8vS1tlQRM0NSVZsMz
 3juw==
X-Gm-Message-State: AOAM530NGw4JQD1FlQe/B/41xThcCUu+7jNjmE76Q+k+G9CumohKvi2o
 L8dhLAXtqaIZeYxJ/goEEyM=
X-Google-Smtp-Source: ABdhPJzxI96X2aoVb97lBNhFsxBgJCE430YrIk4sahHFGp5UlGoIXAAqf2s2nIpE9GC3zD0hGe7X3Q==
X-Received: by 2002:a17:907:c01:: with SMTP id
 ga1mr34212053ejc.80.1622628558666; 
 Wed, 02 Jun 2021 03:09:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id g4sm1017468edw.8.2021.06.02.03.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:09:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/amdkfd: use resource cursor in
 svm_migrate_copy_to_vram v2
Date: Wed,  2 Jun 2021 12:09:09 +0200
Message-Id: <20210602100914.46246-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Access to the mm_node is now forbidden. So instead of hand wiring that
use the cursor functionality.

v2: fix handling as pointed out by Philip.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 68 ++++--------------------
 1 file changed, 10 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index fd8f544f0de2..5ce8fa2ddab0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -29,6 +29,7 @@
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_mn.h"
+#include "amdgpu_res_cursor.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 #include "kfd_migrate.h"
@@ -205,34 +206,6 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 	return r;
 }
 
-static uint64_t
-svm_migrate_node_physical_addr(struct amdgpu_device *adev,
-			       struct drm_mm_node **mm_node, uint64_t *offset)
-{
-	struct drm_mm_node *node = *mm_node;
-	uint64_t pos = *offset;
-
-	if (node->start == AMDGPU_BO_INVALID_OFFSET) {
-		pr_debug("drm node is not validated\n");
-		return 0;
-	}
-
-	pr_debug("vram node start 0x%llx npages 0x%llx\n", node->start,
-		 node->size);
-
-	if (pos >= node->size) {
-		do  {
-			pos -= node->size;
-			node++;
-		} while (pos >= node->size);
-
-		*mm_node = node;
-		*offset = pos;
-	}
-
-	return (node->start + pos) << PAGE_SHIFT;
-}
-
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
 {
@@ -297,11 +270,9 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 {
 	uint64_t npages = migrate->cpages;
 	struct device *dev = adev->dev;
-	struct drm_mm_node *node;
+	struct amdgpu_res_cursor cursor;
 	dma_addr_t *src;
 	uint64_t *dst;
-	uint64_t vram_addr;
-	uint64_t offset;
 	uint64_t i, j;
 	int r;
 
@@ -317,19 +288,12 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		goto out;
 	}
 
-	node = prange->ttm_res->mm_node;
-	offset = prange->offset;
-	vram_addr = svm_migrate_node_physical_addr(adev, &node, &offset);
-	if (!vram_addr) {
-		WARN_ONCE(1, "vram node address is 0\n");
-		r = -ENOMEM;
-		goto out;
-	}
-
+	amdgpu_res_first(prange->ttm_res, prange->offset << PAGE_SHIFT,
+			 npages << PAGE_SHIFT, &cursor);
 	for (i = j = 0; i < npages; i++) {
 		struct page *spage;
 
-		dst[i] = vram_addr + (j << PAGE_SHIFT);
+		dst[i] = cursor.start + (j << PAGE_SHIFT);
 		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
 		svm_migrate_get_vram_page(prange, migrate->dst[i]);
 
@@ -354,18 +318,10 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 						mfence);
 				if (r)
 					goto out_free_vram_pages;
-				offset += j;
-				vram_addr = (node->start + offset) << PAGE_SHIFT;
+				amdgpu_res_next(&cursor, j << PAGE_SHIFT);
 				j = 0;
 			} else {
-				offset++;
-				vram_addr += PAGE_SIZE;
-			}
-			if (offset >= node->size) {
-				node++;
-				pr_debug("next node size 0x%llx\n", node->size);
-				vram_addr = node->start << PAGE_SHIFT;
-				offset = 0;
+				amdgpu_res_next(&cursor, PAGE_SIZE);
 			}
 			continue;
 		}
@@ -373,19 +329,15 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
 			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
 
-		if (j + offset >= node->size - 1 && i < npages - 1) {
+		if (j << PAGE_SHIFT >= cursor.size - 1 && i < npages - 1) {
 			r = svm_migrate_copy_memory_gart(adev, src + i - j,
 							 dst + i - j, j + 1,
 							 FROM_RAM_TO_VRAM,
 							 mfence);
 			if (r)
 				goto out_free_vram_pages;
-
-			node++;
-			pr_debug("next node size 0x%llx\n", node->size);
-			vram_addr = node->start << PAGE_SHIFT;
-			offset = 0;
-			j = 0;
+			amdgpu_res_next(&cursor, (j + 1) * PAGE_SIZE);
+			j= 0;
 		} else {
 			j++;
 		}
-- 
2.25.1


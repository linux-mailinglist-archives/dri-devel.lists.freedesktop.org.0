Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB2B2DF8F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE4010E772;
	Wed, 20 Aug 2025 14:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M9q6kgHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6A210E76B;
 Wed, 20 Aug 2025 14:37:46 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45a1b0b42d5so48749985e9.2; 
 Wed, 20 Aug 2025 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755700664; x=1756305464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7dYE0WEtU/TzXqdPQoksdj+LhmcMBvd6dH5veaACpE=;
 b=M9q6kgHLVbtPCQf56uuls9IoRWXhDcdE652zYI/MvVS3pdwVlGnmHvx1wwCyLq1lho
 +vizrRlhh9X+xSrX4MkJCWW0bR9xBP8KD6w8AKAmgvefLJhvtjlEvfDlpSbz86Tih9wB
 XBbXaS4Odz//+oBnfTEm2ANMaBtXBGm3G2XUR7xG//PXd/RA3GCoG2RyEleBZSpYHJoa
 yNb+oUTK1laIKQVEAHyamHNAdcj7dS00fS8fYiYDyky8wFakmUT5ONa2C7fP3HTxuxtH
 fnQNOOW6AyiVoo+r/jX09hOSiC4DAGKezJS9/ElQIfaf+1S9y0ms7ulnUWYE+L4tVlhM
 frfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755700664; x=1756305464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7dYE0WEtU/TzXqdPQoksdj+LhmcMBvd6dH5veaACpE=;
 b=ERdXmOVeItU+Ep1sh96MoO02b1eb7K5hLir5F/jTIXW+PDvrM/QY/DmVJrsUhvaavC
 sr36aXEPG52vDInPCoRvC38oEmF9mpKtPlq66Eb/xiyqSWlOhc+PF880Q7PEVcr97Xmu
 /ZI+YB/CZBtHQM4KmiXqNRhP86+iHj8IXRZlGV/B5ZfZtlFtqw5cMzhqlYuzFwLHokFp
 pEpqRrmikBKKBKI9kS33sP5RaRY1S3/u6SHkkT8TRAHycQtpX5ZWzHhQWaznCrBqVmnA
 pnXV47Wrmki8mS/qoz7PEZoE5G15P0cUv07rY8kpOfJt/wTNH5cRBjc99troG/kv4L0l
 4pAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV00pYrx7+yghD7vXbVSfW8TedL7GffRu1N5xTo/7jPArBFtOxX3rfloGTL5nDzlRXDiQ8LmLGl@lists.freedesktop.org,
 AJvYcCWmZqGDl1xBdQsOzZIJUgMPaZUsv/aSRDL97wIEPiPbsw97QRlMt1oVRb0Ekrh8KX3Kn7GO/YNgA/WE@lists.freedesktop.org,
 AJvYcCXQAq0CexGaLTLOqrzT0vkoxUxnBDHilBcNx9IHcmfO/M7O7QZmVwanjPupiDXKGpO/8wh4sQIvMAKd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbyEBFGKxQBrGi1CSEC0h9YKBUBC5Rn/G18bLjYTtVS/JviVTA
 QlTQqcYV3vJN7gXSVdZvvX6anI835GgHES1esYjCZyqJAWdhNmdWyjwNgvGU5g==
X-Gm-Gg: ASbGncsFl+LPSBro8+Ahfi2mGRr2Ot0XyQ721R+TTMymAqpG2nV0GmESkPHFulbNLLA
 tr7K3bicvqxuld+w+1HzBrBVs2Vci6ub/Dxd6NqNf/os7hXX2iouZB9IHM2U1T4JEgWoPNvygve
 KPgZzWhVf0D2DAMCCHz3Vq/sZcN/ETXeG2Zb9qnxSITzaBTc/nY4fo/KQD/KY3YDlYnjZUwYHVu
 MsVTYxvHUifHpNRiq2xhpvX/HCO/h46bfCD2WANTKmfUoOk9msgtv80trLYgSTrteWxhIkuZyi4
 J1V20mkLQboftCN720+8lQ3M1UkraOu8zNYqXoNWS7MPrL/f9s0VbM08tXKrR+H66Jg7R7HSgnI
 UQbDmuZu0KOIwLEJjDS0TV2yNFzKwzrglLtI=
X-Google-Smtp-Source: AGHT+IEGOv+Y5gAYFwBXgCCX+5vm2RvbBQ6od7uh+Ae6wLwgoP9lYxDs7EYrdJRa8RpE+EfqRLsk6g==
X-Received: by 2002:a05:600c:4e88:b0:458:bf0a:6061 with SMTP id
 5b1f17b1804b1-45b479fd474mr27196505e9.24.1755700664451; 
 Wed, 20 Aug 2025 07:37:44 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1579:3800:9446:56c7:e203:3b9c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43ba5sm8090404f8f.22.2025.08.20.07.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:37:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, david@redhat.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org
Subject: [PATCH 3/3] drm/ttm: disable changing the global caching flags on
 newer AMD CPUs v2
Date: Wed, 20 Aug 2025 16:33:13 +0200
Message-ID: <20250820143739.3422-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820143739.3422-1-christian.koenig@amd.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
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

On some x86 systems (old AMD Athlons, Intel Luna Lake) we have the problem
that changing the caching flags of system memory requires changing the
global MTRR/PAT tables since those CPUs can't handle aliasing caching
attributes.

But on most modern x86 system (e.g. AMD CPUs after 2004) we actually
don't need that any more and can update the caching flags directly in the
PTEs of the userspace and kernel mappings.

We already do this with encryption on x86 64bit for quite a while and all
other supported platforms (Sparc, PowerPC, ARM, MIPS, LONGARCH) as well as
the i915 driver have never done anything different either.

So stop changing the global chaching flags for CPU systems which don't
need it and just insert a clflush to be on the safe side so that we never
return memory with dirty cache lines.

Testing on a Ryzen 5 and 7 shows that the clflush has absolutely no
performance impact, but I'm still waiting for CI systems to confirm
functional correctness.

v2: drop the pool only on AMD CPUs for now

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 83b10706ba89..3f830fb2aea5 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -45,6 +45,7 @@
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/drm_cache.h>
 
 #include "ttm_module.h"
 
@@ -119,6 +120,8 @@ module_param(page_pool_size, ulong, 0644);
 
 static atomic_long_t allocated_pages;
 
+static bool skip_caching_adjustment;
+
 static struct ttm_pool_type global_write_combined[NR_PAGE_ORDERS];
 static struct ttm_pool_type global_uncached[NR_PAGE_ORDERS];
 
@@ -195,7 +198,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	/* We don't care that set_pages_wb is inefficient here. This is only
 	 * used when we have to shrink and CPU overhead is irrelevant then.
 	 */
-	if (caching != ttm_cached && !PageHighMem(p))
+	if (!skip_caching_adjustment &&
+	    caching != ttm_cached && !PageHighMem(p))
 		set_pages_wb(p, 1 << order);
 #endif
 
@@ -223,13 +227,19 @@ static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
 	if (!num_pages)
 		return 0;
 
-	switch (alloc->tt_caching) {
-	case ttm_cached:
-		break;
-	case ttm_write_combined:
-		return set_pages_array_wc(alloc->caching_divide, num_pages);
-	case ttm_uncached:
-		return set_pages_array_uc(alloc->caching_divide, num_pages);
+	if (skip_caching_adjustment) {
+		drm_clflush_pages(alloc->caching_divide, num_pages);
+	} else {
+		switch (alloc->tt_caching) {
+		case ttm_cached:
+			break;
+		case ttm_write_combined:
+			return set_pages_array_wc(alloc->caching_divide,
+						  num_pages);
+		case ttm_uncached:
+			return set_pages_array_uc(alloc->caching_divide,
+						  num_pages);
+		}
 	}
 #endif
 	alloc->caching_divide = alloc->pages;
@@ -342,6 +352,9 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 		return &pool->caching[caching].orders[order];
 
 #ifdef CONFIG_X86
+	if (skip_caching_adjustment)
+		return NULL;
+
 	switch (caching) {
 	case ttm_write_combined:
 		if (pool->nid != NUMA_NO_NODE)
@@ -981,7 +994,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 
 #ifdef CONFIG_X86
 	/* Anything returned to the system needs to be cached. */
-	if (tt->caching != ttm_cached)
+	if (!skip_caching_adjustment && tt->caching != ttm_cached)
 		set_pages_array_wb(tt->pages, tt->num_pages);
 #endif
 
@@ -1296,6 +1309,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	spin_lock_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
+#ifdef CONFIG_X86
+	skip_caching_adjustment =
+		(boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
+		static_cpu_has(X86_FEATURE_CLFLUSH);
+#endif
+
 	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
 		ttm_pool_type_init(&global_write_combined[i], NULL,
 				   ttm_write_combined, i);
-- 
2.43.0


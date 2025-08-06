Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB2B1C6D0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 15:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983310E778;
	Wed,  6 Aug 2025 13:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lXh81Fln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977F10E3E1;
 Wed,  6 Aug 2025 13:28:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so18784645e9.0; 
 Wed, 06 Aug 2025 06:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754486920; x=1755091720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FP1yL6HccCLefto+0HqWzAXB4+x2ufUWjFUdYaozs/4=;
 b=lXh81FlnZaiwW1pV5hF8alzGksKdSGudvnwa6bWx51TfhNSVgqrQx3UDXZvXsFUBIi
 yqsuN8oKZLmHVM09UnZ/wpvnRfmv6rRL8XuUD8VwZWoV8FLIFh4j0ntI3DyxI/JERrnN
 fumiNxrtOFeKBsOjL6vesfBKvr8VV41a0nbmyqidNCXxfAJnsq8wBXiAXIOnEjbwrgJd
 v/6Tv8AJfCgIzh0Z9T+vclPKjbpdFQhThWu//Nhs0GBSwTfxTVYETZCN64rdUiOFkByo
 qcKdlmrx9rL+32dBrfX3cGJ/wW06CGTTC1JEliA8wul03TPjnc+go77++EIQfb1zp/cU
 V35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754486920; x=1755091720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FP1yL6HccCLefto+0HqWzAXB4+x2ufUWjFUdYaozs/4=;
 b=CD++iwneY1fevsohEwWIBPFExIoTgm7QQFGZKTnUyuXUSBKBRbnFy/oBGTrhhnzQmK
 JjjX7KnfAW5lHSzs62hbzxsIRWXpTFH1ti1uryheCjI8Mr8EXzF/6uoSgikpuK33I0wy
 v51YQUBRPvgCXV73lLdk71DBwgngplnS9Lel0/USUejzU0VndLclISV0j0Sp8RsdJnh1
 S3AdPrMJrQOGz12BpBgaudh599mQjh3qqibvWIGVYQa+7LgvTxjIWng+vF2rtR55LiHH
 R7n0cAqKWfppCC7GbwiiIUAMq6CoPqEphvayuZFyBhcoR6jFIQq2zNC6UH1E+w8gKjwB
 5zvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdnEkN7O52x5igsOq2legAaToxI1eI5oMfzvBDND62qHvtlxRicaug8sFwvTISBFA2VHgp5jbuQ7M=@lists.freedesktop.org,
 AJvYcCXws7gpZh55vUu5fRBvmWiD3TLO/9BrkKSKk1MKBjFECPacxartaO/jDbGFPSI8aLBWh1m/X9FoWDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRdlRIEzT9WnKWr+x11UdB4apJNM+6KGVmz5BpDzTJNVqH4TpR
 u3qbmNKotTbw5+VmypYwGlgQsExsq/Vy9T+ki+GakrngHI4ZTrebqcerO/qh8A==
X-Gm-Gg: ASbGnctwdfGHPA8deaOvUATkACpmyxiJbwi638oeeZ1f99l14FASxrCJJ/aK1B/IWIX
 PFbtueEoSQkvR75EsUMpr3INMJTwjvS9b55VjGaKkwDf4VjGU6QejJBB0mPhMR0wYI17D/rXjTO
 v3rMk9OWQF10zELCH7ub1ilMHiME9m8T8lY3ahPJMFTeB4Z6hVQQURgn/V0bpOrEJauORVXW/yo
 nWUym5zAYK7qGmEYy8OMYwabK9gVLQxKoQfIXHzaRX3Y1s0VEJhsGQoTuxfS7ZLD+kBQ1n/QW6a
 xP+IgamKjpVtcSqnS02CFt6uEOhMSTS669htz4DlFaaOHq1wo2HSAhHaVZoJK0G8WBva7JkRT0a
 nIw+Z4fsCeVxEFTuIaMdlsgQMzNphPhdJraZ3BFB50n4XxJw=
X-Google-Smtp-Source: AGHT+IFhYXABE8jmnIDs1eyiMghA4zEQVv+XicYta4UrBQhVIaJmF6Du/eUpSf0FT/BLPqdISpWgjA==
X-Received: by 2002:a05:600c:4fc4:b0:458:7005:2ac3 with SMTP id
 5b1f17b1804b1-459e748f99dmr24198735e9.21.1754486919565; 
 Wed, 06 Aug 2025 06:28:39 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1539:2d00:6adc:3e4b:bdf2:ac60])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm49531155e9.1.2025.08.06.06.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 06:28:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com
Subject: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
Date: Wed,  6 Aug 2025 15:28:38 +0200
Message-ID: <20250806132838.1831-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

On some old x86 systems we had the problem that changing the caching flags
of system memory requires changing the global MTRR/PAT tables.

But on any modern x86 system (CPUs introduced rughly after 2004) we
actually don't need that any more and can update the caching flags
directly in the PTEs of the CPU mapping. It was just never disabled
because of the fear of regressions.

We already use the PTE flags for encryption on x86 64bit for quite a while
and all other supported platforms (Sparc, PowerPC, ARM, MIPS, LONGARCH)
have never done anything different either.

So disable the page pool completely for 64bit systems and just insert a
clflush to be on the safe side so that we never return memory with dirty
cache lines.

Testing on a Ryzen 5 and 7 shows that this has absolutely no performance
impact and of hand the AMD CI can't find a problem either.

Let's see what the i915 and XE CI systems say to that.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index baf27c70a419..7487eac29398 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -38,7 +38,7 @@
 #include <linux/highmem.h>
 #include <linux/sched/mm.h>
 
-#ifdef CONFIG_X86
+#ifdef CONFIG_X86_32
 #include <asm/set_memory.h>
 #endif
 
@@ -46,6 +46,7 @@
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/drm_cache.h>
 
 #include "ttm_module.h"
 
@@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	struct ttm_pool_dma *dma;
 	void *vaddr;
 
-#ifdef CONFIG_X86
+#ifdef CONFIG_X86_32
 	/* We don't care that set_pages_wb is inefficient here. This is only
 	 * used when we have to shrink and CPU overhead is irrelevant then.
 	 */
@@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 /* Apply any cpu-caching deferred during page allocation */
 static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
 {
-#ifdef CONFIG_X86
+#ifdef CONFIG_X86_32
 	unsigned int num_pages = alloc->pages - alloc->caching_divide;
 
 	if (!num_pages)
@@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
 	case ttm_uncached:
 		return set_pages_array_uc(alloc->caching_divide, num_pages);
 	}
+
+#elif defined(CONFIG_X86_64)
+	unsigned int num_pages = alloc->pages - alloc->caching_divide;
+
+	drm_clflush_pages(alloc->caching_divide, num_pages);
 #endif
 	alloc->caching_divide = alloc->pages;
 	return 0;
@@ -342,7 +348,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 	if (pool->use_dma_alloc)
 		return &pool->caching[caching].orders[order];
 
-#ifdef CONFIG_X86
+#ifdef CONFIG_X86_32
 	switch (caching) {
 	case ttm_write_combined:
 		if (pool->nid != NUMA_NO_NODE)
@@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
 		return -EBUSY;
 
-#ifdef CONFIG_X86
+#ifdef CONFIG_X86_32
 	/* Anything returned to the system needs to be cached. */
 	if (tt->caching != ttm_cached)
 		set_pages_array_wb(tt->pages, tt->num_pages);
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2453DC93
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 17:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2704010E169;
	Sun,  5 Jun 2022 15:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76FC10E8C7
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 15:25:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id er5so15776702edb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3oII5rEfZoXf7U4b6hs9rpi5sWM6BBnmpd30r2QEOU=;
 b=PyvPxjctikeWzSfNKXCBFIPiHQj342ETF+dWPSJtdTYhGlMch8kZDbkzZkAyX1rhHD
 vZ401ub/slIA5YG7R+7EGL6JtPXUmSKeBnMSlw5PZx16vAcARgASoY3pVP9iaOnNox3G
 5K+FGbP7qHXBGFM25b//KOjJyLZEDACKFxUT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3oII5rEfZoXf7U4b6hs9rpi5sWM6BBnmpd30r2QEOU=;
 b=yk0JSiVaH9uhygh5EpeWnh0XzNnLgJosjWmu/3+U1VfzgyZ/jIVmYH/Hj7BztpiC9U
 JwJrdxO4wZKUeEtqwkW6hvBgT72bUWzo1gtiX3TNveW7Xs+FuuavLGMVqDyw8I40L7AQ
 xsrUhEbJYHgx+5nXldbZa2HHgZrmpNjlvxrQBwboYHoK1OA1S58TKmz/xqL5G+NPblJL
 Xt+2uCqfg6C6DNbOmBo8dB+pyzux+IufVLyOZG0BTS4pBlM2fD7ZaN1u3wrYM2CqtVRy
 2NzD1F+VT8NqAoq/d7359wHh8W9/A+B6db0y/b4QxAGGP15zmxXGD9pj984/41HwHkHj
 Lj3Q==
X-Gm-Message-State: AOAM531r8I9DCiueGVd1zWenasnktLuinf1DELLuKCFqyrfq5Rf2ABfA
 I+dFuUyFXMKfT3UWrrADE98/Ng==
X-Google-Smtp-Source: ABdhPJzO8PurCrRxgpc214KmxgqXebuHnZN2GlgM5MuV0uMe12+HNCSkaguDfuGB/Kq9xPEFTfDOvw==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr21618319edc.86.1654442746342; 
 Sun, 05 Jun 2022 08:25:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402125500b0042dddaa8af3sm7051499edw.37.2022.06.05.08.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:25:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] mm/slab: delete cache_alloc_debugcheck_before()
Date: Sun,  5 Jun 2022 17:25:38 +0200
Message-Id: <20220605152539.3196045-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It only does a might_sleep_if(GFP_RECLAIM) check, which is already
covered by the might_alloc() in slab_pre_alloc_hook(). And all callers
of cache_alloc_debugcheck_before() call that beforehand already.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org
---
 mm/slab.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index b04e40078bdf..75779ac5f5ba 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -2973,12 +2973,6 @@ static void *cache_alloc_refill(struct kmem_cache *cachep, gfp_t flags)
 	return ac->entry[--ac->avail];
 }
 
-static inline void cache_alloc_debugcheck_before(struct kmem_cache *cachep,
-						gfp_t flags)
-{
-	might_sleep_if(gfpflags_allow_blocking(flags));
-}
-
 #if DEBUG
 static void *cache_alloc_debugcheck_after(struct kmem_cache *cachep,
 				gfp_t flags, void *objp, unsigned long caller)
@@ -3219,7 +3213,6 @@ slab_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid, size_t orig_
 	if (unlikely(ptr))
 		goto out_hooks;
 
-	cache_alloc_debugcheck_before(cachep, flags);
 	local_irq_save(save_flags);
 
 	if (nodeid == NUMA_NO_NODE)
@@ -3304,7 +3297,6 @@ slab_alloc(struct kmem_cache *cachep, struct list_lru *lru, gfp_t flags,
 	if (unlikely(objp))
 		goto out;
 
-	cache_alloc_debugcheck_before(cachep, flags);
 	local_irq_save(save_flags);
 	objp = __do_cache_alloc(cachep, flags);
 	local_irq_restore(save_flags);
@@ -3541,8 +3533,6 @@ int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size,
 	if (!s)
 		return 0;
 
-	cache_alloc_debugcheck_before(s, flags);
-
 	local_irq_disable();
 	for (i = 0; i < size; i++) {
 		void *objp = kfence_alloc(s, s->object_size, flags) ?: __do_cache_alloc(s, flags);
-- 
2.36.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF63CD42A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE5B6E10E;
	Mon, 19 Jul 2021 11:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28B56E064
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:51:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i94so21677940wri.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eqHfD/jfgqlQOIaJznbgFhlPhDoxlRZd4mPgyyxe4Og=;
 b=g8E+sN75LQz6QE/kBvovHAKjsVxf8gXchFJYj2qxmDnQJoqufvt577k8ZZm7b75VRT
 J2X5PWkNkn6mZmTftQJE9lRZCf5V5hekqO5FuAMZwh6inpd3ih5BSWpKMWj7qUCGpvUm
 BYXgwfp8zLxfAHNPxBknX/9doeuGk4slRldT3ex2v5kR7dmGcn38o3iuEhm+0spvg4Ee
 tCd+drOV3rnyjDHlJ9FlN9jqUW4JBAc1nugcKA0l3yAz2Nz2wW5gCc7jkfSbDfoRvJtC
 3Vijf6viss6EsH4UlrWwSb19QI0pmirO6F16ZToZ2xkTQofRCKu5digJckVlofW7mFUa
 8xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqHfD/jfgqlQOIaJznbgFhlPhDoxlRZd4mPgyyxe4Og=;
 b=BCJPCc22mRfyV8y554eePqTi62RKUlsog5khKNyiSpYiESU4V1vUAHScBVPatKkvs6
 w0jXQ3sgSnfw1cswpOGxNRBm4vsm+gdPW6sC9vAcdFtXexWYNG9iWwcw0oZc/cTFKifN
 dM2fh1jDspfNKqPhiFCzkuW/lE0pQPJjBoS/JfQMHy19H5aVQmFqIzKA+PHEKEF0D+sd
 4BpMqeHcP7kjdaAFT700UDlFQdjGuYjDUVBsjVAY1pk55iKATf/sCFRKv9nYYMvN55oh
 SC1jIMnTNoTCi96zUmVZ/HCSg95umMGBWac1Yqg90rGMZZau4HjmHcBBbLguhTmYh2wt
 ShBw==
X-Gm-Message-State: AOAM530+sH7xwwf3kOIdCTavt/rtDNAI+AoBZNACmZaZ5cdXwv6hNik5
 EN1wWzJEXnzCCxPvW7OrAmRlii85HXM=
X-Google-Smtp-Source: ABdhPJwRFf297Oh84Kv+TX09LzukhL20JAC2HMx3FMcmf7cb0cUwx4HQSq6epxfMXCCc33eM2/X5nw==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr29184223wrw.166.1626695507557; 
 Mon, 19 Jul 2021 04:51:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bb37:8df9:3c3c:217f])
 by smtp.gmail.com with ESMTPSA id p5sm16034104wme.2.2021.07.19.04.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:51:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: add ttm_resource_fini
Date: Mon, 19 Jul 2021 13:51:42 +0200
Message-Id: <20210719115145.1260-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719115145.1260-1-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
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

Make sure we call the common cleanup function in all
implementations of the resource manager.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 2 ++
 drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
 drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
 drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
 drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 3 ++-
 include/drm/ttm/ttm_resource.h                  | 3 +++
 12 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 543000304a1c..77cfb64dd312 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -169,6 +169,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	return 0;
 
 err_free:
+	ttm_resource_fini(man, &node->base.base);
 	kfree(node);
 
 err_out:
@@ -200,6 +201,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
 		atomic64_sub(res->num_pages, &mgr->used);
 
+	ttm_resource_fini(man, res);
 	kfree(node);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
index d02c8637f909..ffddec08e931 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -95,6 +95,7 @@ static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
 	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
 
 	atomic64_sub(res->num_pages, &mgr->used);
+	ttm_resource_fini(man, res);
 	kfree(res);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 436ec246a7da..7e68a07c0fb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -471,6 +471,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	while (i--)
 		drm_mm_remove_node(&node->mm_nodes[i]);
 	spin_unlock(&mgr->lock);
+	ttm_resource_fini(man, &node->base);
 	kvfree(node);
 
 error_sub:
@@ -510,6 +511,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
+	ttm_resource_fini(man, res);
 	kvfree(node);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 0de6549fb875..5b610906bec8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -175,11 +175,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 }
 
 void
-nouveau_mem_del(struct ttm_resource *reg)
+nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 
 	nouveau_mem_fini(mem);
+	ttm_resource_fini(man, reg);
 	kfree(mem);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 2c01166a90f2..325551eba5cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -23,7 +23,8 @@ nouveau_mem(struct ttm_resource *reg)
 
 int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
-void nouveau_mem_del(struct ttm_resource *);
+void nouveau_mem_del(struct ttm_resource_manager *man,
+		     struct ttm_resource *);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index f4c2e46b6fe1..34421174ed59 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -36,9 +36,10 @@
 #include <core/tegra.h>
 
 static void
-nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
+nouveau_manager_del(struct ttm_resource_manager *man,
+		    struct ttm_resource *reg)
 {
-	nouveau_mem_del(reg);
+	nouveau_mem_del(man, reg);
 }
 
 static int
@@ -62,7 +63,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 
 	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
 	if (ret) {
-		nouveau_mem_del(*res);
+		nouveau_mem_del(man, *res);
 		return ret;
 	}
 
@@ -118,7 +119,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
 			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
 	if (ret) {
-		nouveau_mem_del(*res);
+		nouveau_mem_del(man, *res);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 03395386e8a7..9e8c245c320c 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -89,6 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
+		ttm_resource_fini(man, *res);
 		kfree(node);
 		return ret;
 	}
@@ -108,6 +109,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&rman->lock);
 
+	ttm_resource_fini(man, res);
 	kfree(node);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7ff6194154fe..8e890de9af7e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -45,6 +45,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
+void ttm_resource_fini(struct ttm_resource_manager *man,
+		       struct ttm_resource *res)
+{
+}
+EXPORT_SYMBOL(ttm_resource_fini);
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res_ptr)
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 63aca52f75e1..135394dcca95 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
 static void ttm_sys_man_free(struct ttm_resource_manager *man,
 			     struct ttm_resource *res)
 {
+	ttm_resource_fini(man, res);
 	kfree(res);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 28ceb749a733..ea89b2f74957 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -84,6 +84,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	gman->used_gmr_pages -= (*res)->num_pages;
 	spin_unlock(&gman->lock);
 	ida_free(&gman->gmr_ida, id);
+	ttm_resource_fini(man, *res);
 	kfree(*res);
 	return -ENOSPC;
 }
@@ -97,6 +98,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
 	spin_lock(&gman->lock);
 	gman->used_gmr_pages -= res->num_pages;
 	spin_unlock(&gman->lock);
+	ttm_resource_fini(man, res);
 	kfree(res);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 2a3d3468e4e0..4fcbd94ccc11 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -104,6 +104,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
+		ttm_resource_fini(man, &node->base);
 		kfree(node);
 	} else {
 		node->base.start = node->mm_nodes[0].start;
@@ -122,7 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
 	spin_lock(&rman->lock);
 	drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&rman->lock);
-
+	ttm_resource_fini(man, res);
 	kfree(node);
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index c73b35fb7d42..8e116c0a276d 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -264,6 +264,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res);
+void ttm_resource_fini(struct ttm_resource_manager *man,
+		       struct ttm_resource *res);
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FE45BE68
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367E6E372;
	Wed, 24 Nov 2021 12:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD336E237
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s13so4010908wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p85kFNURfxDrvaC/vMJo7/uoCTWCC4YsDRHYVO+ytzo=;
 b=b0b0ZlzF4/UedqLL/SQX9UC2WCVwDeS7XshNQVm0d8fDFWdvWZpbgE9Jq6Nc7g716x
 nA3/oQmMiJMVEPsBCYdB2eJmEA94ns0V+ySNGuv/WwY2BHKwEKYcuTRXreQqdDoUBeH+
 ABeMTq09MIR3eKwm3dOf6FCa4RTz8AKhA6AzMsD160luYUeKlS09NIygcWzky8sV997a
 8Jrd0C5uPc7YdAf1tcAMIer1gvy3fz+ofqm3gY5G3POR2bKdCZ5dBO6RAd19LV1capoQ
 1RVdNAVNrUgPCMLSkhNwM/wtCphEsn9MAfMFbgkhYs3twa2stKLAMG/8wVd3I7lsclwp
 Zc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p85kFNURfxDrvaC/vMJo7/uoCTWCC4YsDRHYVO+ytzo=;
 b=3aqkUTVN+v/y8wLvJEhQLpcvEfRbkqoZVIxDEcR4oO00+zYiGg2OceeuK3fXAtOtrc
 tO/UxCJ8T04RZ5zeY2CHp35a5+qZEGsi9twb2e9TdnTC9NWz/CUcwWQ1CanUxAAIgyed
 6CYm99adOgC5nBBgM/hq8Y53DHDFh++Q9j9FWq/KCEvJheZmOJjq+ulDEXgxdyh1P2yD
 txs7X9g6S8zaMuQgYb1ZCOUabtnuREW6jXWczakBZAMizrqzIm3+OtmY70kzP7i3H5zI
 H6bEevz6wWPnnbYRDFQQVPs4D6gHg4ofe0McJ2xFzXy9OUCuZh5rUNTQxehymaSjlY77
 avnw==
X-Gm-Message-State: AOAM533f1KXdBX44F1vzDbpE3PFLnftco0/SqTY2W2zwV/l87m+EV590
 n9/zzoMbvg6aks9VEAMTSF/cgx5hs+c=
X-Google-Smtp-Source: ABdhPJyo9622V2vwDgfmNAa/uQ5ON6qkjT7eLrEFwrLJhNIX1ueFV5T92Hx7tsmuOaHsZtyp08eyCw==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr18457133wri.203.1637757873963; 
 Wed, 24 Nov 2021 04:44:33 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] drm/ttm: add ttm_resource_fini
Date: Wed, 24 Nov 2021 13:44:19 +0100
Message-Id: <20211124124430.20859-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 1 +
 drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
 drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
 drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
 drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 3 ++-
 include/drm/ttm/ttm_resource.h                  | 3 +++
 13 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 675a72ef305d..ea5470c8c921 100644
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
index 7b2b0980ec41..55d68408951d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -476,6 +476,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	while (i--)
 		drm_mm_remove_node(&node->mm_nodes[i]);
 	spin_unlock(&mgr->lock);
+	ttm_resource_fini(man, &node->base);
 	kvfree(node);
 
 error_sub:
@@ -515,6 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
+	ttm_resource_fini(man, res);
 	kvfree(node);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index d59fbb019032..ca3ca1f7f850 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -123,6 +123,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
 	mutex_unlock(&bman->lock);
 
+	ttm_resource_fini(man, res);
 	kfree(bman_res);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 2ca3207c13fc..2e517cdc24c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -162,11 +162,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
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
index 2ca9d9a9e5d5..91ef33f8f22c 100644
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
index 67d68a4a8640..25fcf0d63c2d 100644
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
index 035d71332d18..89bcfe22a0ca 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -44,6 +44,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
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
index b2c4af331c9d..bfd686bb8d19 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -116,6 +116,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	gman->used_gmr_pages -= (*res)->num_pages;
 	spin_unlock(&gman->lock);
 	ida_free(&gman->gmr_ida, id);
+	ttm_resource_fini(man, *res);
 	kfree(*res);
 	return -ENOSPC;
 }
@@ -129,6 +130,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
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
index 5952051091cd..df1f06b7b504 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -261,6 +261,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
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


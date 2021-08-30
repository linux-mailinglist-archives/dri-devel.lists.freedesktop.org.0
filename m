Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123193FB2C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779F789CF9;
	Mon, 30 Aug 2021 08:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C095389C28
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n5so21239537wro.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4h7bjKf/aUo5GQAaq1ZE/sNTN9GH4rK/xfdUPXJYlao=;
 b=fzDlIgZctzGQFa1tcdcJRCAm1y3BDGgcMNhI7ukttyBPjz+MFn9YRWOSINJzxo8bG4
 V9svrx/+M1qD9Ek0Y2d1EtH8vKlWV9KxP8uZskmSAEMMwUeTXjXgZ4a2VDC0BszRqhHL
 ufknTdN1TufjeS1A2L4bxlvZz9fBTqJR58y363OJZBSBLbOuolPuxfdzfbvfE4f/Y/mH
 QADqWAPbLCvPoECW1u8ZLJoxVhOCBsQBrLMntacDSoGD6GE6vDxkQ41hdtfb2qONBGPr
 6FiTsdp6MYHhbtCRAsx38Bfe5WX56LT49sPxgkUDE3t3Gcn5x5/xxMbbvsACtvWMa+dh
 R0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4h7bjKf/aUo5GQAaq1ZE/sNTN9GH4rK/xfdUPXJYlao=;
 b=iWAU/rz1yMyNPRDQWHhSCxkyggyHixutysJkGtC0c0GV+dVeuiHr99T7dzJcwLDKHE
 TULdWYENoKVfBWN+GNYluO9l8AAlCGY7XTWWWysC4YMSP0wueWwbeAF0RL3ZI/Pm4geb
 oabIzcsx8OalR2+GC8xZvaNva33C6XI6BP7V2r86eZkMVbnHda7T7Z4lpYfCk+EoeA5i
 idYJWRX5Llk9SGfYO65zVd2wgmyK2BJrd8oPv2mSSiG2Wj5PD2RnAqQ5NNm0/Z+JoU3n
 g9gL1xbKYuUi30lIZA+c+Je9pdNWi0S0whP2dMB9W7nsNRpyQLPGKO93hRtrYqkdDxM5
 ilRQ==
X-Gm-Message-State: AOAM530HOusnGl0vywY38TxnV8U1SEPibfyx6wZtTasWPMxtrxfqP4FN
 0BzHknxnK983aAYWcyttQuY=
X-Google-Smtp-Source: ABdhPJyVtke3xgSIyhDjbU4s45Br1WjCGtT4T9c0fgDQ9KRLbs+cTWvXlSQAlUi5DNoSH9w6YyDRBQ==
X-Received: by 2002:a5d:5919:: with SMTP id v25mr24356600wrd.32.1630313829417; 
 Mon, 30 Aug 2021 01:57:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 01/12] drm/ttm: add ttm_resource_fini
Date: Mon, 30 Aug 2021 10:56:56 +0200
Message-Id: <20210830085707.209508-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
index 2fd77c36a1ff..0184210744a7 100644
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
index f4b08a8705b3..69962b5769c5 100644
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
index 2431717376e7..2e0db43ff99c 100644
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
index 140b6b9a8bbe..dd6929f0c4f6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -262,6 +262,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
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


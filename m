Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A93A29DD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022AB6ECFA;
	Thu, 10 Jun 2021 11:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785776ECF7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:06:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l2so1806782wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cOGQtkF1SduG5EfnifCL/CjLxpKgXE6lDA4WF65MvNA=;
 b=cPzZXPprtNAI7XQd+vi1LcMZ8BzXQt3qKAnQWccitvOGZvr0+S9GdxvTPFSCL+HHya
 ld0aRhkhKdNuXOWHFOTJidw/YHoW4L6XG9X7vabXpwT/x3VAFf7uhvwDTAg4dfGuqWGo
 SEzDV8+3H1IH+gJBHwz41Qt1F2csWDGjI7jzxBoLR0WjstQUaG1zB58S3IWF2GlWzMqz
 PqBTVuCoomKU1zwmjjX3pS+ylfT09X++UZJ6GpeAbhtdKXRWb/tv7iTAjRn9DvCDkknb
 W1kreEDSIGB4jlkPsTVop/cD3bDyV0Q6C+Zq4e9Wkwe7Z06C/+0+JbfCyqONyptdbsh2
 +ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOGQtkF1SduG5EfnifCL/CjLxpKgXE6lDA4WF65MvNA=;
 b=B/2LUzAZ37/KQMzNOYqbb1fsPv3gC0X/cPG+ZL5cQ5CK6WwMLad+FCmBI3yB5cK9vg
 TUFA9EVHdc2URD4BwFDcJy/CD9V1ZXueUnK9qsLmMO9Vd/joOgmVQlH/Vzg750w0m/hj
 AsA5XmB813jA/C9axm7EGEcWQYO8doisw2/p5LwlEY4lXX97h9FAraQdvRJ0ylpWBAtT
 7q1DjPJLif/ZXxA1PzWxTCaOouDea4ycvGPp55P7/InwQQoTlCxFgV1h7NN3U15gbv+x
 czpaTQIctROvWq4HZ3Ob9xRno7YjnIM1b+AlhEyWbyZKS7MfgAt6OrCgr8aNCF03PU86
 Lifg==
X-Gm-Message-State: AOAM531U0sZhHNOatzfUTcH2ui1Ft4v5WsQp8Brk7dyA3lvCW9DT3qVm
 L11i1xtImprzW8aOmetBAsg=
X-Google-Smtp-Source: ABdhPJygXcncvLSGV+O2pG+nHv51u6VGo/h3sexM4nweJ5BIW+/3aKC9NpsPK/x93RfRkrAnBRvI8Q==
X-Received: by 2002:adf:e943:: with SMTP id m3mr4713569wrn.384.1623323161144; 
 Thu, 10 Jun 2021 04:06:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:14a0:1c64:4cb2:9d16])
 by smtp.gmail.com with ESMTPSA id z12sm3234372wmc.5.2021.06.10.04.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:06:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: add ttm_resource_fini
Date: Thu, 10 Jun 2021 13:05:57 +0200
Message-Id: <20210610110559.1758-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610110559.1758-1-christian.koenig@amd.com>
References: <20210610110559.1758-1-christian.koenig@amd.com>
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

For now that function is just a stub.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 1 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 1 +
 drivers/gpu/drm/ttm/ttm_range_manager.c      | 1 +
 drivers/gpu/drm/ttm/ttm_resource.c           | 5 +++++
 drivers/gpu/drm/ttm/ttm_sys_manager.c        | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c          | 1 +
 include/drm/ttm/ttm_resource.h               | 2 ++
 8 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8e3f5da44e4f..95d1cd338cf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -187,6 +187,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	spin_unlock(&mgr->lock);
 	atomic64_add(res->num_pages, &mgr->available);
 
+	ttm_resource_fini(&node->base);
 	kfree(node);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9a6df02477ce..9f0eb93123ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -510,6 +510,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
+	ttm_resource_fini(&node->base);
 	kvfree(node);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index f4c2e46b6fe1..1969759ee2ee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -38,6 +38,7 @@
 static void
 nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 {
+	ttm_resource_fini(reg);
 	nouveau_mem_del(reg);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 03395386e8a7..3636601fd4b0 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -108,6 +108,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&rman->lock);
 
+	ttm_resource_fini(&node->base);
 	kfree(node);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7ff6194154fe..5df1c63373cf 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -45,6 +45,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
+void ttm_resource_fini(struct ttm_resource *res)
+{
+}
+EXPORT_SYMBOL(ttm_resource_fini);
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res_ptr)
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 63aca52f75e1..4427bf6b076b 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
 static void ttm_sys_man_free(struct ttm_resource_manager *man,
 			     struct ttm_resource *res)
 {
+	ttm_resource_fini(res);
 	kfree(res);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 2a3d3468e4e0..414d3713f250 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -123,6 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
 	drm_mm_remove_node(&node->mm_nodes[0]);
 	spin_unlock(&rman->lock);
 
+	ttm_resource_fini(&node->base);
 	kfree(node);
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 6d0b7a6d2169..7fc42db688b8 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -263,6 +263,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res);
+void ttm_resource_fini(struct ttm_resource *res);
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
-- 
2.25.1


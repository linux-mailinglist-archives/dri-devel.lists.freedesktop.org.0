Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5F7A8760
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09010E503;
	Wed, 20 Sep 2023 14:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BD010E504
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KaCJuBYOuhmNczdn5ohpcMUNqCBxl8Lek3WwgGd+nlY=;
 b=fq5Rop6tiQsnFydqVlhLFjQzh1jN40GWOvEdF9gDR2hCTekTJFteCU9UlRa9WKHgJ5gXKE
 oIJezeiaoYWSigYDcd1Z2E7f2KggcXn0h6gHS/yvYMBqIvS0tHlSUOSnoWAr1SavUHGCv+
 9xcZNdYBCuS/T5ifJCLRyCZz2K8cP8E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-OPYxhAaZO0y1lEBvOH3Q0w-1; Wed, 20 Sep 2023 10:44:02 -0400
X-MC-Unique: OPYxhAaZO0y1lEBvOH3Q0w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a9e12a3093so3815266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221041; x=1695825841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KaCJuBYOuhmNczdn5ohpcMUNqCBxl8Lek3WwgGd+nlY=;
 b=JPrE/ceukA0s+U6d9KRgNx0ZJJAYWSLIJ3jFZj/5/eZkEqwvqGr5CdFB1W7v95Ra+t
 zFMBYL98Wk6uSawkdJrhDFl/VR0CZUCidPt7Rg7uFRfs4NYw2FbiQHKLCSszvmXnBmOc
 IZ9XVxrfE0UUzY6+DB1qMU0g10PL10QkOpDNKVRWUWylQUmjPDwAPX2wZ0pCxgf01BsF
 BphWw6fUYT4/QKgAwhvIq+Im/wWF+MD6aZIDAgTKK+D+9K6bhi34ZfM1lC+MBz00hcna
 nxm4jyFmRP9qu9DN+Y4tdhQCzWx91zrsEgsQgMNC3YNvzh0hyNbbRqTrKMq6CqlCSM2W
 aszw==
X-Gm-Message-State: AOJu0YyOExE9IpHGgHiwNvqdz8ZQs1RSWGWA2YyzJFQGmekYx974zW2o
 pZ5HtxFi1l59oP2Bm5DpN/57i1LpS9pyMfA7XNfmQ9cNlXXZYv5rMTN+6YZrXSqH8V4Nom8f9NV
 kQ1y4iBNSju/qlmhE6uet4xd3qO+7
X-Received: by 2002:a17:907:25cd:b0:9ad:e62c:4517 with SMTP id
 ae13-20020a17090725cd00b009ade62c4517mr7537196ejc.34.1695221040802; 
 Wed, 20 Sep 2023 07:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmf5FeK0YoGHfqD4yfTTE5caBB64H3Du71mIB9hWrqahJtSt9J3n5HSIqHsntvVJlLqnyQ/Q==
X-Received: by 2002:a17:907:25cd:b0:9ad:e62c:4517 with SMTP id
 ae13-20020a17090725cd00b009ade62c4517mr7537168ejc.34.1695221040457; 
 Wed, 20 Sep 2023 07:44:00 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709060b5800b0098951bb4dc3sm9380179ejg.184.2023.09.20.07.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:44:00 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next v4 3/8] drm/nouveau: uvmm: rename 'umgr' to
 'base'
Date: Wed, 20 Sep 2023 16:42:36 +0200
Message-ID: <20230920144343.64830-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename struct drm_gpuvm within struct nouveau_uvmm from 'umgr' to base.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c    |  4 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c    | 32 +++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h    |  6 ++---
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 053f703f2f68..e83db051e851 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -231,7 +231,7 @@ nouveau_debugfs_gpuva(struct seq_file *m, void *data)
 			continue;
 
 		nouveau_uvmm_lock(uvmm);
-		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		drm_debugfs_gpuva_info(m, &uvmm->base);
 		seq_puts(m, "\n");
 		nouveau_debugfs_gpuva_regions(m, uvmm);
 		nouveau_uvmm_unlock(uvmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index c001952cd678..b4239af29e5a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -106,8 +106,8 @@ nouveau_exec_job_submit(struct nouveau_job *job)
 	drm_exec_until_all_locked(exec) {
 		struct drm_gpuva *va;
 
-		drm_gpuvm_for_each_va(va, &uvmm->umgr) {
-			if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
+		drm_gpuvm_for_each_va(va, &uvmm->base) {
+			if (unlikely(va == &uvmm->base.kernel_alloc_node))
 				continue;
 
 			ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index c750072cb268..6c86b64273c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -329,7 +329,7 @@ nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
 	struct nouveau_uvma_region *reg;
 	int ret;
 
-	if (!drm_gpuva_interval_empty(&uvmm->umgr, addr, range))
+	if (!drm_gpuva_interval_empty(&uvmm->base, addr, range))
 		return -ENOSPC;
 
 	ret = nouveau_uvma_region_alloc(&reg);
@@ -384,7 +384,7 @@ nouveau_uvma_region_empty(struct nouveau_uvma_region *reg)
 {
 	struct nouveau_uvmm *uvmm = reg->uvmm;
 
-	return drm_gpuva_interval_empty(&uvmm->umgr,
+	return drm_gpuva_interval_empty(&uvmm->base,
 					reg->va.addr,
 					reg->va.range);
 }
@@ -589,7 +589,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 	uvma->region = args->region;
 	uvma->kind = args->kind;
 
-	drm_gpuva_map(&uvmm->umgr, &uvma->va, op);
+	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
 	/* Keep a reference until this uvma is destroyed. */
 	nouveau_uvma_gem_get(uvma);
@@ -1194,7 +1194,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 				goto unwind_continue;
 			}
 
-			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->base,
 								op->va.addr,
 								op->va.range);
 			if (IS_ERR(op->ops)) {
@@ -1205,7 +1205,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
 							    op->ops);
 			if (ret) {
-				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				drm_gpuva_ops_free(&uvmm->base, op->ops);
 				op->ops = NULL;
 				op->reg = NULL;
 				goto unwind_continue;
@@ -1240,7 +1240,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 				}
 			}
 
-			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
 							      op->va.addr,
 							      op->va.range,
 							      op->gem.obj,
@@ -1256,7 +1256,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 							  op->va.range,
 							  op->flags & 0xff);
 			if (ret) {
-				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				drm_gpuva_ops_free(&uvmm->base, op->ops);
 				op->ops = NULL;
 				goto unwind_continue;
 			}
@@ -1264,7 +1264,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			break;
 		}
 		case OP_UNMAP:
-			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->umgr,
+			op->ops = drm_gpuvm_sm_unmap_ops_create(&uvmm->base,
 								op->va.addr,
 								op->va.range);
 			if (IS_ERR(op->ops)) {
@@ -1275,7 +1275,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			ret = nouveau_uvmm_sm_unmap_prepare(uvmm, &op->new,
 							    op->ops);
 			if (ret) {
-				drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+				drm_gpuva_ops_free(&uvmm->base, op->ops);
 				op->ops = NULL;
 				goto unwind_continue;
 			}
@@ -1404,7 +1404,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 			break;
 		}
 
-		drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+		drm_gpuva_ops_free(&uvmm->base, op->ops);
 		op->ops = NULL;
 		op->reg = NULL;
 	}
@@ -1509,7 +1509,7 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 		}
 
 		if (!IS_ERR_OR_NULL(op->ops))
-			drm_gpuva_ops_free(&uvmm->umgr, op->ops);
+			drm_gpuva_ops_free(&uvmm->base, op->ops);
 
 		if (obj)
 			drm_gem_object_put(obj);
@@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->umgr, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->name,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
@@ -1855,7 +1855,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	return 0;
 
 out_free_gpuva_mgr:
-	drm_gpuvm_destroy(&uvmm->umgr);
+	drm_gpuvm_destroy(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1877,11 +1877,11 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
 
 	nouveau_uvmm_lock(uvmm);
-	drm_gpuvm_for_each_va_safe(va, next, &uvmm->umgr) {
+	drm_gpuvm_for_each_va_safe(va, next, &uvmm->base) {
 		struct nouveau_uvma *uvma = uvma_from_va(va);
 		struct drm_gem_object *obj = va->gem.obj;
 
-		if (unlikely(va == &uvmm->umgr.kernel_alloc_node))
+		if (unlikely(va == &uvmm->base.kernel_alloc_node))
 			continue;
 
 		drm_gpuva_remove(va);
@@ -1910,7 +1910,7 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
-	drm_gpuvm_destroy(&uvmm->umgr);
+	drm_gpuvm_destroy(&uvmm->base);
 	mutex_unlock(&cli->mutex);
 
 	dma_resv_fini(&uvmm->resv);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index e96c9919d1bd..a308c59760a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -8,8 +8,8 @@
 #include "nouveau_drv.h"
 
 struct nouveau_uvmm {
+	struct drm_gpuvm base;
 	struct nouveau_vmm vmm;
-	struct drm_gpuvm umgr;
 	struct maple_tree region_mt;
 	struct mutex mutex;
 	struct dma_resv resv;
@@ -41,10 +41,10 @@ struct nouveau_uvma {
 	u8 kind;
 };
 
-#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
+#define uvmm_from_gpuvm(x) container_of((x), struct nouveau_uvmm, base)
 #define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
 
-#define to_uvmm(x) uvmm_from_mgr((x)->va.vm)
+#define to_uvmm(x) uvmm_from_gpuvm((x)->va.vm)
 
 struct nouveau_uvmm_bind_job {
 	struct nouveau_job base;
-- 
2.41.0


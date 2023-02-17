Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8FD69AD0C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE0D10F00F;
	Fri, 17 Feb 2023 13:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9C610EFFD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIWonkC5C/glRECsErna8rexTQ7GLEMuQBk+usFaDoA=;
 b=V9u3z9pD0ohAFYDVORfZt7/QCEijr/AEf5yuTzysqmGPydjGuvyPTrp0fOJ05xT7Z9OxDj
 XnBWVUXu349rHOaESaJKyJ0NEkRbArMwNycn8lyEF60xN754wRWSrc0XcBLpHReGA1Z5eE
 m0ADzlOkRfkEousxx9A+7doR/9VhCgs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-VQfoI98ZPXyJf4mH0lIuIg-1; Fri, 17 Feb 2023 08:49:00 -0500
X-MC-Unique: VQfoI98ZPXyJf4mH0lIuIg-1
Received: by mail-ed1-f71.google.com with SMTP id
 v3-20020a056402174300b004aab6614de9so1105260edx.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIWonkC5C/glRECsErna8rexTQ7GLEMuQBk+usFaDoA=;
 b=1f00PFe1wmayMx2qeTx4DtVd8sGsZaZURWhVOqJbo4gBixZ1qh89Tc0qjsfqAxXObm
 jLqegQH0kKd1W7xD8ml5sLda7rqAdOJVwzTKT2xQapaXSJDcBBV/SM1ZqVZOhN+/7ZRv
 jPAz6hnW3ruaAH1Byj7GHqJhb6LjkuJVTZD2uugHNYpyMUqhJ6vLbBzdgQYt/3krv7oL
 hZUrwsOvcyXnDn+5HWPEztyGIcLuROo0XD94FsqDYZic6shrGLM43bNOBYux4rjgSJmU
 BGdRpdaBqUacTmbqGBrlv6ea2qYDYDis0oWTcMAyO3PbJ1z9k5/V3CMIfCwC/ph8b9Pw
 C2Cw==
X-Gm-Message-State: AO0yUKXBPu5H8c+Y8oFMNF2xUacieG+1n/POfqHhls/XTsII089NHQlI
 dHQi4OTYwWeok/hi8IBgSu36k3wl8B4Sk78Ky4nldgYnKhHQDvTUZxDxj+usMmmqdDt6ehj8/+v
 O4FEjVbURzAR9YY8ik3t2QjiPDt9b
X-Received: by 2002:a05:6402:614:b0:4ad:7439:db03 with SMTP id
 n20-20020a056402061400b004ad7439db03mr3594315edv.12.1676641739038; 
 Fri, 17 Feb 2023 05:48:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+SRUNF0RcZPReWAaplGNeyliS+73v8sATcOmGYtCQrEx1ENWuAncTyZ8oYhebOzec3XwW8/Q==
X-Received: by 2002:a05:6402:614:b0:4ad:7439:db03 with SMTP id
 n20-20020a056402061400b004ad7439db03mr3594292edv.12.1676641738668; 
 Fri, 17 Feb 2023 05:48:58 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a50aa81000000b004acbe5409b4sm2324194edc.48.2023.02.17.05.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:58 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 14/16] drm/nouveau: implement uvmm for user mode
 bindings
Date: Fri, 17 Feb 2023 14:48:18 +0100
Message-Id: <20230217134820.14672-9-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

uvmm provides the driver abstraction around the DRM GPU VA manager
connecting it to the nouveau infrastructure.

It handles the split and merge operations provided by the DRM GPU VA
manager for map operations colliding with existent mappings and takes
care of the driver specific locking around the DRM GPU VA manager.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/Kbuild          |    1 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c |    7 +
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  147 +--
 drivers/gpu/drm/nouveau/nouveau_bo.h    |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |    2 +
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   48 +
 drivers/gpu/drm/nouveau/nouveau_gem.c   |   25 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h   |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 1090 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |  110 +++
 11 files changed, 1378 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 5e5617006da5..ee281bb76463 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -47,6 +47,7 @@ nouveau-y += nouveau_prime.o
 nouveau-y += nouveau_sgdma.o
 nouveau-y += nouveau_ttm.o
 nouveau-y += nouveau_vmm.o
+nouveau-y += nouveau_uvmm.o
 
 # DRM - modesetting
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 82dab51d8aeb..36cc80eb0e20 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -261,6 +261,13 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (!drm->channel)
 		return nouveau_abi16_put(abi16, -ENODEV);
 
+	/* If uvmm wasn't initialized until now disable it completely to prevent
+	 * userspace from mixing up UAPIs.
+	 *
+	 * The client lock is already acquired by nouveau_abi16_get().
+	 */
+	__nouveau_cli_uvmm_disable(cli);
+
 	device = &abi16->device;
 	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index bf6984c8754c..f3d73d6edd46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -199,7 +199,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int *align, u64 *size)
 
 struct nouveau_bo *
 nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
-		 u32 tile_mode, u32 tile_flags)
+		 u32 tile_mode, u32 tile_flags, bool internal)
 {
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
@@ -235,68 +235,103 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			nvbo->force_coherent = true;
 	}
 
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
-		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
-		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
-			kfree(nvbo);
-			return ERR_PTR(-EINVAL);
+	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
+	if (!nouveau_cli_uvmm(cli) || internal) {
+		/* for BO noVM allocs, don't assign kinds */
+		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+
+			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
+			nvbo->comp = (tile_flags & 0x00030000) >> 16;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+		} else {
+			nvbo->zeta = (tile_flags & 0x00000007);
 		}
+		nvbo->mode = tile_mode;
+
+		/* Determine the desirable target GPU page size for the buffer. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Because we cannot currently allow VMM maps to fail
+			 * during buffer migration, we need to determine page
+			 * size for the buffer up-front, and pre-allocate its
+			 * page tables.
+			 *
+			 * Skip page sizes that can't support needed domains.
+			 */
+			if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
+			    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
 
-		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
-	} else
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
-		nvbo->comp = (tile_flags & 0x00030000) >> 16;
-		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+			/* Select this page size if it's the first that supports
+			 * the potential memory domains, or when it's compatible
+			 * with the requested compression settings.
+			 */
+			if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
+				pi = i;
+
+			/* Stop once the buffer is larger than the current page size. */
+			if (*size >= 1ULL << vmm->page[i].shift)
+				break;
+		}
+
+		if (WARN_ON(pi < 0)) {
 			kfree(nvbo);
 			return ERR_PTR(-EINVAL);
 		}
-	} else {
-		nvbo->zeta = (tile_flags & 0x00000007);
-	}
-	nvbo->mode = tile_mode;
-	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
-
-	/* Determine the desirable target GPU page size for the buffer. */
-	for (i = 0; i < vmm->page_nr; i++) {
-		/* Because we cannot currently allow VMM maps to fail
-		 * during buffer migration, we need to determine page
-		 * size for the buffer up-front, and pre-allocate its
-		 * page tables.
-		 *
-		 * Skip page sizes that can't support needed domains.
-		 */
-		if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
-		    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
-			continue;
-		if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
-		    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
-			continue;
 
-		/* Select this page size if it's the first that supports
-		 * the potential memory domains, or when it's compatible
-		 * with the requested compression settings.
-		 */
-		if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
-			pi = i;
-
-		/* Stop once the buffer is larger than the current page size. */
-		if (*size >= 1ULL << vmm->page[i].shift)
-			break;
-	}
+		/* Disable compression if suitable settings couldn't be found. */
+		if (nvbo->comp && !vmm->page[pi].comp) {
+			if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
+				nvbo->kind = mmu->kind[nvbo->kind];
+			nvbo->comp = 0;
+		}
+		nvbo->page = vmm->page[pi].shift;
+	} else {
+		/* reject other tile flags when in VM mode. */
+		if (tile_mode)
+			return ERR_PTR(-EINVAL);
+		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
+			return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(pi < 0)) {
-		kfree(nvbo);
-		return ERR_PTR(-EINVAL);
-	}
+		/* Determine the desirable target GPU page size for the buffer. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Because we cannot currently allow VMM maps to fail
+			 * during buffer migration, we need to determine page
+			 * size for the buffer up-front, and pre-allocate its
+			 * page tables.
+			 *
+			 * Skip page sizes that can't support needed domains.
+			 */
+			if ((domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
 
-	/* Disable compression if suitable settings couldn't be found. */
-	if (nvbo->comp && !vmm->page[pi].comp) {
-		if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
-			nvbo->kind = mmu->kind[nvbo->kind];
-		nvbo->comp = 0;
+			if (pi < 0)
+				pi = i;
+			/* Stop once the buffer is larger than the current page size. */
+			if (*size >= 1ULL << vmm->page[i].shift)
+				break;
+		}
+		if (WARN_ON(pi < 0)) {
+			kfree(nvbo);
+			return ERR_PTR(-EINVAL);
+		}
+		nvbo->page = vmm->page[pi].shift;
 	}
-	nvbo->page = vmm->page[pi].shift;
 
 	nouveau_bo_fixup_align(nvbo, align, size);
 
@@ -334,7 +369,7 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	int ret;
 
 	nvbo = nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
-				tile_flags);
+				tile_flags, true);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
@@ -938,6 +973,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			nouveau_vma_map(vma, mem);
 		}
+		nouveau_uvmm_bo_map_all(nvbo, mem);
 	} else {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			ret = dma_resv_wait_timeout(bo->base.resv,
@@ -946,6 +982,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 			WARN_ON(ret <= 0);
 			nouveau_vma_unmap(vma);
 		}
+		nouveau_uvmm_bo_unmap_all(nvbo);
 	}
 
 	if (new_reg)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 774dd93ca76b..cb85207d9e8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -73,7 +73,7 @@ extern struct ttm_device_funcs nouveau_bo_driver;
 
 void nouveau_bo_move_init(struct nouveau_drm *);
 struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, int *align,
-				    u32 domain, u32 tile_mode, u32 tile_flags);
+				    u32 domain, u32 tile_mode, u32 tile_flags, bool internal);
 int  nouveau_bo_init(struct nouveau_bo *, u64 size, int align, u32 domain,
 		     struct sg_table *sg, struct dma_resv *robj);
 int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 domain,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index cc7c5b4a05fd..cde843156700 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,6 +68,7 @@
 #include "nouveau_platform.h"
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
+#include "nouveau_uvmm.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -190,6 +191,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
+	nouveau_uvmm_fini(&cli->uvmm);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 20a7f31b9082..d634f1054d65 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -64,6 +64,7 @@ struct platform_device;
 #include "nouveau_fence.h"
 #include "nouveau_bios.h"
 #include "nouveau_vmm.h"
+#include "nouveau_uvmm.h"
 
 struct nouveau_drm_tile {
 	struct nouveau_fence *fence;
@@ -91,6 +92,8 @@ struct nouveau_cli {
 	struct nvif_mmu mmu;
 	struct nouveau_vmm vmm;
 	struct nouveau_vmm svm;
+	struct nouveau_uvmm uvmm;
+
 	const struct nvif_mclass *mem;
 
 	struct list_head head;
@@ -112,15 +115,60 @@ struct nouveau_cli_work {
 	struct dma_fence_cb cb;
 };
 
+static inline struct nouveau_uvmm *
+nouveau_cli_uvmm(struct nouveau_cli *cli)
+{
+	if (!cli || !cli->uvmm.vmm.cli)
+		return NULL;
+
+	return &cli->uvmm;
+}
+
+static inline struct nouveau_uvmm *
+nouveau_cli_uvmm_locked(struct nouveau_cli *cli)
+{
+	struct nouveau_uvmm *uvmm;
+
+	mutex_lock(&cli->mutex);
+	uvmm = nouveau_cli_uvmm(cli);
+	mutex_unlock(&cli->mutex);
+
+	return uvmm;
+}
+
 static inline struct nouveau_vmm *
 nouveau_cli_vmm(struct nouveau_cli *cli)
 {
+	struct nouveau_uvmm *uvmm;
+
+	uvmm = nouveau_cli_uvmm(cli);
+	if (uvmm)
+		return &uvmm->vmm;
+
 	if (cli->svm.cli)
 		return &cli->svm;
 
 	return &cli->vmm;
 }
 
+static inline void
+__nouveau_cli_uvmm_disable(struct nouveau_cli *cli)
+{
+	struct nouveau_uvmm *uvmm;
+
+	uvmm = nouveau_cli_uvmm(cli);
+	if (!uvmm)
+		cli->uvmm.disabled = true;
+}
+
+static inline void
+nouveau_cli_uvmm_disable(struct nouveau_cli *cli)
+{
+	mutex_lock(&cli->mutex);
+	__nouveau_cli_uvmm_disable(cli);
+	mutex_unlock(&cli->mutex);
+}
+
 void nouveau_cli_work_queue(struct nouveau_cli *, struct dma_fence *,
 			    struct nouveau_cli_work *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4369c8dc8b5b..10c60b0a8dc8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -120,7 +120,11 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 		goto out;
 	}
 
-	ret = nouveau_vma_new(nvbo, vmm, &vma);
+	/* only create a VMA on binding */
+	if (!nouveau_cli_uvmm(cli))
+		ret = nouveau_vma_new(nvbo, vmm, &vma);
+	else
+		ret = 0;
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 out:
@@ -187,6 +191,9 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return;
 
+	if (nouveau_cli_uvmm(cli))
+		return;
+
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
 	if (ret)
 		return;
@@ -231,7 +238,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		domain |= NOUVEAU_GEM_DOMAIN_CPU;
 
 	nvbo = nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
-				tile_flags);
+				tile_flags, false);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
@@ -279,13 +286,15 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 	else
 		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
 	rep->offset = nvbo->offset;
-	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50) {
+	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50 &&
+	    !nouveau_cli_uvmm(cli)) {
 		vma = nouveau_vma_find(nvbo, vmm);
 		if (!vma)
 			return -EINVAL;
 
 		rep->offset = vma->addr;
-	}
+	} else
+		rep->offset = 0;
 
 	rep->size = nvbo->bo.base.size;
 	rep->map_handle = drm_vma_node_offset_addr(&nvbo->bo.base.vma_node);
@@ -310,6 +319,11 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	struct nouveau_bo *nvbo = NULL;
 	int ret = 0;
 
+	/* If uvmm wasn't initialized until now disable it completely to prevent
+	 * userspace from mixing up UAPIs.
+	 */
+	nouveau_cli_uvmm_disable(cli);
+
 	ret = nouveau_gem_new(cli, req->info.size, req->align,
 			      req->info.domain, req->info.tile_mode,
 			      req->info.tile_flags, &nvbo);
@@ -715,6 +729,9 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	if (unlikely(!abi16))
 		return -ENOMEM;
 
+	if (unlikely(nouveau_cli_uvmm(cli)))
+		return -ENOSYS;
+
 	list_for_each_entry(temp, &abi16->channels, head) {
 		if (temp->chan->chid == req->channel) {
 			chan = temp->chan;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 76c86d8bb01e..5365a3d3a17f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -35,4 +35,9 @@ int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
 int nouveau_mem_map(struct nouveau_mem *, struct nvif_vmm *, struct nvif_vma *);
+int
+nouveau_mem_map_fixed(struct nouveau_mem *mem,
+		      struct nvif_vmm *vmm,
+		      u8 kind, u64 addr,
+		      u64 offset, u64 range);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index f42c2b1b0363..6a883b9a799a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -50,7 +50,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	dma_resv_lock(robj, NULL);
 	nvbo = nouveau_bo_alloc(&drm->client, &size, &align,
-				NOUVEAU_GEM_DOMAIN_GART, 0, 0);
+				NOUVEAU_GEM_DOMAIN_GART, 0, 0, true);
 	if (IS_ERR(nvbo)) {
 		obj = ERR_CAST(nvbo);
 		goto unlock;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
new file mode 100644
index 000000000000..2f7747a5a917
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -0,0 +1,1090 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *     Danilo Krummrich <dakr@redhat.com>
+ *
+ */
+
+/*
+ * Locking:
+ *
+ * The uvmm mutex protects any operations on the GPU VA space provided by the
+ * DRM GPU VA manager.
+ *
+ * The DRM GEM GPUVA lock protects a GEM's GPUVA list. It also protects single
+ * map/unmap operations against a BO move, which itself walks the GEM's GPUVA
+ * list in order to map/unmap it's entries.
+ *
+ * We'd also need to protect the DRM_GPUVA_EVICTED flag for each individual
+ * GPUVA, however this isn't necessary since any read or write to this flag
+ * happens when we already took the DRM GEM GPUVA lock of the backing GEM of
+ * the particular GPUVA.
+ */
+
+#include "nouveau_drv.h"
+#include "nouveau_gem.h"
+#include "nouveau_mem.h"
+#include "nouveau_uvmm.h"
+
+#include <nvif/vmm.h>
+#include <nvif/mem.h>
+
+#include <nvif/class.h>
+#include <nvif/if000c.h>
+#include <nvif/if900d.h>
+
+#define NOUVEAU_VA_SPACE_BITS		47 /* FIXME */
+#define NOUVEAU_VA_SPACE_START		0x0
+#define NOUVEAU_VA_SPACE_END		(1ULL << NOUVEAU_VA_SPACE_BITS)
+
+struct uvmm_map_args {
+	u64 addr;
+	u64 range;
+	u8 kind;
+};
+
+int
+nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 unmanaged_end = uvmm->unmanaged_addr +
+			    uvmm->unmanaged_size;
+
+	if (addr & ~PAGE_MASK)
+		return -EINVAL;
+
+	if (range & ~PAGE_MASK)
+		return -EINVAL;
+
+	if (end <= addr)
+		return -EINVAL;
+
+	if (addr < NOUVEAU_VA_SPACE_START ||
+	    end > NOUVEAU_VA_SPACE_END)
+		return -EINVAL;
+
+	if (addr < unmanaged_end &&
+	    end > uvmm->unmanaged_addr)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+nouveau_uvmm_vmm_sparse_ref(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_sparse(vmm, addr, range, true);
+}
+
+static int
+nouveau_uvmm_vmm_sparse_unref(struct nouveau_uvmm *uvmm,
+			      u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_sparse(vmm, addr, range, false);
+}
+
+static int
+nouveau_uvmm_vmm_get(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_get(vmm, addr, range, PAGE_SHIFT);
+}
+
+static int
+nouveau_uvmm_vmm_put(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_put(vmm, addr, range, PAGE_SHIFT);
+}
+
+static int
+nouveau_uvmm_vmm_unmap(struct nouveau_uvmm *uvmm,
+		       u64 addr, u64 range, bool sparse)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+
+	return nvif_vmm_raw_unmap(vmm, addr, range, PAGE_SHIFT, sparse);
+}
+
+static int
+nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
+		     u64 addr, u64 range,
+		     u64 bo_offset, u8 kind,
+		     struct nouveau_mem *mem)
+{
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	union {
+		struct gf100_vmm_map_v0 gf100;
+	} args;
+	u32 argc = 0;
+
+	switch (vmm->object.oclass) {
+	case NVIF_CLASS_VMM_GF100:
+	case NVIF_CLASS_VMM_GM200:
+	case NVIF_CLASS_VMM_GP100:
+		args.gf100.version = 0;
+		if (mem->mem.type & NVIF_MEM_VRAM)
+			args.gf100.vol = 0;
+		else
+			args.gf100.vol = 1;
+		args.gf100.ro = 0;
+		args.gf100.priv = 0;
+		args.gf100.kind = kind;
+		argc = sizeof(args.gf100);
+		break;
+	default:
+		WARN_ON(1);
+		return -ENOSYS;
+	}
+
+	return nvif_vmm_raw_map(vmm, addr, range, PAGE_SHIFT,
+				&args, argc,
+				&mem->mem, bo_offset);
+}
+
+static int
+nouveau_uvma_region_sparse_unref(struct nouveau_uvma_region *reg)
+{
+	u64 addr = reg->region.va.addr << PAGE_SHIFT;
+	u64 range = reg->region.va.range << PAGE_SHIFT;
+
+	if (!reg->region.sparse)
+		return 0;
+
+	return nouveau_uvmm_vmm_sparse_unref(reg->uvmm, addr, range);
+}
+
+static int
+nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
+{
+	u64 addr = uvma->va.va.addr << PAGE_SHIFT;
+	u64 range = uvma->va.va.range << PAGE_SHIFT;
+
+	return nouveau_uvmm_vmm_put(uvma->uvmm, addr, range);
+}
+
+static int
+nouveau_uvma_map(struct nouveau_uvma *uvma,
+		 struct nouveau_mem *mem)
+{
+	u64 addr = uvma->va.va.addr << PAGE_SHIFT;
+	u64 offset = uvma->va.gem.offset << PAGE_SHIFT;
+	u64 range = uvma->va.va.range << PAGE_SHIFT;
+
+	return nouveau_uvmm_vmm_map(uvma->uvmm, addr, range,
+				    offset, uvma->kind, mem);
+}
+
+static int
+nouveau_uvma_unmap(struct nouveau_uvma *uvma)
+{
+	u64 addr = uvma->va.va.addr << PAGE_SHIFT;
+	u64 range = uvma->va.va.range << PAGE_SHIFT;
+	bool sparse = uvma->va.region->sparse;
+
+	if (drm_gpuva_evicted(&uvma->va))
+		return 0;
+
+	return nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+}
+
+static int
+nouveau_uvma_alloc(struct nouveau_uvma **puvma)
+{
+	*puvma = kzalloc(sizeof(**puvma), GFP_KERNEL);
+	if (!*puvma)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void
+nouveau_uvma_free(struct nouveau_uvma *uvma)
+{
+	kfree(uvma);
+}
+
+static int
+__nouveau_uvma_insert(struct nouveau_uvmm *uvmm,
+		      struct nouveau_uvma *uvma)
+{
+	return drm_gpuva_insert(&uvmm->umgr, &uvma->va);
+}
+
+static int
+nouveau_uvma_insert(struct nouveau_uvmm *uvmm,
+		    struct nouveau_uvma *uvma,
+		    struct drm_gem_object *obj,
+		    u64 bo_offset, u64 addr,
+		    u64 range, u8 kind)
+{
+	int ret;
+
+	addr >>= PAGE_SHIFT;
+	bo_offset >>= PAGE_SHIFT;
+	range >>= PAGE_SHIFT;
+
+	uvma->uvmm = uvmm;
+	uvma->kind = kind;
+	uvma->va.va.addr = addr;
+	uvma->va.va.range = range;
+	uvma->va.gem.offset = bo_offset;
+	uvma->va.gem.obj = obj;
+
+	ret = __nouveau_uvma_insert(uvmm, uvma);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+nouveau_uvma_remove(struct nouveau_uvma *uvma)
+{
+	drm_gpuva_remove(&uvma->va);
+}
+
+static void
+nouveau_uvma_gem_get(struct nouveau_uvma *uvma)
+{
+	drm_gem_object_get(uvma->va.gem.obj);
+}
+
+static void
+nouveau_uvma_gem_put(struct nouveau_uvma *uvma)
+{
+	drm_gem_object_put(uvma->va.gem.obj);
+}
+
+static int
+nouveau_uvma_region_alloc(struct nouveau_uvma_region **preg)
+{
+	*preg = kzalloc(sizeof(**preg), GFP_KERNEL);
+	if (!*preg)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void
+nouveau_uvma_region_free(struct nouveau_uvma_region *reg)
+{
+	kfree(reg);
+}
+
+static int
+__nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
+			     struct nouveau_uvma_region *reg)
+{
+	return drm_gpuva_region_insert(&uvmm->umgr, &reg->region);
+}
+
+static int
+nouveau_uvma_region_insert(struct nouveau_uvmm *uvmm,
+			   struct nouveau_uvma_region *reg,
+			   u64 addr, u64 range,
+			   bool sparse)
+{
+	int ret;
+
+	reg->uvmm = uvmm;
+	reg->region.va.addr = addr >> PAGE_SHIFT;
+	reg->region.va.range = range >> PAGE_SHIFT;
+	reg->region.sparse = sparse;
+
+	ret = __nouveau_uvma_region_insert(uvmm, reg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int
+nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
+			   u64 addr, u64 range,
+			   bool sparse)
+{
+	struct nouveau_uvma_region *reg;
+	int ret;
+
+	ret = nouveau_uvma_region_alloc(&reg);
+	if (ret)
+		return ret;
+
+	ret = nouveau_uvma_region_insert(uvmm, reg, addr, range, sparse);
+	if (ret)
+		goto err_free_region;
+
+	if (sparse) {
+		ret = nouveau_uvmm_vmm_sparse_ref(uvmm, addr, range);
+		if (ret)
+			goto err_region_remove;
+	}
+
+	return 0;
+
+err_region_remove:
+	drm_gpuva_region_remove(&reg->region);
+err_free_region:
+	nouveau_uvma_region_free(reg);
+	return ret;
+}
+
+static struct nouveau_uvma_region *
+nouveau_uvma_region_find(struct nouveau_uvmm *uvmm,
+			 u64 addr, u64 range)
+{
+	struct drm_gpuva_region *reg;
+
+	reg = drm_gpuva_region_find(&uvmm->umgr,
+				    addr >> PAGE_SHIFT,
+				    range >> PAGE_SHIFT);
+	if (!reg)
+		return NULL;
+
+	return uvma_region_from_va_region(reg);
+}
+
+static void
+nouveau_uvma_region_remove(struct nouveau_uvma_region *reg)
+{
+	drm_gpuva_region_remove(&reg->region);
+}
+
+int
+__nouveau_uvma_region_destroy(struct nouveau_uvma_region *reg)
+{
+	struct nouveau_uvmm *uvmm = reg->uvmm;
+	u64 addr = reg->region.va.addr << PAGE_SHIFT;
+	u64 range = reg->region.va.range << PAGE_SHIFT;
+	bool sparse = reg->region.sparse;
+
+	if (!drm_gpuva_region_empty(&reg->region))
+		return -EBUSY;
+
+	nouveau_uvma_region_remove(reg);
+
+	if (sparse)
+		nouveau_uvmm_vmm_sparse_unref(uvmm, addr, range);
+
+	nouveau_uvma_region_free(reg);
+
+	return 0;
+}
+
+int
+nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range)
+{
+	struct nouveau_uvma_region *reg;
+
+	reg = nouveau_uvma_region_find(uvmm, addr, range);
+	if (!reg)
+		return -ENOENT;
+
+	return __nouveau_uvma_region_destroy(reg);
+}
+
+static void
+op_map_prepare_unwind(struct nouveau_uvma *uvma)
+{
+	nouveau_uvma_gem_put(uvma);
+	nouveau_uvma_remove(uvma);
+	nouveau_uvma_free(uvma);
+}
+
+static void
+op_unmap_prepare_unwind(struct drm_gpuva *va)
+{
+	drm_gpuva_insert(va->mgr, va);
+}
+
+static void
+uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
+		       struct nouveau_uvma_alloc *new,
+		       struct drm_gpuva_ops *ops,
+		       struct drm_gpuva_op *last,
+		       struct uvmm_map_args *args)
+{
+	struct drm_gpuva_op *op = last;
+	u64 vmm_get_start = args ? args->addr : 0;
+	u64 vmm_get_end = args ? args->addr + args->range : 0;
+
+	/* Unwind GPUVA space. */
+	drm_gpuva_for_each_op_from_reverse(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			op_map_prepare_unwind(new->map);
+			break;
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+
+			if (r->next)
+				op_map_prepare_unwind(new->next);
+
+			if (r->prev)
+				op_map_prepare_unwind(new->prev);
+
+			op_unmap_prepare_unwind(r->unmap->va);
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP:
+			op_unmap_prepare_unwind(op->unmap.va);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Unmap operation don't allocate page tables, hence skip the following
+	 * page table unwind.
+	 */
+	if (!args)
+		return;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP: {
+			u64 vmm_get_range = vmm_get_end - vmm_get_start;
+
+			if (vmm_get_range)
+				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
+						     vmm_get_range);
+			break;
+		}
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
+			u64 ustart = va->va.addr << PAGE_SHIFT;
+			u64 urange = va->va.range << PAGE_SHIFT;
+			u64 uend = ustart + urange;
+
+			if (r->prev)
+				vmm_get_start = uend;
+
+			if (r->next)
+				vmm_get_end = ustart;
+
+			if (r->prev && r->next)
+				vmm_get_start = vmm_get_end = 0;
+
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			u64 ustart = va->va.addr << PAGE_SHIFT;
+			u64 urange = va->va.range << PAGE_SHIFT;
+			u64 uend = ustart + urange;
+
+			/* Nothing to do for mappings we merge with. */
+			if (uend == vmm_get_start ||
+			    ustart == vmm_get_end)
+				break;
+
+			if (ustart > vmm_get_start) {
+				u64 vmm_get_range = ustart - vmm_get_start;
+
+				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
+						     vmm_get_range);
+			}
+			vmm_get_start = uend;
+			break;
+		}
+		default:
+			break;
+		}
+
+		if (op == last)
+			break;
+	}
+}
+
+void
+nouveau_uvmm_sm_map_prepare_unwind(struct nouveau_uvmm *uvmm,
+				   struct nouveau_uvma_alloc *new,
+				   struct drm_gpuva_ops *ops,
+				   u64 addr, u64 range)
+{
+	struct drm_gpuva_op *last = drm_gpuva_last_op(ops);
+	struct uvmm_map_args args = {
+		.addr = addr,
+		.range = range,
+	};
+
+	uvmm_sm_prepare_unwind(uvmm, new, ops, last, &args);
+}
+
+void
+nouveau_uvmm_sm_unmap_prepare_unwind(struct nouveau_uvmm *uvmm,
+				     struct nouveau_uvma_alloc *new,
+				     struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *last = drm_gpuva_last_op(ops);
+
+	uvmm_sm_prepare_unwind(uvmm, new, ops, last, NULL);
+}
+
+static int
+op_map_prepare(struct nouveau_uvmm *uvmm,
+	       struct nouveau_uvma **puvma,
+	       struct drm_gpuva_op_map *m,
+	       struct uvmm_map_args *args)
+{
+	struct nouveau_uvma *uvma;
+	int ret;
+
+	ret = nouveau_uvma_alloc(&uvma);
+	if (ret)
+		goto err;
+
+	ret = nouveau_uvma_insert(uvmm, uvma, m->gem.obj,
+				   m->gem.offset << PAGE_SHIFT,
+				   m->va.addr << PAGE_SHIFT,
+				   m->va.range << PAGE_SHIFT,
+				   args->kind);
+	if (ret)
+		goto err_free_uvma;
+
+	/* Keep a reference until this uvma is destroyed. */
+	nouveau_uvma_gem_get(uvma);
+
+	*puvma = uvma;
+	return 0;
+
+err_free_uvma:
+	nouveau_uvma_free(uvma);
+err:
+	*puvma = NULL;
+	return ret;
+}
+
+static void
+op_unmap_prepare(struct drm_gpuva_op_unmap *u)
+{
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+
+	nouveau_uvma_remove(uvma);
+}
+
+static int
+uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
+		struct nouveau_uvma_alloc *new,
+		struct drm_gpuva_ops *ops,
+		struct uvmm_map_args *args)
+{
+	struct drm_gpuva_op *op;
+	u64 vmm_get_start = args ? args->addr : 0;
+	u64 vmm_get_end = args ? args->addr + args->range : 0;
+	int ret;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP: {
+			u64 vmm_get_range = vmm_get_end - vmm_get_start;
+
+			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
+			if (ret)
+				goto unwind;
+
+			if (args && vmm_get_range) {
+				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
+							   vmm_get_range);
+				if (ret) {
+					op_map_prepare_unwind(new->map);
+					goto unwind;
+				}
+			}
+			break;
+		}
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
+			struct uvmm_map_args remap_args = {
+				.kind = uvma_from_va(va)->kind,
+			};
+			u64 ustart = va->va.addr << PAGE_SHIFT;
+			u64 urange = va->va.range << PAGE_SHIFT;
+			u64 uend = ustart + urange;
+
+			op_unmap_prepare(r->unmap);
+
+			if (r->prev) {
+				ret = op_map_prepare(uvmm, &new->prev, r->prev,
+						     &remap_args);
+				if (ret)
+					goto unwind;
+
+				if (args)
+					vmm_get_start = uend;
+			}
+
+			if (r->next) {
+				ret = op_map_prepare(uvmm, &new->next, r->next,
+						     &remap_args);
+				if (ret) {
+					if (r->prev)
+						op_map_prepare_unwind(new->prev);
+					goto unwind;
+				}
+
+				if (args)
+					vmm_get_end = ustart;
+			}
+
+			if (args && (r->prev && r->next))
+				vmm_get_start = vmm_get_end = 0;
+
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			u64 ustart = va->va.addr << PAGE_SHIFT;
+			u64 urange = va->va.range << PAGE_SHIFT;
+			u64 uend = ustart + urange;
+
+			op_unmap_prepare(u);
+
+			if (!args)
+				break;
+
+			/* Nothing to do for mappings we merge with. */
+			if (uend == vmm_get_start ||
+			    ustart == vmm_get_end)
+				break;
+
+			if (ustart > vmm_get_start) {
+				u64 vmm_get_range = ustart - vmm_get_start;
+
+				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
+							   vmm_get_range);
+				if (ret) {
+					op_unmap_prepare_unwind(va);
+					goto unwind;
+				}
+			}
+			vmm_get_start = uend;
+
+			break;
+		}
+		default:
+			ret = -EINVAL;
+			goto unwind;
+		}
+	}
+
+	return 0;
+
+unwind:
+	if (op != drm_gpuva_first_op(ops))
+		uvmm_sm_prepare_unwind(uvmm, new, ops,
+				       drm_gpuva_prev_op(op),
+				       args);
+	return ret;
+}
+
+int
+nouveau_uvmm_sm_map_prepare(struct nouveau_uvmm *uvmm,
+			    struct nouveau_uvma_alloc *new,
+			    struct drm_gpuva_ops *ops,
+			    u64 addr, u64 range, u8 kind)
+{
+	struct uvmm_map_args args = {
+		.addr = addr,
+		.range = range,
+		.kind = kind,
+	};
+
+	return uvmm_sm_prepare(uvmm, new, ops, &args);
+}
+
+int
+nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
+			      struct nouveau_uvma_alloc *new,
+			      struct drm_gpuva_ops *ops)
+{
+	return uvmm_sm_prepare(uvmm, new, ops, NULL);
+}
+
+struct drm_gpuva_ops *
+nouveau_uvmm_sm_map_ops(struct nouveau_uvmm *uvmm,
+			u64 addr, u64 range,
+			struct drm_gem_object *obj, u64 offset)
+{
+	return drm_gpuva_sm_map_ops_create(&uvmm->umgr,
+					   addr >> PAGE_SHIFT,
+					   range >> PAGE_SHIFT,
+					   obj, offset >> PAGE_SHIFT);
+}
+
+struct drm_gpuva_ops *
+nouveau_uvmm_sm_unmap_ops(struct nouveau_uvmm *uvmm,
+			  u64 addr, u64 range)
+{
+	return drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+					     addr >> PAGE_SHIFT,
+					     range >> PAGE_SHIFT);
+}
+
+static struct drm_gem_object *
+op_gem_obj(struct drm_gpuva_op *op)
+{
+	switch (op->op) {
+	case DRM_GPUVA_OP_MAP:
+		return op->map.gem.obj;
+	case DRM_GPUVA_OP_REMAP:
+		return op->remap.unmap->va->gem.obj;
+	case DRM_GPUVA_OP_UNMAP:
+		return op->unmap.va->gem.obj;
+	default:
+		WARN(1, "Unknown operation.\n");
+		return NULL;
+	}
+}
+
+static void
+op_map(struct nouveau_uvma *uvma)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(uvma->va.gem.obj);
+
+	nouveau_uvma_map(uvma, nouveau_mem(nvbo->bo.resource));
+	drm_gpuva_link(&uvma->va);
+}
+
+static void
+op_unmap(struct drm_gpuva_op_unmap *u)
+{
+	struct drm_gpuva *va = u->va;
+	struct nouveau_uvma *uvma = uvma_from_va(va);
+
+	/* nouveau_uvma_unmap() does not try to unmap if backing BO is
+	 * evicted.
+	 */
+	if (!u->keep)
+		nouveau_uvma_unmap(uvma);
+	drm_gpuva_unlink(va);
+}
+
+static void
+op_unmap_range(struct drm_gpuva_op_unmap *u,
+	       u64 addr, u64 range)
+{
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	bool sparse = uvma->va.region->sparse;
+
+	addr <<= PAGE_SHIFT;
+	range <<= PAGE_SHIFT;
+
+	if (!drm_gpuva_evicted(u->va))
+		nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+
+	drm_gpuva_unlink(u->va);
+}
+
+static void
+op_remap(struct drm_gpuva_op_remap *r,
+	 struct nouveau_uvma_alloc *new)
+{
+	struct drm_gpuva_op_unmap *u = r->unmap;
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	u64 addr = uvma->va.va.addr;
+	u64 range = uvma->va.va.range;
+
+	if (r->prev) {
+		addr = r->prev->va.addr + r->prev->va.range;
+		drm_gpuva_link(&new->prev->va);
+	}
+
+	if (r->next) {
+		range = r->next->va.addr - addr;
+		drm_gpuva_link(&new->next->va);
+	}
+
+	op_unmap_range(u, addr, range);
+}
+
+static int
+uvmm_sm(struct nouveau_uvmm *uvmm,
+	struct nouveau_uvma_alloc *new,
+	struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *op;
+
+	drm_gpuva_for_each_op(op, ops) {
+		struct drm_gem_object *obj = op_gem_obj(op);
+
+		if (!obj)
+			return -EINVAL;
+
+		drm_gem_gpuva_lock(obj);
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			op_map(new->map);
+			break;
+		case DRM_GPUVA_OP_REMAP: {
+			op_remap(&op->remap, new);
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP:
+			op_unmap(&op->unmap);
+			break;
+		default:
+			break;
+		}
+		drm_gem_gpuva_unlock(obj);
+	}
+
+	return 0;
+}
+
+int
+nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm,
+		    struct nouveau_uvma_alloc *new,
+		    struct drm_gpuva_ops *ops)
+{
+	return uvmm_sm(uvmm, new, ops);
+}
+
+int
+nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm,
+		      struct nouveau_uvma_alloc *new,
+		      struct drm_gpuva_ops *ops)
+{
+	return uvmm_sm(uvmm, new, ops);
+}
+
+static void
+uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
+		struct nouveau_uvma_alloc *new,
+		struct drm_gpuva_ops *ops, bool unmap)
+{
+	struct drm_gpuva_op *op;
+
+	drm_gpuva_for_each_op(op, ops) {
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			break;
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva_op_map *p = r->prev;
+			struct drm_gpuva_op_map *n = r->next;
+			struct drm_gpuva *va = r->unmap->va;
+			struct nouveau_uvma *uvma = uvma_from_va(va);
+
+			if (unmap) {
+				u64 addr = va->va.addr << PAGE_SHIFT;
+				u64 end = addr + (va->va.range << PAGE_SHIFT);
+
+				if (p)
+					addr = (p->va.addr << PAGE_SHIFT) +
+					       (n->va.range << PAGE_SHIFT);
+
+				if (n)
+					end = n->va.addr << PAGE_SHIFT;
+
+				nouveau_uvmm_vmm_put(uvmm, addr, end - addr);
+			}
+
+			nouveau_uvma_gem_put(uvma);
+			nouveau_uvma_free(uvma);
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP: {
+			struct drm_gpuva_op_unmap *u = &op->unmap;
+			struct drm_gpuva *va = u->va;
+			struct nouveau_uvma *uvma = uvma_from_va(va);
+
+			if (unmap)
+				nouveau_uvma_vmm_put(uvma);
+
+			nouveau_uvma_gem_put(uvma);
+			nouveau_uvma_free(uvma);
+			break;
+		}
+		default:
+			break;
+		}
+	}
+}
+
+void
+nouveau_uvmm_sm_map_cleanup(struct nouveau_uvmm *uvmm,
+			    struct nouveau_uvma_alloc *new,
+			    struct drm_gpuva_ops *ops)
+{
+	uvmm_sm_cleanup(uvmm, new, ops, false);
+}
+
+void
+nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
+			      struct nouveau_uvma_alloc *new,
+			      struct drm_gpuva_ops *ops)
+{
+	uvmm_sm_cleanup(uvmm, new, ops, true);
+}
+
+void
+nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
+{
+	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva *va;
+
+	drm_gem_gpuva_lock(obj);
+	drm_gem_for_each_gpuva(va, obj) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+
+		nouveau_uvma_map(uvma, mem);
+		drm_gpuva_evict(va, false);
+	}
+	drm_gem_gpuva_unlock(obj);
+}
+
+void
+nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
+{
+	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuva *va;
+
+	drm_gem_gpuva_lock(obj);
+	drm_gem_for_each_gpuva(va, obj) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+
+		nouveau_uvma_unmap(uvma);
+		drm_gpuva_evict(va, true);
+	}
+	drm_gem_gpuva_unlock(obj);
+}
+
+int
+nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		  struct drm_nouveau_vm_init *init)
+{
+	int ret;
+	u64 unmanaged_end = init->unmanaged_addr + init->unmanaged_size;
+
+	mutex_init(&uvmm->mutex);
+
+	mutex_lock(&cli->mutex);
+
+	if (unlikely(cli->uvmm.disabled)) {
+		ret = -ENOSYS;
+		goto out_unlock;
+	}
+
+	if (unmanaged_end <= init->unmanaged_addr) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (unmanaged_end > NOUVEAU_VA_SPACE_END) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	uvmm->unmanaged_addr = init->unmanaged_addr;
+	uvmm->unmanaged_size = init->unmanaged_size;
+
+	drm_gpuva_manager_init(&uvmm->umgr, cli->name,
+			       NOUVEAU_VA_SPACE_START >> PAGE_SHIFT,
+			       NOUVEAU_VA_SPACE_END >> PAGE_SHIFT,
+			       init->unmanaged_addr >> PAGE_SHIFT,
+			       init->unmanaged_size >> PAGE_SHIFT,
+			       NULL, DRM_GPUVA_MANAGER_REGIONS);
+
+	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
+			    cli->vmm.vmm.object.oclass, RAW,
+			    init->unmanaged_addr, init->unmanaged_size,
+			    NULL, 0, &cli->uvmm.vmm.vmm);
+	if (ret)
+		goto out_free_gpuva_mgr;
+
+	cli->uvmm.vmm.cli = cli;
+	mutex_unlock(&cli->mutex);
+
+	return 0;
+
+out_free_gpuva_mgr:
+	drm_gpuva_manager_destroy(&uvmm->umgr);
+out_unlock:
+	mutex_unlock(&cli->mutex);
+	return ret;
+}
+
+void
+nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
+{
+	DRM_GPUVA_ITER(it, &uvmm->umgr);
+	DRM_GPUVA_REGION_ITER(__it, &uvmm->umgr);
+	struct nouveau_cli *cli = uvmm->vmm.cli;
+
+	if (!cli)
+		return;
+
+	nouveau_uvmm_lock(uvmm);
+	drm_gpuva_iter_for_each(it) {
+		struct drm_gpuva *va = it.va;
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+		struct drm_gem_object *obj = va->gem.obj;
+
+		drm_gpuva_iter_remove(&it);
+
+		drm_gem_gpuva_lock(obj);
+		nouveau_uvma_unmap(uvma);
+		drm_gpuva_unlink(va);
+		drm_gem_gpuva_unlock(obj);
+
+		nouveau_uvma_vmm_put(uvma);
+
+		nouveau_uvma_gem_put(uvma);
+		nouveau_uvma_free(uvma);
+	}
+
+	drm_gpuva_iter_for_each(__it) {
+		struct drm_gpuva_region *reg = __it.reg;
+		struct nouveau_uvma_region *ureg = uvma_region_from_va_region(reg);
+
+		if (unlikely(reg == &uvmm->umgr.kernel_alloc_region))
+			continue;
+
+		drm_gpuva_iter_remove(&__it);
+
+		nouveau_uvma_region_sparse_unref(ureg);
+		nouveau_uvma_region_free(ureg);
+	}
+	nouveau_uvmm_unlock(uvmm);
+
+	mutex_lock(&cli->mutex);
+	nouveau_vmm_fini(&uvmm->vmm);
+	drm_gpuva_manager_destroy(&uvmm->umgr);
+	mutex_unlock(&cli->mutex);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
new file mode 100644
index 000000000000..858840e9e0c5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __NOUVEAU_UVMM_H__
+#define __NOUVEAU_UVMM_H__
+
+#include <drm/drm_gpuva_mgr.h>
+
+#include "nouveau_drv.h"
+
+struct nouveau_uvmm {
+	struct nouveau_vmm vmm;
+	struct drm_gpuva_manager umgr;
+	struct mutex mutex;
+
+	u64 unmanaged_addr;
+	u64 unmanaged_size;
+
+	bool disabled;
+};
+
+struct nouveau_uvma_region {
+	struct drm_gpuva_region region;
+	struct nouveau_uvmm *uvmm;
+};
+
+struct nouveau_uvma {
+	struct drm_gpuva va;
+	struct nouveau_uvmm *uvmm;
+	u64 handle;
+	u8 kind;
+};
+
+struct nouveau_uvma_alloc {
+	struct nouveau_uvma *map;
+	struct nouveau_uvma *prev;
+	struct nouveau_uvma *next;
+};
+
+#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
+#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
+#define uvma_region_from_va_region(x) container_of((x), struct nouveau_uvma_region, region)
+
+int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		      struct drm_nouveau_vm_init *init);
+void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
+
+void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
+void nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo);
+
+int nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm,
+				u64 addr, u64 range);
+
+int nouveau_uvma_region_create(struct nouveau_uvmm *uvmm,
+			       u64 addr, u64 range,
+			       bool sparse);
+int __nouveau_uvma_region_destroy(struct nouveau_uvma_region *reg);
+int nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
+				u64 addr, u64 range);
+
+struct drm_gpuva_ops *
+nouveau_uvmm_sm_map_ops(struct nouveau_uvmm *uvmm,
+			u64 addr, u64 range,
+			struct drm_gem_object *obj, u64 offset);
+struct drm_gpuva_ops *
+nouveau_uvmm_sm_unmap_ops(struct nouveau_uvmm *uvmm,
+			  u64 addr, u64 range);
+
+void
+nouveau_uvmm_sm_map_prepare_unwind(struct nouveau_uvmm *uvmm,
+				   struct nouveau_uvma_alloc *new,
+				   struct drm_gpuva_ops *ops,
+				   u64 addr, u64 range);
+void
+nouveau_uvmm_sm_unmap_prepare_unwind(struct nouveau_uvmm *uvmm,
+				     struct nouveau_uvma_alloc *new,
+				     struct drm_gpuva_ops *ops);
+
+int nouveau_uvmm_sm_map_prepare(struct nouveau_uvmm *uvmm,
+				struct nouveau_uvma_alloc *new,
+				struct drm_gpuva_ops *ops,
+				u64 addr, u64 range, u8 kind);
+int nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
+				  struct nouveau_uvma_alloc *new,
+				  struct drm_gpuva_ops *ops);
+
+int nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm,
+			struct nouveau_uvma_alloc *new,
+			struct drm_gpuva_ops *ops);
+int nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm,
+			  struct nouveau_uvma_alloc *new,
+			  struct drm_gpuva_ops *ops);
+
+void nouveau_uvmm_sm_map_cleanup(struct nouveau_uvmm *uvmm,
+				 struct nouveau_uvma_alloc *new,
+				 struct drm_gpuva_ops *ops);
+void nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
+				   struct nouveau_uvma_alloc *new,
+				   struct drm_gpuva_ops *ops);
+
+static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
+{
+	mutex_lock(&uvmm->mutex);
+}
+
+static inline void nouveau_uvmm_unlock(struct nouveau_uvmm *uvmm)
+{
+	mutex_unlock(&uvmm->mutex);
+}
+
+#endif
-- 
2.39.1


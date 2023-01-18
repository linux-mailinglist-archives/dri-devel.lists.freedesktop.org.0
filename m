Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8657D6713AD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2660D10E6A0;
	Wed, 18 Jan 2023 06:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58410E699
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMcBA2BxKR6mgzQVCp1bnTeEdyEKJQVuyTzd+hiIz80=;
 b=BK0XI8ov+Rq1wLse8ykphltr+qg3Vr4CnA6yEbD3Oev7HzQCMkwMeCQvZeyZ3aUj6qHNYP
 fJan2ND81ogfucOf7zXHmZLKckQdkRg9Ekuz+dCiVZeFMEcxGfkUp7rzL/QxpH9QDs/DMB
 +ttABara8d8oGIqYKIozs61P0HX7JcU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-VK0CRkInO56OxwnlMzQoKA-1; Wed, 18 Jan 2023 01:14:16 -0500
X-MC-Unique: VK0CRkInO56OxwnlMzQoKA-1
Received: by mail-ej1-f70.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so22906480ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMcBA2BxKR6mgzQVCp1bnTeEdyEKJQVuyTzd+hiIz80=;
 b=0zbZjVg4X178JGpdFXnjH150mZzZQvJTHRteF72LWpfOe0twn0IlgbcjzYMZk2g8fN
 Q0DngBtiiy4FwKBhQ0KeElaiGoQNBetDGUK7ndVln7LrFJJr96PlzWv0nx1/EvmPN22b
 fW2vjT9ZRimxKniohb/BvWRuTGhlHAZ7J/Pro77+W+GsLSlVV+KONK/8DC0HHapSzJV4
 i7GQ4uYDa+wBaoY/LZBfQG9eDsGYMlB4qgzpocwi8bQDlr+3LOhsNHOxXR8vCg+YvZHr
 xwku7ztvHm50RurV/6po12SpWG1i4jTYNJe74r4mfCmFFX3Oi7Wyo9fsj7NrN92qm3Ox
 PH3g==
X-Gm-Message-State: AFqh2koh2qz0/3Z1WmBMndDvNPaakqxBvhMIUmfPcOr6GhqRAvnEhNTK
 qtaQfzkK/XmKRbctn3Zhvvb+D2jyhlJ2cJmJ5D8o9spGX7DhjQZJc/Kj7JtMZlQXJ9+dsn3YVR+
 3rI2wrd1N0W3Co+THiwJN+DW/zsep
X-Received: by 2002:a17:906:3c03:b0:7c1:79f5:9545 with SMTP id
 h3-20020a1709063c0300b007c179f59545mr5524867ejg.42.1674022454421; 
 Tue, 17 Jan 2023 22:14:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuznNARQTduxkNFKD7cavVy8dqxCe5g+nOWp3iv028+GM793vBn+deG0+ZiXrWoUPL9dGsOg==
X-Received: by 2002:a17:906:3c03:b0:7c1:79f5:9545 with SMTP id
 h3-20020a1709063c0300b007c179f59545mr5524840ejg.42.1674022454059; 
 Tue, 17 Jan 2023 22:14:14 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170906769000b0087758f5ecd1sm392404ejm.194.2023.01.17.22.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:13 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 12/14] drm/nouveau: implement uvmm for user mode
 bindings
Date: Wed, 18 Jan 2023 07:12:54 +0100
Message-Id: <20230118061256.2689-13-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

uvmm provides the driver abstraction around the DRM GPU VA manager
connecting it to the nouveau infrastructure.

It handles the split and merge operations provided by the DRM GPU VA
manager for map operations colliding with existent mappings and takes
care of the driver specific locking around the DRM GPU VA manager.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/Kbuild          |   1 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c |   7 +
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 147 +++---
 drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   2 +
 drivers/gpu/drm/nouveau/nouveau_drv.h   |  48 ++
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  51 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.h   |   5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 575 ++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |  68 +++
 11 files changed, 835 insertions(+), 73 deletions(-)
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
index 4cdeda7fe2df..03bbee291fc9 100644
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
 
@@ -937,11 +972,13 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			nouveau_vma_map(vma, mem);
 		}
+		nouveau_uvmm_bo_map_all(nvbo, mem);
 	} else {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			WARN_ON(ttm_bo_wait(bo, false, false));
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
index 80f154b6adab..989f30a31ba9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -70,6 +70,7 @@
 #include "nouveau_platform.h"
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
+#include "nouveau_uvmm.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -192,6 +193,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
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
index 5dad2d0dd5cb..3370a73e6a9b 100644
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
@@ -180,6 +184,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
 	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
@@ -187,22 +192,26 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return;
 
-	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
-	if (ret)
-		return;
+	if (uvmm) {
+		nouveau_uvmm_cli_unmap_all(uvmm, gem);
+	} else {
+		ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
+		if (ret)
+			return;
 
-	vma = nouveau_vma_find(nvbo, vmm);
-	if (vma) {
-		if (--vma->refs == 0) {
-			ret = pm_runtime_get_sync(dev);
-			if (!WARN_ON(ret < 0 && ret != -EACCES)) {
-				nouveau_gem_object_unmap(nvbo, vma);
-				pm_runtime_mark_last_busy(dev);
+		vma = nouveau_vma_find(nvbo, vmm);
+		if (vma) {
+			if (--vma->refs == 0) {
+				ret = pm_runtime_get_sync(dev);
+				if (!WARN_ON(ret < 0 && ret != -EACCES)) {
+					nouveau_gem_object_unmap(nvbo, vma);
+					pm_runtime_mark_last_busy(dev);
+				}
+				pm_runtime_put_autosuspend(dev);
 			}
-			pm_runtime_put_autosuspend(dev);
 		}
+		ttm_bo_unreserve(&nvbo->bo);
 	}
-	ttm_bo_unreserve(&nvbo->bo);
 }
 
 const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
@@ -231,7 +240,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		domain |= NOUVEAU_GEM_DOMAIN_CPU;
 
 	nvbo = nouveau_bo_alloc(cli, &size, &align, domain, tile_mode,
-				tile_flags);
+				tile_flags, false);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
@@ -279,13 +288,15 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
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
@@ -310,6 +321,11 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
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
@@ -710,6 +726,9 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
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
index 000000000000..47a74e3ce882
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: MIT
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
+ * We'd also need to protect the DRM_GPUVA_SWAPPED flag for each individual
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
+struct nouveau_uvmm_map_args {
+	u8 kind;
+	bool swapped;
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
+nouveau_uvma_map(struct nouveau_uvma *uvma,
+		 struct nouveau_mem *mem)
+{
+	struct nvif_vmm *vmm = &uvma->uvmm->vmm.vmm;
+	u64 addr = uvma->va.node.start << PAGE_SHIFT;
+	u64 offset = uvma->va.gem.offset << PAGE_SHIFT;
+	u64 range = uvma->va.node.size << PAGE_SHIFT;
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
+		args.gf100.kind = uvma->kind;
+		argc = sizeof(args.gf100);
+		break;
+	default:
+		WARN_ON(1);
+		return -ENOSYS;
+	}
+
+	return nvif_vmm_raw_map(vmm, addr, range,
+				&args, argc,
+				&mem->mem, offset,
+				&uvma->handle);
+}
+
+static int
+nouveau_uvma_unmap(struct nouveau_uvma *uvma)
+{
+	struct nvif_vmm *vmm = &uvma->uvmm->vmm.vmm;
+	bool sparse = uvma->va.region->sparse;
+
+	if (drm_gpuva_swapped(&uvma->va))
+		return 0;
+
+	return nvif_vmm_raw_unmap(vmm, uvma->handle, sparse);
+}
+
+static void
+nouveau_uvma_destroy(struct nouveau_uvma *uvma)
+{
+	drm_gpuva_destroy_locked(&uvma->va);
+	kfree(uvma);
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
+		drm_gpuva_swap(va, false);
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
+		drm_gpuva_swap(va, true);
+	}
+	drm_gem_gpuva_unlock(obj);
+}
+
+void
+nouveau_uvmm_cli_unmap_all(struct nouveau_uvmm *uvmm,
+			   struct drm_gem_object *obj)
+{
+	struct drm_gpuva *va, *tmp;
+
+	nouveau_uvmm_lock(uvmm);
+	drm_gem_gpuva_lock(obj);
+	drm_gem_for_each_gpuva_safe(va, tmp, obj) {
+		struct nouveau_uvma *uvma = uvma_from_va(va);
+
+		if (&uvmm->umgr == va->mgr) {
+			nouveau_uvma_unmap(uvma);
+			nouveau_uvma_destroy(uvma);
+		}
+	}
+	drm_gem_gpuva_unlock(obj);
+	nouveau_uvmm_unlock(uvmm);
+}
+
+static void
+nouveau_uvmm_unmap_range(struct nouveau_uvmm *uvmm,
+			 u64 addr, u64 range)
+{
+	struct drm_gpuva *va, *next;
+	u64 end = addr + range;
+
+	addr >>= PAGE_SHIFT;
+	range >>= PAGE_SHIFT;
+	end  >>= PAGE_SHIFT;
+
+	drm_gpuva_for_each_va_safe(va, next, &uvmm->umgr) {
+		if (addr >= va->node.start &&
+		    end <= va->node.start + va->node.size) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
+			struct drm_gem_object *obj = va->gem.obj;
+
+			drm_gem_gpuva_lock(obj);
+			nouveau_uvma_unmap(uvma);
+			nouveau_uvma_destroy(uvma);
+			drm_gem_gpuva_unlock(obj);
+		}
+	}
+}
+
+static int
+nouveau_uvma_new(struct nouveau_uvmm *uvmm,
+		 struct drm_gem_object *obj,
+		 u64 bo_offset, u64 addr,
+		 u64 range, u8 kind,
+		 struct nouveau_uvma **puvma)
+{
+	struct nouveau_uvma *uvma;
+	int ret;
+
+	addr >>= PAGE_SHIFT;
+	bo_offset >>= PAGE_SHIFT;
+	range >>= PAGE_SHIFT;
+
+	uvma = *puvma = kzalloc(sizeof(*uvma), GFP_KERNEL);
+	if (!uvma)
+		return -ENOMEM;
+
+	uvma->uvmm = uvmm;
+	uvma->kind = kind;
+	uvma->va.gem.offset = bo_offset;
+	uvma->va.gem.obj = obj;
+
+	ret = drm_gpuva_insert(&uvmm->umgr, &uvma->va, addr, range);
+	if (ret) {
+		kfree(uvma);
+		*puvma = NULL;
+		return ret;
+	}
+	drm_gpuva_link_locked(&uvma->va);
+
+	return 0;
+}
+
+int
+nouveau_uvma_region_new(struct nouveau_uvmm *uvmm,
+			u64 addr, u64 range,
+			bool sparse)
+{
+	struct nouveau_uvma_region *reg;
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	int ret;
+
+	reg = kzalloc(sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	reg->uvmm = uvmm;
+	reg->region.sparse = sparse;
+
+	ret = drm_gpuva_region_insert(&uvmm->umgr, &reg->region,
+				      addr >> PAGE_SHIFT,
+				      range >> PAGE_SHIFT);
+	if (ret)
+		goto err_free_region;
+
+	if (sparse) {
+		ret = nvif_vmm_raw_sparse(vmm, addr, range, true);
+		if (ret)
+			goto err_destroy_region;
+	}
+
+	return 0;
+
+err_destroy_region:
+	drm_gpuva_region_destroy(&uvmm->umgr, &reg->region);
+err_free_region:
+	kfree(reg);
+	return ret;
+}
+
+static void
+__nouveau_uvma_region_destroy(struct nouveau_uvma_region *reg)
+{
+	struct nouveau_uvmm *uvmm = reg->uvmm;
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	u64 addr = reg->region.node.start << PAGE_SHIFT;
+	u64 range = reg->region.node.size << PAGE_SHIFT;
+
+	nouveau_uvmm_unmap_range(uvmm, addr, range);
+
+	if (reg->region.sparse)
+		nvif_vmm_raw_sparse(vmm, addr, range, false);
+
+	drm_gpuva_region_destroy(&uvmm->umgr, &reg->region);
+	kfree(reg);
+}
+
+int
+nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range)
+{
+	struct drm_gpuva_region *reg;
+
+	reg = drm_gpuva_region_find(&uvmm->umgr,
+				    addr >> PAGE_SHIFT,
+				    range >> PAGE_SHIFT);
+	if (!reg)
+		return -ENOENT;
+
+	__nouveau_uvma_region_destroy(uvma_region_from_va_region(reg));
+
+	return 0;
+}
+
+static int
+op_map(struct nouveau_uvmm *uvmm,
+       struct drm_gpuva_op_map *m,
+       struct nouveau_uvmm_map_args *args)
+{
+	struct nouveau_uvma *uvma;
+	struct nouveau_bo *nvbo = nouveau_gem_object(m->gem.obj);
+	int ret;
+
+	ret = nouveau_uvma_new(uvmm, m->gem.obj,
+			       m->gem.offset << PAGE_SHIFT,
+			       m->va.addr << PAGE_SHIFT,
+			       m->va.range << PAGE_SHIFT,
+			       args->kind, &uvma);
+	if (ret)
+		return ret;
+
+	drm_gpuva_swap(&uvma->va, args->swapped);
+	if (!args->swapped) {
+		ret = nouveau_uvma_map(uvma, nouveau_mem(nvbo->bo.resource));
+		if (ret) {
+			nouveau_uvma_destroy(uvma);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+op_unmap(struct nouveau_uvmm *uvmm,
+	 struct drm_gpuva_op_unmap *u)
+{
+	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	int ret;
+
+	ret = nouveau_uvma_unmap(uvma);
+	if (ret)
+		return ret;
+
+	nouveau_uvma_destroy(uvma);
+
+	return 0;
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
+		WARN(1, "unknown operation");
+		return NULL;
+	}
+}
+
+static int
+process_sm_ops(struct nouveau_uvmm *uvmm, struct drm_gpuva_ops *ops,
+	       struct nouveau_uvmm_map_args *args)
+{
+	struct drm_gpuva_op *op;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	drm_gpuva_for_each_op(op, ops) {
+		obj = op_gem_obj(op);
+		if (!obj)
+			continue;
+
+		drm_gem_gpuva_lock(obj);
+
+		switch (op->op) {
+		case DRM_GPUVA_OP_MAP:
+			ret = op_map(uvmm, &op->map, args);
+			if (ret)
+				goto err_unlock;
+
+			break;
+		case DRM_GPUVA_OP_REMAP:
+		{
+			struct drm_gpuva_op_remap *r = &op->remap;
+			struct drm_gpuva *va = r->unmap->va;
+			struct nouveau_uvmm_map_args remap_args = {
+				.kind = uvma_from_va(r->unmap->va)->kind,
+				.swapped = drm_gpuva_swapped(va),
+			};
+
+			ret = op_unmap(uvmm, r->unmap);
+			if (ret)
+				goto err_unlock;
+
+			if (r->prev) {
+				ret = op_map(uvmm, r->prev, &remap_args);
+				if (ret)
+					goto err_unlock;
+			}
+
+			if (r->next) {
+				ret = op_map(uvmm, r->next, &remap_args);
+				if (ret)
+					goto err_unlock;
+			}
+
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP:
+			ret = op_unmap(uvmm, &op->unmap);
+			if (ret)
+				goto err_unlock;
+
+			break;
+		}
+
+		drm_gem_gpuva_unlock(obj);
+	}
+
+	return 0;
+
+err_unlock:
+	drm_gem_gpuva_unlock(obj);
+	return ret;
+}
+
+int
+nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm, u64 addr, u64 range,
+		    struct drm_gem_object *obj, u64 offset, u8 kind)
+{
+	struct drm_gpuva_ops *ops;
+	struct nouveau_uvmm_map_args args = {
+		.kind = kind,
+		.swapped = false,
+	};
+	int ret;
+
+	ops = drm_gpuva_sm_map_ops_create(&uvmm->umgr,
+					  addr >> PAGE_SHIFT,
+					  range >> PAGE_SHIFT,
+					  obj, offset >> PAGE_SHIFT);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	ret = process_sm_ops(uvmm, ops, &args);
+	drm_gpuva_ops_free(ops);
+
+	return ret;
+}
+
+int
+nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
+{
+	struct drm_gpuva_ops *ops;
+	int ret;
+
+	ops = drm_gpuva_sm_unmap_ops_create(&uvmm->umgr,
+					    addr >> PAGE_SHIFT,
+					    range >> PAGE_SHIFT);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	ret = process_sm_ops(uvmm, ops, NULL);
+	drm_gpuva_ops_free(ops);
+
+	return ret;
+}
+
+int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		      struct drm_nouveau_vm_init *init)
+{
+	int ret;
+	u64 unmanaged_end = init->unmanaged_addr + init->unmanaged_size;
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
+			       init->unmanaged_size >> PAGE_SHIFT);
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
+	mutex_init(&uvmm->mutex);
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
+void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
+{
+	struct nouveau_cli *cli = uvmm->vmm.cli;
+	struct drm_gpuva_region *reg, *next;
+
+	if (!cli)
+		return;
+
+	/* Destroying a region implies destroying all mappings within the
+	 * region.
+	 */
+	nouveau_uvmm_lock(uvmm);
+	drm_gpuva_for_each_region_safe(reg, next, &uvmm->umgr)
+		if (&reg->node != &uvmm->umgr.kernel_alloc_node)
+			__nouveau_uvma_region_destroy(uvma_region_from_va_region(reg));
+	nouveau_uvmm_unlock(uvmm);
+
+	mutex_lock(&cli->mutex);
+	nouveau_vmm_fini(&uvmm->vmm);
+	drm_gpuva_manager_destroy(&uvmm->umgr);
+	mutex_unlock(&cli->mutex);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
new file mode 100644
index 000000000000..b0ad57004aa6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: MIT
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
+#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
+#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
+#define uvma_region_from_va_region(x) container_of((x), struct nouveau_uvma_region, region)
+
+int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
+		      struct drm_nouveau_vm_init *init);
+void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
+
+int nouveau_uvma_region_new(struct nouveau_uvmm *uvmm,
+			    u64 addr, u64 range,
+			    bool sparse);
+int nouveau_uvma_region_destroy(struct nouveau_uvmm *uvmm,
+				u64 addr, u64 range);
+
+int nouveau_uvmm_sm_map(struct nouveau_uvmm *uvmm, u64 addr, u64 range,
+			struct drm_gem_object *obj, u64 offset, u8 kind);
+int nouveau_uvmm_sm_unmap(struct nouveau_uvmm *uvmm, u64 addr, u64 range);
+
+void nouveau_uvmm_cli_unmap_all(struct nouveau_uvmm *uvmm,
+				struct drm_gem_object *obj);
+void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
+void nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo);
+
+int nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range);
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
2.39.0


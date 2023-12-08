Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC580A16C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 11:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102B10EA56;
	Fri,  8 Dec 2023 10:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952F10EA21;
 Fri,  8 Dec 2023 10:47:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so25460171fa.2; 
 Fri, 08 Dec 2023 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702032420; x=1702637220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rid1cCUMEyVF8y19rRf6254xafs3vXmofvO0HSqkkDU=;
 b=PW3cptxxkG8MeHhULNuasc3M0l6/EP3een2/eGdxOi5aPB46il3qM3KrGUGJnOOFzS
 URaJL3YoKNoU9JQJEHsnz7FU64g6CFQqh8kVMvCDmAE5F/ophYugQXxb/gA6UueiEI3j
 WoxEUOQKs8naY9o5yf9WgWGsH3v5XJWAURPgFbpGIMZuKTFzTccvwvwDJtPleurVE0vi
 5HKY+NE/TbQYVzkUr0VNByVyBSfIcRsmEamXsE50XgNhXEaMkljjRODRJxvNyv0coiWg
 0NocICtnNiu5NXDeWvND+jjB2ahqZf/24MbWOguIlVIrfCn3t5kvQ5OtHruU90LfJJA0
 8mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702032420; x=1702637220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rid1cCUMEyVF8y19rRf6254xafs3vXmofvO0HSqkkDU=;
 b=P76iPBNFMr57hsW4Jqm0DvMiTlfgJ+l7y8pwnn9TZh48iwhX0L7MMpA8esCsPuWzgr
 RDX+GnvYzjcBcbw9ppBK50FNFcUyVJ5IUY9UthUPj8m8jRCK2xSXUPSUzLmVrmcni7xu
 jWfdshTMpcp+BH0ewK1Jp22pQI9nzCSxF1GHX2h0MMv0L0nGs0KKlpcAqdTXNJRbp7rp
 TzKHnwEFOyxEJ82zp3mdhCYnB1cboRCsbJg7deI/xvEvCBdJBXyUSCfmKjkiHnp7tnVP
 QJRD+Kh5WnGARbtoJhkS+2ZKI8DUgMETsInnAKgXMCriESgCFQhQq2/VF0ZGrqojzr70
 xsoQ==
X-Gm-Message-State: AOJu0YxM+8/+VYuYZ7MO9l4LBABI7Byh7bFZbAAJKcoB3vefTcZciHaP
 rVqXIzdD65KUkF9TNQy46s4=
X-Google-Smtp-Source: AGHT+IHGn0Atxtb+mtyw4irxA91R0XgE1uTQR5LEeSA4hwjWEuF+oLUdeLBeIVEkcv//oQAo/ET1vQ==
X-Received: by 2002:a2e:9e46:0:b0:2ca:1282:d62a with SMTP id
 g6-20020a2e9e46000000b002ca1282d62amr1876340ljk.93.1702032419288; 
 Fri, 08 Dec 2023 02:46:59 -0800 (PST)
Received: from localhost
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ub27-20020a170907c81b00b00a1df4387f16sm866457ejc.95.2023.12.08.02.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 02:46:58 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/nouveau: Fixup gk20a instobj hierarchy
Date: Fri,  8 Dec 2023 11:46:53 +0100
Message-ID: <20231208104653.1917055-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Commit 12c9b05da918 ("drm/nouveau/imem: support allocations not
preserved across suspend") uses container_of() to cast from struct
nvkm_memory to struct nvkm_instobj, assuming that all instance objects
are derived from struct nvkm_instobj. For the gk20a family that's not
the case and they are derived from struct nvkm_memory instead. This
causes some subtle data corruption (nvkm_instobj.preserve ends up
mapping to gk20a_instobj.vaddr) that causes a NULL pointer dereference
in gk20a_instobj_acquire_iommu() (and possibly elsewhere) and also
prevents suspend/resume from working.

Fix this by making struct gk20a_instobj derive from struct nvkm_instobj
instead.

Fixes: 12c9b05da918 ("drm/nouveau/imem: support allocations not preserved across suspend")
Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that this was probably subtly wrong before the above-mentioned
commit already, but I don't think we've seen any reports that would
indicate any actual failures related to this before. So I think it's
good enough to apply this fix for v6.7. The next closest thing would
be commit d8e83994aaf6 ("drm/nouveau/imem: improve management of
instance memory"), but that's 8 years old (Linux v4.3)...
---
 .../drm/nouveau/nvkm/subdev/instmem/gk20a.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 1b811d6972a1..201022ae9214 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -49,14 +49,14 @@
 #include <subdev/mmu.h>
 
 struct gk20a_instobj {
-	struct nvkm_memory memory;
+	struct nvkm_instobj base;
 	struct nvkm_mm_node *mn;
 	struct gk20a_instmem *imem;
 
 	/* CPU mapping */
 	u32 *vaddr;
 };
-#define gk20a_instobj(p) container_of((p), struct gk20a_instobj, memory)
+#define gk20a_instobj(p) container_of((p), struct gk20a_instobj, base.memory)
 
 /*
  * Used for objects allocated using the DMA API
@@ -148,7 +148,7 @@ gk20a_instobj_iommu_recycle_vaddr(struct gk20a_instobj_iommu *obj)
 	list_del(&obj->vaddr_node);
 	vunmap(obj->base.vaddr);
 	obj->base.vaddr = NULL;
-	imem->vaddr_use -= nvkm_memory_size(&obj->base.memory);
+	imem->vaddr_use -= nvkm_memory_size(&obj->base.base.memory);
 	nvkm_debug(&imem->base.subdev, "vaddr used: %x/%x\n", imem->vaddr_use,
 		   imem->vaddr_max);
 }
@@ -283,7 +283,7 @@ gk20a_instobj_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
 {
 	struct gk20a_instobj *node = gk20a_instobj(memory);
 	struct nvkm_vmm_map map = {
-		.memory = &node->memory,
+		.memory = &node->base.memory,
 		.offset = offset,
 		.mem = node->mn,
 	};
@@ -391,8 +391,8 @@ gk20a_instobj_ctor_dma(struct gk20a_instmem *imem, u32 npages, u32 align,
 		return -ENOMEM;
 	*_node = &node->base;
 
-	nvkm_memory_ctor(&gk20a_instobj_func_dma, &node->base.memory);
-	node->base.memory.ptrs = &gk20a_instobj_ptrs;
+	nvkm_memory_ctor(&gk20a_instobj_func_dma, &node->base.base.memory);
+	node->base.base.memory.ptrs = &gk20a_instobj_ptrs;
 
 	node->base.vaddr = dma_alloc_attrs(dev, npages << PAGE_SHIFT,
 					   &node->handle, GFP_KERNEL,
@@ -438,8 +438,8 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 	*_node = &node->base;
 	node->dma_addrs = (void *)(node->pages + npages);
 
-	nvkm_memory_ctor(&gk20a_instobj_func_iommu, &node->base.memory);
-	node->base.memory.ptrs = &gk20a_instobj_ptrs;
+	nvkm_memory_ctor(&gk20a_instobj_func_iommu, &node->base.base.memory);
+	node->base.base.memory.ptrs = &gk20a_instobj_ptrs;
 
 	/* Allocate backing memory */
 	for (i = 0; i < npages; i++) {
@@ -533,7 +533,7 @@ gk20a_instobj_new(struct nvkm_instmem *base, u32 size, u32 align, bool zero,
 	else
 		ret = gk20a_instobj_ctor_dma(imem, size >> PAGE_SHIFT,
 					     align, &node);
-	*pmemory = node ? &node->memory : NULL;
+	*pmemory = node ? &node->base.memory : NULL;
 	if (ret)
 		return ret;
 
-- 
2.43.0


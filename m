Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A21220B9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 01:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F346E91C;
	Tue, 17 Dec 2019 00:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CC66E91A;
 Tue, 17 Dec 2019 00:57:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df827f40000>; Mon, 16 Dec 2019 16:57:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 16:57:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 16:57:32 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:57:32 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:57:32 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 17 Dec 2019 00:57:32 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df827fb0009>; Mon, 16 Dec 2019 16:57:31 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: Add correct turing page kinds
Date: Mon, 16 Dec 2019 16:58:05 -0800
Message-ID: <20191217005805.2931-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576544244; bh=DmQyp+Dw1GdVq/xtZzzElaerb1FHWaqWI8N0ensWpY4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=TDaTdQXrCPgaxBaXUu1hYAdB0Blu0lZHoDiuMucQSWFETfxxnjgXuqrvhib+CsWPR
 H/snhq6ausLmK2YL6Cd95scjicFetCMecSckPgXaCiNobxi5yYIrv1jppEd+j32xYd
 mp3pXWjD5UxjkR+uYrJFM47+WQaB/c9JUWXBaclsvvWwm1ubWU/IgIDtkA7sgm5xbt
 U0R1exEuXRKsJh5QizeXZa1t0Fyl4IIF1JRiHfsJzFJy/6OKdckfIc1WJRPv0rG1nv
 G+dn+yPZT6aOONW3B1RceIYOBVZO+nIyPM6pyCNSbv23bKTL5Tt3BT07FPli6tIKgS
 pauktBehLUgvw==
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
Cc: nouveau@lists.freedesktop.org, James
 Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turing introduced a new simplified page kind
scheme, reducing the number of possible page
kinds from 256 to 16.  It also is the first
NVIDIA GPU in which the highest possible page
kind value is not reserved as an "invalid" page
kind.

To address this, the invalid page kind is made
an explicit property of the MMU HAL, and a new
table of page kinds is added to the tu102 MMU
HAL.

One hardware change not addressed here is that
0x00 is technically no longer a supported page
kind, and pitch surfaces are instead intended to
share the block-linear generic page kind 0x06.
However, because that will be a rather invasive
change to nouveau and 0x00 still works fine in
practice on Turing hardware, addressing this new
behavior is deferred.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0008.h    |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/mmu.h       |  4 ++--
 drivers/gpu/drm/nouveau/nvif/mmu.c               |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c  |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c  |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c   |  3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h   |  8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c  | 16 +++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c   |  7 +++++--
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c   |  6 +++---
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c   |  6 +++---
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c    |  6 +++---
 12 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0008.h b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
index 8450127420f5..c21d09f04f1d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0008.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
@@ -35,7 +35,7 @@ struct nvif_mmu_type_v0 {
 
 struct nvif_mmu_kind_v0 {
 	__u8  version;
-	__u8  pad01[1];
+	__u8  kind_inv;
 	__u16 count;
 	__u8  data[];
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index 747ecf67e403..cec1e88a0a05 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -7,6 +7,7 @@ struct nvif_mmu {
 	u8  dmabits;
 	u8  heap_nr;
 	u8  type_nr;
+	u8  kind_inv;
 	u16 kind_nr;
 	s32 mem;
 
@@ -36,9 +37,8 @@ void nvif_mmu_fini(struct nvif_mmu *);
 static inline bool
 nvif_mmu_kind_valid(struct nvif_mmu *mmu, u8 kind)
 {
-	const u8 invalid = mmu->kind_nr - 1;
 	if (kind) {
-		if (kind >= mmu->kind_nr || mmu->kind[kind] == invalid)
+		if (kind >= mmu->kind_nr || mmu->kind[kind] == mmu->kind_inv)
 			return false;
 	}
 	return true;
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index 5641bda2046d..47efc408efa6 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -121,6 +121,7 @@ nvif_mmu_init(struct nvif_object *parent, s32 oclass, struct nvif_mmu *mmu)
 				       kind, argc);
 		if (ret == 0)
 			memcpy(mmu->kind, kind->data, kind->count);
+		mmu->kind_inv = kind->kind_inv;
 		kfree(kind);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
index 2d075246dc46..2cd5ec81c0d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
@@ -30,7 +30,7 @@
  * The value 0xff represents an invalid storage type.
  */
 const u8 *
-gf100_mmu_kind(struct nvkm_mmu *mmu, int *count)
+gf100_mmu_kind(struct nvkm_mmu *mmu, int *count, u8 *invalid)
 {
 	static const u8
 	kind[256] = {
@@ -69,6 +69,7 @@ gf100_mmu_kind(struct nvkm_mmu *mmu, int *count)
 	};
 
 	*count = ARRAY_SIZE(kind);
+	*invalid = 0xff;
 	return kind;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c
index dbf644ebac97..83990c83f9f8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gm200.c
@@ -27,7 +27,7 @@
 #include <nvif/class.h>
 
 const u8 *
-gm200_mmu_kind(struct nvkm_mmu *mmu, int *count)
+gm200_mmu_kind(struct nvkm_mmu *mmu, int *count, u8 *invalid)
 {
 	static const u8
 	kind[256] = {
@@ -65,6 +65,7 @@ gm200_mmu_kind(struct nvkm_mmu *mmu, int *count)
 		0xfe, 0xfe, 0xfe, 0xfe, 0xff, 0xfd, 0xfe, 0xff
 	};
 	*count = ARRAY_SIZE(kind);
+	*invalid = 0xff;
 	return kind;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c
index db3dfbbb2aa0..c0083ddda65a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv50.c
@@ -27,7 +27,7 @@
 #include <nvif/class.h>
 
 const u8 *
-nv50_mmu_kind(struct nvkm_mmu *base, int *count)
+nv50_mmu_kind(struct nvkm_mmu *base, int *count, u8 *invalid)
 {
 	/* 0x01: no bank swizzle
 	 * 0x02: bank swizzled
@@ -57,6 +57,7 @@ nv50_mmu_kind(struct nvkm_mmu *base, int *count)
 		0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x7f, 0x7f
 	};
 	*count = ARRAY_SIZE(kind);
+	*invalid = 0x7f;
 	return kind;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
index 07f2fcd18f3d..479b02344271 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
@@ -35,17 +35,17 @@ struct nvkm_mmu_func {
 		u32 pd_offset;
 	} vmm;
 
-	const u8 *(*kind)(struct nvkm_mmu *, int *count);
+	const u8 *(*kind)(struct nvkm_mmu *, int *count, u8 *invalid);
 	bool kind_sys;
 };
 
 extern const struct nvkm_mmu_func nv04_mmu;
 
-const u8 *nv50_mmu_kind(struct nvkm_mmu *, int *count);
+const u8 *nv50_mmu_kind(struct nvkm_mmu *, int *count, u8 *invalid);
 
-const u8 *gf100_mmu_kind(struct nvkm_mmu *, int *count);
+const u8 *gf100_mmu_kind(struct nvkm_mmu *, int *count, u8 *invalid);
 
-const u8 *gm200_mmu_kind(struct nvkm_mmu *, int *);
+const u8 *gm200_mmu_kind(struct nvkm_mmu *, int *, u8 *);
 
 struct nvkm_mmu_pt {
 	union {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
index c0db0ce10cba..b21e82eb0916 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
@@ -1,5 +1,6 @@
 /*
  * Copyright 2018 Red Hat Inc.
+ * Copyright 2019 NVIDIA Corporation.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -26,13 +27,26 @@
 
 #include <nvif/class.h>
 
+const u8 *
+tu102_mmu_kind(struct nvkm_mmu *mmu, int *count, u8 *invalid)
+{
+	static const u8
+	kind[16] = {
+		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, /* 0x00 */
+		0x06, 0x06, 0x02, 0x01, 0x03, 0x04, 0x05, 0x07,
+	};
+	*count = ARRAY_SIZE(kind);
+	*invalid = 0x07;
+	return kind;
+}
+
 static const struct nvkm_mmu_func
 tu102_mmu = {
 	.dma_bits = 47,
 	.mmu = {{ -1, -1, NVIF_CLASS_MMU_GF100}},
 	.mem = {{ -1,  0, NVIF_CLASS_MEM_GF100}, gf100_mem_new, gf100_mem_map },
 	.vmm = {{ -1,  0, NVIF_CLASS_VMM_GP100}, tu102_vmm_new },
-	.kind = gm200_mmu_kind,
+	.kind = tu102_mmu_kind,
 	.kind_sys = true,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 353f10f92b77..0e4b8941da37 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -111,15 +111,17 @@ nvkm_ummu_kind(struct nvkm_ummu *ummu, void *argv, u32 argc)
 	} *args = argv;
 	const u8 *kind = NULL;
 	int ret = -ENOSYS, count = 0;
+	u8 kind_inv = 0;
 
 	if (mmu->func->kind)
-		kind = mmu->func->kind(mmu, &count);
+		kind = mmu->func->kind(mmu, &count, &kind_inv);
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true))) {
 		if (argc != args->v0.count * sizeof(*args->v0.data))
 			return -EINVAL;
 		if (args->v0.count > count)
 			return -EINVAL;
+		args->v0.kind_inv = kind_inv;
 		memcpy(args->v0.data, kind, args->v0.count);
 	} else
 		return ret;
@@ -157,9 +159,10 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 	struct nvkm_mmu *mmu = device->mmu;
 	struct nvkm_ummu *ummu;
 	int ret = -ENOSYS, kinds = 0;
+	u8 unused = 0;
 
 	if (mmu->func->kind)
-		mmu->func->kind(mmu, &kinds);
+		mmu->func->kind(mmu, &kinds, &unused);
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
 		args->v0.dmabits = mmu->dma_bits;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
index ab6424faf84c..6a2d9eb8e1ea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c
@@ -247,7 +247,7 @@ gf100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	} *args = argv;
 	struct nvkm_device *device = vmm->mmu->subdev.device;
 	struct nvkm_memory *memory = map->memory;
-	u8  kind, priv, ro, vol;
+	u8  kind, kind_inv, priv, ro, vol;
 	int kindn, aper, ret = -ENOSYS;
 	const u8 *kindm;
 
@@ -274,8 +274,8 @@ gf100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	if (WARN_ON(aper < 0))
 		return aper;
 
-	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn);
-	if (kind >= kindn || kindm[kind] == 0xff) {
+	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn, &kind_inv);
+	if (kind >= kindn || kindm[kind] == kind_inv) {
 		VMM_DEBUG(vmm, "kind %02x", kind);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index b4f519768d5e..d86287565542 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -320,7 +320,7 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	} *args = argv;
 	struct nvkm_device *device = vmm->mmu->subdev.device;
 	struct nvkm_memory *memory = map->memory;
-	u8  kind, priv, ro, vol;
+	u8  kind, kind_inv, priv, ro, vol;
 	int kindn, aper, ret = -ENOSYS;
 	const u8 *kindm;
 
@@ -347,8 +347,8 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	if (WARN_ON(aper < 0))
 		return aper;
 
-	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn);
-	if (kind >= kindn || kindm[kind] == 0xff) {
+	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn, &kind_inv);
+	if (kind >= kindn || kindm[kind] == kind_inv) {
 		VMM_DEBUG(vmm, "kind %02x", kind);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
index c98afe3134ee..2d89e27e8e9e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c
@@ -235,7 +235,7 @@ nv50_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	struct nvkm_device *device = vmm->mmu->subdev.device;
 	struct nvkm_ram *ram = device->fb->ram;
 	struct nvkm_memory *memory = map->memory;
-	u8  aper, kind, comp, priv, ro;
+	u8  aper, kind, kind_inv, comp, priv, ro;
 	int kindn, ret = -ENOSYS;
 	const u8 *kindm;
 
@@ -278,8 +278,8 @@ nv50_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return -EINVAL;
 	}
 
-	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn);
-	if (kind >= kindn || kindm[kind] == 0x7f) {
+	kindm = vmm->mmu->func->kind(vmm->mmu, &kindn, &kind_inv);
+	if (kind >= kindn || kindm[kind] == kind_inv) {
 		VMM_DEBUG(vmm, "kind %02x", kind);
 		return -EINVAL;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

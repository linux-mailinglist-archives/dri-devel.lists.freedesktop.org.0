Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F86B6713A9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12410E69B;
	Wed, 18 Jan 2023 06:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E426610E69C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjQT6ug5vGiLF/xBpRpA85/y/iklQ7iPHa1/Bh9Ff60=;
 b=WOL4QJg2X8p1BF1VdzmjU4c6u1RTKKC/040oVKLCJajqQzKif2yghPMAWr5AcXwz8mv3In
 Fk6U/2OpSw6zYd11EegJlHTuTWxrR7fbsQev4GGPTwCcXFunYrfOeB0fTEsDpM3o1ow97C
 23nHrM1MyQYOMtBglubHMtBo9otCsBI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-uZvJPkdzPaa8GtZwmNW9gg-1; Wed, 18 Jan 2023 01:14:12 -0500
X-MC-Unique: uZvJPkdzPaa8GtZwmNW9gg-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso23191252ejb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjQT6ug5vGiLF/xBpRpA85/y/iklQ7iPHa1/Bh9Ff60=;
 b=C+gxSzRl7jtpzBoyUerzMRZZ4rZomSLw7puy2CaFQYy7VDSlQ/pTRzZT9eBX+HVPwk
 n72pols54sgOhAEDcOw/tfLelGLqLoSH8rnIFlNXcBNmXzFiOKaeUvnN/W2blwWXWws5
 rPreICCtQ7NL9MBNDpXVpP9a6gMHj0h7U+oFkHZeu766dixsQes/9E8B7R/DaIoUxxj7
 5QYj5K7swWb0m9HDNWFo8yTetbWophZzaXpmx+3v8jfvCcG/H9L5sqEZwvYg+AbGhpM9
 A41KsWxk34DYJM83ZYQ1cShsmTxTSJlelsrp3IEf4oSyOBCfACsOl7S7oaJE8yXuA9F9
 UNkg==
X-Gm-Message-State: AFqh2kp6Qu8vY8JABR3k393x+zzDS7TjTv2nLtaTmcTBeKdBCxmwA7MI
 z7+WGGxyle9/LqkB7Sffeos8h1Bs4CEIc7AK1g2hcF2QjiWJ9tKiFYwuj+RX3jL3XesJ3VQjKn4
 7Z6LbZ9Yh9r3IDOOK5c4Cal0P9bUr
X-Received: by 2002:a17:906:1918:b0:7ad:ca80:5669 with SMTP id
 a24-20020a170906191800b007adca805669mr5854857eje.64.1674022450089; 
 Tue, 17 Jan 2023 22:14:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuWfnz6ITxzZ8qF1vuQEIoNm1/OHOeVoK6+PSz1rRUJhncLMnOcYeslOLyw5ktqlUoCIEzD3A==
X-Received: by 2002:a17:906:1918:b0:7ad:ca80:5669 with SMTP id
 a24-20020a170906191800b007adca805669mr5854845eje.64.1674022449837; 
 Tue, 17 Jan 2023 22:14:09 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 kz22-20020a17090777d600b007c1633cea13sm14338638ejc.12.2023.01.17.22.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:09 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 11/14] drm/nouveau: nvkm/vmm: implement raw ops to
 manage uvmm
Date: Wed, 18 Jan 2023 07:12:53 +0100
Message-Id: <20230118061256.2689-12-dakr@redhat.com>
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

The new VM_BIND UAPI uses the DRM GPU VA manager to manage the VA space.
Hence, we a need a way to manipulate the MMUs page tables without going
through the internal range allocator implemented by nvkm/vmm.

This patch adds a raw interface for nvkm/vmm to pass the resposibility
for managing the address space and the corresponding map/unmap/sparse
operations to the upper layers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  23 ++-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  17 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  10 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |   4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  73 +++++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 168 +++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  32 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   3 +
 10 files changed, 319 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 9c7ff56831c5..d30e32fb8628 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -3,7 +3,10 @@
 struct nvif_vmm_v0 {
 	__u8  version;
 	__u8  page_nr;
-	__u8  managed;
+#define NVIF_VMM_V0_TYPE_UNMANAGED                                         0x00
+#define NVIF_VMM_V0_TYPE_MANAGED                                           0x01
+#define NVIF_VMM_V0_TYPE_RAW                                               0x02
+	__u8  type;
 	__u8  pad03[5];
 	__u64 addr;
 	__u64 size;
@@ -17,6 +20,7 @@ struct nvif_vmm_v0 {
 #define NVIF_VMM_V0_UNMAP                                                  0x04
 #define NVIF_VMM_V0_PFNMAP                                                 0x05
 #define NVIF_VMM_V0_PFNCLR                                                 0x06
+#define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
 struct nvif_vmm_page_v0 {
@@ -66,6 +70,23 @@ struct nvif_vmm_unmap_v0 {
 	__u64 addr;
 };
 
+struct nvif_vmm_raw_v0 {
+	__u8 version;
+#define NVIF_VMM_RAW_V0_MAP	0x0
+#define NVIF_VMM_RAW_V0_UNMAP	0x1
+#define NVIF_VMM_RAW_V0_SPARSE	0x2
+	__u8  op;
+	__u8  sparse;
+	__u8  ref;
+	__u8  pad04[4];
+	__u64 addr;
+	__u64 size;
+	__u64 offset;
+	__u64 memory;
+	__u64 handle;
+	__u8  data[];
+};
+
 struct nvif_vmm_pfnmap_v0 {
 	__u8  version;
 	__u8  page;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index a2ee92201ace..4d0781740336 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -4,6 +4,12 @@
 struct nvif_mem;
 struct nvif_mmu;
 
+enum nvif_vmm_type {
+	UNMANAGED,
+	MANAGED,
+	RAW,
+};
+
 enum nvif_vmm_get {
 	ADDR,
 	PTES,
@@ -30,8 +36,9 @@ struct nvif_vmm {
 	int page_nr;
 };
 
-int nvif_vmm_ctor(struct nvif_mmu *, const char *name, s32 oclass, bool managed,
-		  u64 addr, u64 size, void *argv, u32 argc, struct nvif_vmm *);
+int nvif_vmm_ctor(struct nvif_mmu *, const char *name, s32 oclass,
+		  enum nvif_vmm_type, u64 addr, u64 size, void *argv, u32 argc,
+		  struct nvif_vmm *);
 void nvif_vmm_dtor(struct nvif_vmm *);
 int nvif_vmm_get(struct nvif_vmm *, enum nvif_vmm_get, bool sparse,
 		 u8 page, u8 align, u64 size, struct nvif_vma *);
@@ -39,4 +46,10 @@ void nvif_vmm_put(struct nvif_vmm *, struct nvif_vma *);
 int nvif_vmm_map(struct nvif_vmm *, u64 addr, u64 size, void *argv, u32 argc,
 		 struct nvif_mem *, u64 offset);
 int nvif_vmm_unmap(struct nvif_vmm *, u64);
+int nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 handle, bool sparse);
+int nvif_vmm_raw_map(struct nvif_vmm *vmm, u64 addr, u64 size,
+		     void *argv, u32 argc,
+		     struct nvif_mem *mem, u64 offset,
+		     u64 *handle);
+int nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 70e7887ef4b4..ec284c1792b3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -31,6 +31,16 @@ struct nvkm_vmm {
 
 	u64 start;
 	u64 limit;
+	struct {
+		struct {
+			u64 addr;
+			u64 size;
+		} p;
+		struct {
+			u64 addr;
+			u64 size;
+		} n;
+	} managed;
 
 	struct nvkm_vmm_pt *pd;
 	struct list_head join;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..186351ecf72f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -350,7 +350,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	 * VMM instead of the standard one.
 	 */
 	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm",
-			    cli->vmm.vmm.object.oclass, true,
+			    cli->vmm.vmm.object.oclass, MANAGED,
 			    args->unmanaged_addr, args->unmanaged_size,
 			    &(struct gp100_vmm_v0) {
 				.fault_replay = true,
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 67d6619fcd5e..a6602c012671 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -128,8 +128,8 @@ nouveau_vmm_fini(struct nouveau_vmm *vmm)
 int
 nouveau_vmm_init(struct nouveau_cli *cli, s32 oclass, struct nouveau_vmm *vmm)
 {
-	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", oclass, false, PAGE_SIZE,
-				0, NULL, 0, &vmm->vmm);
+	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", oclass, UNMANAGED,
+				PAGE_SIZE, 0, NULL, 0, &vmm->vmm);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 6053d6dc2184..a0ca5329b3ef 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -104,6 +104,63 @@ nvif_vmm_get(struct nvif_vmm *vmm, enum nvif_vmm_get type, bool sparse,
 	return ret;
 }
 
+int
+nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 handle, bool sparse)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_UNMAP,
+		.handle = handle,
+		.sparse = sparse,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
+int
+nvif_vmm_raw_map(struct nvif_vmm *vmm, u64 addr, u64 size, void *argv, u32 argc,
+		 struct nvif_mem *mem, u64 offset, u64 *handle)
+{
+	struct nvif_vmm_raw_v0 *args;
+	int ret;
+
+	if (!(args = kzalloc(sizeof(*args) + argc, GFP_KERNEL)))
+		return -ENOMEM;
+
+	args->version = 0;
+	args->op = NVIF_VMM_RAW_V0_MAP;
+	args->addr = addr;
+	args->size = size;
+	args->memory = nvif_handle(&mem->object);
+	args->offset = offset;
+	memcpy(args->data, argv, argc);
+
+	ret = nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+			       args, sizeof(*args) + argc);
+
+	if (likely(!ret))
+		*handle = args->handle;
+
+	kfree(args);
+	return ret;
+}
+
+int
+nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref)
+{
+	struct nvif_vmm_raw_v0 args = {
+		.version = 0,
+		.op = NVIF_VMM_RAW_V0_SPARSE,
+		.addr = addr,
+		.size = size,
+		.ref = ref,
+	};
+
+	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
+				&args, sizeof(args));
+}
+
 void
 nvif_vmm_dtor(struct nvif_vmm *vmm)
 {
@@ -112,8 +169,9 @@ nvif_vmm_dtor(struct nvif_vmm *vmm)
 }
 
 int
-nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, bool managed,
-	      u64 addr, u64 size, void *argv, u32 argc, struct nvif_vmm *vmm)
+nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
+	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
+	      struct nvif_vmm *vmm)
 {
 	struct nvif_vmm_v0 *args;
 	u32 argn = sizeof(*args) + argc;
@@ -125,9 +183,18 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, bool managed,
 	if (!(args = kmalloc(argn, GFP_KERNEL)))
 		return -ENOMEM;
 	args->version = 0;
-	args->managed = managed;
 	args->addr = addr;
 	args->size = size;
+
+	switch (type) {
+	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
+	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
+	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
 	memcpy(args->data, argv, argc);
 
 	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifVmm", 0,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 524cd3c0e3fe..c9fac5654baf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -42,6 +42,26 @@ nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
 	return nvkm_vmm_ref(nvkm_uvmm(object)->vmm);
 }
 
+static bool
+nvkm_uvmm_in_managed_range(struct nvkm_uvmm *uvmm, u64 start, u64 size)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+
+	u64 p_start = vmm->managed.p.addr;
+	u64 p_end = p_start + vmm->managed.p.size;
+	u64 n_start = vmm->managed.n.addr;
+	u64 n_end = n_start + vmm->managed.n.size;
+	u64 end = start + size;
+
+	if (start >= p_start && end <= p_end)
+		return true;
+
+	if (start >= n_start && end <= n_end)
+		return true;
+
+	return false;
+}
+
 static int
 nvkm_uvmm_mthd_pfnclr(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 {
@@ -58,6 +78,9 @@ nvkm_uvmm_mthd_pfnclr(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_uvmm_in_managed_range(uvmm, addr, size) && uvmm->raw)
+		return -EINVAL;
+
 	if (size) {
 		mutex_lock(&vmm->mutex);
 		ret = nvkm_vmm_pfn_unmap(vmm, addr, size);
@@ -88,6 +111,9 @@ nvkm_uvmm_mthd_pfnmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_uvmm_in_managed_range(uvmm, addr, size) && uvmm->raw)
+		return -EINVAL;
+
 	if (size) {
 		mutex_lock(&vmm->mutex);
 		ret = nvkm_vmm_pfn_map(vmm, page, addr, size, phys);
@@ -113,6 +139,9 @@ nvkm_uvmm_mthd_unmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_uvmm_in_managed_range(uvmm, addr, 0) && uvmm->raw)
+		return -EINVAL;
+
 	mutex_lock(&vmm->mutex);
 	vma = nvkm_vmm_node_search(vmm, addr);
 	if (ret = -ENOENT, !vma || vma->addr != addr) {
@@ -159,6 +188,9 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	} else
 		return ret;
 
+	if (nvkm_uvmm_in_managed_range(uvmm, addr, size) && uvmm->raw)
+		return -EINVAL;
+
 	memory = nvkm_umem_search(client, handle);
 	if (IS_ERR(memory)) {
 		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
@@ -314,6 +346,131 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args,
+		       void *argv, u32 argc)
+{
+	struct nvkm_client *client = uvmm->object.client;
+	u64 addr, size, handle, offset;
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	struct nvkm_vma *vma;
+	struct nvkm_memory *memory;
+	int ret;
+
+	addr = args->addr;
+	size = args->size;
+	handle = args->memory;
+	offset = args->offset;
+
+	if (!nvkm_uvmm_in_managed_range(uvmm, addr, size))
+		return -EINVAL;
+
+	memory = nvkm_umem_search(client, handle);
+	if (IS_ERR(memory)) {
+		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
+		return PTR_ERR(memory);
+	}
+
+	vma = nvkm_vma_new(addr, size);
+	if (!vma)
+		return -ENOMEM;
+
+	vma->mapref = true;
+	vma->used = true;
+
+	mutex_lock(&vmm->mutex);
+	if (ret = -ENOENT, vma->busy) {
+		VMM_DEBUG(vmm, "denied %016llx: %d", addr, vma->busy);
+		goto fail;
+	}
+	vma->busy = true;
+	mutex_unlock(&vmm->mutex);
+
+	ret = nvkm_memory_map(memory, offset, vmm, vma, argv, argc);
+	if (ret == 0) {
+		/* Successful map will clear vma->busy. */
+		args->handle = (u64)(uintptr_t)vma;
+		nvkm_memory_unref(&memory);
+		return 0;
+	}
+
+	mutex_lock(&vmm->mutex);
+	nvkm_memory_tags_put(vma->memory, vmm->mmu->subdev.device, &vma->tags);
+	nvkm_memory_unref(&vma->memory);
+	kfree(vma);
+fail:
+	mutex_unlock(&vmm->mutex);
+	nvkm_memory_unref(&memory);
+	return ret;
+}
+
+static int
+nvkm_uvmm_mthd_raw_unmap(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	struct nvkm_vma *vma;
+
+	vma = (struct nvkm_vma *)args->handle;
+	if (!vma)
+		return -EINVAL;
+
+	mutex_lock(&vmm->mutex);
+	if (vma->busy) {
+		VMM_DEBUG(vmm, "denied %016llx: %d", vma->addr, vma->busy);
+		mutex_unlock(&vmm->mutex);
+		return -ENOENT;
+	}
+	vma->sparse = args->sparse;
+	nvkm_vmm_raw_unmap_locked(vmm, vma);
+	mutex_unlock(&vmm->mutex);
+
+	args->handle = 0;
+	kfree(vma);
+	return 0;
+}
+
+static int
+nvkm_uvmm_mthd_raw_sparse(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+	int ret;
+
+	if (!nvkm_uvmm_in_managed_range(uvmm, args->addr, args->size))
+		return -EINVAL;
+
+	mutex_lock(&vmm->mutex);
+	ret = nvkm_vmm_raw_sparse_locked(vmm, args->addr, args->size, args->ref);
+	mutex_unlock(&vmm->mutex);
+
+	return ret;
+}
+
+static int
+nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+{
+	union {
+		struct nvif_vmm_raw_v0 v0;
+	} *args = argv;
+	int ret = -ENOSYS;
+
+	if (!uvmm->raw)
+		return -EINVAL;
+
+	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true)))
+		return ret;
+
+	switch (args->v0.op) {
+	case NVIF_VMM_RAW_V0_MAP:
+		return nvkm_uvmm_mthd_raw_map(uvmm, &args->v0, argv, argc);
+	case NVIF_VMM_RAW_V0_UNMAP:
+		return nvkm_uvmm_mthd_raw_unmap(uvmm, &args->v0);
+	case NVIF_VMM_RAW_V0_SPARSE:
+		return nvkm_uvmm_mthd_raw_sparse(uvmm, &args->v0);
+	default:
+		return -EINVAL;
+	};
+}
+
 static int
 nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
@@ -326,6 +483,7 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	case NVIF_VMM_V0_UNMAP : return nvkm_uvmm_mthd_unmap (uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNMAP: return nvkm_uvmm_mthd_pfnmap(uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNCLR: return nvkm_uvmm_mthd_pfnclr(uvmm, argv, argc);
+	case NVIF_VMM_V0_RAW   : return nvkm_uvmm_mthd_raw   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MTHD(0x00) ... NVIF_VMM_V0_MTHD(0x7f):
 		if (uvmm->vmm->func->mthd) {
 			return uvmm->vmm->func->mthd(uvmm->vmm,
@@ -366,10 +524,11 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	struct nvkm_uvmm *uvmm;
 	int ret = -ENOSYS;
 	u64 addr, size;
-	bool managed;
+	bool managed, raw;
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, more))) {
-		managed = args->v0.managed != 0;
+		managed = args->v0.type == NVIF_VMM_V0_TYPE_MANAGED;
+		raw = args->v0.type == NVIF_VMM_V0_TYPE_RAW;
 		addr = args->v0.addr;
 		size = args->v0.size;
 	} else
@@ -377,12 +536,13 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 	if (!(uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL)))
 		return -ENOMEM;
+	uvmm->raw = raw;
 	nvkm_object_ctor(&nvkm_uvmm, oclass, &uvmm->object);
 	*pobject = &uvmm->object;
 
 	if (!mmu->vmm) {
-		ret = mmu->func->vmm.ctor(mmu, managed, addr, size, argv, argc,
-					  NULL, "user", &uvmm->vmm);
+		ret = mmu->func->vmm.ctor(mmu, managed || raw, addr, size,
+					  argv, argc, NULL, "user", &uvmm->vmm);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
index 71dab55e18a9..7f6fb1fb46bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
@@ -7,6 +7,7 @@
 struct nvkm_uvmm {
 	struct nvkm_object object;
 	struct nvkm_vmm *vmm;
+	bool raw;
 };
 
 int nvkm_uvmm_new(const struct nvkm_oclass *, void *argv, u32 argc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index ae793f400ba1..255ab920cb15 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -744,7 +744,7 @@ nvkm_vmm_ptes_get(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 	return 0;
 }
 
-static inline struct nvkm_vma *
+struct nvkm_vma *
 nvkm_vma_new(u64 addr, u64 size)
 {
 	struct nvkm_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
@@ -1101,6 +1101,9 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 		if (addr && (ret = nvkm_vmm_ctor_managed(vmm, 0, addr)))
 			return ret;
 
+		vmm->managed.p.addr = 0;
+		vmm->managed.p.size = addr;
+
 		/* NVKM-managed area. */
 		if (size) {
 			if (!(vma = nvkm_vma_new(addr, size)))
@@ -1114,6 +1117,9 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 		size = vmm->limit - addr;
 		if (size && (ret = nvkm_vmm_ctor_managed(vmm, addr, size)))
 			return ret;
+
+		vmm->managed.n.addr = addr;
+		vmm->managed.n.size = size;
 	} else {
 		/* Address-space fully managed by NVKM, requiring calls to
 		 * nvkm_vmm_get()/nvkm_vmm_put() to allocate address-space.
@@ -1326,6 +1332,19 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 	return 0;
 }
 
+void
+nvkm_vmm_raw_unmap_locked(struct nvkm_vmm *vmm, struct nvkm_vma *vma)
+{
+	const struct nvkm_vmm_page *page = &vmm->func->page[vma->refd];
+
+	nvkm_vmm_ptes_unmap_put(vmm, page, vma->addr, vma->size, vma->sparse, false);
+	vma->refd = NVKM_VMA_PAGE_NONE;
+
+	nvkm_memory_tags_put(vma->memory, vmm->mmu->subdev.device, &vma->tags);
+	nvkm_memory_unref(&vma->memory);
+	vma->mapped = false;
+}
+
 void
 nvkm_vmm_unmap_region(struct nvkm_vmm *vmm, struct nvkm_vma *vma)
 {
@@ -1775,6 +1794,17 @@ nvkm_vmm_get(struct nvkm_vmm *vmm, u8 page, u64 size, struct nvkm_vma **pvma)
 	return ret;
 }
 
+int nvkm_vmm_raw_sparse_locked(struct nvkm_vmm *vmm, u64 addr, u64 size, bool ref)
+{
+	int ret;
+
+	ret = nvkm_vmm_ptes_sparse(vmm, addr, size, ref);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 void
 nvkm_vmm_part(struct nvkm_vmm *vmm, struct nvkm_memory *inst)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index f6188aa9171c..7bb1905b70f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -163,6 +163,7 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
 		  u32 pd_header, bool managed, u64 addr, u64 size,
 		  struct lock_class_key *, const char *name,
 		  struct nvkm_vmm **);
+struct nvkm_vma *nvkm_vma_new(u64 addr, u64 size);
 struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
 struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
 				     u64 addr, u64 size);
@@ -172,6 +173,8 @@ int nvkm_vmm_get_locked(struct nvkm_vmm *, bool getref, bool mapref,
 void nvkm_vmm_put_locked(struct nvkm_vmm *, struct nvkm_vma *);
 void nvkm_vmm_unmap_locked(struct nvkm_vmm *, struct nvkm_vma *, bool pfn);
 void nvkm_vmm_unmap_region(struct nvkm_vmm *, struct nvkm_vma *);
+void nvkm_vmm_raw_unmap_locked(struct nvkm_vmm *vmm, struct nvkm_vma *vma);
+int nvkm_vmm_raw_sparse_locked(struct nvkm_vmm *, u64 addr, u64 size, bool ref);
 
 #define NVKM_VMM_PFN_ADDR                                 0xfffffffffffff000ULL
 #define NVKM_VMM_PFN_ADDR_SHIFT                                              12
-- 
2.39.0


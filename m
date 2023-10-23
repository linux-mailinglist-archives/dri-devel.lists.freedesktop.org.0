Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A07D40B0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961410E23B;
	Mon, 23 Oct 2023 20:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92310E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FD3hNS4lVu6ICJ/H/yivP4f39flTbICE8fR7cEiOx8M=;
 b=fJW1iSUyfvvoFQwr/GMc1d+VADuYlr8Z5rEYpOSoBBDiFR1hNRhnF+kCaQAe22uEjRf2Er
 1DsJ7UDenRv0B1lrDcqvjYx1YKUDb5E7zBBsq1CbixndwVh+ROLhyMKzCnNLfOM0YlGtUX
 sY33SX5+RJ3cOYXFvzdTCSRREDvPdfc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-JubiSk06N7ubeMAtZTIhJQ-1; Mon, 23 Oct 2023 16:17:13 -0400
X-MC-Unique: JubiSk06N7ubeMAtZTIhJQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ae0bf9c0a9so235764966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092232; x=1698697032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FD3hNS4lVu6ICJ/H/yivP4f39flTbICE8fR7cEiOx8M=;
 b=iUHE07uxxr+7YihTM8thw+fhffvNaumrLqwY3PVgQiTD0As6quk1aG4QlE773t+FDc
 FZYVgtboYYGz3V5/Bg8JREGH0Or7LtQcKJlWCJWo3SMAgmrgBICdURioh7hrlIZf83Ss
 y1NuBNMYyC8WtcxyTWv6UQ2MmAmsfZ+T9Ix4ct7CZ58Ia6pDznZpBPV1l1PRVNo6vrDb
 gQLXaXisQsrXzGYy4bHIOp3RuRBOgkT6IS/UYUXZEvmeR00lHNrBG8XCI2AEfgmxlhDe
 eYTb+4CTEDbFcIBRdOv4k6uiQuh46MLxj6YhlgGsqbw5ZuRH/giGV4Ul5dW7Lcq62SxI
 XBEA==
X-Gm-Message-State: AOJu0Yyb3ICaJKwgd/d8y2tNnq9kELPP5Plz2tn6K6VT9kIBuXhe4AVO
 l75TsAZuYbO9hqmkm7H62LqQcinZxBmi9FcywZ2qHVs1RFz98RMsR8ImSAoEGUionVzyK2d3qvT
 UUEy/vzGdzh5/ILk5WjJk/alR/Gpc
X-Received: by 2002:a17:906:ee8a:b0:9c7:4e5d:12c5 with SMTP id
 wt10-20020a170906ee8a00b009c74e5d12c5mr7468010ejb.61.1698092231793; 
 Mon, 23 Oct 2023 13:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjov/sRAgPfvwizPCtBCA/DLsjEDiY2Uu6xT6fbcRBlw81tzAPNcG0AF9fVcg7hwErZTBemQ==
X-Received: by 2002:a17:906:ee8a:b0:9c7:4e5d:12c5 with SMTP id
 wt10-20020a170906ee8a00b009c74e5d12c5mr7468000ejb.61.1698092231498; 
 Mon, 23 Oct 2023 13:17:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a170907271500b009ad81554c1bsm7083485ejk.55.2023.10.23.13.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v7 2/7] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Date: Mon, 23 Oct 2023 22:16:48 +0200
Message-ID: <20231023201659.25332-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide a common dma-resv for GEM objects not being used outside of this
GPU-VM. This is used in a subsequent patch to generalize dma-resv,
external and evicted object handling and GEM validation.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 ++++++-
 include/drm/drm_gpuvm.h                | 33 ++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d7367a202fee..b9742742a0e8 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -61,6 +61,15 @@
  * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
  * entries from within dma-fence signalling critical sections it is enough to
  * pre-allocate the &drm_gpuva structures.
+ *
+ * &drm_gem_objects which are private to a single VM can share a common
+ * &dma_resv in order to improve locking efficiency (e.g. with &drm_exec).
+ * For this purpose drivers must pass a &drm_gem_object to drm_gpuvm_init(), in
+ * the following called 'resv object', which serves as the container of the
+ * GPUVM's shared &dma_resv. This resv object can be a driver specific
+ * &drm_gem_object, such as the &drm_gem_object containing the root page table,
+ * but it can also be a 'dummy' object, which can be allocated with
+ * drm_gpuvm_resv_object_alloc().
  */
 
 /**
@@ -652,11 +661,49 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
 
+static void
+drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
+{
+	drm_gem_object_release(obj);
+	kfree(obj);
+}
+
+static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
+	.free = drm_gpuvm_gem_object_free,
+};
+
+/**
+ * drm_gpuvm_resv_object_alloc() - allocate a dummy &drm_gem_object
+ * @drm: the drivers &drm_device
+ *
+ * Allocates a dummy &drm_gem_object which can be passed to drm_gpuvm_init() in
+ * order to serve as root GEM object providing the &drm_resv shared across
+ * &drm_gem_objects local to a single GPUVM.
+ *
+ * Returns: the &drm_gem_object on success, NULL on failure
+ */
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm)
+{
+	struct drm_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return NULL;
+
+	obj->funcs = &drm_gpuvm_object_funcs;
+	drm_gem_private_object_init(drm, obj, 0);
+
+	return obj;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
+
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
  * @drm: the &drm_device this VM resides in
+ * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -671,6 +718,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	       struct drm_device *drm,
+	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -681,6 +729,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
+	gpuvm->r_obj = r_obj;
+
+	drm_gem_object_get(r_obj);
 
 	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
@@ -715,6 +766,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 		 "GPUVA tree is not empty, potentially leaking memory.\n");
+
+	drm_gem_object_put(gpuvm->r_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..b4e7d662961a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1809,8 +1809,9 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
 	struct drm_device *drm = cli->drm->dev;
-	int ret;
+	struct drm_gem_object *r_obj;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	int ret;
 
 	mutex_init(&uvmm->mutex);
 	dma_resv_init(&uvmm->resv);
@@ -1834,14 +1835,22 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
+	r_obj = drm_gpuvm_resv_object_alloc(drm);
+	if (!r_obj) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm,
+	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
 		       NULL);
+	/* GPUVM takes care from here on. */
+	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 687fd5893624..5f43a224d0f4 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -244,10 +244,16 @@ struct drm_gpuvm {
 	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuvm_ops *ops;
+
+	/**
+	 * @r_obj: Resv GEM object; representing the GPUVM's common &dma_resv.
+	 */
+	struct drm_gem_object *r_obj;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    struct drm_device *drm,
+		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
@@ -255,6 +261,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm);
+
+/**
+ * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
+ */
+#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
+
+/**
+ * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding the &drm_gpuvm's
+ * &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gem_object holding the &drm_gpuvm's shared
+ * &dma_resv
+ */
+#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
+
+#define drm_gpuvm_resv_held(gpuvm__) \
+	dma_resv_held(drm_gpuvm_resv(gpuvm__))
+
+#define drm_gpuvm_resv_assert_held(gpuvm__) \
+	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
-- 
2.41.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391547DE8ED
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386C610E7E7;
	Wed,  1 Nov 2023 23:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0F10E7EA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrqtmRv09TQhKlPPw+IOPHKwAPbXmQstmKJsYeBQBoE=;
 b=cYwQUQSdNgmhTyusxCxXSkDu+UHDJSofxbHZ2ZTWi2bkmzz1Ywl9kqtwikIL/dGqqa9Y45
 iKho1EC0OWoqcFFlfR1o0721IFcul4+K86mSyTozuuaUeA8mApkEmx+K7oGhO4gK2fknYK
 5WqNxLL7n642djbe6XfuTGCpjX4SYrQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-L1XMw8I6NeOKACW7pQIkMw-1; Wed, 01 Nov 2023 19:31:38 -0400
X-MC-Unique: L1XMw8I6NeOKACW7pQIkMw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53dfe3af1b9so190252a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881497; x=1699486297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VrqtmRv09TQhKlPPw+IOPHKwAPbXmQstmKJsYeBQBoE=;
 b=R05BsvzYoE/iwYe7cM00pO5Cx6jgYBZs1oZcjg0fWi7M3qsEWscCHfRKjbIoz8pSH3
 ETG+oJVxt70cJt3r/JvAtBO5YwriGi7kSpD23vOpgIY+d2AOZ43UAg1Llt4rHlvgPtsE
 fMFn13ZSG4+Sa7s6lRZVM+dCvm9tjvZWd+hkgh9yKTyv4DxBLroD37m+u6Gyr+ZuHlhp
 Ay0uWNCKMPscKwJDqo/hU5TkYGX6mvuSPKzxLanN5fO1tiPm0KeZHqRXaTA7pjIyEvPM
 yXvXFuEqQm89fcaY2dCk5NeaC7uh4KT45Nms3uAuM9Mr+6KfADQxAYIqZCspr+RSGzuK
 9NUg==
X-Gm-Message-State: AOJu0YyP3Dnm+mDWRUvajpOxgHpOYNj8gsZ7Ghpf8W5MKmNrF3ThbXAU
 +sUPKXjniv4FugObLdmKAJUoGy+jytD6TDCOvGLdjTqW6eLq3sbPR7GLDCUXnprBidAafEWLldP
 fVst//tCe4by77/rrC2E8maPTCvRc
X-Received: by 2002:a17:907:5cd:b0:9d5:7c41:ccf6 with SMTP id
 wg13-20020a17090705cd00b009d57c41ccf6mr3146526ejb.26.1698881497567; 
 Wed, 01 Nov 2023 16:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUqq/wRZ3wp4IJtYm5bWqzL1FFZNVnHWCIF6hxU0mlvyL3MGSg7xCmp/J5/ji50OFueDWXpQ==
X-Received: by 2002:a17:907:5cd:b0:9d5:7c41:ccf6 with SMTP id
 wg13-20020a17090705cd00b009d57c41ccf6mr3146519ejb.26.1698881497329; 
 Wed, 01 Nov 2023 16:31:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rn25-20020a170906d93900b00992e94bcfabsm449425ejb.167.2023.11.01.16.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 05/12] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Date: Thu,  2 Nov 2023 00:30:57 +0100
Message-ID: <20231101233113.8059-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 ++++++-
 include/drm/drm_gpuvm.h                | 33 ++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 2669f9bbc377..af5805e4d7c9 100644
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
@@ -670,11 +679,49 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
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
@@ -689,6 +736,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	       struct drm_device *drm,
+	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -699,6 +747,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
+	gpuvm->r_obj = r_obj;
+
+	drm_gem_object_get(r_obj);
 
 	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
@@ -733,6 +784,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 		 "GPUVA tree is not empty, potentially leaking memory.\n");
+
+	drm_gem_object_put(gpuvm->r_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 641a911528db..f74bf30bc683 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1797,8 +1797,9 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
 	struct drm_device *drm = cli->drm->dev;
-	int ret;
+	struct drm_gem_object *r_obj;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	int ret;
 
 	mutex_init(&uvmm->mutex);
 	dma_resv_init(&uvmm->resv);
@@ -1822,11 +1823,19 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm,
+	r_obj = drm_gpuvm_resv_object_alloc(drm);
+	if (!r_obj) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
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
index 13eac6f70061..ff3377cbfe52 100644
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
@@ -256,6 +262,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC957DE8F6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF7210E7F1;
	Wed,  1 Nov 2023 23:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EB510E7F1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juQeCGfPWswDlP+Z0KdUDVDRgyhQp0+hsdRA02TinWo=;
 b=G8k6xlNebz9o7F9QUF8gQAmp3MxMMp0PvjYr4C49moODblEOy6MQeC32WfrHpPJ74AsgKK
 1J5qFxuvzSUTkGCTUaG+PfCG7IsSUgWUVwefGQ8cox6p3lKjfA8QFBe0j3/4jkt5bozdn1
 P3Celyk4j5MYTrUjNJoad0p4zoyuKIo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-zuwwZ1dTNf6DXl_nEcrbcw-1; Wed, 01 Nov 2023 19:31:54 -0400
X-MC-Unique: zuwwZ1dTNf6DXl_nEcrbcw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9c7558b89ccso18204466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881513; x=1699486313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juQeCGfPWswDlP+Z0KdUDVDRgyhQp0+hsdRA02TinWo=;
 b=v6gdBmeHX2h7DioSmXSj5KgM7IwlfAp+hWD6ed7VrhkeMik2G9NwYQwxHUkCr6UR/l
 t+fqcIVOrfTbxOBEn7TsaGIEMNK/FVPy+TfDdSoMEtLqWc6oUXZvtXMC++8nq/PWPmH6
 ejKogMuvKaBQmzuXOEN64SBgEpZQHPOZIF/NrURw528oTu9M3MG8bq3AoW3uFwVpUX9O
 y2Vg41E1eI927C4rxbZXCCrvLAUqwNVYd8Xbb3JZGgGklXYXs9bZC9CRpaTJXG7FdM0P
 +ema+IXBouC+QzZ/vKA9+k/MGiaf2f/cahVjOm6PpmLyQYjidUWdOEzKdHUI5j0LxWn+
 oEpg==
X-Gm-Message-State: AOJu0Yz1HRvX9jhd5Dwv3sxm8uqVuLWvBqSe79KqJb6VNpbXuBYzGHAz
 cUiq9BdplEZhpK8F7qMHRr0T1TI6MfsN24EoiX62Un/UNFCVMd1276nd9V3rk6a0kurl79Y12fd
 89JfrbEvIoJ1wxlk5Mn5BiLsVv/jZ
X-Received: by 2002:a17:907:7da6:b0:9a9:ef41:e5c7 with SMTP id
 oz38-20020a1709077da600b009a9ef41e5c7mr3738003ejc.8.1698881513210; 
 Wed, 01 Nov 2023 16:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3haPe7UuyYPxTUThuUD/4vMv9tfXO+2VXpt9Qcm8NUJqbE6A1CQ8Urtch+YYcdlVqRZEpYw==
X-Received: by 2002:a17:907:7da6:b0:9a9:ef41:e5c7 with SMTP id
 oz38-20020a1709077da600b009a9ef41e5c7mr3737989ejc.8.1698881512969; 
 Wed, 01 Nov 2023 16:31:52 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a170906a29100b00992e265495csm456222ejz.212.2023.11.01.16.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count drm_gpuvm
 structures
Date: Thu,  2 Nov 2023 00:31:01 +0100
Message-ID: <20231101233113.8059-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
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

Implement reference counting for struct drm_gpuvm.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
 include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
 3 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 53e2c406fb04..6a88eafc5229 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	kref_init(&gpuvm->kref);
+
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->flags = flags;
 	gpuvm->ops = ops;
@@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
-/**
- * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
- * @gpuvm: pointer to the &drm_gpuvm to clean up
- *
- * Note that it is a bug to call this function on a manager that still
- * holds GPU VA mappings.
- */
-void
-drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
+static void
+drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 {
 	gpuvm->name = NULL;
 
@@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
+
+static void
+drm_gpuvm_free(struct kref *kref)
+{
+	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
+
+	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
+		return;
+
+	drm_gpuvm_fini(gpuvm);
+
+	gpuvm->ops->vm_free(gpuvm);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to release the reference of
+ *
+ * This releases a reference to @gpuvm.
+ */
+void
+drm_gpuvm_put(struct drm_gpuvm *gpuvm)
+{
+	if (gpuvm)
+		kref_put(&gpuvm->kref, drm_gpuvm_free);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
@@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
 		return -EINVAL;
 
-	return __drm_gpuva_insert(gpuvm, va);
+	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_insert);
 
@@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	}
 
 	__drm_gpuva_remove(va);
+	drm_gpuvm_put(va->vm);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 54be12c1272f..cb2f06565c46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 	}
 }
 
+static void
+nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
+{
+	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
+
+	kfree(uvmm);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+	.vm_free = nouveau_uvmm_free,
+};
+
 int
 nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 			   void *data,
@@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,
 		       init->kernel_managed_size,
-		       NULL);
+		       &gpuvm_ops);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
@@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	return 0;
 
 out_gpuvm_fini:
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0c2e24155a93..4e6e1fd3485a 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -247,6 +247,11 @@ struct drm_gpuvm {
 		struct list_head list;
 	} rb;
 
+	/**
+	 * @kref: reference count of this object
+	 */
+	struct kref kref;
+
 	/**
 	 * @kernel_alloc_node:
 	 *
@@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
+
+/**
+ * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to acquire the reference of
+ *
+ * This function acquires an additional reference to @gpuvm. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm *
+drm_gpuvm_get(struct drm_gpuvm *gpuvm)
+{
+	kref_get(&gpuvm->kref);
+
+	return gpuvm;
+}
+
+void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
 
 bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
@@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
  * operations to drivers.
  */
 struct drm_gpuvm_ops {
+	/**
+	 * @vm_free: called when the last reference of a struct drm_gpuvm is
+	 * dropped
+	 *
+	 * This callback is mandatory.
+	 */
+	void (*vm_free)(struct drm_gpuvm *gpuvm);
+
 	/**
 	 * @op_alloc: called when the &drm_gpuvm allocates
 	 * a struct drm_gpuva_op
-- 
2.41.0


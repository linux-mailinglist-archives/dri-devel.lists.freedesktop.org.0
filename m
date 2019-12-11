Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45F11A5BB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EB16EA8D;
	Wed, 11 Dec 2019 08:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9706EA92
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576052299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSCatYr1K7gbKR20Rl2b+FcJa0Soyo5HWbQNxR4Y05o=;
 b=SX9oIWXinpXaLXvbSeIbXvUnpW482IBgsHZXzuDQ71NCiTfQS6FFHhjO/HEhtNNgCu2OjD
 MxqH5VkAOkkPmqBY/TFBWvZH4FKuPkwhs6PG35dO/LKzbSVM/cmyMtBGSPJBik3+FRjYVp
 4f8FdjMTUD/6abTeqjLVogoYiBRD2iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-8paW8KCSOO-xypeXDDW1kw-1; Wed, 11 Dec 2019 03:18:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFEF7800D41;
 Wed, 11 Dec 2019 08:18:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B1F5C1B0;
 Wed, 11 Dec 2019 08:18:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C084D16E2D; Wed, 11 Dec 2019 09:18:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
Date: Wed, 11 Dec 2019 09:18:09 +0100
Message-Id: <20191211081810.20079-2-kraxel@redhat.com>
In-Reply-To: <20191211081810.20079-1-kraxel@redhat.com>
References: <20191211081810.20079-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 8paW8KCSOO-xypeXDDW1kw-1
X-Mimecast-Spam-Score: 0
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add caching field to drm_gem_shmem_object to specify the cachine
attributes for mappings.  Add helper function to tweak pgprot
accordingly.  Switch vmap and mmap functions to the new helper.

Set caching to write-combine when creating the object so behavior
doesn't change by default.  Drivers can override that later if
needed.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/drm/drm_gem_shmem_helper.h     | 12 ++++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c | 24 +++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6748379a0b44..9d6e02c6205f 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -17,6 +17,11 @@ struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
 
+enum drm_gem_shmem_caching {
+	DRM_GEM_SHMEM_CACHED = 1,
+	DRM_GEM_SHMEM_WC,
+};
+
 /**
  * struct drm_gem_shmem_object - GEM object backed by shmem
  */
@@ -83,6 +88,11 @@ struct drm_gem_shmem_object {
 	 * The address are un-mapped when the count reaches zero.
 	 */
 	unsigned int vmap_use_count;
+
+	/**
+	 * @caching: caching attributes for mappings.
+	 */
+	enum drm_gem_shmem_caching caching;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
@@ -130,6 +140,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj);
 
+pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pgprot_t prot);
+
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
  *
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a421a2eed48a..5bb94e130a50 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -76,6 +76,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 	mutex_init(&shmem->pages_lock);
 	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
+	shmem->caching = DRM_GEM_SHMEM_WC;
 
 	/*
 	 * Our buffers are kept pinned, so allocating them
@@ -256,9 +257,11 @@ static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem)
 
 	if (obj->import_attach)
 		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
-	else
+	else {
+		pgprot_t prot = drm_gem_shmem_caching(shmem, PAGE_KERNEL);
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
-				    VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+				    VM_MAP, prot);
+	}
 
 	if (!shmem->vaddr) {
 		DRM_DEBUG_KMS("Failed to vmap pages\n");
@@ -540,7 +543,8 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	}
 
 	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = drm_gem_shmem_caching(shmem, vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	vma->vm_ops = &drm_gem_shmem_vm_ops;
 
@@ -683,3 +687,17 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
+
+pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pgprot_t prot)
+{
+	switch (shmem->caching) {
+	case DRM_GEM_SHMEM_CACHED:
+		return prot;
+	case DRM_GEM_SHMEM_WC:
+		return pgprot_writecombine(prot);
+	default:
+		WARN_ON_ONCE(1);
+		return prot;
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_caching);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

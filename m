Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25084A5036D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478A10E7C2;
	Wed,  5 Mar 2025 15:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="McYKGNOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195010E7C2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741188416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPtUDuBhtdSX6GhOg+XQnbMK00oSmP61u2YCpHroymk=;
 b=McYKGNOQVKe2+FRlPu2CimJjHwuvxpvosMz57KrxI45qI4mQZj2QtEo/YfYdX56ClLL5th
 KMbk8mkcDc6riDIFpGMQmG++CjAr28jDPgsvtMscyMPt4aMHZxc99Gs0Hnkwew+Ue6NDX3
 fB0BCVYCahtgz8sWmuV/XPanlAF9Iy0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-S-SNIuNANpO0Prn_zQ5Caw-1; Wed, 05 Mar 2025 10:26:47 -0500
X-MC-Unique: S-SNIuNANpO0Prn_zQ5Caw-1
X-Mimecast-MFC-AGG-ID: S-SNIuNANpO0Prn_zQ5Caw_1741188407
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2217a4bfcc7so121018365ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 07:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741188406; x=1741793206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPtUDuBhtdSX6GhOg+XQnbMK00oSmP61u2YCpHroymk=;
 b=KzKibT0nsV+zqFjS5xPUm6JPLNUwezqPO/OJ84Y/KWT1pLYqKxC1l7+uU0xlFEl2xw
 KR1KZXsdYxctWMEYCyghJYmseG0u8ktHyiU7H3nTSJFob5zDbNSFycLlk0JNx4Ul2Lw3
 3tION1/ym4pR7Fup3BnApNL9p1LBxzm69Ebfn5mXa5Za+wfRfKIznmo9xShH9Jtwi3Lk
 tOTDLCINtgmIcLDWkXB8JgtkeSeSZOyVO42hrAFalNjENRC0DGtoLZ0ZSPRWxuyAzNlE
 9F8IsOWtJMPLGZT1f1i+8WMcIno6WehCExvWU/2X56l3Wl4euU7RhH/uf4ZQImJDakE8
 Etvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy1KXWeBvKWVQBWDnJVk2mjklfhaQWcttkLT5mGnrJG4jzBGiO899rWKY/aTZSsIxCZ3c3sWxAMr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4pnojRG9vA9vJ0gdi9oBoc08ce3PCii07zQMIonL1hvDfIJbe
 CnXwsl7Hf9lGIQfaGcp++bbbehIDpBIS6Hgz3saxAeWt3yq97nBrNKcnuaJZg3bR5PEtnFUnvp6
 cW0k4Hx5UXOT4JieE7oD8k+q5EaAXTRgnI0PNmeZdzsz9RE2A0FdN//YaD3FBq1MDDw==
X-Gm-Gg: ASbGncstqTu6hNVyFT+rJMEOxx/r4gHpXluCgCDbxA/9cBHYcDhkQsBn9Ou52yZb7WM
 Nv4MkY6qR2NlN6y9UpPh6a73O+dOg0AZwIYf2uq6WW0rQOuEERXgTs9fXQDExwosEVhXtXVz0YT
 4dcTn8fOXpkLlb419JII1w8TwBC5y6lyiX0IyqUFMGyMWxlHvqDM2EzJz4LwvFdP3UNghHLnWwZ
 CPKRZ7T+Gmv8OVoIHph7RiGkAxxGhQi9oxRzhTABokuCsGs0ONJaQX9676QCvRWQnluElTCfdXr
 mpXsv4ydG31zbyGU
X-Received: by 2002:a05:6a00:998:b0:736:46b4:beef with SMTP id
 d2e1a72fcca58-73682b55144mr6706582b3a.3.1741188406431; 
 Wed, 05 Mar 2025 07:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECYyXVd+Gb6leHDb5NO82ag7tQipklHOXKqXQqY4fydYrcJZzPu+CjaBp7aum4qt8U11Vpow==
X-Received: by 2002:a05:6a00:998:b0:736:46b4:beef with SMTP id
 d2e1a72fcca58-73682b55144mr6706526b3a.3.1741188406066; 
 Wed, 05 Mar 2025 07:26:46 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7364b4eff66sm6983292b3a.83.2025.03.05.07.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:26:45 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, akpm@linux-foundation.org,
 urezki@gmail.com, hch@infradead.org, dmitry.osipenko@collabora.com,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
Subject: [PATCH drm-next 2/2] drm/virtio: Use atomic_vmap to work drm_panic in
 GUI
Date: Thu,  6 Mar 2025 00:25:54 +0900
Message-ID: <20250305152555.318159-3-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305152555.318159-1-ryasuoka@redhat.com>
References: <20250305152555.318159-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7CZUc5CdnAW9BQCFhFVheTQ5he0KlpCatEy2mS3c3VQ_1741188407
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio drm_panic supports only vmapped shmem BO because there is no
atomic vmap feature. Now atomic_vmap is supported, so drm_panic tries to
vmap addr if it is not mapped.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/drm_gem.c              | 51 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c | 51 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++--
 include/drm/drm_gem.h                  |  1 +
 include/drm/drm_gem_shmem_helper.h     |  2 +
 5 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df..eebfaef3a52e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -535,6 +535,57 @@ static void drm_gem_check_release_batch(struct folio_batch *fbatch)
 	cond_resched();
 }
 
+struct page **drm_gem_atomic_get_pages(struct drm_gem_object *obj)
+{
+	struct address_space *mapping;
+	struct page **pages;
+	struct folio *folio;
+	long i, j, npages;
+
+	if (WARN_ON(!obj->filp))
+		return ERR_PTR(-EINVAL);
+
+	/* This is the shared memory object that backs the GEM resource */
+	mapping = obj->filp->f_mapping;
+
+	/* We already BUG_ON() for non-page-aligned sizes in
+	 * drm_gem_object_init(), so we should never hit this unless
+	 * driver author is doing something really wrong:
+	 */
+	WARN_ON((obj->size & (PAGE_SIZE - 1)) != 0);
+
+	npages = obj->size >> PAGE_SHIFT;
+
+	pages = kmalloc_array(npages, sizeof(struct page *), GFP_ATOMIC);
+	if (pages == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	mapping_set_unevictable(mapping);
+
+	i = 0;
+	while (i < npages) {
+		long nr;
+
+		folio = shmem_read_folio_gfp(mapping, i,
+				GFP_ATOMIC);
+		if (IS_ERR(folio))
+			return ERR_PTR(-ENOMEM);
+		nr = min(npages - i, folio_nr_pages(folio));
+		for (j = 0; j < nr; j++, i++)
+			pages[i] = folio_file_page(folio, i);
+
+		/* Make sure shmem keeps __GFP_DMA32 allocated pages in the
+		 * correct region during swapin. Note that this requires
+		 * __GFP_DMA32 to be set in mapping_gfp_mask(inode->i_mapping)
+		 * so shmem can relocate pages during swapin if required.
+		 */
+		BUG_ON(mapping_gfp_constraint(mapping, __GFP_DMA32) &&
+				(folio_pfn(folio) >= 0x00100000UL));
+	}
+
+	return pages;
+}
+
 /**
  * drm_gem_get_pages - helper to allocate backing pages for a GEM object
  * from shmem
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..789dfd726a36 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -186,6 +186,34 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
+static int drm_gem_shmem_atomic_get_pages(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	struct page **pages;
+
+	pages = drm_gem_atomic_get_pages(obj);
+	if (IS_ERR(pages)) {
+		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
+			    PTR_ERR(pages));
+		shmem->pages_use_count = 0;
+		return PTR_ERR(pages);
+	}
+
+	/*
+	 * TODO: Allocating WC pages which are correctly flushed is only
+	 * supported on x86. Ideal solution would be a GFP_WC flag, which also
+	 * ttm_pool.c could use.
+	 */
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
+#endif
+
+	shmem->pages = pages;
+
+	return 0;
+}
+
 static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
@@ -317,6 +345,29 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
+int drm_gem_shmem_atomic_vmap(struct drm_gem_shmem_object *shmem,
+			      struct iosys_map *map)
+{
+	struct drm_gem_object *obj = &shmem->base;
+	int ret = 0;
+
+	pgprot_t prot = PAGE_KERNEL;
+
+	ret = drm_gem_shmem_atomic_get_pages(shmem);
+	if (ret)
+		return -ENOMEM;
+
+	if (shmem->map_wc)
+		prot = pgprot_writecombine(prot);
+	shmem->vaddr = atomic_vmap(shmem->pages, obj->size >> PAGE_SHIFT,
+				   VM_MAP, prot);
+	if (!shmem->vaddr)
+		return -ENOMEM;
+	iosys_map_set_vaddr(map, shmem->vaddr);
+
+	return 0;
+}
+
 /*
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a6f5a78f436a..2a977c5cf42a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
 
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 
-	/* Only support mapped shmem bo */
-	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
+	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
 		return -ENODEV;
 
-	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	/* try to vmap it if possible */
+	if (!bo->base.vaddr) {
+		int ret;
+
+		ret = drm_gem_shmem_atomic_vmap(&bo->base, &sb->map[0]);
+		if (ret)
+			return ret;
+	} else {
+		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	}
 
 	sb->format = plane->state->fb->format;
 	sb->height = plane->state->fb->height;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index fdae947682cd..cfed66bc12ef 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -529,6 +529,7 @@ void drm_gem_free_mmap_offset(struct drm_gem_object *obj);
 int drm_gem_create_mmap_offset(struct drm_gem_object *obj);
 int drm_gem_create_mmap_offset_size(struct drm_gem_object *obj, size_t size);
 
+struct page **drm_gem_atomic_get_pages(struct drm_gem_object *obj);
 struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d22e3fb53631..86a357945f42 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -105,6 +105,8 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_atomic_vmap(struct drm_gem_shmem_object *shmem,
+			      struct iosys_map *map);
 int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 		       struct iosys_map *map);
 void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-- 
2.48.1


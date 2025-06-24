Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC9AE6079
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C929810E547;
	Tue, 24 Jun 2025 09:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NsL+g6Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1316410E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750756549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGg2AREMc0dSaJ6WgWSMxWStxg/Y+z5/zzdp0EO25ZI=;
 b=NsL+g6ThftiJ63tF5HDnnJQ8Rcya/AoSErUxaBsCNg+Webf7/ETam66l3HJKFT2xrKlK31
 du2LNrI8Uvm8+R5fs2hRfjilxjCl4lq54WbDLPZosZi6D1Uk5SJsnZf2p/+KG7W+4tbv+k
 DBGUNf38mxD8N+qXNo+Je0EafgPB/qI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-YXZb2hYLOyyBuq3I5bWDhA-1; Tue,
 24 Jun 2025 05:15:45 -0400
X-MC-Unique: YXZb2hYLOyyBuq3I5bWDhA-1
X-Mimecast-MFC-AGG-ID: YXZb2hYLOyyBuq3I5bWDhA_1750756543
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0D0C81955F44; Tue, 24 Jun 2025 09:15:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6605A180045C; Tue, 24 Jun 2025 09:15:37 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 05/11] drm/ttm: Add ttm_bo_kmap_try_from_panic()
Date: Tue, 24 Jun 2025 11:01:14 +0200
Message-ID: <20250624091501.257661-6-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

If the ttm bo is backed by pages, then it's possible to safely kmap
one page at a time, using kmap_try_from_panic().
Unfortunately there is no way to do the same with ioremap, so it
only supports the kmap case.
This is needed for proper drm_panic support with xe driver.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---

v8:
 * Added in v8

v9:
 * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
   from the panic handler (Christian König)

 drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b9a772b26fa1..ad95e8b9852b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -381,6 +381,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 	return (!map->virtual) ? -ENOMEM : 0;
 }
 
+/**
+ *
+ * ttm_bo_kmap_try_from_panic
+ *
+ * @bo: The buffer object
+ * @page: The page to map
+ *
+ * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
+ * This should only be called from the panic handler, if you make sure the bo
+ * is the one being displayed, so is properly allocated, and protected.
+ *
+ * Returns the vaddr, that you can use to write to the bo, and that you should
+ * pass to kunmap_local() when you're done with this page, or NULL if the bo
+ * is in iomem.
+ */
+void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
+{
+	if (page + 1 > PFN_UP(bo->resource->size))
+		return NULL;
+
+	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
+		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
+
+	return NULL;
+}
+EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
+
 /**
  * ttm_bo_kmap
  *
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8ad6e2713625..5332ee74d95b 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -401,6 +401,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
 		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
+void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-- 
2.49.0


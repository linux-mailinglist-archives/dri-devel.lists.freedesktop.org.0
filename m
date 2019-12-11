Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF511AA9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E66EB1F;
	Wed, 11 Dec 2019 12:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D36EB1F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576066803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CO314128W7CDNlXEcy+PWsJG51Toka8m6TWFPQjhhH4=;
 b=JuWLwj81zqtQF8e+LsBv8NGYKCsZNglL4nfnKcdi4tf/FKyvx6dOXCEVfMn/EIbsb6EsCS
 LPjPz7SkeoQzoznOSnZ8fWtsX+r5WlarJGMx3Et/xAtORd7cTemSe+Ui4AfhZc+MVHWdCT
 KuPRKohOLyiJbdM5GsqS6jChUcHys24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-ptuNYTXuPj6rCyVckKaV4A-1; Wed, 11 Dec 2019 07:20:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C40E31804488;
 Wed, 11 Dec 2019 12:20:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464BC6364F;
 Wed, 11 Dec 2019 12:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91A7A17538; Wed, 11 Dec 2019 13:19:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/udl: simplify gem object mapping.
Date: Wed, 11 Dec 2019 13:19:56 +0100
Message-Id: <20191211121957.18637-5-kraxel@redhat.com>
In-Reply-To: <20191211121957.18637-1-kraxel@redhat.com>
References: <20191211121957.18637-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ptuNYTXuPj6rCyVckKaV4A-1
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
 gurchetansingh@chromium.org, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With shmem helpers allowing to update pgprot caching flags via
drm_gem_object_funcs.pgprot we can just use that and ditch our own
implementations of mmap() and vmap().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/udl/udl_gem.c | 62 ++++-------------------------------
 1 file changed, 7 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
index b6e26f98aa0a..b82a4a921f1b 100644
--- a/drivers/gpu/drm/udl/udl_gem.c
+++ b/drivers/gpu/drm/udl/udl_gem.c
@@ -17,61 +17,12 @@
  * GEM object funcs
  */
 
-static int udl_gem_object_mmap(struct drm_gem_object *obj,
-			       struct vm_area_struct *vma)
+static pgprot_t udl_gem_object_pgprot(struct drm_gem_object *obj,
+				      pgprot_t pgprot)
 {
-	int ret;
-
-	ret = drm_gem_shmem_mmap(obj, vma);
-	if (ret)
-		return ret;
-
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (obj->import_attach)
-		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	return 0;
-}
-
-static void *udl_gem_object_vmap(struct drm_gem_object *obj)
-{
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	int ret;
-
-	ret = mutex_lock_interruptible(&shmem->vmap_lock);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (shmem->vmap_use_count++ > 0)
-		goto out;
-
-	ret = drm_gem_shmem_get_pages(shmem);
-	if (ret)
-		goto err_zero_use;
-
-	if (obj->import_attach)
-		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
-	else
-		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
-				    VM_MAP, PAGE_KERNEL);
-
-	if (!shmem->vaddr) {
-		DRM_DEBUG_KMS("Failed to vmap pages\n");
-		ret = -ENOMEM;
-		goto err_put_pages;
-	}
-
-out:
-	mutex_unlock(&shmem->vmap_lock);
-	return shmem->vaddr;
-
-err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
-err_zero_use:
-	shmem->vmap_use_count = 0;
-	mutex_unlock(&shmem->vmap_lock);
-	return ERR_PTR(ret);
+		pgprot = pgprot_writecombine(pgprot);
+	return pgprot;
 }
 
 static const struct drm_gem_object_funcs udl_gem_object_funcs = {
@@ -80,9 +31,10 @@ static const struct drm_gem_object_funcs udl_gem_object_funcs = {
 	.pin = drm_gem_shmem_pin,
 	.unpin = drm_gem_shmem_unpin,
 	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = udl_gem_object_vmap,
+	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = udl_gem_object_mmap,
+	.mmap = drm_gem_shmem_mmap,
+	.pgprot = udl_gem_object_pgprot,
 };
 
 /*
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976727FB4C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8847C6E86E;
	Thu,  1 Oct 2020 08:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC55F6E5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601486218; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4FdEWnxywTg58dVaxSVDCY6CPJH5VaSpaRHUxXoYO8=;
 b=MHTvilFiFcEoV8ERIrzbb2lSr7HlhKRtVWEcAwCR0gCnShWJ90CkLCYMXEbi/NCMHZluMx
 3RXGT3638NQsQ6QarhTsZOtv2vWScq5hVTDCU+HePWop1+dwSJwxWY9TD231Xz7E1Gqvr2
 BbsN3E3GQO9nRiMlFePjh24K6Oc+ys8=
From: Paul Cercueil <paul@crapouillou.net>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/3] drm: Add and export function drm_gem_cma_create_noalloc
Date: Wed, 30 Sep 2020 19:16:42 +0200
Message-Id: <20200930171644.299363-1-paul@crapouillou.net>
In-Reply-To: <20200930165212.GA8833@lst.de>
References: <20200930165212.GA8833@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add and export the function drm_gem_cma_create_noalloc(), which is just
__drm_gem_cma_create() renamed.

This function can be used by drivers that need to create a GEM object
without allocating the backing memory.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 11 ++++++-----
 include/drm/drm_gem_cma_helper.h     |  3 +++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 59b9ca207b42..6abc4b306832 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -34,7 +34,7 @@
  */
 
 /**
- * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
+ * drm_gem_cma_create_noalloc - Create a GEM CMA object without allocating memory
  * @drm: DRM device
  * @size: size of the object to allocate
  *
@@ -45,8 +45,8 @@
  * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
  * error code on failure.
  */
-static struct drm_gem_cma_object *
-__drm_gem_cma_create(struct drm_device *drm, size_t size)
+struct drm_gem_cma_object *
+drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
@@ -76,6 +76,7 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	kfree(cma_obj);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(drm_gem_cma_create_noalloc);
 
 /**
  * drm_gem_cma_create - allocate an object with the given size
@@ -98,7 +99,7 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 
 	size = round_up(size, PAGE_SIZE);
 
-	cma_obj = __drm_gem_cma_create(drm, size);
+	cma_obj = drm_gem_cma_create_noalloc(drm, size);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
@@ -476,7 +477,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
-	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
+	cma_obj = drm_gem_cma_create_noalloc(dev, attach->dmabuf->size);
 	if (IS_ERR(cma_obj))
 		return ERR_CAST(cma_obj);
 
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2bfa2502607a..be2b8e3a8ab2 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -83,6 +83,9 @@ int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
 
+struct drm_gem_cma_object *
+drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size);
+
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
 
 #ifndef CONFIG_MMU
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

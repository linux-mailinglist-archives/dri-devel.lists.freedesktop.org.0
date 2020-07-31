Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC223462D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E043B6EA80;
	Fri, 31 Jul 2020 12:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166B36EA80;
 Fri, 31 Jul 2020 12:51:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q7so32317206ljm.1;
 Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hf2m1CaACgkl3i0FS0MjmjyDubimZdTD8G//CB5QIMY=;
 b=WpFdItwLmE1h/jcPKXj3mRmyaF+TKN3FWkbAvN9i01/b/GBnQQrfqTYPD3KkCl+HER
 4a3yBnoP8xZ1+beeiIJ9vfMIpoL/Uq0aKjRgj9n3gDAB35PWSD+52cvI8qsbw9MMxnde
 Ogk+jE2mX/g7LFVkGpGWoSr7sD8Yog+cmIHDyOr5lEBZFzgPS2kU4Fuv8LCiEtAMJi4Y
 V/MPagzOAVhsCHI/ruYoFU5NgrrL0yQ5Bln8moUVlTyOMw3rTQ7cCkra3lYcATWDogf/
 jBRFwFf8eSKHB5WoChdB5jL9GonvtcReyID4iSV0w2pPa3lh5NAPcP/9Jan5UaU8YB8u
 zvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hf2m1CaACgkl3i0FS0MjmjyDubimZdTD8G//CB5QIMY=;
 b=Ji+cZm8V4QthW5YZquLMvWLe5Asf9GDZYkp6PI4U1IACbqDWoG+ndBYH/CGsqXj/Hf
 aSJbZd8iC3e0SWwNxak506Xn2d3ToQ5ETH1jSx3qW5MJnOTdBE9e2jlhnnmjnTvOX1BL
 kuMOABKviRiikbYAw7aQrP7WwQ+XVxWzREeVPkpI2oZyXf7T2GsRWspyOjdalhlI6jmj
 J8IytmPiZ9cAJLZs1mSa9AVmU7MylAKP7egdhhqxk9tzdzFpD1VJoUci+/CkSVj7QP0r
 OzvuZrdnj3n03aHvLr9LsT/KU7UC4xJSpLfqfkRzzqaHPOzpybwcwUsutcKtIgQowXys
 qc3g==
X-Gm-Message-State: AOAM532ZuXy6fH4F7ulksF6gQAJ/W5GeynH4nQppsjv4jZ03eOdGGE3i
 y4EPmEPqCQvhHMNwQ3s+VlM=
X-Google-Smtp-Source: ABdhPJyAr3EgNy6m0bxN5SP4DJ54ompCgY6CBLlI16M8yY4FlCVLhiNPKf3qPH+txZ2PmAgUTW2prA==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr1932560ljk.309.1596199875447; 
 Fri, 31 Jul 2020 05:51:15 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:14 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Date: Fri, 31 Jul 2020 15:51:05 +0300
Message-Id: <20200731125109.18666-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
display frontend" from Apr 3, 2018, leads to the following static
checker warning:

	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
	warn: passing zero to 'ERR_CAST'

drivers/gpu/drm/xen/xen_drm_front_gem.c
   133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
   134                                                  size_t size)
   135  {
   136          struct xen_gem_object *xen_obj;
   137
   138          xen_obj = gem_create(dev, size);
   139          if (IS_ERR_OR_NULL(xen_obj))
   140                  return ERR_CAST(xen_obj);

Fix this and the rest of misused places with IS_ERR_OR_NULL in the
driver.

Fixes:  c575b7eeb89f: "drm/xen-front: Add support for Xen PV display frontend"

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 4 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 8 ++++----
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 3e660fb111b3..88db2726e8ce 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -400,8 +400,8 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	args->size = args->pitch * args->height;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
-	if (IS_ERR_OR_NULL(obj)) {
-		ret = PTR_ERR_OR_ZERO(obj);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..4ec8a49241e1 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -83,7 +83,7 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
 
 	size = round_up(size, PAGE_SIZE);
 	xen_obj = gem_create_obj(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return xen_obj;
 
 	if (drm_info->front_info->cfg.be_alloc) {
@@ -117,7 +117,7 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
 	 */
 	xen_obj->num_pages = DIV_ROUND_UP(size, PAGE_SIZE);
 	xen_obj->pages = drm_gem_get_pages(&xen_obj->base);
-	if (IS_ERR_OR_NULL(xen_obj->pages)) {
+	if (IS_ERR(xen_obj->pages)) {
 		ret = PTR_ERR(xen_obj->pages);
 		xen_obj->pages = NULL;
 		goto fail;
@@ -136,7 +136,7 @@ struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
 	struct xen_gem_object *xen_obj;
 
 	xen_obj = gem_create(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return ERR_CAST(xen_obj);
 
 	return &xen_obj->base;
@@ -194,7 +194,7 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	size = attach->dmabuf->size;
 	xen_obj = gem_create_obj(dev, size);
-	if (IS_ERR_OR_NULL(xen_obj))
+	if (IS_ERR(xen_obj))
 		return ERR_CAST(xen_obj);
 
 	ret = gem_alloc_pages_array(xen_obj, size);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 78096bbcd226..ef11b1e4de39 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -60,7 +60,7 @@ fb_create(struct drm_device *dev, struct drm_file *filp,
 	int ret;
 
 	fb = drm_gem_fb_create_with_funcs(dev, filp, mode_cmd, &fb_funcs);
-	if (IS_ERR_OR_NULL(fb))
+	if (IS_ERR(fb))
 		return fb;
 
 	gem_obj = fb->obj[0];
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

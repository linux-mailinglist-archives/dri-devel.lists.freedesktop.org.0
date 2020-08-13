Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC62433E9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7106E27F;
	Thu, 13 Aug 2020 06:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A595F6E27A;
 Thu, 13 Aug 2020 06:21:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w14so4917046ljj.4;
 Wed, 12 Aug 2020 23:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J4NK2JZREwBhnLoP8/oKs+IVAcm9xle+iSBy8U4z3uI=;
 b=aMsveTfmby4Jw6uZ+ZeNPtXeBO0gQ0qkTmqC/9GrQOVuWB2lYmn7iPmMxxLa9ydpUl
 1ylGuVEH+1dx7jR4VZAnJ0/IqCUZA0kh2ntvDKRpJX7EAS7PKDZO25kQN0OBiSsLWgqk
 6ep8OJjrrrgUCkcHjNkEeZKLo1g1yDwBhwP188aNxjstn2flQIKvfiD5B0G03ZEem1wP
 gFvA3eKEh+C2hudMtuVXaSRwDie8PLK8REizod4HzNkbb64NndYRRu8+JKDmQPqsVGV9
 Oafv3T6RBhtsBy13Uy8ZNETtPfwU8vvpoLLHBukwgbdFMCEWpOI2QP+FIC4g+yctIKkV
 FJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J4NK2JZREwBhnLoP8/oKs+IVAcm9xle+iSBy8U4z3uI=;
 b=A1Mgr8FY9x0QUGGq882rWtJc93a1A6Uf8sHC8EcQ7F00nn8eZWQ3PQSjQtSuZf3EKD
 wFXp6TnM0YqoETCfJhWkx7qroBLfAzLHK1QFqcO6p2/AfZfDigUTNqywDVAPTolD7Nb2
 7xoOEGiOJ/SCjCXDm4Vnk0BlUUpc6BJgAEN93ttnvyVeHxTFQszl3HCLhAGDGqwb1LZL
 2tywEwFOS1ymjQ50h68O/CdNS/12EAoO2F82xtSkolgbgVOAjosrWq7ORXp+rW0Nvj+j
 bwnQD+Pl6DzXzJXlUxlfvYOORwbfMvYLXmzaQuj1WpBMe07ulJnaBFGEFaGb+JIhXR+E
 Egtg==
X-Gm-Message-State: AOAM5308GfH78QCDXzAKDyioWiu4yO31s8nhoqu16I+H4XvtwCJ6UC42
 0PFfGnbS/siJoitIMe//4tiHXg5DNfg=
X-Google-Smtp-Source: ABdhPJzAgt09V5g8MNNXCmLRERCspKuYMmlsFKj8ZycK52qZyUCILtyFM0t9o9rPEpdwEPlvkRh5Zg==
X-Received: by 2002:a2e:3615:: with SMTP id d21mr1286683lja.333.1597299677965; 
 Wed, 12 Aug 2020 23:21:17 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:17 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 2/5] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
Date: Thu, 13 Aug 2020 09:21:10 +0300
Message-Id: <20200813062113.11030-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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
 stable@vger.kernel.org, dan.carpenter@oracle.com,
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
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 4 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 8 ++++----
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1fd458e877ca..51818e76facd 100644
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

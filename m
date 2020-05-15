Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D71D4A1D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABFE6EC5C;
	Fri, 15 May 2020 09:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22FB6EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u188so1968339wmu.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W98MEwuMPsDJPuQXd5YbYpNnxp1KJi16qnc4ceqsWuw=;
 b=HtUMBBgZpyTjkl7jD1ee3MriqZZdIvhw2jPrDYEYD8Lirot12rkWErWaroGawtAZuQ
 P4PeGFMWOpx7CI0V8iBQFsZwHRn+P0gb+x36DD0oJoBpSl06xqOb2BUIXwrBRxtqCSZF
 CTdfScqvnSVanPyYS4X+tvaaX/wbZA4nVBAi+u5YSB8nBcGofnR8+eIvLqL10IIOXOtJ
 9acIlQ0zk8CVvu49KU58X6EED+zF/N4+eM+O4vtss1zAczv/p0DtZdl8ztAprgh1CpTt
 Rea0qByII1OqZLF2mwcpoWniCdVC+wDJk14kx/6Jbf3rRYEoZ2RKsg+XrIFE2mVIrk10
 3mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W98MEwuMPsDJPuQXd5YbYpNnxp1KJi16qnc4ceqsWuw=;
 b=W7H5hbaSf70m76ktX5FEYALlybYzLBLYFdJIjIKfnLP0uKtP7UrCu0wOSVBXFBsBSF
 /jhQ5SOsVhFg7LsUo8hDovbXjABCSDAZznizE/viHO+TGHlJa6poGWsna2C74QglmOwf
 gb2T0mpkPab2LOSQF3P3iTQ1n+X1opTmy1ycmYu1xDqNfwnER9clU3sN89umU2F2F/nQ
 n+dACWmnKThfzI+jWAGJDNQTZEQQgyyWuPnOlz9PN7q+11sx6WLd6oTX7tNAN8uDLDkM
 KGrD3t1qc0nxCKuZrSmmfSKN/bU/BsqysuLvaDjolT5hntamd8pa9Jdq8I1FNsTknIjn
 lOwQ==
X-Gm-Message-State: AOAM533IlO8hoCNOLZdc6La+AfFEv8bsw7gwH6H6it8MoiWW2X5iEOLD
 lFVVc3KHDUDjYz23ey7qsMhUB9ER
X-Google-Smtp-Source: ABdhPJwwvU2VFsYRBf3u9tsvN+7x3jXy43f06aWmu6E6zq5xn4mnb+/pxykaVp2mrnMwDWuuKnOXfA==
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr2913444wmk.143.1589536481335; 
 Fri, 15 May 2020 02:54:41 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:40 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 34/38] drm/vgem: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:14 +0100
Message-Id: <20200515095118.2743122-35-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c   | 6 +++---
 drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index ec1a8ebb6f1b..e4dc7b267a0b 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -198,7 +198,7 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 
 	ret = drm_gem_handle_create(file, &obj->base, handle);
 	if (ret) {
-		drm_gem_object_put_unlocked(&obj->base);
+		drm_gem_object_put(&obj->base);
 		return ERR_PTR(ret);
 	}
 
@@ -223,7 +223,7 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	args->size = gem_object->size;
 	args->pitch = pitch;
 
-	drm_gem_object_put_unlocked(gem_object);
+	drm_gem_object_put(gem_object);
 
 	DRM_DEBUG("Created object of size %llu\n", args->size);
 
@@ -251,7 +251,7 @@ static int vgem_gem_dumb_map(struct drm_file *file, struct drm_device *dev,
 
 	*offset = drm_vma_node_offset_addr(&obj->vma_node);
 unref:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 9268f6fc3f66..17f32f550dd9 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -182,7 +182,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 		dma_fence_put(fence);
 	}
 err:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

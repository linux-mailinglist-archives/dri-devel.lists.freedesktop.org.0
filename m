Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE21C9413
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B236EA16;
	Thu,  7 May 2020 15:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9086EA16
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z6so7251455wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7bDfvTEDaxlj15NeDnwA1LXqS0PWMOl6LaOovzDeDJ4=;
 b=fbhymtw54KllCSQ/hVbmxZAdzcu4aLoddxkkgxWKeYzxGtNGakRX/ecxY0pvjlh1YA
 XqtPBiXYus72KA0wwIPgW4jgjSYGosp5dXJ2c0ppBn6Wp0hxcK+eDdkPZRgea+WEGhF4
 YTM4NNdHvT/4B9mmyxF1vw2C+WfbCMsvEtAv7s8Spw3JngCwneDQS1+w0vC7wGeqSpVF
 4rxi53Tnc10/mVWlWK5c125dNykE/U/30TBc8A54KWaYdvro2WQWQHlLzmnLjEJgPLmK
 2vi2F4Si2fLItHswXIxv+9pXT7KjivT14L9z7/K3Kq3lelSJWQCjvulgO7V0EI2CflYi
 pyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7bDfvTEDaxlj15NeDnwA1LXqS0PWMOl6LaOovzDeDJ4=;
 b=lQW2JUeoyx1Dqk6nIf2U/8kB0J6RwbnFc5gzBDihMzpT2K7p5Fq6CQXmbO0uNV1gN5
 MCiYzTgbFdnLTyZJv13rEt6za2YbOAKESybzBdYo1HLkSOnhf9MCsL6PP2iYJ0RdYHiC
 cOSw4nCBP1+hri5rTzCGiv/t0Cjlu740hmIj5w5yBcNEgIRd9zuEXOuyyg2D80W4ftM1
 DnzygL+XEX4Ebxc4GLEJczFIQpbvI/n07c3ikjqWKbAD/HqAzEsUsBlB0puc9WyL6p1a
 k+uPAtqFKflENapKa1KlarL/p05YIdlo89aCaYWDRRFAzNkT8NaxL9KfnBB4+geWIhDW
 hbug==
X-Gm-Message-State: AGi0PuYbIaSxhLI5aoLi1nsbXBnbsWj5lCTixBPr9E8KwZJzSTH+WWxP
 +ezXgx7vAokXxJqkiWAaWLLtwliT
X-Google-Smtp-Source: APiQypJDbb7ByWSHI542lnktRjflbNGkS9hpmkK79jnTJipKLcyDhKJYxIIdOqmdi5n/xrwjfCDuSw==
X-Received: by 2002:a7b:c14b:: with SMTP id z11mr10434229wmi.44.1588864291845; 
 Thu, 07 May 2020 08:11:31 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:31 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 29/36] drm/tegra: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:15 +0100
Message-Id: <20200507150822.114464-30-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 emil.l.velikov@gmail.com
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

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/tegra/drm.c | 12 ++++++------
 drivers/gpu/drm/tegra/fb.c  |  6 +++---
 drivers/gpu/drm/tegra/gem.c |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d4f51b5c7ee5..09d71c94985c 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -328,7 +328,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 
 fail:
 	while (num_refs--)
-		drm_gem_object_put_unlocked(refs[num_refs]);
+		drm_gem_object_put(refs[num_refs]);
 
 	kfree(refs);
 
@@ -368,7 +368,7 @@ static int tegra_gem_mmap(struct drm_device *drm, void *data,
 
 	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
@@ -636,7 +636,7 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
 	bo->tiling.mode = mode;
 	bo->tiling.value = value;
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
@@ -676,7 +676,7 @@ static int tegra_gem_get_tiling(struct drm_device *drm, void *data,
 		break;
 	}
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return err;
 }
@@ -701,7 +701,7 @@ static int tegra_gem_set_flags(struct drm_device *drm, void *data,
 	if (args->flags & DRM_TEGRA_GEM_BOTTOM_UP)
 		bo->flags |= TEGRA_BO_BOTTOM_UP;
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
@@ -723,7 +723,7 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 	if (bo->flags & TEGRA_BO_BOTTOM_UP)
 		args->flags |= DRM_TEGRA_GEM_BOTTOM_UP;
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 2b0666ac681b..01939c57fc74 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -171,7 +171,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 
 unreference:
 	while (i--)
-		drm_gem_object_put_unlocked(&planes[i]->gem);
+		drm_gem_object_put(&planes[i]->gem);
 
 	return ERR_PTR(err);
 }
@@ -235,7 +235,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	info = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(info)) {
 		dev_err(drm->dev, "failed to allocate framebuffer info\n");
-		drm_gem_object_put_unlocked(&bo->gem);
+		drm_gem_object_put(&bo->gem);
 		return PTR_ERR(info);
 	}
 
@@ -244,7 +244,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		err = PTR_ERR(fbdev->fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
 			err);
-		drm_gem_object_put_unlocked(&bo->gem);
+		drm_gem_object_put(&bo->gem);
 		return PTR_ERR(fbdev->fb);
 	}
 
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 623768100c6a..723df142a981 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -24,7 +24,7 @@ static void tegra_bo_put(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
-	drm_gem_object_put_unlocked(&obj->gem);
+	drm_gem_object_put(&obj->gem);
 }
 
 /* XXX move this into lib/scatterlist.c? */
@@ -385,7 +385,7 @@ struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
 		return ERR_PTR(err);
 	}
 
-	drm_gem_object_put_unlocked(&bo->gem);
+	drm_gem_object_put(&bo->gem);
 
 	return bo;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

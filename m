Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56151D4A1A
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C76EC57;
	Fri, 15 May 2020 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A42A6EC4B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 50so2751905wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXSokitOb4mqZMpIxKyK3nwkjsOeIwUipJwMxA5Ussc=;
 b=pz0QUgq6QJTaV127c7f+athygQ03Zm2pA2WobwxMCLEuGonyl6xX0eMwsKZL2vNRTx
 YXoQj2Flr3xsxBZu7hAhmpK08nA3B5bNcpl+I4LMi8nROhPzscYUtSO5JLFBHltuyCVm
 j7l4lMtmJhn+w8YVdROhijg+n9KxIujt7MTiF/lCI6eSFiOc1cqaVJuJlS6fahy1RJaM
 Uo9xswCSRfBhpIZ874VtZEK6ceg+GMRMIh0j2yrzjoNNq7ZD7lY5i1ikh8edPbk5Oz5D
 7IGT08Hz4RjNGN+8uCT3NVOx7wwhWFsQUok8GMuToDcJtbGWxo1S0wzsonwEH/rxW6Su
 hR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXSokitOb4mqZMpIxKyK3nwkjsOeIwUipJwMxA5Ussc=;
 b=J2KapFR6GrGHw6bGL4oU5I7HmkgIayRGeZ6TDEO7A6nqcWDtDYtOE+Np+HVSg0CHi5
 OoS/5IchYDZiIsNbER2uwMHsQz4A5+b8nOKAmmZhUWLInPDjucw2iCor9po/Dh5d+5iW
 gGK0QkMqS62MLudCDI1eU9vVnKNgGTEBHMJzO3L/iAoz97sAmcrbd6faFO0uHgNi+C4W
 J6rn85qOhCoqn4P7Pk2LXWtvOit4h74fFUk9gFN86fZEqa9TjG15hfgjBmsyOqO/PmsR
 LjRM2Utzx3foIwpu9OXow7Y4wjsRM0c5fK+qwc5aYUXRZyaJ9c4ONLVvObAQFuB3njer
 +gwg==
X-Gm-Message-State: AOAM5339pT6piTsHou6gBIR2N4dUrWdmGwjzB2wH7oK/v5c8Lv3FWzyH
 ldWvJFcij+zZ5kFPjTSQTWqa7eCL
X-Google-Smtp-Source: ABdhPJzep3KID1Jfjb7oxQEimpWdmGaTLXti6Pg/ayobCAsFWorAO19jHhIgXeZv0MEzoqD5BNMabA==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr3201080wrv.141.1589536477779; 
 Fri, 15 May 2020 02:54:37 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:37 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 31/38] drm/tegra: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:11 +0100
Message-Id: <20200515095118.2743122-32-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

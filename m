Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE931C940B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD4D6EA0F;
	Thu,  7 May 2020 15:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0180C6EA0D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 188so6948632wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5eqZ2rTBjmdE0MTqK4MUVqoqZDwrMowJoFLmdQORJU=;
 b=RkvtNL8QEJ6YZTsz3BUbWZ0XpxRAHI0exlJ9FfF8BNXzATY+TBjWjmMfhsBJbEEY3y
 /eUCxa7H7fxNdUbKLg+6Rqw1C7W53DI8ph3FybjnWrZcpDqP1zwlMsb9LpaoXB90v21w
 nBk3muolNqckn0U6RtZfuLbCxkoKJfZBdTUG/nvqru26mZ5oqHOU205xSprJZ+MrEYx2
 T3/CtHlG2ZcV2IHDrSfzD07OQxl+kWxuUD2Ps4u20TOsuIYbCSQi3UWC3Sk8upJkVnFT
 QsbcJfo2d3PQKi5bTmxSJVPCEfscwS4Ggk/K8rYvTGr6ZCIZP2ZLZnYYkc8nNQ66ERMz
 M2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5eqZ2rTBjmdE0MTqK4MUVqoqZDwrMowJoFLmdQORJU=;
 b=ok56Y4vl599SEw8xEFWIgPbtBnTiuppHONXpLfPJSIYEB3pIrS/hr4CZBKv9RsKTgT
 LY4NRZMmR/jMls0wLQxkhLoWfImVRvGT8SWru0wkmuuTDYfvxLpL9a6QdqU7ssmfM1i4
 +x27r8YcyXtRTSUxXUZnJYmIdvZPWdTDSHL331kb25187+v3quUrylDVKC5kUcmI5FRY
 BQu3nbxZmc9DrRSs+upuNG6spulROPqKJEIkGktOl9pAAcRI3cAIPr1b80kwHAAptM1u
 3OmFfwUaO2jd4y3r+j5wLHyfQ5M+Sf7wIAwjsUiE2FvAn4s+fNuy+Tpt7YAi5+NMwzs9
 2iiw==
X-Gm-Message-State: AGi0PublQ2dIOYuUUsEjLPN+4daY+mAR7BZOUTudVKSsWA47xBR8ZLdn
 G6lrXDEO0b32Pq1rm5N5EXCI/K0v
X-Google-Smtp-Source: APiQypLsRZpBlR1f01FUWZ+qY5Zwiey0iEsVYzsCmVed5DO7jLqSkg+aYReU7gAipYvS6/KE1P44AQ==
X-Received: by 2002:a1c:3bc5:: with SMTP id i188mr522643wma.90.1588864284235; 
 Thu, 07 May 2020 08:11:24 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:23 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/36] drm/nouveau: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:09 +0100
Message-Id: <20200507150822.114464-24-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Ben Skeggs <bskeggs@redhat.com>
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

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_gem.c     | 14 +++++++-------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 1f08de4241e0..27f511b9987b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1017,7 +1017,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
 	nv_crtc->cursor.show(nv_crtc, true);
 out:
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index e2bae1424502..72c91991b96a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -139,7 +139,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 	if (chan->ntfy) {
 		nouveau_vma_del(&chan->ntfy_vma);
 		nouveau_bo_unpin(chan->ntfy);
-		drm_gem_object_put_unlocked(&chan->ntfy->bo.base);
+		drm_gem_object_put(&chan->ntfy->bo.base);
 	}
 
 	if (chan->heap.block_size)
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 700817dc4fa0..60bef0ad028d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -185,7 +185,7 @@ nouveau_user_framebuffer_destroy(struct drm_framebuffer *drm_fb)
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
 
 	if (fb->nvbo)
-		drm_gem_object_put_unlocked(&fb->nvbo->bo.base);
+		drm_gem_object_put(&fb->nvbo->bo.base);
 
 	drm_framebuffer_cleanup(drm_fb);
 	kfree(fb);
@@ -267,7 +267,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (ret == 0)
 		return &fb->base;
 
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 	return ERR_PTR(ret);
 }
 
@@ -648,7 +648,7 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 		return ret;
 
 	ret = drm_gem_handle_create(file_priv, &bo->bo.base, &args->handle);
-	drm_gem_object_put_unlocked(&bo->bo.base);
+	drm_gem_object_put(&bo->bo.base);
 	return ret;
 }
 
@@ -663,7 +663,7 @@ nouveau_display_dumb_map_offset(struct drm_file *file_priv,
 	if (gem) {
 		struct nouveau_bo *bo = nouveau_gem_object(gem);
 		*poffset = drm_vma_node_offset_addr(&bo->bo.base.vma_node);
-		drm_gem_object_put_unlocked(gem);
+		drm_gem_object_put(gem);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f5ece1f94973..5631c484d10f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -279,7 +279,7 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	}
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(&nvbo->bo.base);
+	drm_gem_object_put(&nvbo->bo.base);
 	return ret;
 }
 
@@ -358,7 +358,7 @@ validate_fini_no_ticket(struct validate_op *op, struct nouveau_channel *chan,
 		list_del(&nvbo->entry);
 		nvbo->reserved_by = NULL;
 		ttm_bo_unreserve(&nvbo->bo);
-		drm_gem_object_put_unlocked(&nvbo->bo.base);
+		drm_gem_object_put(&nvbo->bo.base);
 	}
 }
 
@@ -405,14 +405,14 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 		nvbo = nouveau_gem_object(gem);
 		if (nvbo == res_bo) {
 			res_bo = NULL;
-			drm_gem_object_put_unlocked(gem);
+			drm_gem_object_put(gem);
 			continue;
 		}
 
 		if (nvbo->reserved_by && nvbo->reserved_by == file_priv) {
 			NV_PRINTK(err, cli, "multiple instances of buffer %d on "
 				      "validation list\n", b->handle);
-			drm_gem_object_put_unlocked(gem);
+			drm_gem_object_put(gem);
 			ret = -EINVAL;
 			break;
 		}
@@ -929,7 +929,7 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		ret = lret;
 
 	nouveau_bo_sync_for_cpu(nvbo);
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 
 	return ret;
 }
@@ -948,7 +948,7 @@ nouveau_gem_ioctl_cpu_fini(struct drm_device *dev, void *data,
 	nvbo = nouveau_gem_object(gem);
 
 	nouveau_bo_sync_for_device(nvbo);
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 	return 0;
 }
 
@@ -965,7 +965,7 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	ret = nouveau_gem_info(file_priv, gem, req);
-	drm_gem_object_put_unlocked(gem);
+	drm_gem_object_put(gem);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

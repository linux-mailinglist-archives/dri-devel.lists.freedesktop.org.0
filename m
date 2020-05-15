Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B001D4A1E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57C36EC5B;
	Fri, 15 May 2020 09:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE76EC51
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so2840319wrt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48BeOr4AUwywCq8MKGtX+OvfvETXdI5v2ppv/DdJJrA=;
 b=Oe/Vn3tI191Dit2PYvYDf8RHTOl0gXPQCh1yLvIqGW0txXICvdj2lydAEc9ALldprg
 SDLyoK7PdNwALFTrdfjoakFPccAVZeXznLjq7EQu5FDOgYyXlqlBQC0WYhS3XFsEQzoE
 0atVq52XJvzx17IKy3oK3rQB7a7RmVpjyEU2CWB4xcKyDqoOoEiSg1NeaMakE2z+QMho
 hYKZr+4+R4DziC24g6khkfQ4/9KoIuSbSgLQ9giQ5Ul+uhskng2PEZVRrmjY3pnL2dR6
 P2TpITaQ52ATdUfQCPXWO5nhcj1GI5HQk8RU3paI9vn7m45vDh133pq710h5KlZUQ3Mv
 38Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48BeOr4AUwywCq8MKGtX+OvfvETXdI5v2ppv/DdJJrA=;
 b=XgJcteikUy+24JbOoaAFCFurJbo7Pr36nAzNDKx2tydmetaj/jQzHQbCgv4BBt+SiS
 Xz0bNKIAE8GGWwkY2FnkVG1mgGEha1OYLb9oswdoJp7206UpD+ZFaLi1+oNUR4KQOOqD
 T/IUz52USPrt3Xfp/4Nomypj51xHn/rsOsmnYwai+kFd9OuXT9ZMtMCHNxr0QbdQNJyf
 qjxUxLHo9cnB0oQweeLGsSAvascprsxZzlEnPI2f1enkmKDW9EYYNWromX3QfNdhhD25
 +4C5S1zpMFT6YZtvMK8OGInYSZtkfO4I/iEjVeIllS/AYSZi8tzP1SxiKcq6K/Ds9vMj
 3Q4g==
X-Gm-Message-State: AOAM532DJy+GQvCKTVPzNKvIOa1i+zSpA/y677gaKYLssgl+gGN+umu1
 KC3c4ETvqvuFbTPchgEnxG6SZPAx
X-Google-Smtp-Source: ABdhPJw9WNuvBK7tkU3wyVXsC8BrGyzIqr9HdQ7CPoB4g+0z+efRkHBQvbL6Pf8qkfC0RNqLLhNYmA==
X-Received: by 2002:a5d:526f:: with SMTP id l15mr3283862wrc.367.1589536482423; 
 Fri, 15 May 2020 02:54:42 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:41 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 35/38] drm/virtio: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:15 +0100
Message-Id: <20200515095118.2743122-36-emil.l.velikov@gmail.com>
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
 Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c     | 6 +++---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index cc7fd957a307..f3ce49c5a34c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -307,7 +307,7 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	ret = virtio_gpu_framebuffer_init(dev, virtio_gpu_fb, mode_cmd, obj);
 	if (ret) {
 		kfree(virtio_gpu_fb);
-		drm_gem_object_put_unlocked(obj);
+		drm_gem_object_put(obj);
 		return NULL;
 	}
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 1025658be4df..3dcd61aa6649 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -52,7 +52,7 @@ static int virtio_gpu_gem_create(struct drm_file *file,
 	*obj_p = &obj->base.base;
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(&obj->base.base);
+	drm_gem_object_put(&obj->base.base);
 
 	*handle_p = handle;
 	return 0;
@@ -102,7 +102,7 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 	if (gobj == NULL)
 		return -ENOENT;
 	*offset_p = drm_vma_node_offset_addr(&gobj->vma_node);
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	return 0;
 }
 
@@ -237,7 +237,7 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
 	u32 i;
 
 	for (i = 0; i < objs->nents; i++)
-		drm_gem_object_put_unlocked(objs->objs[i]);
+		drm_gem_object_put(objs->objs[i]);
 	virtio_gpu_array_free(objs);
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 867c5e239d55..584766be8d64 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -278,7 +278,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 		drm_gem_object_release(obj);
 		return ret;
 	}
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	rc->res_handle = qobj->hw_res_handle; /* similiar to a VM address */
 	rc->bo_handle = handle;
@@ -300,7 +300,7 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 
 	ri->size = qobj->base.base.size;
 	ri->res_handle = qobj->hw_res_handle;
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	return 0;
 }
 
@@ -417,7 +417,7 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
 	else if (ret > 0)
 		ret = 0;
 
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

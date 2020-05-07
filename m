Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6231C9416
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E4E6EA1D;
	Thu,  7 May 2020 15:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB676EA1A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so6832902wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=400S/HHeJE9y1nidML4qCXfc2vSlFghoSfpPqrDWoS4=;
 b=XDxp5CkRwMCABdiy3Co/mGR9NbO6NuQyRUCHLRIXo2hWCWs4mRGvY/Zwts+OAkv1MD
 r7NbAsCNmiFDKM5NKT0gWj4j/MMcj8LWLyzIgssnvB2jJ8wVm91+zM6MUaioJSSEGH/+
 PtfoIRa0DSt5iQbyMtEpSzIg4ZiGk1I8Rz7EPozgu5lTW/IK6GiuY33Wffc9G/ksiZDC
 K4D5tk42orC8la1fiPAHHGNa9X171DBzqtmmrmwCkwmW30y79BEzPq6YCmvXotwCNa+N
 f2WeJUxGgV0gy482/j9kLBxCToMNKWg6jFqANE6AbZzpsmiZ3EGyoM27n7W41187UL9L
 JMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=400S/HHeJE9y1nidML4qCXfc2vSlFghoSfpPqrDWoS4=;
 b=lMHPmycM/XA+lgJ+lr6E0V331ayZiiBc4FY2AKf0iBeGjCS6chrQRG++hy806sLEhW
 ZIX9jzTltxwerN4mCXLxDX3bdh5QtUSHSK933IvRyId7hYfEWrvBRXkf9xtihJg+tPLn
 WAogoJzKQypazRWzRYmdTLTjhuOlFzlZCZCVN0OBvU0z3SHHbApRTHP7aIiOxUo3Mfco
 lX/wx7lCf/R8pJdqcOvG4BckKcYlVnzn5ahuYEyhYdzmLV2/MAaGMJpR9NE5ljqCFLKQ
 uYZLO/EVSnehZbHSufvGVJMo3W1KoIDEYCki4YLVmCtpMUIhlSR5dEqRkg5MjuxqqL2U
 xjpw==
X-Gm-Message-State: AGi0PuaLDZdVzJfHiHwnplbcac7Mtz/KuV0JaWMVCehVy5lIVLD3hA1z
 hs2w4tmHoOukeSKoubB4TarqTv6i
X-Google-Smtp-Source: APiQypIxFCP3F267yCamMBrrywm+xxNRS9c/+0L7UbPbzaIwRNlipCJidKtU23/7om3wihi6vrti8A==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr15535480wrr.268.1588864297342; 
 Thu, 07 May 2020 08:11:37 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:36 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 33/36] drm/virtio: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:19 +0100
Message-Id: <20200507150822.114464-34-emil.l.velikov@gmail.com>
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

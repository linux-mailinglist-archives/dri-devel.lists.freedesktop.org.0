Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C9191E3F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 01:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801889DFA;
	Wed, 25 Mar 2020 00:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E63898C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 00:41:39 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g6so121854plt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FF6NP5cEhwM/0TKaDUyOAgq5MXDdka0eCRQ+ziY/9Y=;
 b=PGG6Uk4ZphYJqPDIrwKPfzhklfT4FIRaK1szHiHLJNYP4S8cfRtsRMUs7zHXSNeWvf
 1DSr4Prg/7sQ/ZvJPzUg5rDZKxoq5HknkfHfhO1SseXRBAcAbaPpDzz6lqNT3eK0hzvt
 4S1rGZgby9sbNR9UPHO8GdT0svsWa0OGD1ts8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FF6NP5cEhwM/0TKaDUyOAgq5MXDdka0eCRQ+ziY/9Y=;
 b=gTKCf4dTYsLEdzpNVBzrfg6EPb08PPnSoF8fQQDOTFMWmwfwtcpaHAoB/Scmb6cXly
 SSg+UkrnhH9NFDn2Q/E4X1QCMm7oGzMI36RnWbqydzXH7wePGQOajIIPyX53vWRde4Kn
 qfU/jGnP6OvRizmOUKxy2uG85RVdIENBkd61VJpFhXFCRl8bAplX19GfH4sJ8k5lpDSG
 4UUDXRgQbUS5F4jIPCL/tV/KdM4IDAuJCLn5zt5ARI74ECje6hQDp9QmBisqA3HbsYOY
 eyXI5pYjp3uechWP2s+ZDrMd0eipySd0mAgy2aUjMRNnJ7+yOaz59XKKec6vlQ8/WzP5
 3a9w==
X-Gm-Message-State: ANhLgQ0GPP66gpoPFtbCjxc0ITfNcwD6nexoNgJenkdcAKIOgVK1lE2W
 eYla2BpQ/8rzfOfm7IBGXYz49tFb5DY=
X-Google-Smtp-Source: ADFU+vu4+0b818vXcdObb0QnJFYscfFFMMY4V9NQ8oFDkEzBp8zIxWuaQKYQ3WkITcpW9McSK8rLKw==
X-Received: by 2002:a17:90a:e003:: with SMTP id
 u3mr623162pjy.157.1585096899103; 
 Tue, 24 Mar 2020 17:41:39 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id x70sm15716488pgd.37.2020.03.24.17.41.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Mar 2020 17:41:38 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: delete notify in virtio_gpu_object_create
Date: Tue, 24 Mar 2020 17:41:30 -0700
Message-Id: <20200325004130.26766-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <CAPaKu7SLyEdbzqDXxU7+Gm1Gjh2Q4C1buudmBCEHgsk6sJ5L8w@mail.gmail.com>
References: <CAPaKu7SLyEdbzqDXxU7+Gm1Gjh2Q4C1buudmBCEHgsk6sJ5L8w@mail.gmail.com>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For 3D buffers, virtio_gpu_gem_object_open notifies.
We can have the same behavior for dumb buffer.  We just
need to make sure the first open notifies the host for
dumb buffers.

v2: virtio_gpu_gem_object_open always notifies

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  1 +
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 10 ++++++++--
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 79ad176aca5a8..842200e01d785 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -71,6 +71,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool notified;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 90c0a8ea1708c..597ddb7391fb9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -111,10 +111,13 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 {
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_object_array *objs;
 
-	if (!vgdev->has_virgl_3d)
-		return 0;
+	if (!vgdev->has_virgl_3d && !bo->notified)
+		goto out_notify;
+	else if (!vgdev->has_virgl_3d)
+		goto out;
 
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
@@ -123,7 +126,10 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 
 	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
 					       objs);
+out_notify:
+	bo->notified = true;
 	virtio_gpu_notify(vgdev);
+out:
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d9039bb7c5e37..51a8da7d5ef3b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -241,7 +241,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	virtio_gpu_notify(vgdev);
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

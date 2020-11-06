Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5922AAE0F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72531897F9;
	Sun,  8 Nov 2020 22:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7F6EAB5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:46 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id ec16so717642qvb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nz9fkxFdcHJ7ADLc2X+aLLgEbUSgZI45eX7FI+RDIco=;
 b=YprrwzJHGd5zC+abZoj17nWgMOHXzcGvRcqC+fRwiSUe1n215VgAqZCBZtCmhA2c18
 lVAh6izQHx3Gok6f9X6hwjH7OemNhVCxoIBH00xFxVbi4wg+v/pOV2geUYl2g9I18yCU
 Pf9wzt5ZePHnXDN6GXQUuSAHrWtJRLIP5H3g/dFVz2WXaX9TF88rOXR1FidZi4BhStnW
 RP8ds1UWLtbT2+EX803qrxQpP6WqD9o0pyH9rMgIT81lZvO/Sixw/VsS6yYby+XcugT5
 rGCLAxN0LjEJRCcI3Dz0nnD25SV96mmVZa+QWamoV6im/LJuv1HFtxmEaZBML9XSBT2h
 m3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nz9fkxFdcHJ7ADLc2X+aLLgEbUSgZI45eX7FI+RDIco=;
 b=M7Bq3/r0o7rwetum9FlF1yAouNFno4+okYKvkeQVH1fwlWH0gGNW8IWc+bYVyJm8QQ
 EUqSCMkxs9kdZxQ5uQ2lIc+GwV/i6CtWIU/7EtYUtMVYYDos17r1OBmGrsiPsPYqtm9r
 9C+zQl7vcFvnu84N950vnQjsxFa8eOM9tUDVulZGaKSlnHaL85sLFAAwrLwwrnlv9/NE
 /I1yvh4MdyF+OncieM60vnBELO+waNHwUbF8iW65Wcz5a6q35BC3PeN5p7WPLSXNBCi7
 tX70An4QdhmCX9Lw5VuE1vR9bRlM9wDbNgO6joLVzC/WvR29vjozAw24lSxqiUaDNr5k
 9xVA==
X-Gm-Message-State: AOAM532OLFMLm/yBIMcDn2ya9+LIOufW7E0KCnZzCH8i9OF/kMgDBvVt
 V5XbtIhgZ9KQMV0d5AixBmE8kA==
X-Google-Smtp-Source: ABdhPJwtilSBuJYfYaXlVmxWrU+ttzbHoc/4G/Yq+TmgFp3KyG8KAzxZCHi7nOXjHAXUO9CN42aFMA==
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr2478454qvb.47.1604680725952; 
 Fri, 06 Nov 2020 08:38:45 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:45 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Date: Fri,  6 Nov 2020 11:34:33 -0500
Message-Id: <20201106163437.30836-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it possible to use the non-coherent cached MSM_BO_CACHED mode,
which otherwise doesn't provide any method for cleaning/invalidating the
cache to sync with the device.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h |  2 ++
 drivers/gpu/drm/msm/msm_gem.c | 23 +++++++++++++++++++++++
 include/uapi/drm/msm_drm.h    | 20 ++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bae48afca82e..3f17acdf6594 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -959,6 +959,26 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
 
+static int msm_ioctl_gem_sync_cache(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct drm_msm_gem_sync_cache *args = data;
+	struct drm_gem_object *obj;
+
+	if (args->flags & ~MSM_GEM_SYNC_CACHE_FLAGS)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	msm_gem_sync_cache(obj, args->flags, args->offset, args->end);
+
+	drm_gem_object_put(obj);
+
+	return 0;
+}
+
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
@@ -971,6 +991,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_SYNC_CACHE,    msm_ioctl_gem_sync_cache,    DRM_RENDER_ALLOW),
 };
 
 static const struct vm_operations_struct vm_ops = {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 22ebecb28349..f170f843010e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -318,6 +318,8 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
 void msm_gem_active_put(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
+void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
+		size_t range_start, size_t range_end);
 void msm_gem_free_object(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3d8254b5de16..039738696f9a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -797,6 +797,29 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
 	return 0;
 }
 
+void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
+		size_t range_start, size_t range_end)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct device *dev = msm_obj->base.dev->dev;
+
+	/* exit early if get_pages() hasn't been called yet */
+	if (!msm_obj->pages)
+		return;
+
+	/* TODO: sync only the specified range */
+
+	if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
+		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
+				msm_obj->sgt->nents, DMA_TO_DEVICE);
+	}
+
+	if (flags & MSM_GEM_SYNC_FOR_CPU) {
+		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
+				msm_obj->sgt->nents, DMA_FROM_DEVICE);
+	}
+}
+
 #ifdef CONFIG_DEBUG_FS
 static void describe_fence(struct dma_fence *fence, const char *type,
 		struct seq_file *m)
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 474497e8743a..c8288f328528 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -319,6 +319,24 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+/*
+ * Host cache maintenance (relevant for MSM_BO_CACHED)
+ * driver may both clean/invalidate (flush) for clean
+ */
+
+#define MSM_GEM_SYNC_FOR_DEVICE		0x1
+#define MSM_GEM_SYNC_FOR_CPU		0x2
+
+#define MSM_GEM_SYNC_CACHE_FLAGS	(MSM_GEM_SYNC_FOR_DEVICE | \
+					 MSM_GEM_SYNC_FOR_CPU)
+
+struct drm_msm_gem_sync_cache {
+	__u32 handle;
+	__u32 flags;
+	__u64 offset;
+	__u64 end;      /* offset + size */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -336,6 +354,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_GEM_SYNC_CACHE         0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -348,6 +367,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_GEM_SYNC_CACHE     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_GEM_SYNC_CACHE, struct drm_msm_gem_sync_cache)
 
 #if defined(__cplusplus)
 }
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

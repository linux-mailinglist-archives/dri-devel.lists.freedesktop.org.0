Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0812B3AEC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E589CF5;
	Mon, 16 Nov 2020 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D976E92E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:12 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id b11so6498291qvr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nz9fkxFdcHJ7ADLc2X+aLLgEbUSgZI45eX7FI+RDIco=;
 b=oT6GanUiEAYa4DT9oS93wnN/T5Olbv/y1qNy+eP3d46oevM4D6RcVboRTWbnXGWHR3
 dgGZVs7KrJkgcj3I1qlreXZ7Y8fDNxlgXtC2EkqGtWcWR5nHvXlxuf8ojfeCpm3Vg/nO
 Wl2wM+xfwwdmW7CtTyN2ucD6RgSHEeimVscqitKH4FGHvQUbzLHv6Rt5cuPTN6FiTgNe
 Sno3myekww5aVdfj9tIzdPOVsUQTBVSfEcIYhWPgGvUXlTEx35+kiZ2fAJuvi+RIREQo
 zPqTw4xpMsoSVjkOQq1GwOqZ2C26Q6PpW4XUJxo1be1vT8kKQq8/55oURO8AB5GZos7+
 1PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nz9fkxFdcHJ7ADLc2X+aLLgEbUSgZI45eX7FI+RDIco=;
 b=iJa3PK8UHkpLJmyJCjT9tsAV80VpnlD4ITnsDcS4Hq0hLQ1J8WK1JAkSz6nWKFKfta
 bqCa1XbLk2j42rMRZw7em5QSaVzjFU3awpl6QAJX5bQ7qQ5is0FUBXP+o1asFVqQ/YuF
 VeLdmDi/doXdcWuq2KVa1naTjugRtEzkOrKGQhGi9E3OcFCodGuwkdLBwii0XuNbilF/
 SG1l3W8ais3ntOz0KHaLmzDe68hAy6X84gq5eLgDFlKQSB/HagPdbsTliRyFWiEOKA9p
 7RxHBYnhbSnzREfOAH6Mr4hnoCQO2RfS1WTPg2NO4RZnoMUJYR46RwnOKaCaz9TtQphO
 htig==
X-Gm-Message-State: AOAM532BGyxjEzggRmTftGKl3Li6bB2WXBqpHzY0Ex9xj+aPM70XowYJ
 kmET8uItLKKEAuqJrEOYnbV9gLOD6eWm7ffvH18=
X-Google-Smtp-Source: ABdhPJyncpGsM9ZlDiCyty99ZXjq0rTsLy7HI5X6wzf46yQiXsXlNWZXkxJYSmE74k6vzYDdDPpSPg==
X-Received: by 2002:a0c:c709:: with SMTP id w9mr7766274qvi.50.1605367271595;
 Sat, 14 Nov 2020 07:21:11 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:10 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Subject: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
Date: Sat, 14 Nov 2020 10:17:12 -0500
Message-Id: <20201114151717.5369-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

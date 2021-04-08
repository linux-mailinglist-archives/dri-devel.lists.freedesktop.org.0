Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A190F357C1E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 08:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2AC6EA0C;
	Thu,  8 Apr 2021 06:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716AC6E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 05:00:24 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q10so538215pgj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 22:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAhu6CqdAQ+BdgBQcTHerGRp4ijsbWysCLX6FzCbuNw=;
 b=ADhdKz4Sx9y75de5EanjHhDJY5wMx53a0RBpg55jv4x21G0Bt/bR3dpLd2DEUyprKN
 aZTY3tjatR+vD34kAUTWc6yMHUc39U9snLdbdNI/3JtD+Z9ZET5Fd7TK+FvfWZuMbqm9
 dp4d2H6TcXRdMqXoBY9SeW4EJDR6lFDEnS1ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAhu6CqdAQ+BdgBQcTHerGRp4ijsbWysCLX6FzCbuNw=;
 b=f+hR2e6/epnyB1k09gRFW35y2wZaxfwa5eqHhHV6dKGzcLmTkXrQxURQcOHy7dDO1w
 7St4YEAjtH24CFs9T3hPSwhwziZ5hPjvjsU45LQk01j7YwfQl9cxz1foA3REm/d8TLk3
 YVsVwtChWiofXF1cru1t97zr+2SzKpuZqHjt9JabROPYkC+ugSCE4SkWSwArqFngZx3f
 YftIdftqFHhgEXeVFPncjK6KIprqhe2YlKpl+qlw1qC/qM/XtAwwjDla7CESp8u7ue6h
 iTXFEugA3K1nfXJQCR6RngtjGupZbogi0eFh6FyM+/HIw1sFNHICuFQUpYfzk43IXYvI
 Ngyw==
X-Gm-Message-State: AOAM530GVKR8KNrggdqtCjahRpDQ2iAP7rToGjrDXoJ+B8drBqLDssuQ
 5jGY55N6t2j75CZh8nqPgv74Wg==
X-Google-Smtp-Source: ABdhPJz087ziF9CITNv68k2QMOx7nCzUgfYsJUromTlsf7o5zATa6GEr68p54yhZQi867KciJ0i4+g==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr6238482pgt.130.1617858024006; 
 Wed, 07 Apr 2021 22:00:24 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:25d8:8458:73e8:75ac])
 by smtp.gmail.com with UTF8SMTPSA id w67sm23753647pgb.87.2021.04.07.22.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 22:00:23 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] Revert "drm/syncobj: use dma_fence_get_stub"
Date: Thu,  8 Apr 2021 13:59:26 +0900
Message-Id: <20210408045926.3202160-1-stevensd@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 08 Apr 2021 06:04:44 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

This reverts commit 86bbd89d5da66fe760049ad3f04adc407ec0c4d6.

Using the singleton stub fence in drm_syncobj_assign_null_handle means
that all syncobjs created in an already signaled state or any syncobjs
signaled by userspace will reference the singleton fence when exported
to a sync_file. If those sync_files are queried with SYNC_IOC_FILE_INFO,
then the timestamp_ns value returned will correspond to whenever the
singleton stub fence was first initialized. This can break the ability
of userspace to use timestamps of these fences, as the singleton stub
fence's timestamp bears no relationship to any meaningful event.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/drm_syncobj.c | 58 ++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 349146049849..7cc11f1a83f4 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -211,6 +211,21 @@ struct syncobj_wait_entry {
 static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 				      struct syncobj_wait_entry *wait);
 
+struct drm_syncobj_stub_fence {
+	struct dma_fence base;
+	spinlock_t lock;
+};
+
+static const char *drm_syncobj_stub_fence_get_name(struct dma_fence *fence)
+{
+	return "syncobjstub";
+}
+
+static const struct dma_fence_ops drm_syncobj_stub_fence_ops = {
+	.get_driver_name = drm_syncobj_stub_fence_get_name,
+	.get_timeline_name = drm_syncobj_stub_fence_get_name,
+};
+
 /**
  * drm_syncobj_find - lookup and reference a sync object.
  * @file_private: drm file private pointer
@@ -344,18 +359,24 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
 }
 EXPORT_SYMBOL(drm_syncobj_replace_fence);
 
-/**
- * drm_syncobj_assign_null_handle - assign a stub fence to the sync object
- * @syncobj: sync object to assign the fence on
- *
- * Assign a already signaled stub fence to the sync object.
- */
-static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
+static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_get_stub();
+	struct drm_syncobj_stub_fence *fence;
 
-	drm_syncobj_replace_fence(syncobj, fence);
-	dma_fence_put(fence);
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return -ENOMEM;
+
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &drm_syncobj_stub_fence_ops,
+		       &fence->lock, 0, 0);
+	dma_fence_signal(&fence->base);
+
+	drm_syncobj_replace_fence(syncobj, &fence->base);
+
+	dma_fence_put(&fence->base);
+
+	return 0;
 }
 
 /* 5s default for wait submission */
@@ -469,6 +490,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence)
 {
+	int ret;
 	struct drm_syncobj *syncobj;
 
 	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
@@ -479,8 +501,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 	INIT_LIST_HEAD(&syncobj->cb_list);
 	spin_lock_init(&syncobj->lock);
 
-	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
-		drm_syncobj_assign_null_handle(syncobj);
+	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
+		ret = drm_syncobj_assign_null_handle(syncobj);
+		if (ret < 0) {
+			drm_syncobj_put(syncobj);
+			return ret;
+		}
+	}
 
 	if (fence)
 		drm_syncobj_replace_fence(syncobj, fence);
@@ -1322,8 +1349,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < args->count_handles; i++)
-		drm_syncobj_assign_null_handle(syncobjs[i]);
+	for (i = 0; i < args->count_handles; i++) {
+		ret = drm_syncobj_assign_null_handle(syncobjs[i]);
+		if (ret < 0)
+			break;
+	}
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

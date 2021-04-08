Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B515357F47
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06986EA43;
	Thu,  8 Apr 2021 09:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08F76EA40
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:34:59 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id t140so987299pgb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 02:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxv/WXld0B+xmj9GZnz0sseyRcT1qkV/u/IKiIAEv/Q=;
 b=gMOyNzJ0k+OalPZrTd51WivZ4YbArRpwjdUNzUFX69r0NgyUuTUQPB57PatESKsTrf
 WOtnfCgP5u2vHWzk9GEfm661dV3SVo1WPsdF9gnaMbwDNMmmQ3eNFuFN8HTHEYERMr9h
 TuWLFhKdDOl/6d/xI1XTsgvcLFUxMfXVuMXqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxv/WXld0B+xmj9GZnz0sseyRcT1qkV/u/IKiIAEv/Q=;
 b=RaqZvSTTsfsQ4NECNhWsds/Q/D27ObgddCjtr7jIxfN4Q8x/S2PiFq2TXGaX1rUdGJ
 qW+8Wj1nfUX74ce1QJx8nLzkxFhPUs5un9AvhagLyxMkqFiIcpYPLFhZ9hq9VR6Q61jn
 5Dh0KamEo15GOEt8TkU4kKPdm25bAdvrBRIHl+adfv+4Pp3fq08/nokH6ivBX+z7tCdO
 ebSfDtQ5m3XCTIePdQ6TzIthuHQLKCym/O5l6nsuwgmh3PUqw3i95R7H+0NqZEZsMqhX
 l9vemtwXdTtPUxTcAhCHwOK70RB907GckjWoMCCBFlBBVdWmj5BzIaTDQG8Dcp9u9veF
 V60A==
X-Gm-Message-State: AOAM5313fOrltpc7wKhIi/7gP2pQ6GAJ8YGUAqnif+qSd7JAl/NNOIE3
 CO7wEYJjPVnfh4MRLJZh/hva+g==
X-Google-Smtp-Source: ABdhPJwQWi5xElJ6PagwAG6dmu8IlAkOfxRnYenIQ9DXWTYrSYahtzvtDunCPNt/zSdwNcSNxtOkhg==
X-Received: by 2002:a62:e119:0:b029:245:8e0:820 with SMTP id
 q25-20020a62e1190000b029024508e00820mr1085029pfh.4.1617874499500; 
 Thu, 08 Apr 2021 02:34:59 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:25d8:8458:73e8:75ac])
 by smtp.gmail.com with UTF8SMTPSA id h6sm24485707pfb.157.2021.04.08.02.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 02:34:59 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/syncobj: use newly allocated stub fences
Date: Thu,  8 Apr 2021 18:34:48 +0900
Message-Id: <20210408093448.3897988-1-stevensd@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Allocate a new private stub fence in drm_syncobj_assign_null_handle,
instead of using a static stub fence.

When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
should match when the fence's status was changed from the perspective of
userspace, which is during the respective ioctl.

When a static stub fence started being used in by these ioctls, this
behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
became the first time anything used the static stub fence, which has no
meaning to userspace.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/dma-buf/dma-fence.c   | 33 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_syncobj.c | 28 ++++++++++++++++++++--------
 include/linux/dma-fence.h     |  1 +
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d64fc03929be..6081eb962490 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -26,6 +26,11 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
+struct drm_fence_private_stub {
+	struct dma_fence base;
+	spinlock_t lock;
+};
+
 /*
  * fence context counter: each execution context should have its own
  * fence context, this allows checking if fences belong to the same
@@ -123,7 +128,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 /**
  * dma_fence_get_stub - return a signaled fence
  *
- * Return a stub fence which is already signaled.
+ * Return a stub fence which is already signaled. The fence's
+ * timestamp corresponds to the first time after boot this
+ * function is called.
  */
 struct dma_fence *dma_fence_get_stub(void)
 {
@@ -141,6 +148,30 @@ struct dma_fence *dma_fence_get_stub(void)
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
 
+/**
+ * dma_fence_allocate_private_stub - return a private, signaled fence
+ *
+ * Return a newly allocated and signaled stub fence.
+ */
+struct dma_fence *dma_fence_allocate_private_stub(void)
+{
+	struct drm_fence_private_stub *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base,
+		       &dma_fence_stub_ops,
+		       &fence->lock,
+		       0, 0);
+	dma_fence_signal(&fence->base);
+
+	return &fence->base;
+}
+EXPORT_SYMBOL(dma_fence_allocate_private_stub);
+
 /**
  * dma_fence_context_alloc - allocate an array of fence contexts
  * @num: amount of contexts to allocate
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 349146049849..c6125e57ae37 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -350,12 +350,15 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
  *
  * Assign a already signaled stub fence to the sync object.
  */
-static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
+static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_get_stub();
+       struct dma_fence *fence = dma_fence_allocate_private_stub();
+       if (IS_ERR(fence))
+	       return PTR_ERR(fence);
 
-	drm_syncobj_replace_fence(syncobj, fence);
-	dma_fence_put(fence);
+       drm_syncobj_replace_fence(syncobj, fence);
+       dma_fence_put(fence);
+       return 0;
 }
 
 /* 5s default for wait submission */
@@ -469,6 +472,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence)
 {
+	int ret;
 	struct drm_syncobj *syncobj;
 
 	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
@@ -479,8 +483,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
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
@@ -1322,8 +1331,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
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
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 9f12efaaa93a..6ffb4b2c6371 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 }
 
 struct dma_fence *dma_fence_get_stub(void);
+struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
 #define DMA_FENCE_TRACE(f, fmt, args...) \
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

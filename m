Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA342558B4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1E46EB9D;
	Fri, 28 Aug 2020 10:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D16EB9D;
 Fri, 28 Aug 2020 10:40:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id q4so731483eds.3;
 Fri, 28 Aug 2020 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n8VdrNaeUw+s5Bde9W9zXTCaEcxIaS9rdmE/QpD8XYI=;
 b=TaNl+oDfU8Bt/s2upoFRk1ozlBnpmakSkxYBscZY9Q3XTVoaFg+ArK4CBL93Qs3ZI5
 kqfLwTt7tvkA3gl3K+yfgUsuVA7Sy/vlEG8KQlYxLrs0oXPGTIK3X5jdDZXRBRWf/jJ7
 /tC27iq1y7ADIOvlPUAMl2GLErqZx3Th+2T/oapRx8GF7SQFLQttbndGXHpOYdOWZgMT
 YkrbJqRzGUWUjp/5qXvKjbByuCdYwmVhclXHn2ofzpBLhzWTLf+vJuuvvN03WvZYtDEy
 Pzt6OKlmeGgwEGYCKw5fPZf9sLIdKNHhIDz7l+i6Bwid70FNOgf/FTHT1nsYKDP/QFJh
 hDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8VdrNaeUw+s5Bde9W9zXTCaEcxIaS9rdmE/QpD8XYI=;
 b=NHjTAYcyd84IY0Gd5lpjyUa8kq1o99vI9aMYRjg5NPTrc2xchjPsDi7CTrkjJV1M8X
 GXacY+6k4XijuN+5KLlDa9CmizpNPnZKqW0wpyj3KptpMHNEp/jgmcdNiJlnBKNxlTmS
 N5yqFALnOQcI2TsWL4MQyaKqpnEYK4P2VZ9PpIHEkyk6UT/sGZA3Qu81n5qjkzgNxQQd
 l0FFeG2LsW/nBIqEFRKVlGCHpg235lGiY0O94LtfmW/3xghEUsPGDfVh6oEs1mSeGgEx
 Siugvup0V86yIv9A9ox9Kr/KQUlhmY+ifddnwUHevu+CPWmAemY378shkzpcG1PJa26L
 KMVA==
X-Gm-Message-State: AOAM5332WNdxiwD8tlB/O9klp2qU+THxYEFj2dpPoJTJUpRwMofPfCXp
 Argo3upmPIq9crGMA9ZntpY=
X-Google-Smtp-Source: ABdhPJwXVGEN3JJB8oLzErQapujet3304Z9FTgKeaeU+KLhDvxAefbGHyAKI/qjOI6/Eb50ZVfM7SA==
X-Received: by 2002:a50:e70e:: with SMTP id a14mr1109009edn.93.1598611231993; 
 Fri, 28 Aug 2020 03:40:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r15sm640198edv.94.2020.08.28.03.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 4/6] drm/nouveau: Support sync FDs and syncobjs
Date: Fri, 28 Aug 2020 12:40:14 +0200
Message-Id: <20200828104016.1672195-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Extends the new NOUVEAU_GEM_PUSHBUF2 IOCTL to accept and emit one or
more sync FDs and/or DRM native sync objects.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note: If acceptable, this should be merged into the previous patch that
adds the new IOCTL.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 180 ++++++++++++++++++++++----
 include/uapi/drm/nouveau_drm.h        |  21 ++-
 2 files changed, 167 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 039f244c0a00..b3ece731e4e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -26,6 +26,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <drm/drm_syncobj.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
@@ -680,12 +681,137 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 	return ret;
 }
 
+static int nouveau_channel_wait_fence(struct nouveau_channel *channel,
+				      struct drm_file *file_priv,
+				      struct drm_nouveau_gem_fence *f)
+{
+	struct dma_fence *fence;
+
+	if (f->flags & NOUVEAU_GEM_FENCE_FD) {
+		fence = sync_file_get_fence(f->handle);
+		if (!fence)
+			return -ENOENT;
+	} else {
+		struct drm_syncobj *syncobj;
+
+		syncobj = drm_syncobj_find(file_priv, f->handle);
+		if (!syncobj)
+			return -ENOENT;
+
+		fence = drm_syncobj_fence_get(syncobj);
+		drm_syncobj_put(syncobj);
+	}
+
+	return nouveau_fence_sync(fence, channel, true);
+}
+
+static int nouveau_channel_wait_fences(struct nouveau_channel *channel,
+				       struct drm_file *file_priv,
+				       struct drm_nouveau_gem_fence *fences,
+				       unsigned int num_fences)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_fences; i++) {
+		if (fences[i].flags & NOUVEAU_GEM_FENCE_WAIT) {
+			ret = nouveau_channel_wait_fence(channel, file_priv,
+							 &fences[i]);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct nouveau_fence *
+nouveau_channel_emit_fence(struct nouveau_channel *channel,
+			   struct drm_file *file_priv,
+			   struct drm_nouveau_gem_fence *f)
+{
+	struct nouveau_fence *fence;
+	int ret;
+
+	ret = nouveau_fence_new(channel, false, &fence);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (f->flags & NOUVEAU_GEM_FENCE_FD) {
+		struct sync_file *file;
+		int fd;
+
+		fd = get_unused_fd_flags(O_CLOEXEC);
+		if (fd < 0) {
+			ret = fd;
+			goto put;
+		}
+
+		file = sync_file_create(&fence->base);
+		if (!file) {
+			put_unused_fd(fd);
+			ret = -ENOMEM;
+			goto put;
+		}
+
+		fd_install(fd, file->file);
+		f->handle = fd;
+	} else {
+		struct drm_syncobj *syncobj;
+
+		ret = drm_syncobj_create(&syncobj, 0, &fence->base);
+		if (ret < 0)
+			goto put;
+
+		ret = drm_syncobj_get_handle(file_priv, syncobj, &f->handle);
+		drm_syncobj_put(syncobj);
+	}
+
+put:
+	nouveau_fence_unref(&fence);
+	return ERR_PTR(ret);
+}
+
+static struct nouveau_fence *
+nouveau_channel_emit_fences(struct nouveau_channel *channel,
+			    struct drm_file *file_priv,
+			    struct drm_nouveau_gem_fence *fences,
+			    unsigned int num_fences)
+{
+	struct nouveau_fence *fence = NULL, *f;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_fences; i++) {
+		if (fences[i].flags & NOUVEAU_GEM_FENCE_EMIT) {
+			f = nouveau_channel_emit_fence(channel, file_priv,
+						        &fences[i]);
+			if (IS_ERR(f))
+				return f;
+
+			if (!fence)
+				fence = f;
+		}
+	}
+
+	if (!fence) {
+		ret = nouveau_fence_new(channel, false, &fence);
+		if (ret)
+			fence = ERR_PTR(ret);
+	} else {
+		nouveau_fence_ref(fence);
+	}
+
+	return fence;
+}
+
 static int
 __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 			    struct drm_nouveau_gem_pushbuf2 *request,
 			    struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct drm_nouveau_gem_fence __user *user_fences;
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -693,12 +819,13 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_nouveau_gem_pushbuf_bo *bo;
+	struct drm_nouveau_gem_fence *fences = NULL;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
 	struct nouveau_fence *fence = NULL;
-	struct dma_fence *prefence = NULL;
 	int i, j, ret = 0;
 	bool do_reloc = false, sync = false;
+	size_t size;
 
 	/* check for unrecognized flags */
 	if (request->flags & ~NOUVEAU_GEM_PUSHBUF_FLAGS)
@@ -773,13 +900,18 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		goto out_prevalid;
 	}
 
-	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_WAIT) {
-		prefence = sync_file_get_fence(request->fence);
-		if (prefence) {
-			ret = nouveau_fence_sync(prefence, chan, true);
-			if (ret < 0)
-				goto out;
+	if (request->num_fences > 0) {
+		fences = u_memcpya(request->fences, request->num_fences,
+				   sizeof(*fences));
+		if (IS_ERR(fences)) {
+			ret = PTR_ERR(fences);
+			goto out;
 		}
+
+		ret = nouveau_channel_wait_fences(chan, file_priv, fences,
+						  request->num_fences);
+		if (ret < 0)
+			goto out;
 	}
 
 	/* Apply any relocations that are required */
@@ -869,10 +1001,13 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		}
 	}
 
-	ret = nouveau_fence_new(chan, false, &fence);
-	if (ret) {
+	fence = nouveau_channel_emit_fences(chan, file_priv, fences,
+					    request->num_fences);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
 		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
 		WIND_RING(chan);
+		fence = NULL;
 		goto out;
 	}
 
@@ -883,29 +1018,18 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		}
 	}
 
-	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_EMIT) {
-		struct sync_file *file;
-		int fd;
-
-		fd = get_unused_fd_flags(O_CLOEXEC);
-		if (fd < 0) {
-			ret = fd;
-			goto out;
-		}
-
-		file = sync_file_create(&fence->base);
-		if (!file) {
-			put_unused_fd(fd);
-			goto out;
-		}
+	user_fences = u64_to_user_ptr(request->fences);
+	size = sizeof(*fences) * request->num_fences;
 
-		fd_install(fd, file->file);
-		request->fence = fd;
+	if (copy_to_user(user_fences, fences, size)) {
+		WIND_RING(chan);
+		ret = -EFAULT;
+		fence = NULL;
+		goto out;
 	}
 
 out:
-	if (prefence)
-		dma_fence_put(prefence);
+	u_free(fences);
 
 	validate_fini(&op, chan, fence, bo);
 	nouveau_fence_unref(&fence);
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 85425dc90301..5b8d40228a1b 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -115,16 +115,25 @@ struct drm_nouveau_gem_pushbuf {
 	__u64 gart_available;
 };
 
-#define NOUVEAU_GEM_PUSHBUF_FENCE_WAIT (1 << 0)
-#define NOUVEAU_GEM_PUSHBUF_FENCE_EMIT (1 << 1)
-#define NOUVEAU_GEM_PUSHBUF_FLAGS (NOUVEAU_GEM_PUSHBUF_FENCE_WAIT | \
-				   NOUVEAU_GEM_PUSHBUF_FENCE_EMIT)
+#define NOUVEAU_GEM_FENCE_WAIT	(1 << 0)
+#define NOUVEAU_GEM_FENCE_EMIT	(1 << 1)
+#define NOUVEAU_GEM_FENCE_FD	(1 << 2)
+#define NOUVEAU_GEM_FENCE_FLAGS	(NOUVEAU_GEM_FENCE_WAIT | \
+				 NOUVEAU_GEM_FENCE_EMIT | \
+				 NOUVEAU_GEM_FENCE_FD)
+
+struct drm_nouveau_gem_fence {
+	__u32 handle;
+	__u32 flags;
+};
+
+#define NOUVEAU_GEM_PUSHBUF_FLAGS	0
 
 struct drm_nouveau_gem_pushbuf2 {
 	struct drm_nouveau_gem_pushbuf base;
 	__u32 flags;
-	__s32 fence;
-	__u64 reserved;
+	__u32 num_fences;
+	__u64 fences;
 };
 
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

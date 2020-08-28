Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542162558B1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB306EB95;
	Fri, 28 Aug 2020 10:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2D06EB8D;
 Fri, 28 Aug 2020 10:40:31 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d26so903990ejr.1;
 Fri, 28 Aug 2020 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5As8i+GKrNIShjThEVZMVHGpni+U0sDtftFt+Q5RT0=;
 b=cyc1+YXGBcdmggBPZpuwDsHCc32Aap71Ok8XC1hzJSEh+Udyy3WwqtmHCzYclF3Q3L
 T/VijzQooIi6YOlqdCaiVYgmGqq8NWIMrsn05ttcHiO9BLcg//oge7aMu7H1rnGJOI1Q
 UawsKHi2SYFkNGsvvzdjNfk8c//xqEGAQa2HsVVcnxHBJfK486GSZrvNMwJzUIkg3JXU
 Qfy1IoBK+KtPXtAJUEzxnbEMZGKlSCSq6T1tSiH3n5BVOtvzU1Jmf0zKt3pL6KtpO3hj
 k8OtHoMjhcdoKibrgmB5VTnhTA5jpfjqRiuUZcLscH13viglUxgGiaBVmAQR5KbXNoFQ
 uyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5As8i+GKrNIShjThEVZMVHGpni+U0sDtftFt+Q5RT0=;
 b=R6+NzFcSb2SjuSRc/lhnxWqTBQ9uLboXsyfZGmkwpLdl00jFGfPQpq0XVG2yrwPVQ+
 VPW3xwrNRYXbvaAw0OGM2ZwjpuhugJ9v363mvRBHDK++AovhhZU95U0ONJjteMx/iBDB
 BgaGIXPDp37hiwZYI+zxvI7/1DbcAZLUB3HMwjl+B0o4+9LmdInW3rvQZe6oA4TQpLhH
 PwMgrTeqOPKVPIE9C/DwAjXkfpCaBkgWbKRJQQVtYBOV1csjepLC0FhEk7Gc8FItHMfQ
 91rdWWUDA3CCpwKVmP0cB5M971Nj2avfXARv5U5XTYR7WbgxtTZXErtDd51p15Crg14+
 rSRw==
X-Gm-Message-State: AOAM533VTKrKCa8hO8/0L2TrL2Xh/cVyrhARsObeaG7f96QEIYUJmsLJ
 5eKkdKRDzY27S6TbEJ8FjGY=
X-Google-Smtp-Source: ABdhPJzoVRSsPdtnJ9XmoDaPmTs1Fk3jxiK9nDIbvYy91VU15S4b17wg7r+YDlj7mjXySc9xgcpAug==
X-Received: by 2002:a17:906:84c1:: with SMTP id
 f1mr1084391ejy.494.1598611229927; 
 Fri, 28 Aug 2020 03:40:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v17sm553403eju.22.2020.08.28.03.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 3/6] drm/nouveau: Support fence FDs at kickoff
Date: Fri, 28 Aug 2020 12:40:13 +0200
Message-Id: <20200828104016.1672195-4-thierry.reding@gmail.com>
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

Add a new NOUVEAU_GEM_PUSHBUF2 IOCTL that accepts and emits a sync fence
FD from/to userspace if requested by the corresponding flags.

Based heavily on work by Lauri Peltonen <lpeltonen@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c | 79 +++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_gem.h |  2 +
 include/uapi/drm/nouveau_drm.h        | 14 +++++
 4 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..c9cb2648a28b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1140,6 +1140,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_PUSHBUF2, nouveau_gem_ioctl_pushbuf2, DRM_RENDER_ALLOW),
 };
 
 long
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 590e4c1d2e8a..039f244c0a00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -24,6 +24,9 @@
  *
  */
 
+#include <linux/file.h>
+#include <linux/sync_file.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
@@ -677,24 +680,30 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 	return ret;
 }
 
-int
-nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv)
+static int
+__nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
+			    struct drm_nouveau_gem_pushbuf2 *request,
+			    struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct drm_nouveau_gem_pushbuf *req = data;
+	struct drm_nouveau_gem_pushbuf *req = &request->base;
 	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
 	struct drm_nouveau_gem_pushbuf_bo *bo;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
 	struct nouveau_fence *fence = NULL;
+	struct dma_fence *prefence = NULL;
 	int i, j, ret = 0;
 	bool do_reloc = false, sync = false;
 
+	/* check for unrecognized flags */
+	if (request->flags & ~NOUVEAU_GEM_PUSHBUF_FLAGS)
+		return -EINVAL;
+
 	if (unlikely(!abi16))
 		return -ENOMEM;
 
@@ -764,6 +773,15 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		goto out_prevalid;
 	}
 
+	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_WAIT) {
+		prefence = sync_file_get_fence(request->fence);
+		if (prefence) {
+			ret = nouveau_fence_sync(prefence, chan, true);
+			if (ret < 0)
+				goto out;
+		}
+	}
+
 	/* Apply any relocations that are required */
 	if (do_reloc) {
 		if (!reloc) {
@@ -865,7 +883,30 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (request->flags & NOUVEAU_GEM_PUSHBUF_FENCE_EMIT) {
+		struct sync_file *file;
+		int fd;
+
+		fd = get_unused_fd_flags(O_CLOEXEC);
+		if (fd < 0) {
+			ret = fd;
+			goto out;
+		}
+
+		file = sync_file_create(&fence->base);
+		if (!file) {
+			put_unused_fd(fd);
+			goto out;
+		}
+
+		fd_install(fd, file->file);
+		request->fence = fd;
+	}
+
 out:
+	if (prefence)
+		dma_fence_put(prefence);
+
 	validate_fini(&op, chan, fence, bo);
 	nouveau_fence_unref(&fence);
 
@@ -906,6 +947,27 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	return nouveau_abi16_put(abi16, ret);
 }
 
+int
+nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf *request = data;
+	struct drm_nouveau_gem_pushbuf2 req;
+	int ret;
+
+	memset(&req, 0, sizeof(req));
+	memcpy(&req.base, request, sizeof(*request));
+
+	ret = __nouveau_gem_ioctl_pushbuf(dev, &req, file_priv);
+
+	request->gart_available = req.base.gart_available;
+	request->vram_available = req.base.vram_available;
+	request->suffix1 = req.base.suffix1;
+	request->suffix0 = req.base.suffix0;
+
+	return ret;
+}
+
 int
 nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 			   struct drm_file *file_priv)
@@ -973,3 +1035,12 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
+int
+nouveau_gem_ioctl_pushbuf2(struct drm_device *dev, void *data,
+			   struct drm_file *file_priv)
+{
+	struct drm_nouveau_gem_pushbuf2 *req = data;
+
+	return __nouveau_gem_ioctl_pushbuf(dev, req, file_priv);
+}
+
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index 978e07591990..652a63242303 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -29,6 +29,8 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 				      struct drm_file *);
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
+extern int nouveau_gem_ioctl_pushbuf2(struct drm_device *, void *,
+				      struct drm_file *);
 
 extern int nouveau_gem_prime_pin(struct drm_gem_object *);
 extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..85425dc90301 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -115,6 +115,18 @@ struct drm_nouveau_gem_pushbuf {
 	__u64 gart_available;
 };
 
+#define NOUVEAU_GEM_PUSHBUF_FENCE_WAIT (1 << 0)
+#define NOUVEAU_GEM_PUSHBUF_FENCE_EMIT (1 << 1)
+#define NOUVEAU_GEM_PUSHBUF_FLAGS (NOUVEAU_GEM_PUSHBUF_FENCE_WAIT | \
+				   NOUVEAU_GEM_PUSHBUF_FENCE_EMIT)
+
+struct drm_nouveau_gem_pushbuf2 {
+	struct drm_nouveau_gem_pushbuf base;
+	__u32 flags;
+	__s32 fence;
+	__u64 reserved;
+};
+
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
 #define NOUVEAU_GEM_CPU_PREP_WRITE                                   0x00000004
 struct drm_nouveau_gem_cpu_prep {
@@ -141,6 +153,7 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_GEM_PUSHBUF2       0x45
 
 struct drm_nouveau_svm_init {
 	__u64 unmanaged_addr;
@@ -196,6 +209,7 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
+#define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF2       DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF2, struct drm_nouveau_gem_pushbuf2)
 
 #if defined(__cplusplus)
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

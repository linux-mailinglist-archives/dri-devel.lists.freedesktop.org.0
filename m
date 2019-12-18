Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC1123C25
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758376E1F4;
	Wed, 18 Dec 2019 01:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559016E202
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:59 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id h14so206830pfe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyyHW+YsY1PWq9tcDK5vwtSS9rTi8+t7ITEZCepACZA=;
 b=fQQYKOluVr3D7Hici4YaNYgM45AU851Z6qn0GoH4GAfT+yE1ZM7uEVRBDAMVsuGIB8
 85Yq3ZMuuE9196lq2Bq1WehFqsSLprO1O6XDHhvbqSg1laQTAlt2THryEB4cM1sR8eJQ
 HFpkeqKLSC4aLU6xQWQDsW2AyjMRGqkcc3IfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yyyHW+YsY1PWq9tcDK5vwtSS9rTi8+t7ITEZCepACZA=;
 b=FQ22gxY1EKyk+o79erIDRVbL/oIPFHDvl4al+IHPSzTtUQyAY0nmTE803pl891lxhC
 UKd5PPbozCZY4rIG7JspJEs95fSn5xre6KzWOqfASuV6Xbg7xm40cdaUn4ELVUSY8G1P
 YX9EWWcZIXULo/FIVRRWs1ShSEM8Ww4cs05JzjXWe/BJ8PCwRU5aIcYDrURu+KDAG8Ki
 UC0MosnHNIPO7IuPz3H5BkzbpaeI3B8PBxwluPPSCKraJmehhycGPOzW9L8so5WGDO2Z
 0YiVDYb/XMjY7lmENaYm7B9bnbFmaP4f8IdaIX9Q7wsrTXFmrQylNK4PP5nI5FB11GK6
 H+xQ==
X-Gm-Message-State: APjAAAWwtHj8qPvIPsKAFLmfhR6DJOjjA2zrksN3JSAZ6IpxbzCPkHRN
 RP0xaBN2SIr5W/BD9pkIYPels3b96hQ=
X-Google-Smtp-Source: APXvYqxmOdwSb9P2sFmqJ1hUzt2dtqEc+xQsWTPwGWeSvRmA53hKlOAmDc7McfAQgjT9nmcHhQtbOQ==
X-Received: by 2002:a65:58c7:: with SMTP id e7mr330526pgu.390.1576630798607;
 Tue, 17 Dec 2019 16:59:58 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:58 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/virtio: remove virtgpu_gem_prime_import_sg_table
Date: Tue, 17 Dec 2019 16:59:25 -0800
Message-Id: <20191218005929.6709-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sharing memory between virtio devices is ill-defined, so until
we have something let's get rid of this.

drm_gem_prime_import_dev returns an error if the callback is NULL.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/Makefile        |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 ----
 drivers/gpu/drm/virtio/virtgpu_prime.c | 38 --------------------------
 4 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 drivers/gpu/drm/virtio/virtgpu_prime.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index 92aa2b3d349d..36d8cf8e0cec 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -6,6 +6,6 @@
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
 	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
-	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
+	virtgpu_ioctl.o virtgpu_trace_points.o
 
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 8cf27af3ad53..e942465e4fb1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -200,8 +200,7 @@ static struct drm_driver driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_mmap = drm_gem_prime_mmap,
-	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
-
+	.gem_prime_import_sg_table = NULL,
 	.gem_create_object = virtio_gpu_create_object,
 	.fops = &virtio_gpu_driver_fops,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 8dfb39f98552..77f446608ca9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -359,11 +359,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
-/* virtgpu_prime.c */
-struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
-	struct drm_device *dev, struct dma_buf_attachment *attach,
-	struct sg_table *sgt);
-
 /* virgl debugfs */
 int virtio_gpu_debugfs_init(struct drm_minor *minor);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
deleted file mode 100644
index 050d24c39a8f..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright 2014 Canonical
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Andreas Pokorny
- */
-
-#include <drm/drm_prime.h>
-
-#include "virtgpu_drv.h"
-
-/* Empty Implementations as there should not be any other driver for a virtual
- * device that might share buffers with virtgpu
- */
-
-struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
-	struct drm_device *dev, struct dma_buf_attachment *attach,
-	struct sg_table *table)
-{
-	return ERR_PTR(-ENODEV);
-}
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

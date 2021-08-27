Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829673F99A1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECFD6E940;
	Fri, 27 Aug 2021 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD46E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t15so4177798wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsjiOIONlFkeiKb/INebhBc5lywdJIjsSRJt4IKPGns=;
 b=fH3b05GKveYwAkc9duGadR6u+z356FlLTrepePBf3ShmZSe0Ibqa7RsSYNAvYrr9J1
 xh4LahdAXtGh6PXIhSzO1cGUXzOTJQbcgU4qPgAgg+SWQiGZZUN9YiAlbbqJoRtHgqwE
 Zv+TZ/NE8Qkjc/aORO7lho0I2FhwvafgdZFscKwgRj50vk50s7lgQMAzFadby9BthoOJ
 OUII0D2NUhOlm4/dJAZw4RD95lw/bZqiOXnwAL+nYCo+CXJI6sFb6wVX73z7kG5HSWq4
 wuJ5iyWC1xUbKP3vmTjRK0ic7oMiuoWJVnZGw8hdU46pVzaCLf1TFD2LcrPgc6l7zEE/
 vmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsjiOIONlFkeiKb/INebhBc5lywdJIjsSRJt4IKPGns=;
 b=nTMbKIrwVVTXY4R9XgabyDyXs+9ZtAQvmgJlHtA4sZ7t4rIUSaDGfyua1UVx4xVy96
 UArbvUydyewK0vF8hAzb+svOh577+1il9Oy6ch9ZUAMT2paI4FqCB5ejgRKkuJjd7aG4
 hFhNV3tScDxInCiVy+bCrA9Y6dxbJAzTrQQ4bHgINxrETdvBZ4uzCXHGkROfF4Ep6oru
 HD3oqgpJMoLOAuKLTAs7VoWYntpIDWet/Kgbr3PekY7vR2E2EyhL9ZcumYQekJq/Fw+S
 JhGv1LxmiNeg88zqPDCQVM8rKFNH5nsXbS1EeWwgYIdoj6SGnmFZaGDGFMrv/tb3uS3E
 A/tQ==
X-Gm-Message-State: AOAM533W7sGZykw3KJpCHC24uuWg3fST5Y8KMcZrfL+IbN+TIxki411H
 Ep61bBkKScCj4qjGagKsxRBvxTgihcM=
X-Google-Smtp-Source: ABdhPJwhhfJtbCEb8K/twv+oQ/ZOildS44AZcI+udm9RqxwT2SOpQOx34YgejuF0McTq4BDdaa9Q3A==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr9962476wrj.371.1630070603040; 
 Fri, 27 Aug 2021 06:23:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id m24sm8530823wrb.18.2021.08.27.06.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 06/25] tegra: Add PRIME support helpers
Date: Fri, 27 Aug 2021 15:22:46 +0200
Message-Id: <20210827132305.3572077-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

These helpers facilitate exporting and importing buffer objects to and
from PRIME file descriptors.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add drm_public annotations
---
 tegra/tegra-symbols.txt |  2 ++
 tegra/tegra.c           | 61 +++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h           |  4 +++
 3 files changed, 67 insertions(+)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 630e075fa5d7..f8811bcd26f4 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,5 +1,7 @@
+drm_tegra_bo_export
 drm_tegra_bo_get_handle
 drm_tegra_bo_get_name
+drm_tegra_bo_import
 drm_tegra_bo_map
 drm_tegra_bo_new
 drm_tegra_bo_open
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 5eb8518104ef..240600c3c496 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -294,3 +294,64 @@ free:
     free(bo);
     return err;
 }
+
+drm_public int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags)
+{
+    int fd, err;
+
+    flags |= DRM_CLOEXEC;
+
+    err = drmPrimeHandleToFD(bo->drm->fd, bo->handle, flags, &fd);
+    if (err < 0)
+        return err;
+
+    return fd;
+}
+
+static ssize_t fd_get_size(int fd)
+{
+    ssize_t size, offset;
+    int err;
+
+    offset = lseek(fd, 0, SEEK_CUR);
+    if (offset < 0)
+        return -errno;
+
+    size = lseek(fd, 0, SEEK_END);
+    if (size < 0)
+        return -errno;
+
+    err = lseek(fd, offset, SEEK_SET);
+    if (err < 0)
+        return -errno;
+
+    return size;
+}
+
+drm_public int
+drm_tegra_bo_import(struct drm_tegra *drm, int fd, struct drm_tegra_bo **bop)
+{
+    struct drm_tegra_bo *bo;
+    ssize_t size;
+    int err;
+
+    size = fd_get_size(fd);
+    if (size < 0)
+        return size;
+
+    bo = drm_tegra_bo_alloc(drm, 0, 0, size);
+    if (!bo)
+        return -ENOMEM;
+
+    err = drmPrimeFDToHandle(drm->fd, fd, &bo->handle);
+    if (err < 0)
+        goto free;
+
+    *bop = bo;
+
+    return 0;
+
+free:
+    free(bo);
+    return err;
+}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 333690f23118..aaaf455fbc8e 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -48,4 +48,8 @@ int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
 int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
                       struct drm_tegra_bo **bop);
 
+int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags);
+int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
+                        struct drm_tegra_bo **bop);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0


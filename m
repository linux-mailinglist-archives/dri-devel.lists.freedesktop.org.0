Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C534BA98D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D465010E151;
	Thu, 17 Feb 2022 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8958C10E466
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:19:39 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so9613696ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5hZQlt0WbdCrilOqg+d/+UwTJ/H5zCVtwf8pir/dbc=;
 b=SZWBZuOX6UxXQyVDx1E8DIv3hn/XZn6EY8xV+ZwBoczbR/sPn5ocErzmOQgCIaHFVR
 LajPAkhEceNE0JnMqHWyIbo07XuuuhJpJWQGw352nOLQHvBapOQ5kVUooNNZhz3h0m1v
 wVwRSzVLJBJ1Ud7stusr/FJldzE3sHLMHvDnIpaasJZpxUYqKA4+BX3HUiV+dloVSVuv
 XblnW1BDRQY5uyTrfq9rkQvey56/Y5k0kT5U5uM61HgShHJjEfz366nEtMd200agYXKy
 W5rTSDTYhuH540a8IhwhMlwLJvC+4DVbEe96hdpBrI3jvrQ13XLluu+4DG8WEDc9p+Fo
 Qp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5hZQlt0WbdCrilOqg+d/+UwTJ/H5zCVtwf8pir/dbc=;
 b=5aG76BnK+qvS3+vObfVQqVxslYCmqgLQpMEAvxbYX7Uo7HRfEx0ZWZdJ0+QA/7Obml
 NKO1MAnElFEATIuREa+kwYccJEtFF+QIQc2q/kCji6mT1K84GNUQJwWU179w2gMibEmA
 zjp0/vcRxLifLN7ZkWC+F9us3pitx3hW0ouFCOVr0wITXV030osip2cVzsHN//EEyqG0
 mstniagRKAJgLM0SH2rNU1rrcUx8QVyRf/44pRvXbXjFZ6bpD7IDtUHo25exivkrHFkO
 XdAHhQoaMc+Mz5oXH8tzx/VzbAZlhcLv4qOj+tz7xrEFg2MpH7iQ3xGiaJ4IVV9z8V+O
 vEpQ==
X-Gm-Message-State: AOAM5324fJn+1t0AjC7KnrlxN5sDx+Zmpd4525Mn9LtzJ8Z4Upq9DXhs
 y24Z0pQtBzTiGYdxERTw7CVNk1CSOFQ=
X-Google-Smtp-Source: ABdhPJyCdP/ISrBdT9oHnZ3QvzOIgAgL0oBHtLahvgntCnTK5fTn0p/b7kq5pboB49hjMKs4mXdZiA==
X-Received: by 2002:a17:906:c30f:b0:6a7:7de0:7e43 with SMTP id
 s15-20020a170906c30f00b006a77de07e43mr3341426ejz.475.1645125578079; 
 Thu, 17 Feb 2022 11:19:38 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id e18sm3770799edj.85.2022.02.17.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:19:37 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 06/25] tegra: Add PRIME support helpers
Date: Thu, 17 Feb 2022 20:19:12 +0100
Message-Id: <20220217191931.2534836-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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
index 3d645d87dd3d..cf091c1d758f 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -290,3 +290,64 @@ free:
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
2.35.1


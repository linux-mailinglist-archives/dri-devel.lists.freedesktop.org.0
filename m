Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660924BA996
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772D610E69A;
	Thu, 17 Feb 2022 19:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB8810E6A2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:20:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id k25so9594278ejp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SZ+FgAfr+kOkPIsRk6Vrc2Z3qvUkpazmSMFT/zX7/4=;
 b=CUSDqaLmxI2JUGNrWeHIfNOdr+eN7xgYk5qOctSmU09Xv5CT0rGmrVE6uzwmIX+dLy
 sAGsbrCwKI9Iypwr4kkt/uStwKuROEQiBySn0WtCWiSsVPRUqDpvDQQGDaSAzGsw3po3
 JZGdYaUAZF6Tb776M+9+x3McrQnrF/AiIVKjqgpYlOVZWYf+6Y9afrhc3eHKSSWebjxq
 B/d33EVBpt59fsRCLyEpfG36oa6rBpWYxQ04SYWDOS730w5RSWI4fLOmuulBvnXTXSME
 av9D1QRjNViEKHU/GbzamXNsw9nCLrM8nkSnA/qDtH3hZ7FAgvRuaxQmchcFOLY1G32+
 fBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SZ+FgAfr+kOkPIsRk6Vrc2Z3qvUkpazmSMFT/zX7/4=;
 b=ufQdRPye5G9ODQ5a4j0jGSLJs08SjPLDk0CULx5IOBTnwJ1GbdnVq1GFj2nAFi6oVq
 WEUCJa8qDXiYjQ6LVUxeewk2zuzvBop4Xtdm6uzLdLFIwgXtihQb5jdACK2Edv4d/MeR
 yjBRPRj10T7ha03aJRzDnIgcTgHQOd1FwVCYXSBzYfCCHBuoTrQfZp6bKf/HG5ikime+
 /oYrapcQJSkba1QTDdgphngqCZAgPm+nZWUZAMCWx8j6nS8DXO0y5HrTgR7FP8osBPGm
 RonAuwXVcIATXEe2j0i+hEQVo3hBJgqOzUR4y9kzf6qCA4tYQIlwJ2eXNv4C7CTSd2tZ
 hTiA==
X-Gm-Message-State: AOAM53036mwOjp9JHjSqoT3IXq0cZetc1cPQTg6vgg1xQMJpQNCMwOzg
 zYEUabiiWRr92G+No+0k2x95r8KdI1I=
X-Google-Smtp-Source: ABdhPJwfAXm7GQsmjD1vJDCfrZswTkLDub7uCqEFKp5nGameasMhM75P4pltn/LYvqQQL3MbTDx5TA==
X-Received: by 2002:a17:907:98a5:b0:6ce:8c66:e75e with SMTP id
 ju5-20020a17090798a500b006ce8c66e75emr3775419ejc.239.1645125606999; 
 Thu, 17 Feb 2022 11:20:06 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id f29sm1492410ejl.12.2022.02.17.11.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:20:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 11/25] tegra: Add channel APIs
Date: Thu, 17 Feb 2022 20:19:17 +0100
Message-Id: <20220217191931.2534836-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These new functions can be used to open a channel to a given engine, map
and unmap buffer objects to that channel, and close the channel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/channel.c         | 195 ++++++++++++++++++++++++++++++++++++++++
 tegra/meson.build       |   2 +-
 tegra/private.h         |  24 +++++
 tegra/tegra-symbols.txt |   5 ++
 tegra/tegra.h           |  22 +++++
 5 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 tegra/channel.c

diff --git a/tegra/channel.c b/tegra/channel.c
new file mode 100644
index 000000000000..391362023259
--- /dev/null
+++ b/tegra/channel.c
@@ -0,0 +1,195 @@
+/*
+ * Copyright © 2012, 2013 Thierry Reding
+ * Copyright © 2013 Erik Faye-Lund
+ * Copyright © 2014-2021 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <string.h>
+
+#include <sys/ioctl.h>
+
+#include "private.h"
+
+drm_public int
+drm_tegra_channel_open(struct drm_tegra *drm,
+                       enum drm_tegra_class client,
+                       struct drm_tegra_channel **channelp)
+{
+    struct drm_tegra_channel_open args;
+    struct drm_tegra_channel *channel;
+    enum host1x_class class;
+    int err;
+
+    switch (client) {
+    case DRM_TEGRA_HOST1X:
+        class = HOST1X_CLASS_HOST1X;
+        break;
+
+    case DRM_TEGRA_GR2D:
+        class = HOST1X_CLASS_GR2D;
+        break;
+
+    case DRM_TEGRA_GR3D:
+        class = HOST1X_CLASS_GR3D;
+        break;
+
+    case DRM_TEGRA_VIC:
+        class = HOST1X_CLASS_VIC;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    channel = calloc(1, sizeof(*channel));
+    if (!channel)
+        return -ENOMEM;
+
+    channel->drm = drm;
+
+    memset(&args, 0, sizeof(args));
+    args.host1x_class = class;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_OPEN, &args);
+    if (err < 0) {
+        free(channel);
+        return -errno;
+    }
+
+    channel->context = args.context;
+    channel->version = args.version;
+    channel->capabilities = args.capabilities;
+    channel->class = class;
+
+    switch (channel->version) {
+    case 0x20:
+    case 0x30:
+    case 0x35:
+    case 0x40:
+    case 0x21:
+        channel->cond_shift = 8;
+        break;
+
+    case 0x18:
+    case 0x19:
+        channel->cond_shift = 10;
+        break;
+
+    default:
+        return -ENOTSUP;
+    }
+
+    *channelp = channel;
+
+    return 0;
+}
+
+drm_public int drm_tegra_channel_close(struct drm_tegra_channel *channel)
+{
+    struct drm_tegra_channel_close args;
+    struct drm_tegra *drm;
+    int err;
+
+    if (!channel)
+        return -EINVAL;
+
+    drm = channel->drm;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_CLOSE, &args);
+    if (err < 0)
+        return -errno;
+
+    free(channel);
+
+    return 0;
+}
+
+drm_public unsigned int
+drm_tegra_channel_get_version(struct drm_tegra_channel *channel)
+{
+    return channel->version;
+}
+
+drm_public int
+drm_tegra_channel_map(struct drm_tegra_channel *channel,
+                      struct drm_tegra_bo *bo, uint32_t flags,
+                      struct drm_tegra_mapping **mapp)
+{
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_channel_map args;
+    struct drm_tegra_mapping *map;
+    int err;
+
+    if (!drm || !bo || !mapp)
+        return -EINVAL;
+
+    map = calloc(1, sizeof(*map));
+    if (!map)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+    args.handle = bo->handle;
+    args.flags = flags;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_MAP, &args);
+    if (err < 0) {
+        free(map);
+        return -errno;
+    }
+
+    map->channel = channel;
+    map->id = args.mapping;
+    *mapp = map;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_channel_unmap(struct drm_tegra_mapping *map)
+{
+    struct drm_tegra_channel *channel = map->channel;
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_channel_unmap args;
+    int err;
+
+    if (!channel || !map)
+        return -EINVAL;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+    args.mapping = map->id;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_UNMAP, &args);
+    if (err < 0)
+        return -errno;
+
+    free(map);
+    return 0;
+}
diff --git a/tegra/meson.build b/tegra/meson.build
index 53724d2107f5..34900c896f15 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -22,7 +22,7 @@ libdrm_tegra = library(
   'drm_tegra',
   [
     files(
-      'private.h', 'tegra.c'
+      'channel.c', 'private.h', 'tegra.c'
     ),
     config_file
   ],
diff --git a/tegra/private.h b/tegra/private.h
index d0f2944bfb3a..7c05276707bf 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -31,8 +31,17 @@
 #include <libdrm_macros.h>
 #include <xf86atomic.h>
 
+#include "tegra_drm.h"
 #include "tegra.h"
 
+enum host1x_class {
+    HOST1X_CLASS_HOST1X = 0x01,
+    HOST1X_CLASS_GR2D = 0x51,
+    HOST1X_CLASS_GR2D_SB = 0x52,
+    HOST1X_CLASS_VIC = 0x5d,
+    HOST1X_CLASS_GR3D = 0x60,
+};
+
 struct drm_tegra {
     bool close;
     int fd;
@@ -48,4 +57,19 @@ struct drm_tegra_bo {
     void *map;
 };
 
+struct drm_tegra_channel {
+    struct drm_tegra *drm;
+    enum host1x_class class;
+    uint32_t capabilities;
+    unsigned int version;
+    uint64_t context;
+
+    unsigned int cond_shift;
+};
+
+struct drm_tegra_mapping {
+    struct drm_tegra_channel *channel;
+    uint32_t id;
+};
+
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index f8811bcd26f4..c16a351171f1 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -9,5 +9,10 @@ drm_tegra_bo_ref
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
 drm_tegra_bo_wrap
+drm_tegra_channel_close
+drm_tegra_channel_get_version
+drm_tegra_channel_map
+drm_tegra_channel_open
+drm_tegra_channel_unmap
 drm_tegra_close
 drm_tegra_new
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 2bcd596e2d61..621fef6b7000 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -28,6 +28,15 @@
 #include <stdint.h>
 #include <stdlib.h>
 
+#include <tegra_drm.h>
+
+enum drm_tegra_class {
+    DRM_TEGRA_HOST1X,
+    DRM_TEGRA_GR2D,
+    DRM_TEGRA_GR3D,
+    DRM_TEGRA_VIC,
+};
+
 struct drm_tegra_bo;
 struct drm_tegra;
 
@@ -52,4 +61,17 @@ int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags);
 int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
                         struct drm_tegra_bo **bop);
 
+struct drm_tegra_channel;
+struct drm_tegra_mapping;
+
+int drm_tegra_channel_open(struct drm_tegra *drm,
+                           enum drm_tegra_class client,
+                           struct drm_tegra_channel **channelp);
+int drm_tegra_channel_close(struct drm_tegra_channel *channel);
+unsigned int drm_tegra_channel_get_version(struct drm_tegra_channel *channel);
+int drm_tegra_channel_map(struct drm_tegra_channel *channel,
+                          struct drm_tegra_bo *bo, uint32_t flags,
+                          struct drm_tegra_mapping **mapp);
+int drm_tegra_channel_unmap(struct drm_tegra_mapping *map);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.35.1


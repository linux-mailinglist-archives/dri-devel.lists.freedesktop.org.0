Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD93F99B7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010166E954;
	Fri, 27 Aug 2021 13:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788696E946
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x6so2168769wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fc1fKeezkdZq1y8BvRvMN3YJHFmnoQPIIHukIp//gwU=;
 b=dcpzJrS5eCMsQO4Iv5NOREqsgQyjFvTcx161b5Dnx/uYSCqgauLgRisWrLqc/WWpAn
 RdKzL7Fh0txilcVqBVwTBNjMagmgt8R0rfB6lFojrjf00PJNZPFqE/QSFLJit5TZDPK9
 W7fRfxpx7TOtkX9g0eW93wJT8GfkV237eCR7ssRstIqjP6W7D+VJu8Wy/XutIUDq4sV5
 bSeYph9wlfeYpX2T0KhklkrD9ect5Rf9ixRP5b98WGev46yhTt+ego4CUiO361U3g7ek
 a9Dg0zC+wDM3sPqYVnGjw63TNk7xdvP4RYUeLYjj2vaefzHClhwX8xnwpCynpmknIZxG
 obBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fc1fKeezkdZq1y8BvRvMN3YJHFmnoQPIIHukIp//gwU=;
 b=YVF7aEiQaY8qVn3ONxOkOPZ4+9bqSzsaaLB4hUQP/re86uNZO6ej2tPlOWSUubMGh0
 AQQlsACsVZY9VMovgsSKqhzqUyIxurzXT9GOC+o3Ix5fsF6cFWu/NHvboA95BGke8ubc
 yK5361qFU0O4gf5bj+8bjs74LdZOoOvofu6FOdfUgY677HUpfckQqspYa3lmPwj5lUQ0
 8PUKO6Ypy8i1utPrgJg1Z+eOEphL7KWesEW129gryRUKFkF98UiESrk/Ww6pQEl0tyx5
 +knL/32T3uCmugUnlUaqnj6sdu/38uRj9r+uHzZgcVx1nTipLMEs/V8y92cMGlkabOaJ
 mjCA==
X-Gm-Message-State: AOAM5316PdnYAvRVVMndVzZXWdAjsm+iOgJnUYpn7hA3P2ZfLkF543lO
 3cd7pJHWWH8oHCl/PEPXQec=
X-Google-Smtp-Source: ABdhPJxDTQNjEUW2csB0eN6FpfEk8a116jtAjt2yrrXLZZwPQ5x60EU1bij8/ur+Qjx1k3FnesaK9Q==
X-Received: by 2002:adf:e445:: with SMTP id t5mr10136252wrm.52.1630070612814; 
 Fri, 27 Aug 2021 06:23:32 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id q17sm6385888wrr.91.2021.08.27.06.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 11/25] tegra: Add channel APIs
Date: Fri, 27 Aug 2021 15:22:51 +0200
Message-Id: <20210827132305.3572077-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
index 9813d9baddac..e115966fc8ed 100644
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
2.32.0


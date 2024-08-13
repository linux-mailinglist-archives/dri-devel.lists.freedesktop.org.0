Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4769502DB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C4810E2EA;
	Tue, 13 Aug 2024 10:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XT9I0+i7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3810E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-428fb103724so35874375e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546300; x=1724151100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX42+dlGnq5Uu/bZprAtS71gyG2lrM/6mSZ/7RZ5Qm0=;
 b=XT9I0+i7dsn4RBfUfRqlmYTmxpJ8XbwjlkFDl7BQRJIYro8KU/jaTlsb+GE1Rf4r5g
 1NWs6Ibu4gg7wYfU69sdc1AduVWmbUxe2xILKe+2PFbymIS73z5DRUXnwCYvqcyoX9u4
 X+3lo+xkHkKVzHwJmNHnfu7h95JQbK5INXndWY+sXzF2F/QtYnR6O6FcqdpKKFV8chw6
 gwmi6qR5nKMUpQWWoiRug2mOZtGs8wWfDLivc0awbhaZE9lxsAO5pCmifAuavuS4Dsg+
 lC7slIcVTY4ecTmlSU3+TcwHCNLO5LLVHdDqr+4qMaoyx/5X33c5pXaRdP5eofOaKjkS
 DnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546300; x=1724151100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX42+dlGnq5Uu/bZprAtS71gyG2lrM/6mSZ/7RZ5Qm0=;
 b=XFCKG1nVXZXa7SDtrL1l1PUmgTGbhz3j/iEkT/10eQQ/6pgtqGVvcyDCFkcRj1NoGB
 4K5YX5sZjuIX0+uvAhNkGiPXyVqiAVhjrzZf1MLleOulqMyvjc7W2Mu0F8ygnD65rJyD
 oZgfAayZp6OUM+MRONxhUUXCs0ki7UKHQdjWfsMAn08lE+ZEqS+suU0vOw/Xhp/osBSY
 TNuzc5IE64wZzwOhE5csgRaITHIxileSyLwIxZ+rwtNoENTWRam6+18nXE0mDkfWlPt1
 +PKeoa3MJ8pyjnhXfQpS4LnzZO/B+tWjI2bfd2LFWrudouZCVBK589x94/N9EsNuHOr8
 X9VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKkAP7S2TL4dgx+hw2u9NxUlegO76fPK3NnTMs2AjxrOfyLM05t/ALlImoG5nQsopcGbKrGU8NDU9AGqyBWHCy08cNIOIaEHhn+Yo0EQ1J
X-Gm-Message-State: AOJu0YzvZKUAestBH2CK8jmv1u5fNojyap/MERIXuUXIIUChkd0MMR5x
 95u0T/43tLTZY0W5dir0P+u48usEqTxcXngz+3eQhleNfSL4R9t0
X-Google-Smtp-Source: AGHT+IFnztvBdTmZK2l5Gnaz08NvYB3FWKUb0WnOFAD4K52NsHAruw7MbK8ufdnmNtvFmrN1DFmdNw==
X-Received: by 2002:a05:600c:1552:b0:427:ee01:ebf0 with SMTP id
 5b1f17b1804b1-429d62b74c7mr20852325e9.8.1723546299553; 
 Tue, 13 Aug 2024 03:51:39 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 01/17] drm/vkms: Extract vkms_config header
Date: Tue, 13 Aug 2024 12:44:12 +0200
Message-ID: <20240813105134.17439-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
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

Creating a new vkms_config structure will be more complex once we
start adding more options.

Extract the vkms_config structure to its own header and source files
and add functions to create and delete a vkms_config and to initialize
debugfs.

Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile      |  3 +-
 drivers/gpu/drm/vkms/vkms_config.c | 48 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 25 ++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    | 34 +++++----------------
 drivers/gpu/drm/vkms/vkms_drv.h    | 10 +------
 drivers/gpu/drm/vkms/vkms_output.c |  1 +
 6 files changed, 84 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..b371b5d70ee3 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_config.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
new file mode 100644
index 000000000000..c58eda76c238
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/slab.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
+
+#include "vkms_config.h"
+#include "vkms_drv.h"
+
+struct vkms_config *vkms_config_create(void)
+{
+	struct vkms_config *config;
+
+	config = kzalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return ERR_PTR(-ENOMEM);
+
+	return config;
+}
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	kfree(config);
+}
+
+static int vkms_config_show(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+
+	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
+	{ "vkms_config", vkms_config_show, 0 },
+};
+
+void vkms_config_debugfs_init(struct vkms_device *vkms_device)
+{
+	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
+			      ARRAY_SIZE(vkms_config_debugfs_list));
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
new file mode 100644
index 000000000000..65da8cd6ff96
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONFIG_H_
+#define _VKMS_CONFIG_H_
+
+#include <linux/types.h>
+
+struct vkms_device;
+
+struct vkms_config {
+	bool writeback;
+	bool cursor;
+	bool overlay;
+	/* only set when instantiated */
+	struct vkms_device *dev;
+};
+
+/* VKMS Config */
+struct vkms_config *vkms_config_create(void);
+void vkms_config_destroy(struct vkms_config *config);
+
+/* DebugFS */
+void vkms_config_debugfs_init(struct vkms_device *vkms_device);
+
+#endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 8dc9dc13896e..6bf462985731 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -26,11 +26,9 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "vkms_config.h"
 #include "vkms_drv.h"
 
-#include <drm/drm_print.h>
-#include <drm/drm_debugfs.h>
-
 #define DRIVER_NAME	"vkms"
 #define DRIVER_DESC	"Virtual Kernel Mode Setting"
 #define DRIVER_DATE	"20180514"
@@ -90,23 +88,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
-	{ "vkms_config", vkms_config_show, 0 },
-};
-
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
@@ -216,8 +197,7 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
-	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
-			      ARRAY_SIZE(vkms_config_debugfs_list));
+	vkms_config_debugfs_init(vkms_device);
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
 	if (ret)
@@ -239,9 +219,9 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return PTR_ERR(config);
 
 	default_config = config;
 
@@ -251,7 +231,7 @@ static int __init vkms_init(void)
 
 	ret = vkms_create(config);
 	if (ret)
-		kfree(config);
+		vkms_config_destroy(config);
 
 	return ret;
 }
@@ -280,7 +260,7 @@ static void __exit vkms_exit(void)
 	if (default_config->dev)
 		vkms_destroy(default_config);
 
-	kfree(default_config);
+	vkms_config_destroy(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..5c523ca27f22 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -115,15 +115,7 @@ struct vkms_output {
 	spinlock_t composer_lock;
 };
 
-struct vkms_device;
-
-struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
-	/* only set when instantiated */
-	struct vkms_device *dev;
-};
+struct vkms_config;
 
 struct vkms_device {
 	struct drm_device drm;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5ce70dd946aa..afe3945c1962 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_config.h"
 #include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
-- 
2.46.0


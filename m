Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA23BF77F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 11:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04F76E064;
	Thu,  8 Jul 2021 09:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D46E064
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 09:20:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k4so332908wrc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8wOYuGgW5dxV41LrFT+/grkfGnQ13pyFW8oHR7OIZw=;
 b=IWXWukGJ+sYxiBpJibUmxHiqApl6N+DEulPAvNQ/b2VL/rwieZfZp75c0X7vLZ7TJ3
 0g5Gf6cVNpOGW+gR1Syy7MbfuG+hTjErP9dwW+0H51UwTQ8mi0v1L849+pmDSzTTVqkJ
 hooulS78YJSUBUtnvAqCwO/nCq8PKrJbic1qTpunf0ly+mWpOHPgqYlA4r+2PvgJSSNT
 O62eIYPcVRZYNb0NiuUCihI1ETeyo5JJyO2ju4/y0YmS9tss/tGaKGIM2EFtHWwbBkY+
 LhU94BKNnWJgSAYBqhwsy1iWmpPaDgrZv62rUaPsJxbiXdoGEevvKIIT4MOm64D/R8/p
 np+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8wOYuGgW5dxV41LrFT+/grkfGnQ13pyFW8oHR7OIZw=;
 b=aGaexLk6OIgb8lXsnWIoaNmpTZY3LqwRPd+yvkllJusN9kQclZEoK/QpmXOoKj8KbK
 Sp253WzP2/B5Jq3tWG7OEJpuKsby6jIaOmdUFk/P42q3uAhHNvDKmvsdywHBixRg1b/F
 zVbMSYu5c5MZN4ek/xs4D4Y21V62Y//Rtn4jG9uU2MF82EB4/KFWKhX3U5rtgF6vUUxV
 J/odY75h4gup7ksnK9mPLIpwPybBONzuRo/ovtdtTTa+krGfkVBn593Hvl523oHrycCN
 pKsG4MnIqnq9SF46e2Tq64Auhtavq+9TV3/HIO9OLzg9moKjO6iGfA0yBDDBNuKq6bl9
 faOA==
X-Gm-Message-State: AOAM530ogHvWEKBP4SXAac1NY8hpJWk3pIE3u4AeLqIeJHnjdaarJBvU
 IvGHu2w33Pik98n8A033rv8=
X-Google-Smtp-Source: ABdhPJzeCR07d1y8gCpicm/rcIXFt9UWWOn6W0Tb2/O83UCOlBFXjE1O5HjKURZbqEnAIZvYGAJdeg==
X-Received: by 2002:a5d:52d0:: with SMTP id r16mr32765405wrv.323.1625736004038; 
 Thu, 08 Jul 2021 02:20:04 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:4d1a:56e6:44c6:5764])
 by smtp.gmail.com with ESMTPSA id
 y11sm5594308wmi.33.2021.07.08.02.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 02:20:03 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie
Subject: [PATCH v2] drm/vkms: Creating a debug file to get/track vkms config
 in vkms_drv.c
Date: Thu,  8 Jul 2021 10:20:02 +0100
Message-Id: <20210708092002.11847-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Creating a vkms_config_debufs file in vkms_drv.c to get/track vkms config
data, for the long-term plan of making vkms configurable and have multiple
different instances.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
Changes in v2:
    - corrected subject to make clear in terms of its purpose
    - corrected commit message
---
 drivers/gpu/drm/vkms/vkms_drv.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 027ffe759440..c81fba6c72f0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -28,6 +28,9 @@
 
 #include "vkms_drv.h"
 
+#include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
+
 #define DRIVER_NAME	"vkms"
 #define DRIVER_DESC	"Virtual Kernel Mode Setting"
 #define DRIVER_DATE	"20180514"
@@ -86,12 +89,37 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
+static int vkms_config_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+
+	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	return 0;
+}
+
+static const struct drm_info_list vkms_config_debugfs_list[] = {
+	{ "vkms_config", vkms_config_show, 0 },
+};
+
+static void vkms_config_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(vkms_config_debugfs_list, ARRAY_SIZE(vkms_config_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
+	.debugfs_init           = vkms_config_debugfs_init,
+
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
 	.date			= DRIVER_DATE,
-- 
2.25.1


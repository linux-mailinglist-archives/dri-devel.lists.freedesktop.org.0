Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BD6624DF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F910E3F8;
	Mon,  9 Jan 2023 11:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA7510E3F8;
 Mon,  9 Jan 2023 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+g9FzGLxnzT1FKDArCdNffS+SgvDZ0w4DX89TYpKeAM=; b=pEFOz+rEU0BOR3jdla+myI1BIa
 Wd/QuANkdR2hZ8aWG9epHuu5HrjbM98GFHTfpPIugZ8GF+WrtH09q2CKfaH9LJxZlzu7Rmr0puK5p
 4SOerCnY7QZCyOxZM1lxNVsShPggRa02QZpiS7tTGJhtv8tXDdo6YimBWVGji6T259nIxEU3DyJt7
 p3P5lb7mz6z7k6tkQ31JHDPFUqr4DWqnTmrcbozKKOZm0ZTK8OXy6+ekNyF76Fr2hPne7Hh70nuod
 vkSqeYfdtjvvHDVDlUwN4Yocr8g0ZuVNIsDqXBLFaij+FMmcaEPBDKkV9PwpYlYb2HIziKEyn1xt6
 8TL059eQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEqm9-003LkJ-5N; Mon, 09 Jan 2023 12:57:13 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Emma Anholt <emma@anholt.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 7/7] drm/qxl: use new debugfs device-centered functions
Date: Mon,  9 Jan 2023 08:55:21 -0300
Message-Id: <20230109115520.40088-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109115520.40088-1-mcanal@igalia.com>
References: <20230109115520.40088-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on qxl_pci_probe(),
before drm_dev_register().

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 26 ++++++++++----------------
 drivers/gpu/drm/qxl/qxl_drv.c     |  5 ++---
 drivers/gpu/drm/qxl/qxl_drv.h     |  2 +-
 3 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index bdfce1a8f006..c33f1f37dca0 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -34,12 +34,11 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
-#if defined(CONFIG_DEBUG_FS)
-static int
+static int __maybe_unused
 qxl_debugfs_irq_received(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct qxl_device *qdev = to_qxl(node->minor->dev);
+	struct drm_debugfs_entry *entry = m->private;
+	struct qxl_device *qdev = to_qxl(entry->dev);
 
 	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received));
 	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received_display));
@@ -49,11 +48,11 @@ qxl_debugfs_irq_received(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int
+static int __maybe_unused
 qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct qxl_device *qdev = to_qxl(node->minor->dev);
+	struct drm_debugfs_entry *entry = m->private;
+	struct qxl_device *qdev = to_qxl(entry->dev);
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
@@ -76,22 +75,17 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static struct drm_info_list qxl_debugfs_list[] = {
+static struct drm_debugfs_info qxl_debugfs_list[] = {
 	{ "irq_received", qxl_debugfs_irq_received, 0, NULL },
 	{ "qxl_buffers", qxl_debugfs_buffers_info, 0, NULL },
 };
 #define QXL_DEBUGFS_ENTRIES ARRAY_SIZE(qxl_debugfs_list)
-#endif
 
-void
-qxl_debugfs_init(struct drm_minor *minor)
+void qxl_debugfs_init(struct drm_device *drm)
 {
-#if defined(CONFIG_DEBUG_FS)
-	struct qxl_device *dev = to_qxl(minor->dev);
+	struct qxl_device *dev = to_qxl(drm);
 
-	drm_debugfs_create_files(qxl_debugfs_list, QXL_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(drm, qxl_debugfs_list, QXL_DEBUGFS_ENTRIES);
 
 	qxl_ttm_debugfs_init(dev);
-#endif
 }
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index a3b83f89e061..3ae2db78f671 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -116,6 +116,8 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto unload;
 
+	qxl_debugfs_init(&qdev->ddev);
+
 	drm_kms_helper_poll_init(&qdev->ddev);
 
 	/* Complete initialization. */
@@ -287,9 +289,6 @@ static struct drm_driver qxl_driver = {
 
 	.dumb_create = qxl_mode_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = qxl_debugfs_init,
-#endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 0868d5d2a839..cb84a3bebcec 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -397,7 +397,7 @@ int qxl_garbage_collect(struct qxl_device *qdev);
 
 /* debugfs */
 
-void qxl_debugfs_init(struct drm_minor *minor);
+void qxl_debugfs_init(struct drm_device *drm);
 void qxl_ttm_debugfs_init(struct qxl_device *qdev);
 
 /* qxl_prime.c */
-- 
2.39.0


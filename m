Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86392AD83E6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 09:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE110E8DB;
	Fri, 13 Jun 2025 07:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C0810E8D2;
 Fri, 13 Jun 2025 07:15:45 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55D7FdOQ701596; Fri, 13 Jun 2025 12:45:39 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55D7Fd01701595;
 Fri, 13 Jun 2025 12:45:39 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 1/2] drm: add debugfs support per client-id
Date: Fri, 13 Jun 2025 12:45:36 +0530
Message-Id: <20250613071537.701563-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613071537.701563-1-sunil.khatri@amd.com>
References: <20250613071537.701563-1-sunil.khatri@amd.com>
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

add support to add a directory for each client-id
per drm node based on drm-file.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_file.c | 11 +++++++++++
 include/drm/drm_file.h     |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 06ba6dcbf5ae..7a055fe7d4d5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -39,6 +39,7 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
@@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	struct drm_device *dev = minor->dev;
 	struct drm_file *file;
 	int ret;
+	char *dir_name;
 
 	file = kzalloc(sizeof(*file), GFP_KERNEL);
 	if (!file)
@@ -143,6 +145,12 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
 	file->minor = minor;
 
+	dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
+	if (!dir_name)
+		return ERR_PTR(-ENOMEM);
+
+	file->debugfs_client = debugfs_create_dir(dir_name, minor->debugfs_root);
+
 	/* for compatibility root is always authenticated */
 	file->authenticated = capable(CAP_SYS_ADMIN);
 
@@ -237,6 +245,9 @@ void drm_file_free(struct drm_file *file)
 
 	drm_events_release(file);
 
+	debugfs_remove_recursive(file->debugfs_client);
+	file->debugfs_client = NULL;
+
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_fb_release(file);
 		drm_property_destroy_user_blobs(dev, file);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..eab7546aad79 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -400,6 +400,13 @@ struct drm_file {
 	 * @client_name_lock: Protects @client_name.
 	 */
 	struct mutex client_name_lock;
+
+	/**
+	 * @debugfs_client:
+	 *
+	 * debugfs directory for each client under a drm node.
+	 */
+	struct dentry *debugfs_client;
 };
 
 /**
-- 
2.34.1


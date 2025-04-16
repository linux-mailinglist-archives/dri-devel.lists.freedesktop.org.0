Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97943A90461
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 15:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125010E914;
	Wed, 16 Apr 2025 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AD910E90F;
 Wed, 16 Apr 2025 13:32:06 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53GDVksV862045; Wed, 16 Apr 2025 19:01:47 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53GDVjnt862044;
 Wed, 16 Apr 2025 19:01:45 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v4 1/5] drm: add macro drm_file_err to print process info
Date: Wed, 16 Apr 2025 19:01:40 +0530
Message-Id: <20250416133144.862023-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Add a drm helper macro which append the process information for
the drm_file over drm_err.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..5ae5ad1048fb 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -37,6 +37,7 @@
 #include <uapi/drm/drm.h>
 
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 struct dma_fence;
 struct drm_file;
@@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv->minor->type == DRM_MINOR_ACCEL;
 }
 
+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+					__attribute__((__maybe_unused));
+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+{
+	struct task_struct *task;
+	struct pid *pid;
+
+	mutex_lock(&file_priv->client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+	return task;
+}
+
+static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
+static void drm_task_unlock(struct drm_file *file_priv)
+{
+	rcu_read_unlock();
+	mutex_unlock(&file_priv->client_name_lock);
+}
+/**
+ * drm_file_err - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @fmt: prinf() like format string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+#define drm_file_err(file_priv, fmt, ...)						\
+	do {										\
+		struct task_struct *task;						\
+		struct drm_device *dev = file_priv->minor->dev;				\
+											\
+		task = drm_task_lock(file_priv);					\
+		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
+			task ? task->comm : "", task ? task->pid : 0,			\
+			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
+		drm_task_unlock(file_priv);						\
+	} while (0)
+
 void drm_file_update_pid(struct drm_file *);
 
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
-- 
2.34.1


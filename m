Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E5A8A702
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B00810E12B;
	Tue, 15 Apr 2025 18:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101B10E0E6;
 Tue, 15 Apr 2025 18:43:43 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53FIhMMn2465217; Wed, 16 Apr 2025 00:13:22 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53FIhKOV2465216;
 Wed, 16 Apr 2025 00:13:20 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 1/4] drm: add function drm_file_err to print proc
 information too
Date: Wed, 16 Apr 2025 00:13:15 +0530
Message-Id: <20250415184318.2465197-1-sunil.khatri@amd.com>
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

Add a drm helper function which get the process information for
the drm_file and append the process information using the existing
drm_err.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm/drm_file.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..e329299a2b2c 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -37,6 +37,7 @@
 #include <uapi/drm/drm.h>
 
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 struct dma_fence;
 struct drm_file;
@@ -446,6 +447,45 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv->minor->type == DRM_MINOR_ACCEL;
 }
 
+/**
+ * drm_file_err - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @fmt: prinf() like format string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+__printf(2, 3)
+static inline void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
+{
+	struct task_struct *task;
+	struct pid *pid;
+	struct drm_device *dev = file_priv->minor->dev;
+	char new_fmt[256];
+	char final_fmt[512];
+	va_list args;
+
+	mutex_lock(&file_priv->client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+
+	if (drm_WARN_ON_ONCE(dev, !task))
+		return;
+
+	snprintf(new_fmt, sizeof(new_fmt), "proc:%s pid:%d client_name:%s %s",
+		task->comm, task->pid, file_priv->client_name ?: "Unset", fmt);
+
+	va_start(args, fmt);
+	vsnprintf(final_fmt, sizeof(final_fmt), new_fmt, args);
+
+	drm_err(dev, "%s", final_fmt);
+	va_end(args);
+
+	rcu_read_unlock();
+	mutex_unlock(&file_priv->client_name_lock);
+}
+
 void drm_file_update_pid(struct drm_file *);
 
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
-- 
2.34.1


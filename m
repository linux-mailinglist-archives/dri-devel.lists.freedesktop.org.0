Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB09A92040
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68BF10EB38;
	Thu, 17 Apr 2025 14:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD9810EB36;
 Thu, 17 Apr 2025 14:51:43 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53HEpPJr4009641; Thu, 17 Apr 2025 20:21:25 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53HEpNZZ4009640;
 Thu, 17 Apr 2025 20:21:23 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V8] drm: add drm_file_err function to add process info
Date: Thu, 17 Apr 2025 20:21:22 +0530
Message-Id: <20250417145122.4009627-1-sunil.khatri@amd.com>
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

Add a drm helper function which appends the process information for
the drm_file over drm_err formatted output.

v5: change to macro from function (Christian Koenig)
    add helper functions for lock/unlock (Christian Koenig)

v6: remove __maybe_unused and make function inline (Jani Nikula)
    remove drm_print.h

v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)

v8: Code formatting and typos (Ursulin tvrtko)

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h     |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c299cd94d3f7..dd351f601acd 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
 
+/**
+ * drm_file_err - log process name, pid and client_name associated with a drm_file
+ * @file_priv: context of interest for process name and pid
+ * @fmt: printf() like format string
+ *
+ * Helper function for clients which needs to log process details such
+ * as name and pid etc along with user logs.
+ */
+void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
+{
+	va_list args;
+	struct va_format vaf;
+	struct pid *pid;
+	struct task_struct *task;
+	struct drm_device *dev = file_priv->minor->dev;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	mutex_lock(&file_priv->client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+
+	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
+		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
+
+	va_end(args);
+	rcu_read_unlock();
+	mutex_unlock(&file_priv->client_name_lock);
+}
+EXPORT_SYMBOL(drm_file_err);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..5c3b2aa3e69d 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv->minor->type == DRM_MINOR_ACCEL;
 }
 
+__printf(2, 3)
+void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
+
 void drm_file_update_pid(struct drm_file *);
 
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
-- 
2.34.1


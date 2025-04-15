Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC7A89C35
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819810E74A;
	Tue, 15 Apr 2025 11:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886BD10E749;
 Tue, 15 Apr 2025 11:26:18 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53FBPxmH297312; Tue, 15 Apr 2025 16:55:59 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53FBPvXR297311;
 Tue, 15 Apr 2025 16:55:57 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/4] drm: function to get process name and pid
Date: Tue, 15 Apr 2025 16:55:47 +0530
Message-Id: <20250415112550.297292-1-sunil.khatri@amd.com>
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

Add helper function which get the process information for
the drm_file and updates the user provided character buffer
with the information of process name and pid as a string.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h     |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c299cd94d3f7..728a60975f5e 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
 
+/**
+ * drm_process_info - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @proc_info: user char ptr to write the string to
+ * @buff_size: size of the buffer passed for the string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
+{
+	struct task_struct *task;
+	struct pid *pid;
+	struct drm_device *dev = file_priv->minor->dev;
+
+	if (!proc_info) {
+		drm_WARN_ON_ONCE(dev, "Invalid user buffer\n");
+		return;
+	}
+
+	mutex_lock(&file_priv->client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+	if (task)
+		snprintf(proc_info, buff_size, "client_name:%s proc:%s pid:%d",
+			 file_priv->client_name ? file_priv->client_name : "Unset",
+			 task->comm, task->pid);
+
+	rcu_read_unlock();
+	mutex_unlock(&file_priv->client_name_lock);
+}
+EXPORT_SYMBOL(drm_process_info);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..a972be73a615 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -507,6 +507,7 @@ void drm_print_memory_stats(struct drm_printer *p,
 
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
+void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB4B42DF5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BD10E2B9;
	Thu,  4 Sep 2025 00:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WiXJaQ/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4766610E2B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756944691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dV4AUTGyvRinAkdFuXGwymkMINGDBUlW2I27Qs7QLbeHO+4I2iqPD8p0zgGFGOI9tgJNXvXQnaX6DBBNA3Qj/UZlEF0ZTzZ/mWJNbv5jVZ8Ax7HMCgs7pDRs9cp6OfeOYE597RXnB/9xZXhzJn3T7yBWe77Pq+zsjh2JvWKzEEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756944691;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5wZ1ENmfjHXSQxn+q8xC1jThTBGhlczGmoVc1ZzZpEQ=; 
 b=RfAkSEtv/l1eFaUiWSj/XG4eHkhTZdxB8T+q8kdD9JkaBiFpl2XB27Ck+Negm8gY/OTNjcfOWGy8NE+65l/SZ0qH+Vvw6gn66psyDB8ERbUjPB4OBKUM/FmglJOfaqfc6T1UWUgxOCToMH2wGN9HgV8EoEw/fIBKNbLq1QVQ9u4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756944691; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5wZ1ENmfjHXSQxn+q8xC1jThTBGhlczGmoVc1ZzZpEQ=;
 b=WiXJaQ/KHgHA45hdDilduYBZ6q21dSv4o62xU84Ir6xELF7BhwgZBtZpL2U+Uaq/
 akc6Ckz8uaHyecCURmJM//QFeo2seL+gRY6DecOSUPGcXQyVcrBzaa0Z5QDpJons4KU
 OdpT0n1lRbFzgCUvoqZgeDF14cKkaVibD22+yLJc=
Received: by mx.zohomail.com with SMTPS id 1756944687766290.4116830590775;
 Wed, 3 Sep 2025 17:11:27 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 4/4] drm/panfrost: Display list of device JM contexts over
 debugfs
Date: Thu,  4 Sep 2025 01:08:02 +0100
Message-ID: <20250904001054.147465-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904001054.147465-1-adrian.larumbe@collabora.com>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

For DebugFS builds, create a filesystem knob that, for every single open
file of the Panfrost DRM device, shows its command name information and
PID (when applicable), and all of its existing JM contexts.

For every context, show its priority and job config.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 97 +++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 02f704ec4961..b3d14b887da4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -712,6 +712,48 @@ static int panthor_gems_show(struct seq_file *m, void *data)
 	return 0;
 }
 
+static void show_panfrost_jm_ctx(struct panfrost_jm_ctx *jm_ctx, u32 handle,
+				 struct seq_file *m)
+{
+	struct drm_device *ddev = ((struct drm_info_node *)m->private)->minor->dev;
+	const char *prio = NULL;
+
+	static const char * const prios[] = {
+		[DRM_SCHED_PRIORITY_HIGH] = "HIGH",
+		[DRM_SCHED_PRIORITY_NORMAL] = "NORMAL",
+		[DRM_SCHED_PRIORITY_LOW] = "LOW",
+	};
+
+	if (jm_ctx->slots[0].sched_entity.priority !=
+	    jm_ctx->slots[1].sched_entity.priority)
+		drm_warn(ddev, "Slot priorities should be the same in a single context");
+
+	if (jm_ctx->slots[0].sched_entity.priority < ARRAY_SIZE(prios))
+		prio = prios[jm_ctx->slots[0].sched_entity.priority];
+
+	seq_printf(m, " JM context %u: priority %s config %x\n",
+		   handle, prio ? prio : "UNKNOWN", jm_ctx->config);
+}
+
+static int show_file_jm_ctxs(struct panfrost_file_priv *pfile,
+			     struct seq_file *m)
+{
+	struct panfrost_jm_ctx *jm_ctx;
+	unsigned long i;
+
+	xa_lock(&pfile->jm_ctxs);
+	xa_for_each(&pfile->jm_ctxs, i, jm_ctx) {
+		jm_ctx = panfrost_jm_ctx_get(jm_ctx);
+		xa_unlock(&pfile->jm_ctxs);
+		show_panfrost_jm_ctx(jm_ctx, i, m);
+		panfrost_jm_ctx_put(jm_ctx);
+		xa_lock(&pfile->jm_ctxs);
+	}
+	xa_unlock(&pfile->jm_ctxs);
+
+	return 0;
+}
+
 static struct drm_info_list panthor_debugfs_list[] = {
 	{"gems", panthor_gems_show, 0, NULL},
 };
@@ -725,9 +767,64 @@ static int panthor_gems_debugfs_init(struct drm_minor *minor)
 	return 0;
 }
 
+static int show_each_file(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *ddev = node->minor->dev;
+	int (*show)(struct panfrost_file_priv *, struct seq_file *) =
+		node->info_ent->data;
+	struct drm_file *file;
+	int ret;
+
+	ret = mutex_lock_interruptible(&ddev->filelist_mutex);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(file, &ddev->filelist, lhead) {
+		struct task_struct *task;
+		struct panfrost_file_priv *pfile = file->driver_priv;
+		struct pid *pid;
+
+		/*
+		 * Although we have a valid reference on file->pid, that does
+		 * not guarantee that the task_struct who called get_pid() is
+		 * still alive (e.g. get_pid(current) => fork() => exit()).
+		 * Therefore, we need to protect this ->comm access using RCU.
+		 */
+		rcu_read_lock();
+		pid = rcu_dereference(file->pid);
+		task = pid_task(pid, PIDTYPE_TGID);
+		seq_printf(m, "client_id %8llu pid %8d command %s:\n",
+			   file->client_id, pid_nr(pid),
+			   task ? task->comm : "<unknown>");
+		rcu_read_unlock();
+
+		ret = show(pfile, m);
+		if (ret < 0)
+			break;
+
+		seq_puts(m, "\n");
+	}
+
+	mutex_unlock(&ddev->filelist_mutex);
+	return ret;
+}
+
+static struct drm_info_list panfrost_sched_debugfs_list[] = {
+	{ "sched_ctxs", show_each_file, 0, show_file_jm_ctxs },
+};
+
+static void panfrost_sched_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panfrost_sched_debugfs_list,
+				 ARRAY_SIZE(panfrost_sched_debugfs_list),
+				 minor->debugfs_root, minor);
+}
+
 static void panfrost_debugfs_init(struct drm_minor *minor)
 {
 	panthor_gems_debugfs_init(minor);
+	panfrost_sched_debugfs_init(minor);
 }
 #endif
 
-- 
2.50.0


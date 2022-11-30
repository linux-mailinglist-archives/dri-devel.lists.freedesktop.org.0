Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1663D6CD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA68810E0FC;
	Wed, 30 Nov 2022 13:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85FE10E452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669815288; x=1701351288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cqs4njH6pQ7SB3CQFpFfoBdElmujdWIPCbJhOzmGTbM=;
 b=K0Mk6pCHKxEhF/nP2e/7xMjp0/wHS/pM+FV09Pw82J8N3CIR6JslbJr/
 9ZGWahl0Eqy6m2tsKBlffqeJf3AUEid0BoIXpvTdpAZ5MDawuubR6mGRD
 vO+xen4OWJCdCRZzbK2w9qE7FEvI2HypTk+BHwRAQK8GYjnVW0aW2JdLk
 TcOLPm0/wh4UG0XLPUCRAwZvppvGIoc40qKx/c39P88ljxJBnBXPnsuw/
 R264JqZBdrp32gwSZ/NnT5xNwCaexoab6ruL7QIJj3Y/zuYXc8sdnkipv
 VcNTd0XyqtzSQBCXIBe27znjoNrV7PNkjXMb9ywz0sZwENY1t+m6o+2dV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295091361"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="295091361"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:34:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="973105193"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="973105193"
Received: from hpvpnmu01.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.197.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:34:30 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/3] drm: Track clients by tgid and not tid
Date: Wed, 30 Nov 2022 13:34:06 +0000
Message-Id: <20221130133407.2689864-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 linux-graphics-maintainer@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thread group id (aka pid from userspace point of view) is a more
interesting thing to show as an owner of a DRM fd, so track and show that
instead of the thread id.

In the next patch we will make the owner updated post file descriptor
handover, which will also be tgid based to avoid ping-pong when multiple
threads access the fd.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: linux-graphics-maintainer@vmware.com
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
 drivers/gpu/drm/drm_debugfs.c           | 4 ++--
 drivers/gpu/drm/drm_file.c              | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a0780a4e3e61..30e24da1f398 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -968,7 +968,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		 * Therefore, we need to protect this ->comm access using RCU.
 		 */
 		rcu_read_lock();
-		task = pid_task(file->pid, PIDTYPE_PID);
+		task = pid_task(file->pid, PIDTYPE_TGID);
 		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
 			   task ? task->comm : "<unknown>");
 		rcu_read_unlock();
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index ee445f4605ba..42f657772025 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -80,7 +80,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	seq_printf(m,
 		   "%20s %5s %3s master a %5s %10s\n",
 		   "command",
-		   "pid",
+		   "tgid",
 		   "dev",
 		   "uid",
 		   "magic");
@@ -94,7 +94,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		bool is_current_master = drm_is_current_master(priv);
 
 		rcu_read_lock(); /* locks pid_task()->comm */
-		task = pid_task(priv->pid, PIDTYPE_PID);
+		task = pid_task(priv->pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
 		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
 			   task ? task->comm : "<unknown>",
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index b0f24cea1e1e..20a9aef2b398 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	if (!file)
 		return ERR_PTR(-ENOMEM);
 
-	file->pid = get_pid(task_pid(current));
+	file->pid = get_pid(task_tgid(current));
 	file->minor = minor;
 
 	/* for compatibility root is always authenticated */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index ce609e7d758f..f2985337aa53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -260,7 +260,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		 * Therefore, we need to protect this ->comm access using RCU.
 		 */
 		rcu_read_lock();
-		task = pid_task(file->pid, PIDTYPE_PID);
+		task = pid_task(file->pid, PIDTYPE_TGID);
 		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
 			   task ? task->comm : "<unknown>");
 		rcu_read_unlock();
-- 
2.34.1


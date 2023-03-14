Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E646B9796
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979FD10EA22;
	Tue, 14 Mar 2023 14:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6E10E17F;
 Tue, 14 Mar 2023 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678803562; x=1710339562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDLp2/3Yl14dmLvreY8sfPyvQKizzKWroDIsTYa9bwY=;
 b=jFij9oumtXklZlImqaBqqiCEja5l8Fu07CW54NTNZ9yX/4FcHO3ysF1d
 ve+U/BvkfR0czm6/9CDduSG3FH68eFMinjREjCB0D1AbxWsddnFXBD4ys
 M6qiwBpr6wqajqJBVA1XCyOxv3jgfiC/y7A5t81oYHHRUw+u5622spcpk
 VIAsfSy1sl6Ly8eD5IA89n7H+RdAyGHLWw9hTsWn5UoVpBCUvGn9iMlSv
 RvQCfQJtfg+0Gnjb9eg8z1PopdafZ1r+tR0BW6bmZnR8jzo5FZ1c19nnD
 fj78gCdnPpFB4mKvzMpRCW0mifHjXg8Sfu2D5oGzqj/QPHZ5Vxxl7SocP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321284655"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="321284655"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656363203"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="656363203"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.236.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 01/10] drm: Track clients by tgid and not tid
Date: Tue, 14 Mar 2023 14:18:55 +0000
Message-Id: <20230314141904.1210824-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-graphics-maintainer@vmware.com,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
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
index d8e683688daa..863cb668e000 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -969,7 +969,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		 * Therefore, we need to protect this ->comm access using RCU.
 		 */
 		rcu_read_lock();
-		task = pid_task(file->pid, PIDTYPE_PID);
+		task = pid_task(file->pid, PIDTYPE_TGID);
 		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
 			   task ? task->comm : "<unknown>");
 		rcu_read_unlock();
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..4855230ba2c6 100644
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
index a51ff8cee049..c1018c470047 100644
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
index d6baf73a6458..c0da89e16e6f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -241,7 +241,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		 * Therefore, we need to protect this ->comm access using RCU.
 		 */
 		rcu_read_lock();
-		task = pid_task(file->pid, PIDTYPE_PID);
+		task = pid_task(file->pid, PIDTYPE_TGID);
 		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
 			   task ? task->comm : "<unknown>");
 		rcu_read_unlock();
-- 
2.37.2


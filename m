Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F3ADACEA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9B810E313;
	Mon, 16 Jun 2025 10:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74810E03E;
 Mon, 16 Jun 2025 10:05:11 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55GA54G71204199; Mon, 16 Jun 2025 15:35:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55GA54571204198;
 Mon, 16 Jun 2025 15:35:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/2] drm/debugfs: add client-id to the debugfs entry
Date: Mon, 16 Jun 2025 15:35:02 +0530
Message-Id: <20250616100503.1204166-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616100503.1204166-1-sunil.khatri@amd.com>
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
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

pid is not always the right choice for fd to track
the caller and hence adding drm client-id to the
print which is unique for a drm client and can be
used by driver in debugging

One of the use is to further enhance debugging for
amdgpu driver based on client-id.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b2178864c7e..2d43bda82887 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	kuid_t uid;
 
 	seq_printf(m,
-		   "%20s %5s %3s master a %5s %10s %*s\n",
+		   "%20s %5s %3s master a %5s %10s %*s %5s\n",
 		   "command",
 		   "tgid",
 		   "dev",
 		   "uid",
 		   "magic",
 		   DRM_CLIENT_NAME_MAX_LEN,
-		   "name");
+		   "name",
+		   "client-id");
 
 	/* dev->filelist is sorted youngest first, but we want to present
 	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
@@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		pid = rcu_dereference(priv->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
-		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %5llu\n",
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(pid),
 			   priv->minor->index,
@@ -109,7 +110,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic,
 			   DRM_CLIENT_NAME_MAX_LEN,
-			   priv->client_name ? priv->client_name : "<unset>");
+			   priv->client_name ? priv->client_name : "<unset>", priv->client_id);
 		rcu_read_unlock();
 		mutex_unlock(&priv->client_name_lock);
 	}
-- 
2.34.1


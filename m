Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6249ADEE52
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07E10E843;
	Wed, 18 Jun 2025 13:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3C10E83F;
 Wed, 18 Jun 2025 13:48:24 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55IDluPN3893224; Wed, 18 Jun 2025 19:17:56 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55IDltxQ3893223;
 Wed, 18 Jun 2025 19:17:56 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v4 4/4] drm/amdgpu: add support of debugfs for mqd information
Date: Wed, 18 Jun 2025 19:17:47 +0530
Message-Id: <20250618134747.3893138-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618134747.3893138-1-sunil.khatri@amd.com>
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
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

add mqd support based on queue of for each client-id
so the gpu address could be used to dump the mqd.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 295e7186e156..50b9df9caf00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -343,6 +343,46 @@ static int amdgpu_userq_priority_permit(struct drm_file *filp,
 	return -EACCES;
 }
 
+#if defined(CONFIG_DEBUG_FS)
+static int amdgpu_mqd_info_read(struct seq_file *m, void *unused)
+{
+	struct amdgpu_usermode_queue *queue = (struct amdgpu_usermode_queue *)m->private;
+	struct amdgpu_bo *bo;
+	int r;
+
+	if (!queue || !queue->mqd.obj)
+		return -EINVAL;
+
+	bo = amdgpu_bo_ref(queue->mqd.obj);
+	r = amdgpu_bo_reserve(bo, true);
+	if (r) {
+		amdgpu_bo_unref(&bo);
+		return 0;
+	}
+
+	seq_printf(m, "queue_type %d\n", queue->queue_type);
+	seq_printf(m, "mqd_gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(queue->mqd.obj));
+
+	amdgpu_bo_unreserve(bo);
+	amdgpu_bo_unref(&bo);
+
+	return 0;
+}
+
+static int amdgpu_mqd_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, amdgpu_mqd_info_read, inode->i_private);
+}
+
+static const struct file_operations amdgpu_mqd_info_fops = {
+	.owner = THIS_MODULE,
+	.open = amdgpu_mqd_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+#endif
+
 static int
 amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 {
@@ -352,6 +392,8 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	const struct amdgpu_userq_funcs *uq_funcs;
 	struct amdgpu_usermode_queue *queue;
 	struct amdgpu_db_info db_info;
+	char *queue_name;
+	struct dentry *debugfs_queue;
 	bool skip_map_queue;
 	uint64_t index;
 	int qid, r = 0;
@@ -475,6 +517,14 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		}
 	}
 
+	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
+	if (!queue_name)
+		return -ENOMEM;
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
+	debugfs_create_file("mqd_info", 0444, debugfs_queue, queue, &amdgpu_mqd_info_fops);
+	kfree(queue_name);
 
 	args->out.queue_id = qid;
 
-- 
2.34.1


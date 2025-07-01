Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1AFAEEED0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 08:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE610E4FD;
	Tue,  1 Jul 2025 06:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347410E4FE;
 Tue,  1 Jul 2025 06:33:20 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 5616XAkh3210768; Tue, 1 Jul 2025 12:03:10 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5616XAHa3210767;
 Tue, 1 Jul 2025 12:03:10 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v8 4/4] drm/amdgpu: add support of debugfs for mqd information
Date: Tue,  1 Jul 2025 12:03:03 +0530
Message-Id: <20250701063303.3210665-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701063303.3210665-1-sunil.khatri@amd.com>
References: <20250701063303.3210665-1-sunil.khatri@amd.com>
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

Add debugfs support for mqd for each queue of the client.

The address exposed to debugfs could be used to dump
the mqd.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 52 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 295e7186e156..115d53bc9a8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -318,6 +318,9 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 		amdgpu_bo_unreserve(queue->db_obj.obj);
 	}
 	amdgpu_bo_unref(&queue->db_obj.obj);
+
+	debugfs_remove_recursive(queue->debugfs_queue);
+
 	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
 	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
 	mutex_unlock(&uq_mgr->userq_mutex);
@@ -343,6 +346,46 @@ static int amdgpu_userq_priority_permit(struct drm_file *filp,
 	return -EACCES;
 }
 
+#if defined(CONFIG_DEBUG_FS)
+static int amdgpu_mqd_info_read(struct seq_file *m, void *unused)
+{
+	struct amdgpu_usermode_queue *queue = m->private;
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
+		return -EINVAL;
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
@@ -352,6 +395,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	const struct amdgpu_userq_funcs *uq_funcs;
 	struct amdgpu_usermode_queue *queue;
 	struct amdgpu_db_info db_info;
+	char *queue_name;
 	bool skip_map_queue;
 	uint64_t index;
 	int qid, r = 0;
@@ -475,6 +519,14 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		}
 	}
 
+	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
+	if (!queue_name)
+		return -ENOMEM;
+
+	/* Queue dentry per client to hold MQD information   */
+	queue->debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
+	debugfs_create_file("mqd_info", 0444, queue->debugfs_queue, queue, &amdgpu_mqd_info_fops);
+	kfree(queue_name);
 
 	args->out.queue_id = qid;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index ec040c2fd6c9..b1ca91b7cda4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -65,6 +65,7 @@ struct amdgpu_usermode_queue {
 	struct dma_fence	*last_fence;
 	u32			xcp_id;
 	int			priority;
+	struct dentry		*debugfs_queue;
 };
 
 struct amdgpu_userq_funcs {
-- 
2.34.1


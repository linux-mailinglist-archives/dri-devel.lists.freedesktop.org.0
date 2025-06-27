Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61265AEB35D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5640E10E9BA;
	Fri, 27 Jun 2025 09:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE9310E9BB;
 Fri, 27 Jun 2025 09:49:43 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55R9nPN1913362; Fri, 27 Jun 2025 15:19:25 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55R9nP7x913359;
 Fri, 27 Jun 2025 15:19:25 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 4/5] drm/amdgpu: add debugfs support for VM pagetable per
 client
Date: Fri, 27 Jun 2025 15:19:20 +0530
Message-Id: <20250627094921.911009-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627094921.911009-1-sunil.khatri@amd.com>
References: <20250627094921.911009-1-sunil.khatri@amd.com>
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

Add a debugfs file under the client directory which shares
the root page table base address of the VM.

This address could be used to dump the pagetable for debug
memory issues.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 50 ++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +-
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 195ed81d39ff..27aa1b551dbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1395,7 +1395,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	if (r)
 		goto error_pasid;
 
-	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
+	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
 	if (r)
 		goto error_pasid;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..93843c9bc9ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2520,12 +2520,58 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 	get_task_comm(vm->task_info->process_name, current->group_leader);
 }
 
+#if defined(CONFIG_DEBUG_FS)
+static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
+{
+	struct drm_file *file;
+	struct amdgpu_fpriv *fpriv;
+	struct amdgpu_bo *root_bo;
+	int r;
+
+	file = m->private;
+	if (!file)
+		return -EINVAL;
+
+	fpriv = file->driver_priv;
+	if (!fpriv && !fpriv->vm.root.bo)
+		return -ENODEV;
+
+	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
+	r = amdgpu_bo_reserve(root_bo, true);
+	if (r) {
+		amdgpu_bo_unref(&root_bo);
+		return -EINVAL;
+	}
+
+	seq_printf(m, "gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
+
+	amdgpu_bo_unreserve(root_bo);
+	amdgpu_bo_unref(&root_bo);
+
+	return 0;
+}
+
+static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, amdgpu_pt_info_read, inode->i_private);
+}
+
+static const struct file_operations amdgpu_pt_info_fops = {
+	.owner = THIS_MODULE,
+	.open = amdgpu_pt_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+#endif
+
 /**
  * amdgpu_vm_init - initialize a vm instance
  *
  * @adev: amdgpu_device pointer
  * @vm: requested vm
  * @xcp_id: GPU partition selection id
+ * @file: drm_file
  *
  * Init @vm fields.
  *
@@ -2533,7 +2579,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
  * 0 for success, error for failure.
  */
 int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-		   int32_t xcp_id)
+		   int32_t xcp_id, struct drm_file *file)
 {
 	struct amdgpu_bo *root_bo;
 	struct amdgpu_bo_vm *root;
@@ -2609,6 +2655,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		DRM_DEBUG("Failed to create task info for VM\n");
 
+	debugfs_create_file("vm_pagetable_info", 0444, file->debugfs_client, file,
+			    &amdgpu_pt_info_fops);
 	amdgpu_bo_unreserve(vm->root.bo);
 	amdgpu_bo_unref(&root_bo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..555afaf867c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			u32 pasid);
 
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
-int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
+int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
+		   struct drm_file *file);
+
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
-- 
2.34.1


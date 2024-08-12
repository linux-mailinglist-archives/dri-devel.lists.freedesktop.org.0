Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486C94E792
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D602810E10B;
	Mon, 12 Aug 2024 07:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="IRMPmjjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88A410E10B;
 Mon, 12 Aug 2024 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iOajgjUkMUESpFDP+oq2b2T6Km/PgKUCPjtCQGjZrV0=; b=IRMPmjjdkfj1SXQYflRnxzmn1k
 n5TCxhHf1joMGhNBWr+sMoS7oPRpUzj8LDKaHGFd3kKGg41ma1HAGbDQDz1ijReCE7kyNS4+WoTjA
 yVnZLM4n8T8xGTYDkclpCNgNMWz7oYF/ma23ehphBz+Zjp3DBMSMrXchh/q6kCkB5uP6+eo3uH/kG
 C8k+XmSvtC1YmKqCevqX11fdNF9eJTV5OMcOxX5jVScoaqX7vd3aVRKtsZC0Z3DblSYk+FxQg15ox
 V4h8f/rFvJxKxT8bzivspmT0pXw9B77tmfrNcQcZfMDAk8HpfQqHV9/8ioimw7UE75Ysd/8SX564X
 ++cEEqvA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1sdP1G-000000010nl-22a5; Mon, 12 Aug 2024 06:59:06 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: viro@zeniv.linux.org.uk
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
Subject: [PATCH 3/4] amdkfd CRIU fixes
Date: Mon, 12 Aug 2024 07:59:05 +0100
Message-ID: <20240812065906.241398-3-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812065906.241398-1-viro@zeniv.linux.org.uk>
References: <20240812065656.GI13701@ZenIV>
 <20240812065906.241398-1-viro@zeniv.linux.org.uk>
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

Instead of trying to use close_fd() on failure exits, just have
criu_get_prime_handle() store the file reference without inserting
it into descriptor table.

Then, once the callers are past the last failure exit, they can go
and either insert all those file references into the corresponding
slots of descriptor table, or drop all those file references and
free the unused descriptors.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 64 +++++++++++++++++-------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 32e5db509560..23e5e3083367 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -36,7 +36,6 @@
 #include <linux/mman.h>
 #include <linux/ptrace.h>
 #include <linux/dma-buf.h>
-#include <linux/fdtable.h>
 #include <linux/processor.h>
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
@@ -1857,7 +1856,8 @@ static uint32_t get_process_num_bos(struct kfd_process *p)
 }
 
 static int criu_get_prime_handle(struct kgd_mem *mem,
-				 int flags, u32 *shared_fd)
+				 int flags, u32 *shared_fd,
+				 struct file **file)
 {
 	struct dma_buf *dmabuf;
 	int ret;
@@ -1868,13 +1868,14 @@ static int criu_get_prime_handle(struct kgd_mem *mem,
 		return ret;
 	}
 
-	ret = dma_buf_fd(dmabuf, flags);
+	ret = get_unused_fd_flags(flags);
 	if (ret < 0) {
 		pr_err("dmabuf create fd failed, ret:%d\n", ret);
 		goto out_free_dmabuf;
 	}
 
 	*shared_fd = ret;
+	*file = dmabuf->file;
 	return 0;
 
 out_free_dmabuf:
@@ -1882,6 +1883,25 @@ static int criu_get_prime_handle(struct kgd_mem *mem,
 	return ret;
 }
 
+static void commit_files(struct file **files,
+			 struct kfd_criu_bo_bucket *bo_buckets,
+			 unsigned int count,
+			 int err)
+{
+	while (count--) {
+		struct file *file = files[count];
+
+		if (!file)
+			continue;
+		if (err) {
+			fput(file);
+			put_unused_fd(bo_buckets[count].dmabuf_fd);
+		} else {
+			fd_install(bo_buckets[count].dmabuf_fd, file);
+		}
+	}
+}
+
 static int criu_checkpoint_bos(struct kfd_process *p,
 			       uint32_t num_bos,
 			       uint8_t __user *user_bos,
@@ -1890,6 +1910,7 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 {
 	struct kfd_criu_bo_bucket *bo_buckets;
 	struct kfd_criu_bo_priv_data *bo_privs;
+	struct file **files = NULL;
 	int ret = 0, pdd_index, bo_index = 0, id;
 	void *mem;
 
@@ -1903,6 +1924,12 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 		goto exit;
 	}
 
+	files = kvzalloc(num_bos * sizeof(struct file *), GFP_KERNEL);
+	if (!files) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
 	for (pdd_index = 0; pdd_index < p->n_pdds; pdd_index++) {
 		struct kfd_process_device *pdd = p->pdds[pdd_index];
 		struct amdgpu_bo *dumper_bo;
@@ -1945,7 +1972,7 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 				ret = criu_get_prime_handle(kgd_mem,
 						bo_bucket->alloc_flags &
 						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
-						&bo_bucket->dmabuf_fd);
+						&bo_bucket->dmabuf_fd, &files[bo_index]);
 				if (ret)
 					goto exit;
 			} else {
@@ -1996,12 +2023,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	*priv_offset += num_bos * sizeof(*bo_privs);
 
 exit:
-	while (ret && bo_index--) {
-		if (bo_buckets[bo_index].alloc_flags
-		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
-			close_fd(bo_buckets[bo_index].dmabuf_fd);
-	}
-
+	commit_files(files, bo_buckets, bo_index, ret);
+	kvfree(files);
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
 	return ret;
@@ -2353,7 +2376,8 @@ static int criu_restore_memory_of_gpu(struct kfd_process_device *pdd,
 
 static int criu_restore_bo(struct kfd_process *p,
 			   struct kfd_criu_bo_bucket *bo_bucket,
-			   struct kfd_criu_bo_priv_data *bo_priv)
+			   struct kfd_criu_bo_priv_data *bo_priv,
+			   struct file **file)
 {
 	struct kfd_process_device *pdd;
 	struct kgd_mem *kgd_mem;
@@ -2405,7 +2429,7 @@ static int criu_restore_bo(struct kfd_process *p,
 	if (bo_bucket->alloc_flags
 	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 		ret = criu_get_prime_handle(kgd_mem, DRM_RDWR,
-					    &bo_bucket->dmabuf_fd);
+					    &bo_bucket->dmabuf_fd, file);
 		if (ret)
 			return ret;
 	} else {
@@ -2422,6 +2446,7 @@ static int criu_restore_bos(struct kfd_process *p,
 {
 	struct kfd_criu_bo_bucket *bo_buckets = NULL;
 	struct kfd_criu_bo_priv_data *bo_privs = NULL;
+	struct file **files = NULL;
 	int ret = 0;
 	uint32_t i = 0;
 
@@ -2435,6 +2460,12 @@ static int criu_restore_bos(struct kfd_process *p,
 	if (!bo_buckets)
 		return -ENOMEM;
 
+	files = kvzalloc(args->num_bos * sizeof(struct file *), GFP_KERNEL);
+	if (!files) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
 	ret = copy_from_user(bo_buckets, (void __user *)args->bos,
 			     args->num_bos * sizeof(*bo_buckets));
 	if (ret) {
@@ -2460,7 +2491,7 @@ static int criu_restore_bos(struct kfd_process *p,
 
 	/* Create and map new BOs */
 	for (; i < args->num_bos; i++) {
-		ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i]);
+		ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i], &files[i]);
 		if (ret) {
 			pr_debug("Failed to restore BO[%d] ret%d\n", i, ret);
 			goto exit;
@@ -2475,11 +2506,8 @@ static int criu_restore_bos(struct kfd_process *p,
 		ret = -EFAULT;
 
 exit:
-	while (ret && i--) {
-		if (bo_buckets[i].alloc_flags
-		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
-			close_fd(bo_buckets[i].dmabuf_fd);
-	}
+	commit_files(files, bo_buckets, i, ret);
+	kvfree(files);
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
 	return ret;
-- 
2.39.2


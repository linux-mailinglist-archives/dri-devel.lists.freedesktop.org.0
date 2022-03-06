Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B314CF37B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 09:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92310E044;
	Mon,  7 Mar 2022 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AEB10E8B4;
 Sun,  6 Mar 2022 01:57:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 047F260FD4;
 Sun,  6 Mar 2022 01:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2F9C004E1;
 Sun,  6 Mar 2022 01:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646531855;
 bh=qhbhEF4KNGgan5nuXFyOhv3ib4IX2nZMIJjs4aq0fyQ=;
 h=From:To:Cc:Subject:Date:From;
 b=k0LfDnUWsEGXgD8jhE2p9wCSnE2zvazHvi7Zycl/K+OZho4693jO+sPfaHcpYlzjv
 sbavPNJCGy9OzNjGgd0KvVP540g6l4Y1tUeziYCqh3P/KyMCs2JqHayEJOYRLwQOeg
 YU3rC79wtkDOsxvJC78cHZHTtmCgI3vg+TOmJnU5jbS4GuauA21q+O1WFVzEClLZn6
 gZMUT0c86cpnMr9QStPq7sqCbu01iEPo/Cy2kdZxTF2VrZXINl71cmzsSoPjFcncGr
 ZxpDmAQOc0X2yF6rAgI/7twHJhNZP3HHWTMdZj/xB1XGm8Dlx7dnLQLVtbu3Ne+32i
 WKiDxJTtU1LNQ==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RFC] mm: Add f_ops->populate()
Date: Sun,  6 Mar 2022 03:56:44 +0200
Message-Id: <20220306015648.82595-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Mar 2022 08:24:51 +0000
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 "maintainer:CODA FILE SYSTEM" <coda@cs.cmu.edu>,
 Matthew Auld <matthew.auld@intel.com>, Vasily Averin <vvs@virtuozzo.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>,
 "open list:INTEL DRM DRIVERS excluding Poulsbo, Moorestow..., 
 dri-devel@lists.freedesktop.org open list:DRM DRIVERS,
 codalist@coda.cs.cmu.edu open list:CODA FILE SYSTEM,
 linux-unionfs@vger.kernel.org open list:OVERLAY FILESYSTEM,
 linux-fsdevel@vger.kernel.org open list:FILESYSTEMS VFS and infrastructure,
 linux-mm@kvack.org open list:MEMORY MANAGEMENT"
 <intel-gfx@lists.freedesktop.org>, Shakeel Butt <shakeelb@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes you might want to use MAP_POPULATE to ask a device driver to
initialize the device memory in some specific manner. SGX driver can use
this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
page in the address range.

Add f_ops->populate() with the same parameters as f_ops->mmap() and make
it conditionally called inside call_mmap(). Update call sites
accodingly.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 arch/mips/kernel/vdso.c                    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  2 +-
 fs/coda/file.c                             |  2 +-
 fs/overlayfs/file.c                        |  2 +-
 include/linux/fs.h                         | 10 ++++++++--
 include/linux/mm.h                         |  2 +-
 ipc/shm.c                                  |  2 +-
 mm/mmap.c                                  | 10 +++++-----
 mm/nommu.c                                 |  4 ++--
 9 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 3d0cf471f2fe..89f3f3da9abd 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -102,7 +102,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
 				VM_READ | VM_EXEC |
 				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
-				0, NULL);
+				0, NULL, false);
 		if (IS_ERR_VALUE(base)) {
 			ret = base;
 			goto out;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1b526039a60d..4c71f64d6a79 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -107,7 +107,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (!obj->base.filp)
 		return -ENODEV;
 
-	ret = call_mmap(obj->base.filp, vma);
+	ret = call_mmap(obj->base.filp, vma, false);
 	if (ret)
 		return ret;
 
diff --git a/fs/coda/file.c b/fs/coda/file.c
index 29dd87be2fb8..e14f312fdbf8 100644
--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -173,7 +173,7 @@ coda_file_mmap(struct file *coda_file, struct vm_area_struct *vma)
 	spin_unlock(&cii->c_lock);
 
 	vma->vm_file = get_file(host_file);
-	ret = call_mmap(vma->vm_file, vma);
+	ret = call_mmap(vma->vm_file, vma, false);
 
 	if (ret) {
 		/* if call_mmap fails, our caller will put host_file so we
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index fa125feed0ff..b963a9397e80 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -503,7 +503,7 @@ static int ovl_mmap(struct file *file, struct vm_area_struct *vma)
 	vma_set_file(vma, realfile);
 
 	old_cred = ovl_override_creds(file_inode(file)->i_sb);
-	ret = call_mmap(vma->vm_file, vma);
+	ret = call_mmap(vma->vm_file, vma, false);
 	revert_creds(old_cred);
 	ovl_file_accessed(file);
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e2d892b201b0..fb90284e1c82 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1993,6 +1993,7 @@ struct file_operations {
 	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
 	int (*mmap) (struct file *, struct vm_area_struct *);
+	int (*populate)(struct file *, struct vm_area_struct *);
 	unsigned long mmap_supported_flags;
 	int (*open) (struct inode *, struct file *);
 	int (*flush) (struct file *, fl_owner_t id);
@@ -2074,9 +2075,14 @@ static inline ssize_t call_write_iter(struct file *file, struct kiocb *kio,
 	return file->f_op->write_iter(kio, iter);
 }
 
-static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
+static inline int call_mmap(struct file *file, struct vm_area_struct *vma, bool do_populate)
 {
-	return file->f_op->mmap(file, vma);
+	int ret = file->f_op->mmap(file, vma);
+
+	if (!ret && do_populate)
+		ret = file->f_op->populate(file, vma);
+
+	return ret;
 }
 
 extern ssize_t vfs_read(struct file *, char __user *, size_t, loff_t *);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 213cc569b192..6c8c036f423b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2683,7 +2683,7 @@ extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned lo
 
 extern unsigned long mmap_region(struct file *file, unsigned long addr,
 	unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-	struct list_head *uf);
+	struct list_head *uf, bool do_populate);
 extern unsigned long do_mmap(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot, unsigned long flags,
 	unsigned long pgoff, unsigned long *populate, struct list_head *uf);
diff --git a/ipc/shm.c b/ipc/shm.c
index b3048ebd5c31..89b28f32acf0 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -587,7 +587,7 @@ static int shm_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
-	ret = call_mmap(sfd->file, vma);
+	ret = call_mmap(sfd->file, vma, do_populate);
 	if (ret) {
 		shm_close(vma);
 		return ret;
diff --git a/mm/mmap.c b/mm/mmap.c
index 1e8fdb0b51ed..5eca79957d4c 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1413,6 +1413,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			unsigned long flags, unsigned long pgoff,
 			unsigned long *populate, struct list_head *uf)
 {
+	bool do_populate = (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE;
 	struct mm_struct *mm = current->mm;
 	vm_flags_t vm_flags;
 	int pkey = 0;
@@ -1579,10 +1580,9 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			vm_flags |= VM_NORESERVE;
 	}
 
-	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
+	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf, do_populate);
 	if (!IS_ERR_VALUE(addr) &&
-	    ((vm_flags & VM_LOCKED) ||
-	     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
+	    ((vm_flags & VM_LOCKED) || do_populate))
 		*populate = len;
 	return addr;
 }
@@ -1721,7 +1721,7 @@ static inline int accountable_mapping(struct file *file, vm_flags_t vm_flags)
 
 unsigned long mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-		struct list_head *uf)
+		struct list_head *uf, bool do_populate)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev, *merge;
@@ -1790,7 +1790,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		}
 
 		vma->vm_file = get_file(file);
-		error = call_mmap(file, vma);
+		error = call_mmap(file, vma, do_populate);
 		if (error)
 			goto unmap_and_free_vma;
 
diff --git a/mm/nommu.c b/mm/nommu.c
index 55a9e48a7a02..a3c20b803c27 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -941,7 +941,7 @@ static int do_mmap_shared_file(struct vm_area_struct *vma)
 {
 	int ret;
 
-	ret = call_mmap(vma->vm_file, vma);
+	ret = call_mmap(vma->vm_file, vma, false);
 	if (ret == 0) {
 		vma->vm_region->vm_top = vma->vm_region->vm_end;
 		return 0;
@@ -972,7 +972,7 @@ static int do_mmap_private(struct vm_area_struct *vma,
 	 * - VM_MAYSHARE will be set if it may attempt to share
 	 */
 	if (capabilities & NOMMU_MAP_DIRECT) {
-		ret = call_mmap(vma->vm_file, vma);
+		ret = call_mmap(vma->vm_file, vma, false);
 		if (ret == 0) {
 			/* shouldn't return success if we're not sharing */
 			BUG_ON(!(vma->vm_flags & VM_MAYSHARE));
-- 
2.35.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F11A7B0E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0856E0E7;
	Tue, 14 Apr 2020 12:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D174B6E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tavltWqAXguW1IUT8gdmgc7HLJ0xDyyeBnJXOx9vPk=;
 b=ZmfWXjT5ArAZVCG4IMNARWvxeljpHykCy/M0RyO/72fdqCb8Wpanf3k8gL4S7LCkQN7wdK
 h4kYhWsa0D3ZfDe33wEsI8bE7URxO4eUVtH44oeL2e2mh8XYO2/UJ6fHUabT/AhFsZspXv
 c1u1KPa2m3a4L71RgGY8V11oGUIvhJc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-MS1cFr5aMhqAbc5PTlxGcg-1; Tue, 14 Apr 2020 08:44:03 -0400
X-MC-Unique: MS1cFr5aMhqAbc5PTlxGcg-1
Received: by mail-wm1-f69.google.com with SMTP id b203so3706521wmd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dvJWNoCqOPJ2Keq90rbU42HTKEA0XnHFbEKVkxqMw4=;
 b=DwVDNB4nUp46Y3W4XR0H8PuoIhcyfj75kq8btBpTWHtMr9dtgAsd3sfCEqTVxpDMw4
 Yt3f3rfyOUj9t/oEJRtYKTMrf1wGLhENMb8/PRbIlvZJUwhl1H07Wp4ZUr9pni/buR/y
 QtoyRji6h5fn/qc5hJHr8wIcavsSPNVp4ybhLT6oHmtQQsdbkjS8oG7NhVzPdyitBIjC
 Ma6RY+j1rXFrXknd/GrYhlUySkL54noXFuJnaxKRyKH1wgC7UF5nzyQZsxAVkCosVjCw
 +yhJk3xsZktWT55Zs/Ga2FLCHVnOfIKBdnLEi4YXqrQZ4V3IXTsaRT0vdJqc7/4dBLnC
 0Chg==
X-Gm-Message-State: AGi0PuZlcx6Nk9UvWdnqcXBbKDZkXUeKHPu4+h+95DQQzJUrDMrtSHQG
 9SE6nDQv32gHNuvvI+8CEBYKx+w/OiwSvGoEnK00GkosokqD8VrfwIae1V8Z6qu5vAIJAZB51aQ
 sqR5aysLOAQ8ouraAIihFjMAz7rWs
X-Received: by 2002:a1c:98c3:: with SMTP id
 a186mr23589116wme.178.1586868241599; 
 Tue, 14 Apr 2020 05:44:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKAkevVacPSJ0w+AqHwRxAkGrHz+1VnI2DGx9IuElYJAp+8aH4PXXY/Q0JWoH7/QLCAqQe8zw==
X-Received: by 2002:a1c:98c3:: with SMTP id
 a186mr23589054wme.178.1586868241066; 
 Tue, 14 Apr 2020 05:44:01 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:00 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 4/8] fs: introduce simple_new_inode
Date: Tue, 14 Apr 2020 14:42:58 +0200
Message-Id: <20200414124304.4470-5-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 netdev@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Uma Krishnan <ukrishn@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is a common special case for new_inode to initialize the
time to the current time and the inode to get_next_ino().
Introduce a core function that does it and use it throughout
Linux.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 arch/powerpc/platforms/cell/spufs/inode.c |  4 +---
 arch/s390/hypfs/inode.c                   |  4 +---
 drivers/infiniband/hw/qib/qib_fs.c        |  6 +-----
 drivers/misc/ibmasm/ibmasmfs.c            |  8 +++-----
 drivers/oprofile/oprofilefs.c             |  8 +++-----
 drivers/usb/gadget/function/f_fs.c        |  8 +-------
 fs/autofs/inode.c                         |  4 +---
 fs/binfmt_misc.c                          | 16 ++--------------
 fs/debugfs/inode.c                        | 19 ++++---------------
 fs/efivarfs/inode.c                       |  4 +---
 fs/fuse/control.c                         |  4 +---
 fs/hugetlbfs/inode.c                      |  8 ++------
 fs/libfs.c                                | 12 ++++++++++++
 fs/ocfs2/dlmfs/dlmfs.c                    |  8 ++------
 fs/proc/base.c                            |  4 +---
 fs/proc/proc_sysctl.c                     |  5 +----
 fs/pstore/inode.c                         | 14 ++------------
 fs/ramfs/inode.c                          |  4 +---
 fs/tracefs/inode.c                        | 14 ++------------
 include/linux/fs.h                        |  1 +
 ipc/mqueue.c                              |  4 +---
 kernel/bpf/inode.c                        |  7 +------
 mm/shmem.c                                |  4 +---
 net/sunrpc/rpc_pipe.c                     |  4 +---
 security/apparmor/apparmorfs.c            |  8 ++------
 security/inode.c                          |  4 +---
 26 files changed, 50 insertions(+), 136 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 25390569e24c..5167b11d41ed 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -77,15 +77,13 @@ spufs_new_inode(struct super_block *sb, umode_t mode)
 {
 	struct inode *inode;
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (!inode)
 		goto out;
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 out:
 	return inode;
 }
diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
index 5c97f48cea91..97d11561f35c 100644
--- a/arch/s390/hypfs/inode.c
+++ b/arch/s390/hypfs/inode.c
@@ -93,15 +93,13 @@ static void hypfs_delete_tree(struct dentry *root)
 
 static struct inode *hypfs_make_inode(struct super_block *sb, umode_t mode)
 {
-	struct inode *ret = new_inode(sb);
+	struct inode *ret = simple_new_inode(sb);
 
 	if (ret) {
 		struct hypfs_sb_info *hypfs_info = sb->s_fs_info;
-		ret->i_ino = get_next_ino();
 		ret->i_mode = mode;
 		ret->i_uid = hypfs_info->uid;
 		ret->i_gid = hypfs_info->gid;
-		ret->i_atime = ret->i_mtime = ret->i_ctime = current_time(ret);
 		if (S_ISDIR(mode))
 			set_nlink(ret, 2);
 	}
diff --git a/drivers/infiniband/hw/qib/qib_fs.c b/drivers/infiniband/hw/qib/qib_fs.c
index e336d778e076..d402c3b1c552 100644
--- a/drivers/infiniband/hw/qib/qib_fs.c
+++ b/drivers/infiniband/hw/qib/qib_fs.c
@@ -53,21 +53,17 @@ static int qibfs_mknod(struct inode *dir, struct dentry *dentry,
 		       void *data)
 {
 	int error;
-	struct inode *inode = new_inode(dir->i_sb);
+	struct inode *inode = simple_new_inode(dir->i_sb);
 
 	if (!inode) {
 		error = -EPERM;
 		goto bail;
 	}
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
 	inode->i_uid = GLOBAL_ROOT_UID;
 	inode->i_gid = GLOBAL_ROOT_GID;
 	inode->i_blocks = 0;
-	inode->i_atime = current_time(inode);
-	inode->i_mtime = inode->i_atime;
-	inode->i_ctime = inode->i_atime;
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = &simple_dir_inode_operations;
diff --git a/drivers/misc/ibmasm/ibmasmfs.c b/drivers/misc/ibmasm/ibmasmfs.c
index 35fec1bf1b3d..72aa02505f45 100644
--- a/drivers/misc/ibmasm/ibmasmfs.c
+++ b/drivers/misc/ibmasm/ibmasmfs.c
@@ -134,13 +134,11 @@ static int ibmasmfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 static struct inode *ibmasmfs_make_inode(struct super_block *sb, int mode)
 {
-	struct inode *ret = new_inode(sb);
+	struct inode *ret = simple_new_inode(sb);
 
-	if (ret) {
-		ret->i_ino = get_next_ino();
+	if (ret)
 		ret->i_mode = mode;
-		ret->i_atime = ret->i_mtime = ret->i_ctime = current_time(ret);
-	}
+
 	return ret;
 }
 
diff --git a/drivers/oprofile/oprofilefs.c b/drivers/oprofile/oprofilefs.c
index 0875f2f122b3..a903dff693c9 100644
--- a/drivers/oprofile/oprofilefs.c
+++ b/drivers/oprofile/oprofilefs.c
@@ -26,13 +26,11 @@ DEFINE_RAW_SPINLOCK(oprofilefs_lock);
 
 static struct inode *oprofilefs_get_inode(struct super_block *sb, int mode)
 {
-	struct inode *inode = new_inode(sb);
+	struct inode *inode = simple_new_inode(sb);
 
-	if (inode) {
-		inode->i_ino = get_next_ino();
+	if (inode)
 		inode->i_mode = mode;
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
-	}
+
 	return inode;
 }
 
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c81023b195c3..d5ca23682f28 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1385,18 +1385,12 @@ ffs_sb_make_inode(struct super_block *sb, void *data,
 
 	ENTER();
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 
 	if (likely(inode)) {
-		struct timespec64 ts = current_time(inode);
-
-		inode->i_ino	 = get_next_ino();
 		inode->i_mode    = perms->mode;
 		inode->i_uid     = perms->uid;
 		inode->i_gid     = perms->gid;
-		inode->i_atime   = ts;
-		inode->i_mtime   = ts;
-		inode->i_ctime   = ts;
 		inode->i_private = data;
 		if (fops)
 			inode->i_fop = fops;
diff --git a/fs/autofs/inode.c b/fs/autofs/inode.c
index 9edf243713eb..26710b7d5ade 100644
--- a/fs/autofs/inode.c
+++ b/fs/autofs/inode.c
@@ -359,7 +359,7 @@ int autofs_fill_super(struct super_block *s, void *data, int silent)
 
 struct inode *autofs_get_inode(struct super_block *sb, umode_t mode)
 {
-	struct inode *inode = new_inode(sb);
+	struct inode *inode = simple_new_inode(sb);
 
 	if (inode == NULL)
 		return NULL;
@@ -369,8 +369,6 @@ struct inode *autofs_get_inode(struct super_block *sb, umode_t mode)
 		inode->i_uid = d_inode(sb->s_root)->i_uid;
 		inode->i_gid = d_inode(sb->s_root)->i_gid;
 	}
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
-	inode->i_ino = get_next_ino();
 
 	if (S_ISDIR(mode)) {
 		set_nlink(inode, 2);
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index 475096a02a1a..cd27039ffbdf 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -586,19 +586,6 @@ static void entry_status(Node *e, char *page)
 	}
 }
 
-static struct inode *bm_get_inode(struct super_block *sb, int mode)
-{
-	struct inode *inode = new_inode(sb);
-
-	if (inode) {
-		inode->i_ino = get_next_ino();
-		inode->i_mode = mode;
-		inode->i_atime = inode->i_mtime = inode->i_ctime =
-			current_time(inode);
-	}
-	return inode;
-}
-
 static void bm_evict_inode(struct inode *inode)
 {
 	Node *e = inode->i_private;
@@ -711,12 +698,13 @@ static ssize_t bm_register_write(struct file *file, const char __user *buffer,
 	if (d_really_is_positive(dentry))
 		goto out2;
 
-	inode = bm_get_inode(sb, S_IFREG | 0644);
+	inode = simple_new_inode(sb);
 
 	err = -ENOMEM;
 	if (!inode)
 		goto out2;
 
+	inode->i_mode = S_IFREG | 0644;
 	err = simple_pin_fs(&bm_fs, &bm_fs_type);
 	if (err) {
 		iput(inode);
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index ea54efc74c0d..834b5872ca0d 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -61,17 +61,6 @@ static const struct inode_operations debugfs_symlink_inode_operations = {
 	.setattr	= debugfs_setattr,
 };
 
-static struct inode *debugfs_get_inode(struct super_block *sb)
-{
-	struct inode *inode = new_inode(sb);
-	if (inode) {
-		inode->i_ino = get_next_ino();
-		inode->i_atime = inode->i_mtime =
-			inode->i_ctime = current_time(inode);
-	}
-	return inode;
-}
-
 struct debugfs_mount_opts {
 	kuid_t uid;
 	kgid_t gid;
@@ -383,7 +372,7 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = debugfs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create file '%s'\n",
 		       name);
@@ -539,7 +528,7 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = debugfs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create directory '%s'\n",
 		       name);
@@ -581,7 +570,7 @@ struct dentry *debugfs_create_automount(const char *name,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = debugfs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create automount '%s'\n",
 		       name);
@@ -639,7 +628,7 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 		return dentry;
 	}
 
-	inode = debugfs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create symlink '%s'\n",
 		       name);
diff --git a/fs/efivarfs/inode.c b/fs/efivarfs/inode.c
index 96c0c86f3fff..f8f459f43920 100644
--- a/fs/efivarfs/inode.c
+++ b/fs/efivarfs/inode.c
@@ -16,12 +16,10 @@ struct inode *efivarfs_get_inode(struct super_block *sb,
 				const struct inode *dir, int mode,
 				dev_t dev, bool is_removable)
 {
-	struct inode *inode = new_inode(sb);
+	struct inode *inode = simple_new_inode(sb);
 
 	if (inode) {
-		inode->i_ino = get_next_ino();
 		inode->i_mode = mode;
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		inode->i_flags = is_removable ? 0 : S_IMMUTABLE;
 		switch (mode & S_IFMT) {
 		case S_IFREG:
diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index c23f6f243ad4..6a9f35aca480 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -232,17 +232,15 @@ static struct dentry *fuse_ctl_add_dentry(struct dentry *parent,
 	if (!dentry)
 		return NULL;
 
-	inode = new_inode(fuse_control_sb);
+	inode = simple_new_inode(fuse_control_sb);
 	if (!inode) {
 		dput(dentry);
 		return NULL;
 	}
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
 	inode->i_uid = fc->user_id;
 	inode->i_gid = fc->group_id;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	/* setting ->i_op to NULL is not allowed */
 	if (iop)
 		inode->i_op = iop;
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 991c60c7ffe0..4064389c2c23 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -739,13 +739,11 @@ static struct inode *hugetlbfs_get_root(struct super_block *sb,
 {
 	struct inode *inode;
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (inode) {
-		inode->i_ino = get_next_ino();
 		inode->i_mode = S_IFDIR | ctx->mode;
 		inode->i_uid = ctx->uid;
 		inode->i_gid = ctx->gid;
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		inode->i_op = &hugetlbfs_dir_inode_operations;
 		inode->i_fop = &simple_dir_operations;
 		/* directory inodes start off with i_nlink == 2 (for "." entry) */
@@ -780,16 +778,14 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb,
 			return NULL;
 	}
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (inode) {
 		struct hugetlbfs_inode_info *info = HUGETLBFS_I(inode);
 
-		inode->i_ino = get_next_ino();
 		inode_init_owner(inode, dir, mode);
 		lockdep_set_class(&inode->i_mapping->i_mmap_rwsem,
 				&hugetlbfs_i_mmap_rwsem_key);
 		inode->i_mapping->a_ops = &hugetlbfs_aops;
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		inode->i_mapping->private_data = resv_map;
 		info->seals = F_SEAL_SEAL;
 		switch (mode & S_IFMT) {
diff --git a/fs/libfs.c b/fs/libfs.c
index 26ec729f7bcd..20bdee9361d5 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -595,6 +595,18 @@ int simple_write_end(struct file *file, struct address_space *mapping,
 }
 EXPORT_SYMBOL(simple_write_end);
 
+struct inode *simple_new_inode(struct super_block *sb)
+{
+	struct inode *inode = new_inode(sb);
+	if (inode) {
+		inode->i_ino = get_next_ino();
+		inode->i_atime = inode->i_mtime =
+			inode->i_ctime = current_time(inode);
+	}
+	return inode;
+}
+EXPORT_SYMBOL(simple_new_inode);
+
 /*
  * the inodes created here are not hashed. If you use iunique to generate
  * unique inode values later for this filesystem, then you must take care
diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
index 8e4f1ace467c..6285c174f9f2 100644
--- a/fs/ocfs2/dlmfs/dlmfs.c
+++ b/fs/ocfs2/dlmfs/dlmfs.c
@@ -371,13 +371,11 @@ static void dlmfs_evict_inode(struct inode *inode)
 
 static struct inode *dlmfs_get_root_inode(struct super_block *sb)
 {
-	struct inode *inode = new_inode(sb);
+	struct inode *inode = simple_new_inode(sb);
 	umode_t mode = S_IFDIR | 0755;
 
 	if (inode) {
-		inode->i_ino = get_next_ino();
 		inode_init_owner(inode, NULL, mode);
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		inc_nlink(inode);
 
 		inode->i_fop = &simple_dir_operations;
@@ -392,15 +390,13 @@ static struct inode *dlmfs_get_inode(struct inode *parent,
 				     umode_t mode)
 {
 	struct super_block *sb = parent->i_sb;
-	struct inode * inode = new_inode(sb);
+	struct inode * inode = simple_new_inode(sb);
 	struct dlmfs_inode_private *ip;
 
 	if (!inode)
 		return NULL;
 
-	inode->i_ino = get_next_ino();
 	inode_init_owner(inode, parent, mode);
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 
 	ip = DLMFS_I(inode);
 	ip->ip_conn = DLMFS_I(parent)->ip_conn;
diff --git a/fs/proc/base.c b/fs/proc/base.c
index 74f948a6b621..3ef16f4f14c9 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1856,15 +1856,13 @@ struct inode *proc_pid_make_inode(struct super_block * sb,
 
 	/* We need a new inode */
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (!inode)
 		goto out;
 
 	/* Common stuff */
 	ei = PROC_I(inode);
 	inode->i_mode = mode;
-	inode->i_ino = get_next_ino();
-	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
 	inode->i_op = &proc_def_inode_operations;
 
 	/*
diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index b6f5d459b087..3464ab94cf79 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -434,12 +434,10 @@ static struct inode *proc_sys_make_inode(struct super_block *sb,
 	struct inode *inode;
 	struct proc_inode *ei;
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
-	inode->i_ino = get_next_ino();
-
 	ei = PROC_I(inode);
 
 	spin_lock(&sysctl_lock);
@@ -454,7 +452,6 @@ static struct inode *proc_sys_make_inode(struct super_block *sb,
 	head->count++;
 	spin_unlock(&sysctl_lock);
 
-	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
 	inode->i_mode = table->mode;
 	if (!S_ISDIR(table->mode)) {
 		inode->i_mode |= S_IFREG;
diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
index d99b5d39aa90..d6cad315a839 100644
--- a/fs/pstore/inode.c
+++ b/fs/pstore/inode.c
@@ -208,16 +208,6 @@ static const struct inode_operations pstore_dir_inode_operations = {
 	.unlink		= pstore_unlink,
 };
 
-static struct inode *pstore_get_inode(struct super_block *sb)
-{
-	struct inode *inode = new_inode(sb);
-	if (inode) {
-		inode->i_ino = get_next_ino();
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
-	}
-	return inode;
-}
-
 enum {
 	Opt_kmsg_bytes, Opt_err
 };
@@ -316,7 +306,7 @@ int pstore_mkfile(struct dentry *root, struct pstore_record *record)
 		return rc;
 
 	rc = -ENOMEM;
-	inode = pstore_get_inode(root->d_sb);
+	inode = simple_new_inode(root->d_sb);
 	if (!inode)
 		goto fail;
 	inode->i_mode = S_IFREG | 0444;
@@ -394,7 +384,7 @@ static int pstore_fill_super(struct super_block *sb, void *data, int silent)
 
 	parse_options(data);
 
-	inode = pstore_get_inode(sb);
+	inode = simple_new_inode(sb);
 	if (inode) {
 		inode->i_mode = S_IFDIR | 0750;
 		inode->i_op = &pstore_dir_inode_operations;
diff --git a/fs/ramfs/inode.c b/fs/ramfs/inode.c
index ee179a81b3da..cf2ce7bc4c9d 100644
--- a/fs/ramfs/inode.c
+++ b/fs/ramfs/inode.c
@@ -63,15 +63,13 @@ static const struct address_space_operations ramfs_aops = {
 struct inode *ramfs_get_inode(struct super_block *sb,
 				const struct inode *dir, umode_t mode, dev_t dev)
 {
-	struct inode * inode = new_inode(sb);
+	struct inode * inode = simple_new_inode(sb);
 
 	if (inode) {
-		inode->i_ino = get_next_ino();
 		inode_init_owner(inode, dir, mode);
 		inode->i_mapping->a_ops = &ramfs_aops;
 		mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
 		mapping_set_unevictable(inode->i_mapping);
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		switch (mode & S_IFMT) {
 		default:
 			init_special_inode(inode, mode, dev);
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 40ccfe737c3a..a30837a8e1d4 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -124,16 +124,6 @@ static const struct inode_operations tracefs_dir_inode_operations = {
 	.rmdir		= tracefs_syscall_rmdir,
 };
 
-static struct inode *tracefs_get_inode(struct super_block *sb)
-{
-	struct inode *inode = new_inode(sb);
-	if (inode) {
-		inode->i_ino = get_next_ino();
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
-	}
-	return inode;
-}
-
 struct tracefs_mount_opts {
 	kuid_t uid;
 	kgid_t gid;
@@ -403,7 +393,7 @@ struct dentry *tracefs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return NULL;
 
-	inode = tracefs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode))
 		return failed_creating(dentry);
 
@@ -424,7 +414,7 @@ static struct dentry *__create_dir(const char *name, struct dentry *parent,
 	if (IS_ERR(dentry))
 		return NULL;
 
-	inode = tracefs_get_inode(dentry->d_sb);
+	inode = simple_new_inode(dentry->d_sb);
 	if (unlikely(!inode))
 		return failed_creating(dentry);
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 55b679b89c8a..6136f5ba2680 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3088,6 +3088,7 @@ extern void clear_inode(struct inode *);
 extern void __destroy_inode(struct inode *);
 extern struct inode *new_inode_pseudo(struct super_block *sb);
 extern struct inode *new_inode(struct super_block *sb);
+extern struct inode *simple_new_inode(struct super_block *sb);
 extern void free_inode_nonrcu(struct inode *inode);
 extern int should_remove_suid(struct dentry *);
 extern int file_remove_privs(struct file *);
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 49a05ba3000d..74c4f852a688 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -296,15 +296,13 @@ static struct inode *mqueue_get_inode(struct super_block *sb,
 	struct inode *inode;
 	int ret = -ENOMEM;
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (!inode)
 		goto err;
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
-	inode->i_mtime = inode->i_ctime = inode->i_atime = current_time(inode);
 
 	if (S_ISREG(mode)) {
 		struct mqueue_inode_info *info;
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 95087d9f4ed3..532a733c474a 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -112,15 +112,10 @@ static struct inode *bpf_get_inode(struct super_block *sb,
 		return ERR_PTR(-EINVAL);
 	}
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (!inode)
 		return ERR_PTR(-ENOSPC);
 
-	inode->i_ino = get_next_ino();
-	inode->i_atime = current_time(inode);
-	inode->i_mtime = inode->i_atime;
-	inode->i_ctime = inode->i_atime;
-
 	inode_init_owner(inode, dir, mode);
 
 	return inode;
diff --git a/mm/shmem.c b/mm/shmem.c
index f47347cb30f6..50ca377464e2 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2246,12 +2246,10 @@ static struct inode *shmem_get_inode(struct super_block *sb, const struct inode
 	if (shmem_reserve_inode(sb))
 		return NULL;
 
-	inode = new_inode(sb);
+	inode = simple_new_inode(sb);
 	if (inode) {
-		inode->i_ino = get_next_ino();
 		inode_init_owner(inode, dir, mode);
 		inode->i_blocks = 0;
-		inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 		inode->i_generation = prandom_u32();
 		info = SHMEM_I(inode);
 		memset(info, 0, (char *)inode - (char *)info);
diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 39e14d5edaf1..fa48b8f55ba9 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -467,12 +467,10 @@ struct rpc_filelist {
 static struct inode *
 rpc_get_inode(struct super_block *sb, umode_t mode)
 {
-	struct inode *inode = new_inode(sb);
+	struct inode *inode = simple_new_inode(sb);
 	if (!inode)
 		return NULL;
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	switch (mode & S_IFMT) {
 	case S_IFDIR:
 		inode->i_fop = &simple_dir_operations;
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 75d70e6ba0a0..1a8afe9d7110 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -212,7 +212,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
 			       const struct file_operations *fops,
 			       const struct inode_operations *iops)
 {
-	struct inode *inode = new_inode(dir->i_sb);
+	struct inode *inode = simple_new_inode(dir->i_sb);
 
 	AA_BUG(!dir);
 	AA_BUG(!dentry);
@@ -220,9 +220,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
 	if (!inode)
 		return -ENOMEM;
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = iops ? iops : &simple_dir_inode_operations;
@@ -2540,15 +2538,13 @@ static int aa_mk_null_file(struct dentry *parent)
 		error = PTR_ERR(dentry);
 		goto out;
 	}
-	inode = new_inode(parent->d_inode->i_sb);
+	inode = simple_new_inode(parent->d_inode->i_sb);
 	if (!inode) {
 		error = -ENOMEM;
 		goto out1;
 	}
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
 			   MKDEV(MEM_MAJOR, 3));
 	d_instantiate(dentry, inode);
diff --git a/security/inode.c b/security/inode.c
index 0fcd03299e0d..8a1a7f73ee9c 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -136,15 +136,13 @@ static struct dentry *securityfs_create_dentry(const char *name, umode_t mode,
 		goto out1;
 	}
 
-	inode = new_inode(dir->i_sb);
+	inode = simple_new_inode(dir->i_sb);
 	if (!inode) {
 		error = -ENOMEM;
 		goto out1;
 	}
 
-	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
-	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	inode->i_private = data;
 	if (S_ISDIR(mode)) {
 		inode->i_op = &simple_dir_inode_operations;
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

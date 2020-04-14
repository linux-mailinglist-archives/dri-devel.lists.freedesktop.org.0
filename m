Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD581A7B11
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCFE6E0F6;
	Tue, 14 Apr 2020 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6856E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZ6xsK3V0N91Fk8iBgZd6BgXsfySMhIjcPWAROHMn1Y=;
 b=QCkgW4fk8wFmcCdRhnjuSpbfSzRRe9nToAXIa5zPQtSw1pCiT8TBAMQbQBCLVLrmbeZAbY
 L+7ZFojA1pGuK4ZygIO9zyxX/yzvzuV99XlSlj0r4Hf0St5RvpUgT8RYRTsEXybFSbcGmF
 JNKqWxHlGrtl8dTEVg+vdwQQDHvZBRw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-IP1CbYMgMTOsDrMYGtievw-1; Tue, 14 Apr 2020 08:44:25 -0400
X-MC-Unique: IP1CbYMgMTOsDrMYGtievw-1
Received: by mail-wr1-f71.google.com with SMTP id e5so31075wrs.23
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41gcpXPXsxw0iFMzm+k+g/C6jCPBlhyC8+dVJ9Pc1fA=;
 b=MlHbtnqMRCxu0Om8hl0IkFY6q1Lav5W7W+2D858Ygg9+oTNARQ6LeRKerZDJL1lOgx
 WgdFBMmYzRstrAKHStTnCswhBrQsw8vI/HicFt0ZLkM8ja+U2/iVh7PWPgEP/tUHS4bc
 TK8BtO/pVVtWfncGte0vWXq7vzXaGAScbwIhIBwNyBJI4Q0BoJ4q19Q1cLlxVC70z4Fn
 yU6326WXx6Ijpyq5Kw/iX0X+nB3HqCGMUcweeIb1ux1VX/MxYdG15tn1wYpx2rxdKMQv
 pUyxyEWYlSJJbJJOFRu8OHCGzuIf8n4eNLrQgQpCowRGzqZgiKVniKTS+G/lm6+Mw6dn
 VVYQ==
X-Gm-Message-State: AGi0PuaFZrwvmou6NOByX+yl640wKshnbwn2FhjVP4Fj3mHpfjGAg52v
 Ne4tYAtsHJ4pMgyXh4GsPVPyS+rr5F73lQ8NRCC+mXMcpdM6sHJeA+mMfag1T/p53QSz//0RvA7
 uNXym32X8FKxtKzJMcSxxtFlH8WEb
X-Received: by 2002:a1c:147:: with SMTP id 68mr24229393wmb.28.1586868264251;
 Tue, 14 Apr 2020 05:44:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypLG15Rdex4MNDkfLSgxNLw13YiMYBHA340JgiTMak7ycYuMs+tWPpamut6Uc41GnMvfLqOpAg==
X-Received: by 2002:a1c:147:: with SMTP id 68mr24229312wmb.28.1586868263915;
 Tue, 14 Apr 2020 05:44:23 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:23 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 7/8] debugfs: switch to simplefs inode creation API
Date: Tue, 14 Apr 2020 14:43:01 +0200
Message-Id: <20200414124304.4470-8-eesposit@redhat.com>
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

The only difference, compared to the pre-existing code, is that symlink
creation now triggers fsnotify_create.  This was a bug in the debugfs
code, since for example vfs_symlink does call fsnotify_create.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/debugfs/inode.c | 144 +++++----------------------------------------
 1 file changed, 15 insertions(+), 129 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 834b5872ca0d..7a2369373b85 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -294,68 +294,6 @@ struct dentry *debugfs_lookup(const char *name, struct dentry *parent)
 }
 EXPORT_SYMBOL_GPL(debugfs_lookup);
 
-static struct dentry *start_creating(const char *name, struct dentry *parent)
-{
-	struct dentry *dentry;
-	int error;
-
-	pr_debug("creating file '%s'\n", name);
-
-	if (IS_ERR(parent))
-		return parent;
-
-	error = simple_pin_fs(&debugfs, &debug_fs_type);
-	if (error) {
-		pr_err("Unable to pin filesystem for file '%s'\n", name);
-		return ERR_PTR(error);
-	}
-
-	/* If the parent is not specified, we create it in the root.
-	 * We need the root dentry to do this, which is in the super
-	 * block. A pointer to that is in the struct vfsmount that we
-	 * have around.
-	 */
-	if (!parent)
-		parent = debugfs.mount->mnt_root;
-
-	inode_lock(d_inode(parent));
-	if (unlikely(IS_DEADDIR(d_inode(parent))))
-		dentry = ERR_PTR(-ENOENT);
-	else
-		dentry = lookup_one_len(name, parent, strlen(name));
-	if (!IS_ERR(dentry) && d_really_is_positive(dentry)) {
-		if (d_is_dir(dentry))
-			pr_err("Directory '%s' with parent '%s' already present!\n",
-			       name, parent->d_name.name);
-		else
-			pr_err("File '%s' in directory '%s' already present!\n",
-			       name, parent->d_name.name);
-		dput(dentry);
-		dentry = ERR_PTR(-EEXIST);
-	}
-
-	if (IS_ERR(dentry)) {
-		inode_unlock(d_inode(parent));
-		simple_release_fs(&debugfs);
-	}
-
-	return dentry;
-}
-
-static struct dentry *failed_creating(struct dentry *dentry)
-{
-	inode_unlock(d_inode(dentry->d_parent));
-	dput(dentry);
-	simple_release_fs(&debugfs);
-	return ERR_PTR(-ENOMEM);
-}
-
-static struct dentry *end_creating(struct dentry *dentry)
-{
-	inode_unlock(d_inode(dentry->d_parent));
-	return dentry;
-}
-
 static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 				struct dentry *parent, void *data,
 				const struct file_operations *proxy_fops,
@@ -364,32 +302,17 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	struct dentry *dentry;
 	struct inode *inode;
 
-	if (!(mode & S_IFMT))
-		mode |= S_IFREG;
-	BUG_ON(!S_ISREG(mode));
-	dentry = start_creating(name, parent);
-
+	dentry = simplefs_create_file(&debugfs, &debug_fs_type,
+				      name, mode, parent, data, &inode);
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = simple_new_inode(dentry->d_sb);
-	if (unlikely(!inode)) {
-		pr_err("out of free dentries, can not create file '%s'\n",
-		       name);
-		return failed_creating(dentry);
-	}
-
-	inode->i_mode = mode;
-	inode->i_private = data;
-
 	inode->i_op = &debugfs_file_inode_operations;
 	inode->i_fop = proxy_fops;
 	dentry->d_fsdata = (void *)((unsigned long)real_fops |
 				DEBUGFS_FSDATA_IS_REAL_FOPS_BIT);
 
-	d_instantiate(dentry, inode);
-	fsnotify_create(d_inode(dentry->d_parent), dentry);
-	return end_creating(dentry);
+	return simplefs_finish_dentry(dentry, inode);
 }
 
 /**
@@ -522,29 +445,16 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
  */
 struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 {
-	struct dentry *dentry = start_creating(name, parent);
+	struct dentry *dentry;
 	struct inode *inode;
 
+	dentry = simplefs_create_dir(&debugfs, &debug_fs_type,
+				     name, 0755, parent, &inode);
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = simple_new_inode(dentry->d_sb);
-	if (unlikely(!inode)) {
-		pr_err("out of free dentries, can not create directory '%s'\n",
-		       name);
-		return failed_creating(dentry);
-	}
-
-	inode->i_mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
 	inode->i_op = &debugfs_dir_inode_operations;
-	inode->i_fop = &simple_dir_operations;
-
-	/* directory inodes start off with i_nlink == 2 (for "." entry) */
-	inc_nlink(inode);
-	d_instantiate(dentry, inode);
-	inc_nlink(d_inode(dentry->d_parent));
-	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
-	return end_creating(dentry);
+	return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_dir);
 
@@ -564,29 +474,19 @@ struct dentry *debugfs_create_automount(const char *name,
 					debugfs_automount_t f,
 					void *data)
 {
-	struct dentry *dentry = start_creating(name, parent);
+	struct dentry *dentry;
 	struct inode *inode;
 
+	dentry = simplefs_create_dentry(&debugfs, &debug_fs_type, name, parent,
+					&inode);
 	if (IS_ERR(dentry))
 		return dentry;
 
-	inode = simple_new_inode(dentry->d_sb);
-	if (unlikely(!inode)) {
-		pr_err("out of free dentries, can not create automount '%s'\n",
-		       name);
-		return failed_creating(dentry);
-	}
-
 	make_empty_dir_inode(inode);
 	inode->i_flags |= S_AUTOMOUNT;
 	inode->i_private = data;
 	dentry->d_fsdata = (void *)f;
-	/* directory inodes start off with i_nlink == 2 (for "." entry) */
-	inc_nlink(inode);
-	d_instantiate(dentry, inode);
-	inc_nlink(d_inode(dentry->d_parent));
-	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
-	return end_creating(dentry);
+	return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL(debugfs_create_automount);
 
@@ -618,28 +518,14 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 {
 	struct dentry *dentry;
 	struct inode *inode;
-	char *link = kstrdup(target, GFP_KERNEL);
-	if (!link)
-		return ERR_PTR(-ENOMEM);
 
-	dentry = start_creating(name, parent);
-	if (IS_ERR(dentry)) {
-		kfree(link);
+	dentry = simplefs_create_symlink(&debugfs, &debug_fs_type,
+					 name, parent, target, &inode);
+	if (IS_ERR(dentry))
 		return dentry;
-	}
 
-	inode = simple_new_inode(dentry->d_sb);
-	if (unlikely(!inode)) {
-		pr_err("out of free dentries, can not create symlink '%s'\n",
-		       name);
-		kfree(link);
-		return failed_creating(dentry);
-	}
-	inode->i_mode = S_IFLNK | S_IRWXUGO;
 	inode->i_op = &debugfs_symlink_inode_operations;
-	inode->i_link = link;
-	d_instantiate(dentry, inode);
-	return end_creating(dentry);
+	return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_symlink);
 
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

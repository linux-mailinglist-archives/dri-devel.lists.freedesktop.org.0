Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D61B28AA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483806E988;
	Tue, 21 Apr 2020 13:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C426E988
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmtwUC7V+MJ1MUJkO+8igv9Zdipw2p7Im+OneAOOFXw=;
 b=YULjPD5L0DUJ+PU6Ww7TacsSdTNysH+YmMAtVcf5cCpG8bIzAoUG0jmFtje29ZwIyrk6Lc
 iPhR56RuarA/qhCYN1BO8D9vDAxbRDeCUNBLWKFQlO4A7bTIlqmFuEXb4v1SALIsZ87n6j
 hPqbVbjeapLRXpFguQWGlmGyrReLFIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-9D2OHxO_OOOsicP3pBkjhQ-1; Tue, 21 Apr 2020 09:57:53 -0400
X-MC-Unique: 9D2OHxO_OOOsicP3pBkjhQ-1
Received: by mail-wm1-f70.google.com with SMTP id u11so1399829wmc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjaOnzI5gdueJ0y4sy2VdCpkInG/pM8xAJAe7M5MwVA=;
 b=XmJa9Tucd4diSzUGuMpiTZoKxfH4H83iwh39YnhSmz/HZ4D2mIUFI/Ss7fwrlyzft5
 hJNu5yXfNZjKuEMFPlW4meQlbfgHqPLVt1s4AO1iliqO9UvR1gnbUYjpoHDrfRhUQqUH
 oPFL+GYrZEkgFRYOgtUNwHbfVtyAvUyEu/515ADKBsZYNJNvodEtfjzWNuAEi/xIGf8f
 Fxp4FJo1DJV4e5ooielH7VDec1AAIl/V1p0mMQG/us3x9xgdTwZ6M8w5zVZx52jNONTg
 6tVZDoqiDLSaHo5anbkyBEVYjGPOWnfRiAVs1wqp4LB3gSi8kPxDcD0fGrV7RiE9Y9ZI
 ch8A==
X-Gm-Message-State: AGi0PuYiJ4LOMCnvQG5v+LuKi7MjjJPUjRBHvR+NXuZLcMZtlIt8I8AQ
 gpCOeuHDBEvGpuFYSMJlVsdnKnl4wGglsE1OmHvnHXfzjHknUcAmQrgip/tH+yF3zbySSRS5U1l
 DpP0UHhyVyKKcjpc70lT9aRG0jCVx
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr5022060wme.139.1587477472394; 
 Tue, 21 Apr 2020 06:57:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlG2viM+l0EuPG6wic3zBlhrKU/He9H0puv0ur4Y4UIWdpPnCyTzA3FMh8mbZkb38/fp+4ZQ==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr5022031wme.139.1587477472153; 
 Tue, 21 Apr 2020 06:57:52 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:51 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 6/7] debugfs: switch to simplefs inode creation API
Date: Tue, 21 Apr 2020 15:57:40 +0200
Message-Id: <20200421135741.30657-4-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421135119.30007-1-eesposit@redhat.com>
References: <20200421135119.30007-1-eesposit@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Becker <jlbec@evilplan.org>
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
index 5dbb74a23e7c..ccbeea9e5f6c 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -305,68 +305,6 @@ struct dentry *debugfs_lookup(const char *name, struct dentry *parent)
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
@@ -375,32 +313,17 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
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
 
-	inode = debugfs_get_inode(dentry->d_sb);
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
@@ -533,29 +456,16 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
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
 
-	inode = debugfs_get_inode(dentry->d_sb);
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
 
@@ -575,29 +485,19 @@ struct dentry *debugfs_create_automount(const char *name,
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
 
-	inode = debugfs_get_inode(dentry->d_sb);
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
 
@@ -629,28 +529,14 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
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
 
-	inode = debugfs_get_inode(dentry->d_sb);
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

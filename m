Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF40669F596
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 14:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042F310E994;
	Wed, 22 Feb 2023 13:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2A510E994
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677072796; x=1708608796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oUD8p7VfQbH5/WucJ/iT0qTWgATjU34Oo2kJqYtBe6c=;
 b=b9FwX46hr3/Y+BTH0hVZsOXv6NhVgK+SnIWCG+v1Y9pGBrEJhptV14j5
 a6K2jCHcbGqE/YemMT2xcASBts3h1zT7M0PfeZ6xDSqJVktpc3Nu8dMPu
 DtjLBZi+5unqUqFBBna9OGR5ce/wLld2St9Iw6QX1mhFNOvf0bTsUw1N7
 xh9PcTimX4n3Vc6b7KUYPoStx7J/hp/qHmuw/cDgV8h58v989IZg2QwqX
 x89o+/kvgLt5qclrKmfRZ/VJ9FfcYRj4DByFtvV/USPMATRmwPQmb93kY
 IDQItFvxk66+voMpeDPM1mJ0tAPz2sz8ulhzAgAugBvb9Pscfm89u+ngI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321062440"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="321062440"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 05:33:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="665349222"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="665349222"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 05:33:13 -0800
Date: Wed, 22 Feb 2023 14:33:11 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <20230222133311.GA3537031@linux.intel.com>
References: <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com>
 <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
 <87ilg1zgf2.fsf@intel.com> <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
 <4904cea7-3440-1e52-f5ea-71b9069506a6@amd.com>
 <20230217100118.GB2862577@linux.intel.com>
 <Y+/XtJu750cftFuY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+/XtJu750cftFuY@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, wambui.karugax@gmail.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 08:38:28PM +0100, Daniel Vetter wrote:
> > > > > I'm firmly in the camp that debugfs does not need to work under all
> > > > > conditions, but that it must fail gracefully instead of crashing.
> > > > Yeah I mean once we talk bring-up, you can just hand-roll the necessary
> > > > bring debugfs things that you need to work before the driver is ready to
> > > > do anything.
> > > > 
> > > > But bring-up debugfs fun is rather special, same way pre-silicon support
> > > > tends to be rather special. Shipping that in distros does not sound like a
> > > > good idea at all to me.
> > > 
> > > Yeah, that's indeed a really good point.
> > > 
> > > I can't remember how often I had to note that module parameters would also
> > > be used by end users.
> > > 
> > > How about if the create the debugfs directory with a "." as name prefix
> > > first and then rename it as soon as the device is registered?
> > 
> > Good idea. Or the dir could have this drm_dev->unique name and be created
> > during alloc, and link in minor created during registration. That would
> > mean minor link is safe to use and unique potentially dangerous before
> > registration.
> > 
> > > Alternatively
> > > we could clear the i_mode of the directory.
> > 
> > I checked that yesterday and this does not prevent to access the file
> > for root user. Perhaps there is other smart way for blocking
> > root access in vfs just by modifying some inode field, but just
> > 'chmod 0000 file' does not prevent that.
> > 
> > > If a power user or engineer wants to debug startup problems stuff it should
> > > be trivial to work around that from userspace, and if people do such things
> > > they should also know the potential consequences.
> > 
> > Fully agree.
> 
> So what about a drm module option instead (that taints the kernel as usual
> for these), which:
> - registers the debugfs dir right away
> - registers any debugfs files as soon as they get populated, instead of
>   postponing until drm_dev_register
> 
> It would only neatly work with the add_file stuff, but I guess drivers
> could still hand-roll this if needed.
> 
> I think funny games with trying to hide the files while not hiding them is
> not a great idea, and explicit "I'm debugging stuff, please stand back"
> knob sounds much better to me.

I prepared debugfs patch that allow to create not accessible directory
and publish it once everything is ready. I hope it would be accepted
by Greg KH and we could use it to make drm_debugfs_* simpler.

Would be nice if someone could test it and/or comment,
before I would post it further.

Thanks
Stanislaw

From 6bb4d38d90428904ac59a2717970697621a32a79 Mon Sep 17 00:00:00 2001
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Date: Tue, 21 Feb 2023 10:39:47 +0100
Subject: [PATCH] debugfs: introduce support for partially-initialized drivers

The i915 driver, among others, includes multiple subsystems that create
debugfs files in different parts of the code. It's important that these
files are not accessed before the driver is fully initialized, as doing
so could cause issues.

This patch adds support for creating a debugfs directory that will
prevent access to its files until a certain point in initialization is
reached, at which point the driver can signal that it's safe to access
the directory. This ensures that debugfs files are accessed only when
it's safe to do so.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 fs/debugfs/inode.c      | 59 ++++++++++++++++++++++++++++++++++++++---
 fs/debugfs/internal.h   |  7 +++++
 include/linux/debugfs.h |  3 +++
 3 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 2e8e112b1993..04b88a5fab61 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -55,12 +55,23 @@ static int debugfs_setattr(struct user_namespace *mnt_userns,
 	return simple_setattr(&init_user_ns, dentry, ia);
 }
 
+static int debugfs_permission(struct user_namespace *mnt_userns, struct inode *inode, int mask)
+{
+	unsigned long priv = (unsigned long) inode->i_private;
+
+	if (S_ISDIR(inode->i_mode) && (priv & DEBUGFS_DIR_PREPARING))
+		return (priv & DEBUGFS_ALLOW_CREATE) ? 0 : -EPERM;
+
+	return generic_permission(mnt_userns, inode, mask);
+}
+
 static const struct inode_operations debugfs_file_inode_operations = {
 	.setattr	= debugfs_setattr,
 };
 static const struct inode_operations debugfs_dir_inode_operations = {
 	.lookup		= simple_lookup,
 	.setattr	= debugfs_setattr,
+	.permission	= debugfs_permission,
 };
 static const struct inode_operations debugfs_symlink_inode_operations = {
 	.get_link	= simple_get_link,
@@ -340,6 +351,7 @@ EXPORT_SYMBOL_GPL(debugfs_lookup);
 static struct dentry *start_creating(const char *name, struct dentry *parent)
 {
 	struct dentry *dentry;
+	unsigned long priv;
 	int error;
 
 	if (!(debugfs_allow & DEBUGFS_ALLOW_API))
@@ -369,10 +381,20 @@ static struct dentry *start_creating(const char *name, struct dentry *parent)
 		parent = debugfs_mount->mnt_root;
 
 	inode_lock(d_inode(parent));
-	if (unlikely(IS_DEADDIR(d_inode(parent))))
+	if (unlikely(IS_DEADDIR(d_inode(parent)))) {
 		dentry = ERR_PTR(-ENOENT);
-	else
+	} else {
+		priv = (unsigned long) d_inode(parent)->i_private;
+
+		priv |= DEBUGFS_ALLOW_CREATE;
+		d_inode(parent)->i_private = (void *) priv;
+
 		dentry = lookup_one_len(name, parent, strlen(name));
+
+		priv &= ~DEBUGFS_ALLOW_CREATE;
+		d_inode(parent)->i_private = (void *) priv;
+	}
+
 	if (!IS_ERR(dentry) && d_really_is_positive(dentry)) {
 		if (d_is_dir(dentry))
 			pr_err("Directory '%s' with parent '%s' already present!\n",
@@ -585,7 +607,9 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
  * passed to them could be an error and they don't crash in that case.
  * Drivers should generally work fine even if debugfs fails to init anyway.
  */
-struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
+
+static struct dentry *__debugfs_create_dir(const char *name, struct dentry *parent,
+					   bool preparing)
 {
 	struct dentry *dentry = start_creating(name, parent);
 	struct inode *inode;
@@ -605,6 +629,9 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 		return failed_creating(dentry);
 	}
 
+	if (preparing)
+		inode->i_private = (void *) DEBUGFS_DIR_PREPARING;
+
 	inode->i_mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
 	inode->i_op = &debugfs_dir_inode_operations;
 	inode->i_fop = &simple_dir_operations;
@@ -616,8 +643,34 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
 }
+
+struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
+{
+	return __debugfs_create_dir(name, parent, false);
+}
 EXPORT_SYMBOL_GPL(debugfs_create_dir);
 
+struct dentry *debugfs_prepare_dir(const char *name, struct dentry *parent)
+{
+	return __debugfs_create_dir(name, parent, true);
+}
+EXPORT_SYMBOL_GPL(debugfs_prepare_dir);
+
+void debugfs_publish_dir(struct dentry *dir)
+{
+	struct inode *inode;
+
+	if (!debugfs_initialized() || IS_ERR(dir))
+		return;
+
+	inode = d_inode(dir);
+
+	inode_lock(inode);
+	inode->i_private = NULL;
+	inode_unlock(inode);
+}
+EXPORT_SYMBOL_GPL(debugfs_publish_dir);
+
 /**
  * debugfs_create_automount - create automount point in the debugfs filesystem
  * @name: a pointer to a string containing the name of the file to create.
diff --git a/fs/debugfs/internal.h b/fs/debugfs/internal.h
index 92af8ae31313..47c795756bec 100644
--- a/fs/debugfs/internal.h
+++ b/fs/debugfs/internal.h
@@ -33,6 +33,13 @@ struct debugfs_fsdata {
 #define DEBUGFS_ALLOW_API	BIT(0)
 #define DEBUGFS_ALLOW_MOUNT	BIT(1)
 
+/*
+ * Inode private flags that limit access to a directory,
+ * which may not be fully propagated to the requested files.
+ */
+#define DEBUGFS_DIR_PREPARING	BIT(0)
+#define DEBUGFS_ALLOW_CREATE	BIT(1)
+
 #ifdef CONFIG_DEBUG_FS_ALLOW_ALL
 #define DEFAULT_DEBUGFS_ALLOW_BITS (DEBUGFS_ALLOW_MOUNT | DEBUGFS_ALLOW_API)
 #endif
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index ea2d919fd9c7..8a080270ac1c 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -86,6 +86,9 @@ void debugfs_create_file_size(const char *name, umode_t mode,
 
 struct dentry *debugfs_create_dir(const char *name, struct dentry *parent);
 
+struct dentry *debugfs_prepare_dir(const char *name, struct dentry *parent);
+void debugfs_publish_dir(struct dentry *dir);
+
 struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 				      const char *dest);
 
-- 
2.25.1



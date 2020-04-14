Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C91A7B0C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A608E6E0DA;
	Tue, 14 Apr 2020 12:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7EF6E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/EAkJa3PCTCg9cZch9XiCXuGIAdU1li//UfqmnYJ2A=;
 b=LExj4iKkBrs66gX2y9VCTmQNLrw/EtCgfb4fHoYx527Qu5BBCBrWB+J14qNpC+q8vVU7s3
 xdeUdVnwFPnhp4DwDFwTUHRzu4nKb44pt9edqA1KC07gTVNWeHRjIo8gX+tvJdtl9u5mhg
 zqBNW7rc7ScAdtscG3R94f+dsilFejw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287--SwwH1EHOHS2qY9yPjJnaQ-1; Tue, 14 Apr 2020 08:43:47 -0400
X-MC-Unique: -SwwH1EHOHS2qY9yPjJnaQ-1
Received: by mail-wm1-f72.google.com with SMTP id h22so2666204wml.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mpH0i9D4CKdkaA94rTuJ9ZLibjvc0u/wsmELw+W2YRE=;
 b=SbRbGEEfO1mXK3WP1TWGuWvKo9VD/qfe2mfIDw9I2soygTfSZ8MyTsD1Ug5wtQECoM
 whCYk0L6eeAZZFDZLAgpOY4onxa/Fv5jzqdLbMo8IvTKnAvDuTdMe32HvxriiOW7nx5t
 ET8u6zGEd/zyLD/aY9gmTRXGB/J261OBjvHjlNAfwbg66NI+6KJS6PxqgVuvTGS33yMm
 4Aocga6oFoT1vi9X5hbG38rv0zC7FRsOL3xZe64m3Q3liWV2ikxxnVaoSNLeXbjeHtKv
 7/mT9jFF01GnpQY/4zTLr0DZBow/jLWvMV0bjTQYaLs9AL/sRfesi+ouyqS2zbNeqab6
 kMSw==
X-Gm-Message-State: AGi0PubFvPIk+9Ppjyftpzl6O1eq/j6xsZcg2jaJ18/Z8O0Yfm+6Rb1s
 VcK40G5cHDW9rep8beLeIaetini6vJqxjUgELi3X9Ki7P9Ir/ykDee2VLr8ZXSXa4y7VFXcSF1Q
 dzvzfBKiGu32SceB4L/j73mg2+xIw
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr22955680wra.49.1586868225584; 
 Tue, 14 Apr 2020 05:43:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKrr6l40rwg6gvnqEERTdItJB1re/eEs/hrCesLG4TYaZ1yTmp5eu/qtdPBP1+X7lPvfKXptw==
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr22955631wra.49.1586868225144; 
 Tue, 14 Apr 2020 05:43:45 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:44 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 2/8] fs: extract simple_pin/release_fs to separate files
Date: Tue, 14 Apr 2020 14:42:56 +0200
Message-Id: <20200414124304.4470-3-eesposit@redhat.com>
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

We will augment this family of functions with inode management.  To avoid
littering include/linux/fs.h and fs/libfs.c, move them to a separate header,
with a Kconfig symbol to enable them.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/Kconfig         |  1 +
 drivers/gpu/drm/drm_drv.c       |  2 +-
 drivers/misc/cxl/Kconfig        |  1 +
 drivers/misc/cxl/api.c          |  1 +
 drivers/misc/ocxl/Kconfig       |  1 +
 drivers/scsi/cxlflash/ocxl_hw.c |  1 +
 fs/Kconfig                      |  3 +++
 fs/Kconfig.binfmt               |  1 +
 fs/Makefile                     |  1 +
 fs/binfmt_misc.c                |  2 +-
 fs/configfs/Kconfig             |  1 +
 fs/configfs/mount.c             |  2 +-
 fs/debugfs/inode.c              |  2 +-
 fs/libfs.c                      | 36 +------------------------------
 fs/simplefs.c                   | 38 +++++++++++++++++++++++++++++++++
 fs/tracefs/inode.c              |  2 +-
 include/linux/fs.h              |  2 --
 include/linux/simplefs.h        | 10 +++++++++
 lib/Kconfig.debug               | 16 ++++++++------
 security/Kconfig                |  1 +
 security/apparmor/apparmorfs.c  |  3 ++-
 security/inode.c                |  2 +-
 22 files changed, 79 insertions(+), 50 deletions(-)
 create mode 100644 fs/simplefs.c
 create mode 100644 include/linux/simplefs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..a6fe933de9da 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -14,6 +14,7 @@ menuconfig DRM
 	select I2C
 	select I2C_ALGOBIT
 	select DMA_SHARED_BUFFER
+	select SIMPLEFS
 	select SYNC_FILE
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b1a628d1f6e..187a61091b5c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -27,7 +27,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mount.h>
diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
index 39eec9031487..a62795079d9c 100644
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -19,6 +19,7 @@ config CXL
 	select CXL_BASE
 	select CXL_AFU_DRIVER_OPS
 	select CXL_LIB
+	select SIMPLEFS
 	default m
 	help
 	  Select this option to enable driver support for IBM Coherent
diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index b493de962153..0b8f8de7475a 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -9,6 +9,7 @@
 #include <misc/cxl.h>
 #include <linux/module.h>
 #include <linux/mount.h>
+#include <linux/simplefs.h>
 #include <linux/pseudo_fs.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_context.h>
diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
index 2d2266c1439e..ddd9245fff3d 100644
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -12,6 +12,7 @@ config OCXL
 	depends on PPC_POWERNV && PCI && EEH
 	select OCXL_BASE
 	select HOTPLUG_PCI_POWERNV
+	select SIMPLEFS
 	default m
 	help
 	  Select this option to enable the ocxl driver for Open
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 7018cd802569..429f55651090 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -12,6 +12,7 @@
 #include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/mount.h>
+#include <linux/simplefs.h>
 #include <linux/pseudo_fs.h>
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
diff --git a/fs/Kconfig b/fs/Kconfig
index f08fbbfafd9a..a6795ae312a2 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -218,6 +218,9 @@ config HUGETLB_PAGE
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
+config SIMPLEFS
+	bool
+
 config ARCH_HAS_GIGANTIC_PAGE
 	bool
 
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 62dc4f577ba1..af7b765de4d3 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -176,6 +176,7 @@ config BINFMT_EM86
 
 config BINFMT_MISC
 	tristate "Kernel support for MISC binaries"
+	select SIMPLEFS
 	---help---
 	  If you say Y here, it will be possible to plug wrapper-driven binary
 	  formats into the kernel. You will like this especially when you use
diff --git a/fs/Makefile b/fs/Makefile
index 2ce5112b02c8..c5c665984b9e 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PROC_FS) += proc_namespace.o
 obj-y				+= notify/
 obj-$(CONFIG_EPOLL)		+= eventpoll.o
 obj-y				+= anon_inodes.o
+obj-$(CONFIG_SIMPLEFS)		+= simplefs.o
 obj-$(CONFIG_SIGNALFD)		+= signalfd.o
 obj-$(CONFIG_TIMERFD)		+= timerfd.o
 obj-$(CONFIG_EVENTFD)		+= eventfd.o
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index cdb45829354d..c764110f5f0b 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -25,7 +25,7 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 #include <linux/syscalls.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/uaccess.h>
 
 #include "internal.h"
diff --git a/fs/configfs/Kconfig b/fs/configfs/Kconfig
index 272b64456999..3b461e4e3989 100644
--- a/fs/configfs/Kconfig
+++ b/fs/configfs/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CONFIGFS_FS
 	tristate "Userspace-driven configuration filesystem"
+	select SIMPLEFS
 	select SYSFS
 	help
 	  configfs is a RAM-based filesystem that provides the converse
diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index 0c6e8cf61953..331c2f064f02 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -10,7 +10,7 @@
  * configfs Copyright (C) 2005 Oracle.  All rights reserved.
  */
 
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/module.h>
 #include <linux/mount.h>
 #include <linux/fs_context.h>
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index b7f2e971ecbc..7b9fddced48f 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -13,7 +13,7 @@
 #define pr_fmt(fmt)	"debugfs: " fmt
 
 #include <linux/module.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
diff --git a/fs/libfs.c b/fs/libfs.c
index 3759fbacf522..26ec729f7bcd 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -11,6 +11,7 @@
 #include <linux/cred.h>
 #include <linux/mount.h>
 #include <linux/vfs.h>
+#include <linux/simplefs.h>
 #include <linux/quotaops.h>
 #include <linux/mutex.h>
 #include <linux/namei.h>
@@ -663,41 +664,6 @@ int simple_fill_super(struct super_block *s, unsigned long magic,
 }
 EXPORT_SYMBOL(simple_fill_super);
 
-static DEFINE_SPINLOCK(pin_fs_lock);
-
-int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, int *count)
-{
-	struct vfsmount *mnt = NULL;
-	spin_lock(&pin_fs_lock);
-	if (unlikely(!*mount)) {
-		spin_unlock(&pin_fs_lock);
-		mnt = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
-		if (IS_ERR(mnt))
-			return PTR_ERR(mnt);
-		spin_lock(&pin_fs_lock);
-		if (!*mount)
-			*mount = mnt;
-	}
-	mntget(*mount);
-	++*count;
-	spin_unlock(&pin_fs_lock);
-	mntput(mnt);
-	return 0;
-}
-EXPORT_SYMBOL(simple_pin_fs);
-
-void simple_release_fs(struct vfsmount **mount, int *count)
-{
-	struct vfsmount *mnt;
-	spin_lock(&pin_fs_lock);
-	mnt = *mount;
-	if (!--*count)
-		*mount = NULL;
-	spin_unlock(&pin_fs_lock);
-	mntput(mnt);
-}
-EXPORT_SYMBOL(simple_release_fs);
-
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/fs/simplefs.c b/fs/simplefs.c
new file mode 100644
index 000000000000..226d18963801
--- /dev/null
+++ b/fs/simplefs.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/simplefs.h>
+#include <linux/mount.h>
+
+static DEFINE_SPINLOCK(pin_fs_lock);
+
+int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, int *count)
+{
+	struct vfsmount *mnt = NULL;
+	spin_lock(&pin_fs_lock);
+	if (unlikely(!*mount)) {
+		spin_unlock(&pin_fs_lock);
+		mnt = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
+		if (IS_ERR(mnt))
+			return PTR_ERR(mnt);
+		spin_lock(&pin_fs_lock);
+		if (!*mount)
+			*mount = mnt;
+	}
+	mntget(*mount);
+	++*count;
+	spin_unlock(&pin_fs_lock);
+	mntput(mnt);
+	return 0;
+}
+EXPORT_SYMBOL(simple_pin_fs);
+
+void simple_release_fs(struct vfsmount **mount, int *count)
+{
+	struct vfsmount *mnt;
+	spin_lock(&pin_fs_lock);
+	mnt = *mount;
+	if (!--*count)
+		*mount = NULL;
+	spin_unlock(&pin_fs_lock);
+	mntput(mnt);
+}
+EXPORT_SYMBOL(simple_release_fs);
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 0ee8c6dfb036..4353ca81e1d7 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/mount.h>
 #include <linux/kobject.h>
 #include <linux/namei.h>
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4f6f59b4f22a..55b679b89c8a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3363,8 +3363,6 @@ struct tree_descr { const char *name; const struct file_operations *ops; int mod
 struct dentry *d_alloc_name(struct dentry *, const char *);
 extern int simple_fill_super(struct super_block *, unsigned long,
 			     const struct tree_descr *);
-extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
-extern void simple_release_fs(struct vfsmount **mount, int *count);
 
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 			loff_t *ppos, const void *from, size_t available);
diff --git a/include/linux/simplefs.h b/include/linux/simplefs.h
new file mode 100644
index 000000000000..1076a44db308
--- /dev/null
+++ b/include/linux/simplefs.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SIMPLEFS_H
+#define _LINUX_SIMPLEFS_H
+
+#include <linux/fs.h>
+
+extern int simple_pin_fs(struct file_system_type *, struct vfsmount **mount, int *count);
+extern void simple_release_fs(struct vfsmount **mount, int *count);
+
+#endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d1398cef3b18..fc38a6f0fc11 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -288,12 +288,16 @@ config STRIP_ASM_SYMS
 
 config READABLE_ASM
 	bool "Generate readable assembler code"
-	depends on DEBUG_KERNEL
-	help
-	  Disable some compiler optimizations that tend to generate human unreadable
-	  assembler output. This may make the kernel slightly slower, but it helps
-	  to keep kernel developers who have to stare a lot at assembler listings
-	  sane.
+    depends on DEBUG_KERNEL
+    help
+      Disable some compiler optimizations that tend to generate human unreadable
+      assembler output. This may make the kernel slightly slower, but it helps
+      to keep kernel developers who have to stare a lot at assembler listings
+      sane.
+	  
+config DEBUG_FS
+	bool "Debug Filesystem"
+	select SIMPLEFS
 
 config HEADERS_INSTALL
 	bool "Install uapi headers to usr/include"
diff --git a/security/Kconfig b/security/Kconfig
index cd3cc7da3a55..2c6713aa8b4f 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -39,6 +39,7 @@ config SECURITY_WRITABLE_HOOKS
 
 config SECURITYFS
 	bool "Enable the securityfs filesystem"
+	select SIMPLEFS
 	help
 	  This will build the securityfs filesystem.  It is currently used by
 	  various security modules (AppArmor, IMA, SafeSetID, TOMOYO, TPM).
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 828bb1eb77ea..d62d3fca47f2 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -18,7 +18,7 @@
 #include <linux/namei.h>
 #include <linux/capability.h>
 #include <linux/rcupdate.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/fs_context.h>
 #include <linux/poll.h>
 #include <linux/zlib.h>
@@ -2529,6 +2529,7 @@ static int aa_mk_null_file(struct dentry *parent)
 	struct vfsmount *mount;
 	struct dentry *dentry;
 	struct inode *inode;
+	int error;
 
 	mount = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
 	if (IS_ERR(mount))
diff --git a/security/inode.c b/security/inode.c
index 6c326939750d..a9a9ee4de21d 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -12,7 +12,7 @@
 /* #define DEBUG */
 #include <linux/sysfs.h>
 #include <linux/kobject.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/fs_context.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

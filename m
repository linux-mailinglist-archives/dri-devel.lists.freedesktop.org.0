Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99A9BA6D6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 18:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B2F10E27D;
	Sun,  3 Nov 2024 17:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="MrPXyPkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E9110E276;
 Sun,  3 Nov 2024 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1730653480;
 bh=nl79rluqUz7qDqQxR9i496RKtXejrl6t02e4QH5qPJI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MrPXyPkEuWuLaArcS1YGVn5YlgOUjnhynRsRbFHftaoVetXelMVaxQkJe+EiL6woE
 S+0agGULjab2y5uR+7KKalE5m4IP94H8VkjxsjakcHAZy5VaYR9a0QZZyYQRSiHv+/
 ysKDYkOHxRTXhv0Lf2m/q/BbJ0blHSQyXutxkMIo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:38 +0000
Subject: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=4652;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=nl79rluqUz7qDqQxR9i496RKtXejrl6t02e4QH5qPJI=;
 b=zRu/d/VZWP3doJBfzxqs7giw29YYNYi0iPXD2I6CuiN9W2SIlp8gheE3GiOLS245JLYo+Bia3
 qTMMFVAORK0D7GC1EfyiEnv7178teL6JXj2G6JdQ8X2UySjLYA2oPsa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

To make it possible to put struct bin_attribute into read-only memory,
the sysfs core has to stop passing mutable pointers to the read() and
write() callbacks.
As there are numerous implementors of these callbacks throughout the
tree it's not possible to change all of them at once.
To enable a step-by-step transition, add new variants of the read() and
write() callbacks which differ only in the constness of the struct
bin_attribute argument.

As most binary attributes are defined through macros, extend these
macros to transparently handle both variants of callbacks to minimize
the churn during the transition.
As soon as all handlers are switch to the const variant, the non-const
one can be removed together with the transition machinery.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 fs/sysfs/file.c       | 22 +++++++++++++++++-----
 include/linux/sysfs.h | 25 +++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 6d39696b43069010b0ad0bdaadcf9002cb70c92c..785408861c01c89fc84c787848243a13c1338367 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -91,9 +91,12 @@ static ssize_t sysfs_kf_bin_read(struct kernfs_open_file *of, char *buf,
 			count = size - pos;
 	}
 
-	if (!battr->read)
+	if (!battr->read && !battr->read_new)
 		return -EIO;
 
+	if (battr->read_new)
+		return battr->read_new(of->file, kobj, battr, buf, pos, count);
+
 	return battr->read(of->file, kobj, battr, buf, pos, count);
 }
 
@@ -152,9 +155,12 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
 	if (!count)
 		return 0;
 
-	if (!battr->write)
+	if (!battr->write && !battr->write_new)
 		return -EIO;
 
+	if (battr->write_new)
+		return battr->write_new(of->file, kobj, battr, buf, pos, count);
+
 	return battr->write(of->file, kobj, battr, buf, pos, count);
 }
 
@@ -323,13 +329,19 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *parent,
 	const struct kernfs_ops *ops;
 	struct kernfs_node *kn;
 
+	if (battr->read && battr->read_new)
+		return -EINVAL;
+
+	if (battr->write && battr->write_new)
+		return -EINVAL;
+
 	if (battr->mmap)
 		ops = &sysfs_bin_kfops_mmap;
-	else if (battr->read && battr->write)
+	else if ((battr->read || battr->read_new) && (battr->write || battr->write_new))
 		ops = &sysfs_bin_kfops_rw;
-	else if (battr->read)
+	else if (battr->read || battr->read_new)
 		ops = &sysfs_bin_kfops_ro;
-	else if (battr->write)
+	else if (battr->write || battr->write_new)
 		ops = &sysfs_bin_kfops_wo;
 	else
 		ops = &sysfs_file_kfops_empty;
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308df3bb25b8c3287 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -305,8 +305,12 @@ struct bin_attribute {
 	struct address_space *(*f_mapping)(void);
 	ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
 			char *, loff_t, size_t);
+	ssize_t (*read_new)(struct file *, struct kobject *, const struct bin_attribute *,
+			    char *, loff_t, size_t);
 	ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
 			 char *, loff_t, size_t);
+	ssize_t (*write_new)(struct file *, struct kobject *,
+			     const struct bin_attribute *, char *, loff_t, size_t);
 	loff_t (*llseek)(struct file *, struct kobject *, const struct bin_attribute *,
 			 loff_t, int);
 	int (*mmap)(struct file *, struct kobject *, const struct bin_attribute *attr,
@@ -325,11 +329,28 @@ struct bin_attribute {
  */
 #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)->attr)
 
+typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct kobject *,
+					   const struct bin_attribute *, char *, loff_t, size_t);
+
 /* macros to create static binary attributes easier */
 #define __BIN_ATTR(_name, _mode, _read, _write, _size) {		\
 	.attr = { .name = __stringify(_name), .mode = _mode },		\
-	.read	= _read,						\
-	.write	= _write,						\
+	.read = _Generic(_read,						\
+		__sysfs_bin_rw_handler_new * : NULL,			\
+		default : _read						\
+	),								\
+	.read_new = _Generic(_read,					\
+		__sysfs_bin_rw_handler_new * : _read,			\
+		default : NULL						\
+	),								\
+	.write = _Generic(_write,					\
+		__sysfs_bin_rw_handler_new * : NULL,			\
+		default : _write					\
+	),								\
+	.write_new = _Generic(_write,					\
+		__sysfs_bin_rw_handler_new * : _write,			\
+		default : NULL						\
+	),								\
 	.size	= _size,						\
 }
 

-- 
2.47.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FA3995F1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 00:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CAC6EE89;
	Wed,  2 Jun 2021 22:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17726EE89
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 22:29:45 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so5004000ybp.17
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=q+Xu+x4tPXqeCP0K0fziEQ32Q2TKXGZjhOO3Wuty7dM=;
 b=LDgGS+RIx3MVx90p4DHf1OboZw9Z+QDn3R8cmFB4OM75Xoh5XcQWxHOWYprgEnUDTm
 Tg9eIwt2m3eVUw5Jbf165LmG49MiR3FBgaXw7xKEIVO7CBtkInNqW8T7BGHquSqw9slM
 XuOv4E0AsMUoqVzXmuiH+ltrpUbuIvjVMlHniYgr7mk6qtXZG3WN0IBCjWiRUcIX+VE5
 +hk6fzfUyxcePPNZZwdsBsBjlnaw93I6gr5ZlZG9S3ztv3oTQNKLgRS00iMF5cskJUeb
 jgNQpVrCGYsbiK3c32RYRp2npuQxwHWJIR8YeJJ4Hp62hUK8ykOF8vp2MoqDxUgrY6B+
 httw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=q+Xu+x4tPXqeCP0K0fziEQ32Q2TKXGZjhOO3Wuty7dM=;
 b=dgem9WKIUw4jM1juzAwPMY8/uHPxd+9+DYpHus194ovD9bwDa+cJA5RNZadV+d1tgC
 kOp7ug2jBjofFcaRwN1hYa7yBgnUQkariLRhMZJ2RiidNNRSMbyvTfXWF8I79UUf5Vl3
 c97R3nMNLunq1FQB++RLB+5S0SkOA1/N8v3nY5pczwpT68hf/DvVuH64W8WMqtNDAnSE
 Jvh54C18tKtSuUdjwf0Rdt+z+9lwyEifqF1R25PJHvDCRsylEN8lqSJixrD10RANXPZP
 RzADQ0h0Sh4AMU0xcFkRZ30jehRnVZTka90o9RZPT5vo1j1K/2ozHhqEMWh7ivD5vmUM
 RihA==
X-Gm-Message-State: AOAM531V6AtHLSqYWaCh2ahktt2ECsfN5e2gKIgtwBQ0Bws7SBhJVdNI
 LmdDKk4TSeNOxEAKK7sa5KQ47pT1qIs=
X-Google-Smtp-Source: ABdhPJw6SSy4JrNd5qkaO6fF+2yahNuOeD039vgP70e6j4SCFAegmEL4wWXXXk+pyi1NQ6XQBGyehB5cFfU=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:f962:b81c:963f:82cb])
 (user=hridya job=sendgmr) by 2002:a25:3817:: with SMTP id
 f23mr48260991yba.192.1622672984775; 
 Wed, 02 Jun 2021 15:29:44 -0700 (PDT)
Date: Wed,  2 Jun 2021 15:29:30 -0700
Message-Id: <20210602222937.2628266-1-hridya@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v5] dmabuf: Add the capability to expose DMA-BUF stats in sysfs
From: Hridya Valsaraju <hridya@google.com>
To: daniel@ffwll.ch, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: surenb@google.com, kernel-team@android.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overview
=3D=3D=3D=3D=3D=3D=3D=3D
The patch adds DMA-BUF statistics to /sys/kernel/dmabuf/buffers. It
allows statistics to be enabled for each DMA-BUF in sysfs by enabling
the config CONFIG_DMABUF_SYSFS_STATS.

The following stats will be exposed by the interface:

/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
/sys/kernel/dmabuf/buffers/<inode_number>/size
/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_coun=
ter

The inode_number is unique for each DMA-BUF and was added earlier [1]
in order to allow userspace to track DMA-BUF usage across different
processes.

Use Cases
=3D=3D=3D=3D=3D=3D=3D=3D=3D
The interface provides a way to gather DMA-BUF per-buffer statistics
from production devices. These statistics will be used to derive DMA-BUF
per-exporter stats and per-device usage stats for Android Bug reports.
The corresponding userspace changes can be found at [2].
Telemetry tools will also capture this information(along with other
memory metrics) periodically as well as on important events like a
foreground app kill (which might have been triggered by Low Memory
Killer). It will also contribute to provide a snapshot of the system
memory usage on other events such as OOM kills and Application Not
Responding events.

Background
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Currently, there are two existing interfaces that provide information
about DMA-BUFs.
1) /sys/kernel/debug/dma_buf/bufinfo
debugfs is however unsuitable to be mounted in production systems and
cannot be considered as an alternative to the sysfs interface being
proposed.
2) proc/<pid>/fdinfo/<fd>
The proc/<pid>/fdinfo/<fd> files expose information about DMA-BUF fds.
However, the existing procfs interfaces can only provide information
about the buffers for which processes hold fds or have the buffers
mmapped into their address space. Since the procfs interfaces alone
cannot provide a full picture of all DMA-BUFs in the system, there is
the need for an alternate interface to provide this information on
production systems.

The patch contains the following major improvements over v1:
1) Each attachment is represented by its own directory to allow creating
a symlink to the importing device and to also provide room for future
expansion.
2) The number of distinct mappings of each attachment is exposed in a
separate file.
3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
inorder to make the interface expandable in future.

All of the improvements above are based on suggestions/feedback from
Daniel Vetter and Christian K=C3=B6nig.

A shell script that can be run on a classic Linux environment to read
out the DMA-BUF statistics can be found at [3](suggested by John
Stultz).

[1]: https://lore.kernel.org/patchwork/patch/1088791/
[2]: https://android-review.googlesource.com/q/topic:%22dmabuf-sysfs%22+(st=
atus:open%20OR%20status:merged)
[3]: https://android-review.googlesource.com/c/platform/system/memory/libme=
minfo/+/1549734

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Reported-by: kernel test robot <lkp@intel.com>
---

Hi Daniel,

I rewrote the commit message and added a new section to
Documentation/driver-api/dma-buf.rst as per your suggestions. Please
do take another look when you get a chance. Thanks again for the
guidance.

Regards,
Hridya

Change in v5:
-Added a section on DMA-BUF statistics to
Documentation/driver-api/dma-buf.rst. Organized the commit message to
clearly state the need for the new interface and provide the
background on why the existing means of DMA-BUF accounting will not
suffice. Based on feedback from Daniel Vetter.

Changes in v4:
-Suppress uevents from kset creation to avoid waking up uevent listeners
on DMA-BUF export/release.

Changes in v3:
-Fix a warning reported by the kernel test robot.

Changes in v2:
-Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addition
of other DMA-BUF-related sysfs stats in future. Based on feedback from
Daniel Vetter.
-Each attachment has its own directory to represent attached devices as
symlinks and to introduce map_count as a separate file. Based on
feedback from Daniel Vetter and Christian K=C3=B6nig. Thank you both!
-Commit messages updated to point to userspace code in AOSP that will
read the DMA-BUF sysfs stats.

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 +++
 Documentation/driver-api/dma-buf.rst          |  34 ++
 drivers/dma-buf/Kconfig                       |  11 +
 drivers/dma-buf/Makefile                      |   1 +
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 300 ++++++++++++++++++
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
 drivers/dma-buf/dma-buf.c                     |  37 +++
 include/linux/dma-buf.h                       |  20 ++
 8 files changed, 517 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Docume=
ntation/ABI/testing/sysfs-kernel-dmabuf-buffers
new file mode 100644
index 000000000000..a243984ed420
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
@@ -0,0 +1,52 @@
+What:		/sys/kernel/dmabuf/buffers
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	The /sys/kernel/dmabuf/buffers directory contains a
+		snapshot of the internal state of every DMA-BUF.
+		/sys/kernel/dmabuf/buffers/<inode_number> will contain the
+		statistics for the DMA-BUF with the unique inode number
+		<inode_number>
+Users:		kernel memory tuning/debugging tools
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and contains the name of the exporter =
of
+		the DMA-BUF.
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/size
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and specifies the size of the DMA-BUF =
in
+		bytes.
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This directory will contain subdirectories representing every
+		attachment of the DMA-BUF.
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This directory will contain information on the attached devic=
e
+		and the number of current distinct device mappings.
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>/device
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and is a symlink to the attached devic=
e's
+		sysfs entry.
+
+What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_u=
id>/map_counter
+Date:		May 2021
+KernelVersion:	v5.13
+Contact:	Hridya Valsaraju <hridya@google.com>
+Description:	This file is read-only and contains a map_counter indicating =
the
+		number of distinct device mappings of the attachment.
diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-ap=
i/dma-buf.rst
index 7f37ec30d9fd..4027762a824a 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -106,6 +106,40 @@ Implicit Fence Poll Support
 .. kernel-doc:: drivers/dma-buf/dma-buf.c
    :doc: implicit fence polling
=20
+DMA-BUF statistics
+~~~~~~~~~~~~~~~~~~
+
+``/sys/kernel/debug/dma_buf/bufinfo`` provides an overview of every DMA-BU=
F in the
+system. However, since debugfs is not safe to be mounted in production,
+procfs and sysfs can be used to gather DMA-BUF statistics on production sy=
stems.
+
+The ``/proc/<pid>/fdinfo/<fd>`` files in procfs can be used to gather info=
rmation
+about DMA-BUF fds. Detailed documentation about the interface is present i=
n
+Documentation/filesystems/proc.rst.
+Unfortunately, the existing procfs interfaces can only provide information=
 about
+the DMA-BUFs for which processes hold fds or have the buffers mmapped into=
 their
+address space. This necessitated the creation of the DMA-BUF sysfs statist=
ics
+interface to provide per-buffer information on production systems.
+
+The interface at ``/sys/kernel/dma-buf/buffers`` exposes information about
+every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
+
+The following stats are exposed by the interface:
+
+* ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
+* ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
+* ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/dev=
ice``
+* ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map=
_counter``
+
+The information in the interface can also be used to derive per-exporter a=
nd
+per-device usage statistics. The data from the interface can be gathered
+on error conditions or other important events to provide a snapshot of
+DMA-BUF usage. It can also be collected periodically by telemetry to monit=
or
+various metrics.
+
+Detailed documentation about the interface is present in
+Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
+
 Kernel Functions and Structures Reference
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 4e16c71c24b7..9561e3d2d428 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -72,6 +72,17 @@ menuconfig DMABUF_HEAPS
 	  allows userspace to allocate dma-bufs that can be shared
 	  between drivers.
=20
+menuconfig DMABUF_SYSFS_STATS
+	bool "DMA-BUF sysfs statistics"
+	select DMA_SHARED_BUFFER
+	help
+	   Choose this option to enable DMA-BUF sysfs statistics
+	   in location /sys/kernel/dmabuf/buffers.
+
+	   /sys/kernel/dmabuf/buffers/<inode_number> will contain
+	   statistics for the DMA-BUF with the unique inode number
+	   <inode_number>.
+
 source "drivers/dma-buf/heaps/Kconfig"
=20
 endmenu
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 995e05f609ff..40d81f23cacf 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)	+=3D heaps/
 obj-$(CONFIG_SYNC_FILE)		+=3D sync_file.o
 obj-$(CONFIG_SW_SYNC)		+=3D sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+=3D udmabuf.o
+obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
=20
 dmabuf_selftests-y :=3D \
 	selftest.o \
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-bu=
f-sysfs-stats.c
new file mode 100644
index 000000000000..45717c8108c8
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DMA-BUF sysfs statistics.
+ *
+ * Copyright (C) 2021 Google LLC.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
+#include <linux/kobject.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#include "dma-buf-sysfs-stats.h"
+
+#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs=
_entry, kobj)
+
+struct dma_buf_stats_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct dma_buf *dmabuf,
+			struct dma_buf_stats_attribute *attr, char *buf);
+};
+#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attr=
ibute, attr)
+
+static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
+					    struct attribute *attr,
+					    char *buf)
+{
+	struct dma_buf_stats_attribute *attribute;
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	struct dma_buf *dmabuf;
+
+	attribute =3D to_dma_buf_stats_attr(attr);
+	sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
+	dmabuf =3D sysfs_entry->dmabuf;
+
+	if (!dmabuf || !attribute->show)
+		return -EIO;
+
+	return attribute->show(dmabuf, attribute, buf);
+}
+
+static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
+	.show =3D dma_buf_stats_attribute_show,
+};
+
+static ssize_t exporter_name_show(struct dma_buf *dmabuf,
+				  struct dma_buf_stats_attribute *attr,
+				  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
+}
+
+static ssize_t size_show(struct dma_buf *dmabuf,
+			 struct dma_buf_stats_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%zu\n", dmabuf->size);
+}
+
+static struct dma_buf_stats_attribute exporter_name_attribute =3D
+	__ATTR_RO(exporter_name);
+static struct dma_buf_stats_attribute size_attribute =3D __ATTR_RO(size);
+
+static struct attribute *dma_buf_stats_default_attrs[] =3D {
+	&exporter_name_attribute.attr,
+	&size_attribute.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(dma_buf_stats_default);
+
+static void dma_buf_sysfs_release(struct kobject *kobj)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+
+	sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
+	kfree(sysfs_entry);
+}
+
+static struct kobj_type dma_buf_ktype =3D {
+	.sysfs_ops =3D &dma_buf_stats_sysfs_ops,
+	.release =3D dma_buf_sysfs_release,
+	.default_groups =3D dma_buf_stats_default_groups,
+};
+
+#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_bu=
f_attach_sysfs_entry, kobj)
+
+struct dma_buf_attach_stats_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
+			struct dma_buf_attach_stats_attribute *attr, char *buf);
+};
+#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_att=
ach_stats_attribute, attr)
+
+static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
+						   struct attribute *attr,
+						   char *buf)
+{
+	struct dma_buf_attach_stats_attribute *attribute;
+	struct dma_buf_attach_sysfs_entry *sysfs_entry;
+
+	attribute =3D to_dma_buf_attach_stats_attr(attr);
+	sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
+
+	if (!attribute->show)
+		return -EIO;
+
+	return attribute->show(sysfs_entry, attribute, buf);
+}
+
+static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops =3D {
+	.show =3D dma_buf_attach_stats_attribute_show,
+};
+
+static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_e=
ntry,
+				struct dma_buf_attach_stats_attribute *attr,
+				char *buf)
+{
+	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
+}
+
+static struct dma_buf_attach_stats_attribute map_counter_attribute =3D
+	__ATTR_RO(map_counter);
+
+static struct attribute *dma_buf_attach_stats_default_attrs[] =3D {
+	&map_counter_attribute.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
+
+static void dma_buf_attach_sysfs_release(struct kobject *kobj)
+{
+	struct dma_buf_attach_sysfs_entry *sysfs_entry;
+
+	sysfs_entry =3D to_dma_buf_attach_entry_from_kobj(kobj);
+	kfree(sysfs_entry);
+}
+
+static struct kobj_type dma_buf_attach_ktype =3D {
+	.sysfs_ops =3D &dma_buf_attach_stats_sysfs_ops,
+	.release =3D dma_buf_attach_sysfs_release,
+	.default_groups =3D dma_buf_attach_stats_default_groups,
+};
+
+void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
+{
+	struct dma_buf_attach_sysfs_entry *sysfs_entry;
+
+	sysfs_entry =3D attach->sysfs_entry;
+	if (!sysfs_entry)
+		return;
+
+	sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device");
+
+	kobject_del(&sysfs_entry->kobj);
+	kobject_put(&sysfs_entry->kobj);
+}
+
+int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
+			       unsigned int uid)
+{
+	struct dma_buf_attach_sysfs_entry *sysfs_entry;
+	int ret;
+	struct dma_buf *dmabuf;
+
+	if (!attach)
+		return -EINVAL;
+
+	dmabuf =3D attach->dmabuf;
+
+	sysfs_entry =3D kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
+			      GFP_KERNEL);
+	if (!sysfs_entry)
+		return -ENOMEM;
+
+	sysfs_entry->kobj.kset =3D dmabuf->sysfs_entry->attach_stats_kset;
+
+	attach->sysfs_entry =3D sysfs_entry;
+
+	ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
+				   NULL, "%u", uid);
+	if (ret)
+		goto kobj_err;
+
+	ret =3D sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
+				"device");
+	if (ret)
+		goto link_err;
+
+	return 0;
+
+link_err:
+	kobject_del(&sysfs_entry->kobj);
+kobj_err:
+	kobject_put(&sysfs_entry->kobj);
+	attach->sysfs_entry =3D NULL;
+
+	return ret;
+}
+void dma_buf_stats_teardown(struct dma_buf *dmabuf)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+
+	sysfs_entry =3D dmabuf->sysfs_entry;
+	if (!sysfs_entry)
+		return;
+
+	kset_unregister(sysfs_entry->attach_stats_kset);
+	kobject_del(&sysfs_entry->kobj);
+	kobject_put(&sysfs_entry->kobj);
+}
+
+
+/* Statistics files do not need to send uevents. */
+static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *k=
obj)
+{
+	return 0;
+}
+
+static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
+	.filter =3D dmabuf_sysfs_uevent_filter,
+};
+
+static struct kset *dma_buf_stats_kset;
+static struct kset *dma_buf_per_buffer_stats_kset;
+int dma_buf_init_sysfs_statistics(void)
+{
+	dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
+						 &dmabuf_sysfs_no_uevent_ops,
+						 kernel_kobj);
+	if (!dma_buf_stats_kset)
+		return -ENOMEM;
+
+	dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers",
+							    &dmabuf_sysfs_no_uevent_ops,
+							    &dma_buf_stats_kset->kobj);
+	if (!dma_buf_per_buffer_stats_kset) {
+		kset_unregister(dma_buf_stats_kset);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+void dma_buf_uninit_sysfs_statistics(void)
+{
+	kset_unregister(dma_buf_per_buffer_stats_kset);
+	kset_unregister(dma_buf_stats_kset);
+}
+
+int dma_buf_stats_setup(struct dma_buf *dmabuf)
+{
+	struct dma_buf_sysfs_entry *sysfs_entry;
+	int ret;
+	struct kset *attach_stats_kset;
+
+	if (!dmabuf || !dmabuf->file)
+		return -EINVAL;
+
+	if (!dmabuf->exp_name) {
+		pr_err("exporter name must not be empty if stats needed\n");
+		return -EINVAL;
+	}
+
+	sysfs_entry =3D kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
+	if (!sysfs_entry)
+		return -ENOMEM;
+
+	sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
+	sysfs_entry->dmabuf =3D dmabuf;
+
+	dmabuf->sysfs_entry =3D sysfs_entry;
+
+	/* create the directory for buffer stats */
+	ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
+				   "%lu", file_inode(dmabuf->file)->i_ino);
+	if (ret)
+		goto err_sysfs_dmabuf;
+
+	/* create the directory for attachment stats */
+	attach_stats_kset =3D kset_create_and_add("attachments",
+						&dmabuf_sysfs_no_uevent_ops,
+						&sysfs_entry->kobj);
+	if (!attach_stats_kset) {
+		ret =3D -ENOMEM;
+		goto err_sysfs_attach;
+	}
+
+	sysfs_entry->attach_stats_kset =3D attach_stats_kset;
+
+	return 0;
+
+err_sysfs_attach:
+	kobject_del(&sysfs_entry->kobj);
+err_sysfs_dmabuf:
+	kobject_put(&sysfs_entry->kobj);
+	dmabuf->sysfs_entry =3D NULL;
+	return ret;
+}
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-bu=
f-sysfs-stats.h
new file mode 100644
index 000000000000..5f4703249117
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * DMA-BUF sysfs statistics.
+ *
+ * Copyright (C) 2021 Google LLC.
+ */
+
+#ifndef _DMA_BUF_SYSFS_STATS_H
+#define _DMA_BUF_SYSFS_STATS_H
+
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+
+int dma_buf_init_sysfs_statistics(void);
+void dma_buf_uninit_sysfs_statistics(void);
+
+int dma_buf_stats_setup(struct dma_buf *dmabuf);
+int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
+			       unsigned int uid);
+static inline void dma_buf_update_attachment_map_count(struct dma_buf_atta=
chment *attach,
+						       int delta)
+{
+	struct dma_buf_attach_sysfs_entry *entry =3D attach->sysfs_entry;
+
+	entry->map_counter +=3D delta;
+}
+void dma_buf_stats_teardown(struct dma_buf *dmabuf);
+void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
+static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabu=
f)
+{
+	struct dma_buf_sysfs_entry *entry =3D dmabuf->sysfs_entry;
+
+	return entry->attachment_uid++;
+}
+#else
+
+static inline int dma_buf_init_sysfs_statistics(void)
+{
+	return 0;
+}
+
+static inline void dma_buf_uninit_sysfs_statistics(void) {}
+
+static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
+{
+	return 0;
+}
+static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *at=
tach,
+					     unsigned int uid)
+{
+	return 0;
+}
+
+static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
+static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment=
 *attach) {}
+static inline void dma_buf_update_attachment_map_count(struct dma_buf_atta=
chment *attach,
+						       int delta) {}
+static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabu=
f)
+{
+	return 0;
+}
+#endif
+#endif // _DMA_BUF_SYSFS_STATS_H
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..184dd7acb1ed 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -29,6 +29,8 @@
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
=20
+#include "dma-buf-sysfs-stats.h"
+
 static inline int is_dma_buf_file(struct file *);
=20
 struct dma_buf_list {
@@ -79,6 +81,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
=20
+	dma_buf_stats_teardown(dmabuf);
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
@@ -580,6 +583,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_ex=
port_info *exp_info)
 	file->f_mode |=3D FMODE_LSEEK;
 	dmabuf->file =3D file;
=20
+	ret =3D dma_buf_stats_setup(dmabuf);
+	if (ret)
+		goto err_sysfs;
+
 	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
=20
@@ -589,6 +596,14 @@ struct dma_buf *dma_buf_export(const struct dma_buf_ex=
port_info *exp_info)
=20
 	return dmabuf;
=20
+err_sysfs:
+	/*
+	 * Set file->f_path.dentry->d_fsdata to NULL so that when
+	 * dma_buf_release() gets invoked by dentry_ops, it exits
+	 * early before calling the release() dma_buf op.
+	 */
+	file->f_path.dentry->d_fsdata =3D NULL;
+	fput(file);
 err_dmabuf:
 	kfree(dmabuf);
 err_module:
@@ -723,6 +738,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 {
 	struct dma_buf_attachment *attach;
 	int ret;
+	unsigned int attach_uid;
=20
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
@@ -748,8 +764,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct =
device *dev,
 	}
 	dma_resv_lock(dmabuf->resv, NULL);
 	list_add(&attach->node, &dmabuf->attachments);
+	attach_uid =3D dma_buf_update_attach_uid(dmabuf);
 	dma_resv_unlock(dmabuf->resv);
=20
+	ret =3D dma_buf_attach_stats_setup(attach, attach_uid);
+	if (ret)
+		goto err_sysfs;
+
 	/* When either the importer or the exporter can't handle dynamic
 	 * mappings we cache the mapping here to avoid issues with the
 	 * reservation object lock.
@@ -776,6 +797,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 			dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt =3D sgt;
 		attach->dir =3D DMA_BIDIRECTIONAL;
+		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
 	}
=20
 	return attach;
@@ -792,6 +814,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_unlock(attach->dmabuf->resv);
=20
+err_sysfs:
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
 }
@@ -841,6 +864,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attach)
 			dma_resv_lock(attach->dmabuf->resv, NULL);
=20
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
+		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
=20
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_buf_unpin(attach);
@@ -854,6 +878,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
=20
+	dma_buf_attach_stats_teardown(attach);
 	kfree(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_detach);
@@ -993,6 +1018,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf=
_attachment *attach,
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
=20
+	if (!IS_ERR(sg_table))
+		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
+
 	return sg_table;
 }
 EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
@@ -1030,6 +1058,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachme=
nt *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
+
+	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
=20
@@ -1480,6 +1510,12 @@ static inline void dma_buf_uninit_debugfs(void)
=20
 static int __init dma_buf_init(void)
 {
+	int ret;
+
+	ret =3D dma_buf_init_sysfs_statistics();
+	if (ret)
+		return ret;
+
 	dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
 	if (IS_ERR(dma_buf_mnt))
 		return PTR_ERR(dma_buf_mnt);
@@ -1495,5 +1531,6 @@ static void __exit dma_buf_deinit(void)
 {
 	dma_buf_uninit_debugfs();
 	kern_unmount(dma_buf_mnt);
+	dma_buf_uninit_sysfs_statistics();
 }
 __exitcall(dma_buf_deinit);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..342585bd6dff 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -295,6 +295,9 @@ struct dma_buf_ops {
  * @poll: for userspace poll support
  * @cb_excl: for userspace poll support
  * @cb_shared: for userspace poll support
+ * @sysfs_entry: for exposing information about this buffer in sysfs.
+ * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
+ * and is incremented on each attach.
  *
  * This represents a shared buffer, created by calling dma_buf_export(). T=
he
  * userspace representation is a normal file descriptor, which can be crea=
ted by
@@ -330,6 +333,15 @@ struct dma_buf {
=20
 		__poll_t active;
 	} cb_excl, cb_shared;
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+	/* for sysfs stats */
+	struct dma_buf_sysfs_entry {
+		struct kobject kobj;
+		struct dma_buf *dmabuf;
+		unsigned int attachment_uid;
+		struct kset *attach_stats_kset;
+	} *sysfs_entry;
+#endif
 };
=20
 /**
@@ -379,6 +391,7 @@ struct dma_buf_attach_ops {
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock he=
ld.
  * @importer_priv: importer specific attachment data.
+ * @sysfs_entry: For exposing information about this attachment in sysfs.
  *
  * This structure holds the attachment information between the dma_buf buf=
fer
  * and its user device(s). The list contains one attachment struct per dev=
ice
@@ -399,6 +412,13 @@ struct dma_buf_attachment {
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
+#ifdef CONFIG_DMABUF_SYSFS_STATS
+	/* for sysfs stats */
+	struct dma_buf_attach_sysfs_entry {
+		struct kobject kobj;
+		unsigned int map_counter;
+	} *sysfs_entry;
+#endif
 };
=20
 /**
--=20
2.32.0.rc0.204.g9fa02ecfa5-goog


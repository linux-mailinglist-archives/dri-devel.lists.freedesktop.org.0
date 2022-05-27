Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C64535A7E
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 09:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF23F10E3B8;
	Fri, 27 May 2022 07:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0CC10E3B8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 07:34:40 +0000 (UTC)
Date: Fri, 27 May 2022 07:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653636878; x=1653896078;
 bh=iCmZqK0pcyNJm14TV+DQNW8NAUAYmurmAxGBQzhleks=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=Kvx1sKbPuEZuuSaXVn/97qdSOKztn/sxu/vpSM4EVgmKzHQqJA7vHwaHTvVwzs7iU
 3fjL8EGk03xMc+tazDC4Sv2APm+SAAF/5yQo2S1MNtVj9IuAb0l72GedQMiKPjkSR7
 ZjDnCulAIWHwcn55LnoFuF+wTyVX5uQn1V+mtzRQeU3A0psUHUfOuVArXy9Ys44Hhl
 JeSP4bMQVHHUt2wvMdOdN+pW6XQ2wf7ur79Zb2aG3nBZDX0sV3DJKKaENqKnsx+bGP
 znyKB3g7quiEs2On7EiK7Qv1aXwNzWqiM2x7VqBpVWDUTa1YNBJ0v3yJK0a/rFekkx
 Al/vMyPKuxniw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <20220527073422.367910-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>, Greg KH <greg@kroah.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To discover support for new DMA-BUF IOCTLs, user-space has no
choice but to try to perform the IOCTL on an existing DMA-BUF.
However, user-space may want to figure out whether or not the
IOCTL is available before it has a DMA-BUF at hand, e.g. at
initialization time in a Wayland compositor.

Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
subsystem to advertise supported features. Add a
sync_file_import_export entry which indicates that importing and
exporting sync_files from/to DMA-BUFs is supported.

v2: Add missing files lost in a rebase

v3:
- Create separate file in Documentation/ABI/testing/, add it to
  MAINTAINERS
- Fix kernel version (Daniel)
- Remove unnecessary brackets (Jason)
- Fix SPDX comment style

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Greg KH <greg@kroah.com>
---
 .../ABI/testing/sysfs-kernel-dmabuf-caps      | 13 +++++
 MAINTAINERS                                   |  1 +
 drivers/dma-buf/Makefile                      |  2 +-
 drivers/dma-buf/dma-buf-sysfs-caps.c          | 51 +++++++++++++++++++
 drivers/dma-buf/dma-buf-sysfs-caps.h          | 16 ++++++
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 16 ++----
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  6 ++-
 drivers/dma-buf/dma-buf.c                     | 43 ++++++++++++++--
 include/uapi/linux/dma-buf.h                  |  6 +++
 9 files changed, 134 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c
 create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h

diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps b/Documenta=
tion/ABI/testing/sysfs-kernel-dmabuf-caps
new file mode 100644
index 000000000000..f83af422fd18
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
@@ -0,0 +1,13 @@
+What:=09=09/sys/kernel/dmabuf/caps
+Date:=09=09May 2022
+KernelVersion:=09v5.20
+Contact:=09Simon Ser <contact@emersion.fr>
+Description:=09This directory advertises DMA-BUF capabilities supported by=
 the
+=09=09kernel.
+
+What:=09=09/sys/kernel/dmabuf/caps/sync_file_import_export
+Date:=09=09May 2022
+KernelVersion:=09v5.20
+Contact:=09Simon Ser <contact@emersion.fr>
+Description:=09This file is read-only and advertises support for importing=
 and
+=09=09exporting sync_files from/to DMA-BUFs.
diff --git a/MAINTAINERS b/MAINTAINERS
index 11da16bfa123..8966686f7231 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5871,6 +5871,7 @@ L:=09dri-devel@lists.freedesktop.org
 L:=09linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 S:=09Maintained
 T:=09git git://anongit.freedesktop.org/drm/drm-misc
+F:=09Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
 F:=09Documentation/driver-api/dma-buf.rst
 F:=09drivers/dma-buf/
 F:=09include/linux/*fence.h
diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 4c9eb53ba3f8..afc874272710 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y :=3D dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-=09 dma-resv.o
+=09 dma-resv.o dma-buf-sysfs-caps.o
 obj-$(CONFIG_DMABUF_HEAPS)=09+=3D dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)=09+=3D heaps/
 obj-$(CONFIG_SYNC_FILE)=09=09+=3D sync_file.o
diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c b/drivers/dma-buf/dma-buf=
-sysfs-caps.c
new file mode 100644
index 000000000000..82b91eb874a9
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-caps.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DMA-BUF sysfs capabilities.
+ *
+ * Copyright (C) 2022 Simon Ser
+ */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "dma-buf-sysfs-caps.h"
+
+static ssize_t sync_file_import_export_show(struct kobject *kobj,
+=09=09=09=09=09    struct kobj_attribute *attr,
+=09=09=09=09=09    char *buf)
+{
+=09return sysfs_emit(buf, "1\n");
+}
+
+static struct kobj_attribute dma_buf_sync_file_import_export_attr =3D
+=09__ATTR_RO(sync_file_import_export);
+
+static struct attribute *dma_buf_caps_attrs[] =3D {
+=09&dma_buf_sync_file_import_export_attr.attr,
+=09NULL,
+};
+
+static const struct attribute_group dma_buf_caps_attr_group =3D {
+=09.attrs =3D dma_buf_caps_attrs,
+};
+
+static struct kobject *dma_buf_caps_kobj;
+
+int dma_buf_init_sysfs_capabilities(struct kset *kset)
+{
+=09int ret;
+
+=09dma_buf_caps_kobj =3D kobject_create_and_add("caps", &kset->kobj);
+=09if (!dma_buf_caps_kobj)
+=09=09return -ENOMEM;
+
+=09ret =3D sysfs_create_group(dma_buf_caps_kobj, &dma_buf_caps_attr_group)=
;
+=09if (ret)
+=09=09kobject_put(dma_buf_caps_kobj);
+=09return ret;
+}
+
+void dma_buf_uninit_sysfs_capabilities(void)
+{
+=09kobject_put(dma_buf_caps_kobj);
+}
diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.h b/drivers/dma-buf/dma-buf=
-sysfs-caps.h
new file mode 100644
index 000000000000..d7bcef490b31
--- /dev/null
+++ b/drivers/dma-buf/dma-buf-sysfs-caps.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * DMA-BUF sysfs capabilities.
+ *
+ * Copyright (C) 2022 Simon Ser
+ */
+
+#ifndef _DMA_BUF_SYSFS_CAPS_H
+#define _DMA_BUF_SYSFS_CAPS_H
+
+struct kset;
+
+int dma_buf_init_sysfs_capabilities(struct kset *kset);
+void dma_buf_uninit_sysfs_capabilities(void);
+
+#endif // _DMA_BUF_SYSFS_CAPS_H
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-bu=
f-sysfs-stats.c
index 2bba0babcb62..e2e62f83ce18 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -141,23 +141,14 @@ static const struct kset_uevent_ops dmabuf_sysfs_no_u=
event_ops =3D {
 =09.filter =3D dmabuf_sysfs_uevent_filter,
 };
=20
-static struct kset *dma_buf_stats_kset;
 static struct kset *dma_buf_per_buffer_stats_kset;
-int dma_buf_init_sysfs_statistics(void)
+int dma_buf_init_sysfs_statistics(struct kset *kset)
 {
-=09dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
-=09=09=09=09=09=09 &dmabuf_sysfs_no_uevent_ops,
-=09=09=09=09=09=09 kernel_kobj);
-=09if (!dma_buf_stats_kset)
-=09=09return -ENOMEM;
-
 =09dma_buf_per_buffer_stats_kset =3D kset_create_and_add("buffers",
 =09=09=09=09=09=09=09    &dmabuf_sysfs_no_uevent_ops,
-=09=09=09=09=09=09=09    &dma_buf_stats_kset->kobj);
-=09if (!dma_buf_per_buffer_stats_kset) {
-=09=09kset_unregister(dma_buf_stats_kset);
+=09=09=09=09=09=09=09    &kset->kobj);
+=09if (!dma_buf_per_buffer_stats_kset)
 =09=09return -ENOMEM;
-=09}
=20
 =09return 0;
 }
@@ -165,7 +156,6 @@ int dma_buf_init_sysfs_statistics(void)
 void dma_buf_uninit_sysfs_statistics(void)
 {
 =09kset_unregister(dma_buf_per_buffer_stats_kset);
-=09kset_unregister(dma_buf_stats_kset);
 }
=20
 int dma_buf_stats_setup(struct dma_buf *dmabuf)
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-bu=
f-sysfs-stats.h
index a49c6e2650cc..798c54fb8ee3 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -8,9 +8,11 @@
 #ifndef _DMA_BUF_SYSFS_STATS_H
 #define _DMA_BUF_SYSFS_STATS_H
=20
+struct kset;
+
 #ifdef CONFIG_DMABUF_SYSFS_STATS
=20
-int dma_buf_init_sysfs_statistics(void);
+int dma_buf_init_sysfs_statistics(struct kset *kset);
 void dma_buf_uninit_sysfs_statistics(void);
=20
 int dma_buf_stats_setup(struct dma_buf *dmabuf);
@@ -18,7 +20,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf);
 void dma_buf_stats_teardown(struct dma_buf *dmabuf);
 #else
=20
-static inline int dma_buf_init_sysfs_statistics(void)
+static inline int dma_buf_init_sysfs_statistics(struct kset *kset)
 {
 =09return 0;
 }
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5e1b0534b3ce..b5c5a5050508 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -30,6 +30,7 @@
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
=20
+#include "dma-buf-sysfs-caps.h"
 #include "dma-buf-sysfs-stats.h"
=20
 static inline int is_dma_buf_file(struct file *);
@@ -1546,22 +1547,54 @@ static inline void dma_buf_uninit_debugfs(void)
 }
 #endif
=20
+/* Capabilities and statistics files do not need to send uevents. */
+static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
+{
+=09return 0;
+}
+
+static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =3D {
+=09.filter =3D dmabuf_sysfs_uevent_filter,
+};
+
+static struct kset *dma_buf_kset;
+
 static int __init dma_buf_init(void)
 {
 =09int ret;
=20
-=09ret =3D dma_buf_init_sysfs_statistics();
+=09dma_buf_kset =3D kset_create_and_add("dmabuf",
+=09=09=09=09=09   &dmabuf_sysfs_no_uevent_ops,
+=09=09=09=09=09   kernel_kobj);
+=09if (!dma_buf_kset)
+=09=09return -ENOMEM;
+
+=09ret =3D dma_buf_init_sysfs_capabilities(dma_buf_kset);
 =09if (ret)
-=09=09return ret;
+=09=09goto err_kset;
+
+=09ret =3D dma_buf_init_sysfs_statistics(dma_buf_kset);
+=09if (ret)
+=09=09goto err_sysfs_caps;
=20
 =09dma_buf_mnt =3D kern_mount(&dma_buf_fs_type);
-=09if (IS_ERR(dma_buf_mnt))
-=09=09return PTR_ERR(dma_buf_mnt);
+=09if (IS_ERR(dma_buf_mnt)) {
+=09=09ret =3D PTR_ERR(dma_buf_mnt);
+=09=09goto err_sysfs_stats;
+=09}
=20
 =09mutex_init(&db_list.lock);
 =09INIT_LIST_HEAD(&db_list.head);
 =09dma_buf_init_debugfs();
 =09return 0;
+
+err_sysfs_stats:
+=09dma_buf_uninit_sysfs_statistics();
+err_sysfs_caps:
+=09dma_buf_uninit_sysfs_capabilities();
+err_kset:
+=09kset_unregister(dma_buf_kset);
+=09return ret;
 }
 subsys_initcall(dma_buf_init);
=20
@@ -1570,5 +1603,7 @@ static void __exit dma_buf_deinit(void)
 =09dma_buf_uninit_debugfs();
 =09kern_unmount(dma_buf_mnt);
 =09dma_buf_uninit_sysfs_statistics();
+=09dma_buf_uninit_sysfs_capabilities();
+=09kset_unregister(dma_buf_kset);
 }
 __exitcall(dma_buf_deinit);
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 70e213a0d7d9..ab3afd5da75a 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -114,6 +114,9 @@ struct dma_buf_sync {
  * ordering via these fences, it is the respnosibility of userspace to use
  * locks or other mechanisms to ensure that no other context adds fences o=
r
  * submits work between steps 1 and 3 above.
+ *
+ * Userspace can check the availability of this API via
+ * /sys/kernel/dmabuf/caps/sync_file_import_export.
  */
 struct dma_buf_export_sync_file {
 =09/**
@@ -146,6 +149,9 @@ struct dma_buf_export_sync_file {
  * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
  * which expect implicit synchronization such as OpenGL or most media
  * drivers/video.
+ *
+ * Userspace can check the availability of this API via
+ * /sys/kernel/dmabuf/caps/sync_file_import_export.
  */
 struct dma_buf_import_sync_file {
 =09/**
--=20
2.36.1



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17172E0B2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BE10E394;
	Tue, 13 Jun 2023 11:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7710E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD58C1FDAE;
 Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjQ0WZPdIw3WWFfN2RUGJfJXUodE1BMieiwQSz+bnM8=;
 b=QVFuBYIdNXyiUvUemFqtDdPYbPvEZHWw+StdMd6gHSnwAq4AgWPJUQUSb+NvimWCU549JP
 BvYbAhSnQ21BPvWw2lsUCzUff2DnvTgg6PY26zzSBEZNXRNbg4DEK5SyvoHyaIJKilpeCf
 76OhAZ1vgE3MSZqNJavWilfHYR4HU18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjQ0WZPdIw3WWFfN2RUGJfJXUodE1BMieiwQSz+bnM8=;
 b=plfXBF+U/X2CU7hRpXgq1LPJz78Cf4Z479NDIlFRZwP34I0+P8+8oD/HNybb77DkAcDUeq
 0lAuhAOQ6OIF5JDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6676013A88;
 Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oFM1GI9OiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 35/38] fbdev/core: Move procfs code to separate file
Date: Tue, 13 Jun 2023 13:07:10 +0200
Message-ID: <20230613110953.24176-36-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move fbdev's procfs code into a separate file and contain it in
init and cleanup helpers. For the cleanup, replace remove_proc_entry()
with proc_remove(). It is equivalent in functionality, but looks
more like an inverse of proc_create_seq().

v2:
	* document proc_remove() usage (Sam)
	* revert unrelated removal of for_each_registered_fb()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/Makefile      |  1 +
 drivers/video/fbdev/core/fb_internal.h | 12 ++++-
 drivers/video/fbdev/core/fb_procfs.c   | 62 ++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c       | 48 +++-----------------
 4 files changed, 80 insertions(+), 43 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_procfs.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index eee3295bc2252..665320160f70a 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fb_backlight.o \
                                      fb_info.o \
+                                     fb_procfs.o \
                                      fbmem.o fbmon.o fbcmap.o fbsysfs.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 0b9640ae7a3d2..51f7c9f04e45a 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -3,7 +3,17 @@
 #ifndef _FB_INTERNAL_H
 #define _FB_INTERNAL_H
 
-struct fb_info;
+#include <linux/fb.h>
+#include <linux/mutex.h>
+
+/* fbmem.c */
+extern struct mutex registration_lock;
+extern struct fb_info *registered_fb[FB_MAX];
+extern int num_registered_fb;
+
+/* fb_procfs.c */
+int fb_init_procfs(void);
+void fb_cleanup_procfs(void);
 
 /* fbsysfs.c */
 int fb_device_create(struct fb_info *fb_info);
diff --git a/drivers/video/fbdev/core/fb_procfs.c b/drivers/video/fbdev/core/fb_procfs.c
new file mode 100644
index 0000000000000..59641142f8aad
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_procfs.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/proc_fs.h>
+
+#include "fb_internal.h"
+
+static struct proc_dir_entry *fb_proc_dir_entry;
+
+static void *fb_seq_start(struct seq_file *m, loff_t *pos)
+{
+	mutex_lock(&registration_lock);
+
+	return (*pos < FB_MAX) ? pos : NULL;
+}
+
+static void fb_seq_stop(struct seq_file *m, void *v)
+{
+	mutex_unlock(&registration_lock);
+}
+
+static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	(*pos)++;
+
+	return (*pos < FB_MAX) ? pos : NULL;
+}
+
+static int fb_seq_show(struct seq_file *m, void *v)
+{
+	int i = *(loff_t *)v;
+	struct fb_info *fi = registered_fb[i];
+
+	if (fi)
+		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
+
+	return 0;
+}
+
+static const struct seq_operations __maybe_unused fb_proc_seq_ops = {
+	.start	= fb_seq_start,
+	.stop	= fb_seq_stop,
+	.next	= fb_seq_next,
+	.show	= fb_seq_show,
+};
+
+int fb_init_procfs(void)
+{
+	struct proc_dir_entry *proc;
+
+	proc = proc_create_seq("fb", 0, NULL, &fb_proc_seq_ops);
+	if (!proc)
+		return -ENOMEM;
+
+	fb_proc_dir_entry = proc;
+
+	return 0;
+}
+
+void fb_cleanup_procfs(void)
+{
+	proc_remove(fb_proc_dir_entry);
+}
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 66532774d351e..536209901e32a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -24,9 +24,7 @@
 #include <linux/vt.h>
 #include <linux/init.h>
 #include <linux/linux_logo.h>
-#include <linux/proc_fs.h>
 #include <linux/platform_device.h>
-#include <linux/seq_file.h>
 #include <linux/console.h>
 #include <linux/kmod.h>
 #include <linux/err.h>
@@ -48,8 +46,7 @@
 
 #define FBPIXMAPSIZE	(1024 * 8)
 
-static DEFINE_MUTEX(registration_lock);
-
+DEFINE_MUTEX(registration_lock);
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
 int num_registered_fb __read_mostly;
 #define for_each_registered_fb(i)		\
@@ -705,40 +702,6 @@ int fb_show_logo(struct fb_info *info, int rotate) { return 0; }
 EXPORT_SYMBOL(fb_prepare_logo);
 EXPORT_SYMBOL(fb_show_logo);
 
-static void *fb_seq_start(struct seq_file *m, loff_t *pos)
-{
-	mutex_lock(&registration_lock);
-	return (*pos < FB_MAX) ? pos : NULL;
-}
-
-static void *fb_seq_next(struct seq_file *m, void *v, loff_t *pos)
-{
-	(*pos)++;
-	return (*pos < FB_MAX) ? pos : NULL;
-}
-
-static void fb_seq_stop(struct seq_file *m, void *v)
-{
-	mutex_unlock(&registration_lock);
-}
-
-static int fb_seq_show(struct seq_file *m, void *v)
-{
-	int i = *(loff_t *)v;
-	struct fb_info *fi = registered_fb[i];
-
-	if (fi)
-		seq_printf(m, "%d %s\n", fi->node, fi->fix.id);
-	return 0;
-}
-
-static const struct seq_operations __maybe_unused proc_fb_seq_ops = {
-	.start	= fb_seq_start,
-	.next	= fb_seq_next,
-	.stop	= fb_seq_stop,
-	.show	= fb_seq_show,
-};
-
 /*
  * We hold a reference to the fb_info in file->private_data,
  * but if the current registered fb has changed, we don't
@@ -1624,8 +1587,9 @@ fbmem_init(void)
 {
 	int ret;
 
-	if (!proc_create_seq("fb", 0, NULL, &proc_fb_seq_ops))
-		return -ENOMEM;
+	ret = fb_init_procfs();
+	if (ret)
+		return ret;
 
 	ret = register_chrdev(FB_MAJOR, "fb", &fb_fops);
 	if (ret) {
@@ -1648,7 +1612,7 @@ fbmem_init(void)
 err_class:
 	unregister_chrdev(FB_MAJOR, "fb");
 err_chrdev:
-	remove_proc_entry("fb", NULL);
+	fb_cleanup_procfs();
 	return ret;
 }
 
@@ -1659,7 +1623,7 @@ fbmem_exit(void)
 {
 	fb_console_exit();
 
-	remove_proc_entry("fb", NULL);
+	fb_cleanup_procfs();
 	class_destroy(fb_class);
 	unregister_chrdev(FB_MAJOR, "fb");
 }
-- 
2.41.0


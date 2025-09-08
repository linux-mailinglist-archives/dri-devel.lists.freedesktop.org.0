Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A681B487BB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50B10E4A1;
	Mon,  8 Sep 2025 09:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fRZyswX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848D710E4B5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757322245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maQua4pP1jg8Dto/w8MesCMtmzns93M95sjmnulnRnE=;
 b=fRZyswX9zAmT/dVWs7N68A1yXKXbQJ8bMPFaSmbkuaK9QyLqID2WdTd/OhX9NQ6N2gSmAb
 x3rX3eUSnQ6oQke9rdkZJTADR4dzMnnlQ0eonxkwJLF4IR0Of1SvO3m08WLn+Ihm8amR7c
 ek4hn64aJvdMFGTQKOWG5WnySsmSQyo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-74vPeKKrN6GyMtZW-6XA9Q-1; Mon,
 08 Sep 2025 05:04:02 -0400
X-MC-Unique: 74vPeKKrN6GyMtZW-6XA9Q-1
X-Mimecast-MFC-AGG-ID: 74vPeKKrN6GyMtZW-6XA9Q_1757322241
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6E90180057E; Mon,  8 Sep 2025 09:04:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.69])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D882D1800452; Mon,  8 Sep 2025 09:03:57 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/panic: Add a drm_panic/draw_test in debugfs
Date: Mon,  8 Sep 2025 11:00:31 +0200
Message-ID: <20250908090341.762049-4-jfalempe@redhat.com>
In-Reply-To: <20250908090341.762049-1-jfalempe@redhat.com>
References: <20250908090341.762049-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

This adds a new drm_panic/draw_test file in debugfs.
This file allows to test the panic screen rendering at different
resolution and pixel format.
It's useful only for kernel developers that want to create or
customize a panic screen.

If you want to check the result at 1024x768 using XRGB8888:

cd /sys/kernel/debug/drm_panic/
exec 3<> draw_test
echo 1024x768:XR24 >&3
cat <&3 > ~/panic_screen.raw
exec 3<&-

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Use debugfs instead of sending the framebuffer through the kunit logs. (Thomas Zimmermann).

 drivers/gpu/drm/Kconfig     |   2 +
 drivers/gpu/drm/drm_panic.c | 117 ++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..0d3146070d9c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -83,6 +83,8 @@ config DRM_PANIC_DEBUG
 	  Add dri/[device]/drm_panic_plane_x in the kernel debugfs, to force the
 	  panic handler to write the panic message to this plane scanout buffer.
 	  This is unsafe and should not be enabled on a production build.
+	  Also adds a drm_panic/draw_test file in debugfs, to easily test the
+	  panic screen rendering.
 	  If in doubt, say "N".
 
 config DRM_PANIC_SCREEN
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d89812ff1935..0c01d6067eab 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -873,6 +873,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
  */
 #ifdef CONFIG_DRM_PANIC_DEBUG
 #include <linux/debugfs.h>
+#include <linux/vmalloc.h>
 
 static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_buf,
 				     size_t count, loff_t *ppos)
@@ -901,8 +902,122 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
 	debugfs_create_file(fname, 0200, plane->dev->debugfs_root,
 			    plane, &dbg_drm_panic_ops);
 }
+
+/*
+ * Draw test interface
+ * This can be used to check the panic screen at any resolution/pixel format.
+ * The framebuffer memory is freed when the file is closed, so use this sh
+ * script to write the parameters and read the result without closing the file.
+ * cd /sys/kernel/debug/drm_panic/
+ * exec 3<> draw_test
+ * echo 1024x768:XR24 >&3
+ * cat <&3 > ~/panic_screen.raw
+ * exec 3<&-
+ */
+static ssize_t debugfs_drawtest_write(struct file *file, const char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct drm_scanout_buffer *sb = (struct drm_scanout_buffer *) file->private_data;
+	size_t fb_size;
+	void *fb;
+	char buf[64];
+	int width;
+	int height;
+	char cc1, cc2, cc3, cc4;
+	u32 drm_format;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	if (sscanf(buf, "%dx%d:%c%c%c%c", &width, &height, &cc1, &cc2, &cc3, &cc4) != 6) {
+		pr_err("Invalid format. Expected: <width>x<height>:<fourcc>\n");
+		return -EINVAL;
+	}
+
+	drm_format = fourcc_code(cc1, cc2, cc3, cc4);
+	sb->format = drm_format_info(drm_format);
+	if (!sb->format)
+		return -EINVAL;
+
+	drm_panic_set_description("Test drawing from debugfs");
+
+	sb->width = width;
+	sb->height = height;
+	sb->pitch[0] = width * sb->format->cpp[0];
+
+	if (sb->map[0].vaddr)
+		vfree(sb->map[0].vaddr);
+
+	fb_size = height * sb->pitch[0];
+	fb = vmalloc(fb_size);
+	iosys_map_set_vaddr(&sb->map[0], fb);
+
+	draw_panic_dispatch(sb);
+
+	drm_panic_clear_description();
+	return count;
+}
+
+static ssize_t debugfs_drawtest_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct drm_scanout_buffer *sb = (struct drm_scanout_buffer *) file->private_data;
+	int fb_size = sb->height * sb->pitch[0];
+
+	if (!sb->map[0].vaddr)
+		return 0;
+	return simple_read_from_buffer(user_buf, count, ppos, sb->map[0].vaddr, fb_size);
+}
+
+static int debugfs_drawtest_open(struct inode *inode, struct file *file)
+{
+	struct drm_scanout_buffer *sb = kzalloc(sizeof(*sb), GFP_KERNEL);
+
+	if (!sb)
+		return -ENOMEM;
+
+	file->private_data = sb;
+	return 0;
+}
+
+static int debugfs_drawtest_release(struct inode *inode, struct file *file)
+{
+	struct drm_scanout_buffer *sb = (struct drm_scanout_buffer *) file->private_data;
+
+	vfree(sb->map[0].vaddr);
+	kfree(sb);
+	return 0;
+}
+
+static const struct file_operations dbg_drm_panic_test_ops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_drawtest_write,
+	.read = debugfs_drawtest_read,
+	.open = debugfs_drawtest_open,
+	.release = debugfs_drawtest_release,
+};
+
+static struct dentry *drm_panic_debugfs_dir;
+
+static void debugfs_register_drawtest(void)
+{
+	drm_panic_debugfs_dir = debugfs_create_dir("drm_panic", NULL);
+	debugfs_create_file("draw_test", 0600, drm_panic_debugfs_dir,
+			    NULL, &dbg_drm_panic_test_ops);
+}
+
+static void debugfs_unregister_drawtest(void)
+{
+	debugfs_remove(drm_panic_debugfs_dir);
+}
+
 #else
 static void debugfs_register_plane(struct drm_plane *plane, int index) {}
+static void debugfs_register_drawtest(void) {}
+static void debugfs_unregister_drawtest(void) {}
 #endif /* CONFIG_DRM_PANIC_DEBUG */
 
 /**
@@ -977,6 +1092,7 @@ void drm_panic_unregister(struct drm_device *dev)
 void __init drm_panic_init(void)
 {
 	drm_panic_qr_init();
+	debugfs_register_drawtest();
 }
 
 /**
@@ -985,6 +1101,7 @@ void __init drm_panic_init(void)
 void drm_panic_exit(void)
 {
 	drm_panic_qr_exit();
+	debugfs_unregister_drawtest();
 }
 
 #ifdef CONFIG_DRM_KUNIT_TEST
-- 
2.51.0


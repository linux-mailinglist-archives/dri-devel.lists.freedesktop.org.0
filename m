Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D021688FEA0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39BA1123F8;
	Thu, 28 Mar 2024 12:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YHQP5ifG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298581123F8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711627629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQzdTyaacEakvFyxpBgGsp5p3UOMsEHrrD4xrr8rggk=;
 b=YHQP5ifGwGEQYC8jxT8drvqhz8Q4EKFNpgwYtnO4dYdw0rt4OA9BYpMFMTImKJsFujEFdv
 ed2v9OI0Pe5kc7JXLgCUkXyl2wI7z3qUkpxgjS0MH53PFBDx/podgQRDbmekjYcjOa1w37
 UFbETp3zLjCQRm2oA9D3adXtzYFrVWY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-Rl6w6txIP22XsteTgbrSmw-1; Thu,
 28 Mar 2024 08:07:05 -0400
X-MC-Unique: Rl6w6txIP22XsteTgbrSmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 498592800491;
 Thu, 28 Mar 2024 12:07:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AD422022EA7;
 Thu, 28 Mar 2024 12:07:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 4/9] drm/panic: Add debugfs entry to test without
 triggering panic.
Date: Thu, 28 Mar 2024 13:03:46 +0100
Message-ID: <20240328120638.468738-5-jfalempe@redhat.com>
In-Reply-To: <20240328120638.468738-1-jfalempe@redhat.com>
References: <20240328120638.468738-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Add a debugfs file, so you can test drm_panic without freezing
your machine. This is unsafe, and should be enabled only for
developer or tester.

To display the drm_panic screen on the device 0:
echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

v9:
 * Create a debugfs file for each plane in the device's debugfs
   directory. This allows to test for each plane of each GPU
   independently.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  9 ++++++++
 drivers/gpu/drm/drm_panic.c | 43 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f07ca38d3f98..6e41fbd16b3d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -125,6 +125,15 @@ config DRM_PANIC_BACKGROUND_COLOR
 	depends on DRM_PANIC
 	default 0x000000
 
+config DRM_PANIC_DEBUG
+	bool "Add a debug fs entry to trigger drm_panic"
+	depends on DRM_PANIC && DEBUG_FS
+	help
+	  Add dri/[device]/drm_panic_plane_x in the kernel debugfs, to force the
+	  panic handler to write the panic message to this plane scanout buffer.
+	  This is unsafe and should not be enabled on a production build.
+	  If in doubt, say "N".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 7761779a884b..b75e90da7f39 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -493,6 +493,45 @@ static void drm_panic(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
 		draw_panic_plane(plane);
 }
 
+
+/*
+ * DEBUG FS, This is currently unsafe.
+ * Create one file per plane, so it's possible to debug one plane at a time.
+ */
+#ifdef CONFIG_DRM_PANIC_DEBUG
+#include <linux/debugfs.h>
+
+static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	bool run;
+
+	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
+		struct drm_plane *plane = file->private_data;
+
+		draw_panic_plane(plane);
+	}
+	return count;
+}
+
+static const struct file_operations dbg_drm_panic_ops = {
+	.owner = THIS_MODULE,
+	.write = debugfs_trigger_write,
+	.open = simple_open,
+};
+
+static void debugfs_register_plane(struct drm_plane *plane, int index)
+{
+	char fname[32];
+
+	snprintf(fname, 32, "drm_panic_plane_%d", index);
+	debugfs_create_file(fname, 0200, plane->dev->debugfs_root,
+			    plane, &dbg_drm_panic_ops);
+}
+#else
+static void debugfs_register_plane(struct drm_plane *plane, int index) {}
+#endif /* CONFIG_DRM_PANIC_DEBUG */
+
 /**
  * drm_panic_register() - Initialize DRM panic for a device
  * @dev: the drm device on which the panic screen will be displayed.
@@ -512,8 +551,10 @@ void drm_panic_register(struct drm_device *dev)
 		plane->kmsg_panic.max_reason = KMSG_DUMP_PANIC;
 		if (kmsg_dump_register(&plane->kmsg_panic))
 			drm_warn(dev, "Failed to register panic handler\n");
-		else
+		else {
+			debugfs_register_plane(plane, registered_plane);
 			registered_plane++;
+		}
 	}
 	if (registered_plane)
 		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
-- 
2.44.0


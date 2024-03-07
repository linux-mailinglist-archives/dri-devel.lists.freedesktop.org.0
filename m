Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB16874A9C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4247E10F87A;
	Thu,  7 Mar 2024 09:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DoXcK4kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CCC10F343
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709803197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aBa/+YA23cQgxphWuT0VZmntKNwpaK//TfDagkQyAg=;
 b=DoXcK4kh0tpy3mRKf3ZkDXlAb8bPWrOLSOA6glQFayHzOFtB8MNgYaff3JtS83moAp6e69
 7VuVB94dzolHSdsL5WDdiNAEnmVlqL339ahfrOCMTgeQrbNW6FBbXQDmVy3B/e+3F6vU/5
 Ets2jecQcV0/YerxV/h2VDZomr60Kxk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-q0XSLdZONs-ZYuI2pQwVhg-1; Thu,
 07 Mar 2024 04:19:53 -0500
X-MC-Unique: q0XSLdZONs-ZYuI2pQwVhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F2E31C5402B;
 Thu,  7 Mar 2024 09:19:53 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43C63111DCF3;
 Thu,  7 Mar 2024 09:19:51 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 4/9] drm/panic: Add debugfs entry to test without
 triggering panic.
Date: Thu,  7 Mar 2024 10:14:46 +0100
Message-ID: <20240307091936.576689-5-jfalempe@redhat.com>
In-Reply-To: <20240307091936.576689-1-jfalempe@redhat.com>
References: <20240307091936.576689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
 drivers/gpu/drm/Kconfig     |  9 +++++++++
 drivers/gpu/drm/drm_panic.c | 38 +++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

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
index 2e2a033d1267..24dc1f1a388f 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -270,6 +270,43 @@ static int drm_panic(struct notifier_block *this, unsigned long event,
 	return NOTIFY_OK;
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
+				   size_t count, loff_t *ppos)
+{
+	bool run;
+
+	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
+		struct drm_plane *plane = file->private_data;
+
+		draw_panic_plane(plane, "Test from debugfs");
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
+#endif /* CONFIG_DRM_PANIC_DEBUG */
+
 /**
  * drm_panic_register() - Initialize DRM panic for a device
  * @dev: the drm device on which the panic screen will be displayed.
@@ -291,6 +328,7 @@ void drm_panic_register(struct drm_device *dev)
 						   &plane->panic_notifier)) {
 			drm_warn(dev, "Failed to register panic handler\n");
 		} else {
+			debugfs_register_plane(plane, registered_plane);
 			registered_plane++;
 		}
 	}
-- 
2.43.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FD868CE9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9410F2CD;
	Tue, 27 Feb 2024 10:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EM2nsMId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC610EEA7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hITNByNTq1P+Xj+RWDty/BpmbZyxmLWXBzUpGFGpVts=;
 b=EM2nsMIdiY6EWXzwmyA3W+zHkGnbHFAzdiD+/k9yTNL6eQGwSVyw+QDuDKKAqhJwwPnKm/
 pxOimNOacSMiMw3RGhltUGskDtIlPqZAYkbUHc9NjSwksi0u/4mHNygWprFoiWczpFKLER
 GdziYlkVNb1wBwARAD9LWsbtHu2YV5A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-pnrCuvx-N2uOGBGVkcvF3w-1; Tue,
 27 Feb 2024 05:05:34 -0500
X-MC-Unique: pnrCuvx-N2uOGBGVkcvF3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE1929ABA11;
 Tue, 27 Feb 2024 10:05:33 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3FE139CAC;
 Tue, 27 Feb 2024 10:05:31 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 3/8] drm/panic: Add debugfs entry to test without
 triggering panic.
Date: Tue, 27 Feb 2024 11:04:14 +0100
Message-ID: <20240227100459.194478-4-jfalempe@redhat.com>
In-Reply-To: <20240227100459.194478-1-jfalempe@redhat.com>
References: <20240227100459.194478-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

to display the drm_panic screen, just run:
echo 1 > /sys/kernel/debug/drm_panic/trigger

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  9 +++++++
 drivers/gpu/drm/drm_panic.c | 47 +++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c17d8a8f6877..8dcea29f595c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -125,6 +125,15 @@ config DRM_PANIC_BACKGROUND_COLOR
 	depends on DRM_PANIC
 	default 0x000000
 
+config DRM_PANIC_DEBUG
+	bool "Add a debug fs entry to trigger drm_panic"
+	depends on DRM_PANIC && DEBUG_FS
+	help
+	  Add drm_panic/trigger in the kernel debugfs, to force the panic
+	  handler to write the panic message to the scanout buffer. This is
+	  unsafe and should not be enabled on a production build.
+	  If in doubt, say "N".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index c9f386476ef9..c5d3f725c5f5 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -398,3 +398,50 @@ void drm_panic_unregister(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_panic_unregister);
 
+
+/*
+ * DEBUG, This is currently unsafe.
+ * Also it will call all panic_notifier, since there is no way to filter and
+ * only call the drm_panic notifier.
+ */
+#ifdef CONFIG_DRM_PANIC_DEBUG
+#include <linux/debugfs.h>
+
+static struct dentry *debug_dir;
+static struct dentry *debug_trigger;
+
+static ssize_t dbgfs_trigger_write(struct file *file, const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	bool run;
+
+	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run)
+		atomic_notifier_call_chain(&panic_notifier_list, 0, "Test drm panic from debugfs");
+	return count;
+}
+
+static const struct file_operations dbg_drm_panic_ops = {
+	.owner = THIS_MODULE,
+	.write = dbgfs_trigger_write,
+};
+
+static int __init debugfs_start(void)
+{
+	debug_dir = debugfs_create_dir("drm_panic", NULL);
+
+	if (IS_ERR(debug_dir))
+		return PTR_ERR(debug_dir);
+	debug_trigger = debugfs_create_file("trigger", 0200, debug_dir,
+					    NULL, &dbg_drm_panic_ops);
+	return 0;
+}
+
+static void __exit debugfs_end(void)
+{
+	debugfs_remove_recursive(debug_dir);
+}
+
+module_init(debugfs_start);
+module_exit(debugfs_end);
+
+#endif
-- 
2.43.0


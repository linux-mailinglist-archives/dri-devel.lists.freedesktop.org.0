Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4239965AB3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DD310E872;
	Fri, 30 Aug 2024 08:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C2810E861;
 Fri, 30 Aug 2024 08:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BFA721A20;
 Fri, 30 Aug 2024 08:45:00 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 170AD13A3D;
 Fri, 30 Aug 2024 08:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yNleBIyG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 04/81] drm: Add client-agnostic setup helper
Date: Fri, 30 Aug 2024 10:39:48 +0200
Message-ID: <20240830084456.77630-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[renesas]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6BFA721A20
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

DRM may support multiple in-kernel clients that run as soon as a DRM
driver has been registered. To select the client(s) in a single place,
introduce drm_client_setup().

Drivers that call the new helper automatically instantiate the kernel's
configured default clients. Only fbdev emulation is currently supported.
Later versions can add support for DRM-based logging, a boot logo or even
a console.

Some drivers handle the color mode for clients internally. Provide the
helper drm_client_setup_with_color_mode() for them.

v3:
- fix build error
v2:
- add drm_client_setup_with_fourcc() (Laurent)
- push default-format handling into actual clients

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/Makefile           |  1 +
 drivers/gpu/drm/drm_client_setup.c | 69 ++++++++++++++++++++++++++++++
 include/drm/drm_client_setup.h     | 15 +++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_client_setup.c
 create mode 100644 include/drm/drm_client_setup.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0beb55d028a8..e7fc77d1d573 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -129,6 +129,7 @@ drm_kms_helper-y := \
 	drm_atomic_helper.o \
 	drm_atomic_state_helper.o \
 	drm_bridge_connector.o \
+	drm_client_setup.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
 	drm_encoder_slave.o \
diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
new file mode 100644
index 000000000000..5373a892f097
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_client_setup.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fbdev_client.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+
+/**
+ * drm_client_setup() - Setup in-kernel DRM clients
+ * @dev: DRM device
+ * @format: Preferred pixel format for the device. Use NULL, unless
+ *          there is clearly a driver-preferred format.
+ *
+ * This function sets up the in-kernel DRM clients. Restore, hotplug
+ * events and teardown are all taken care of.
+ *
+ * Drivers should call drm_client_setup() after registering the new
+ * DRM device with drm_dev_register(). This function is safe to call
+ * even when there are no connectors present. Setup will be retried
+ * on the next hotplug event.
+ *
+ * The clients are destroyed by drm_dev_unregister().
+ */
+void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
+{
+	int ret;
+
+	ret = drm_fbdev_client_setup(dev, format);
+	if (ret)
+		drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
+}
+EXPORT_SYMBOL(drm_client_setup);
+
+/**
+ * drm_client_setup_with_fourcc() - Setup in-kernel DRM clients for color mode
+ * @dev: DRM device
+ * @fourcc: Preferred pixel format as 4CC code for the device
+ *
+ * This function sets up the in-kernel DRM clients. It is equivalent
+ * to drm_client_setup(), but expects a 4CC code as second argument.
+ *
+ * Do not use this function in new drivers. Prefer drm_client_setup() with a
+ * format of NULL.
+ */
+void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
+{
+	drm_client_setup(dev, drm_format_info(fourcc));
+}
+EXPORT_SYMBOL(drm_client_setup_with_fourcc);
+
+/**
+ * drm_client_setup_with_color_mode() - Setup in-kernel DRM clients for color mode
+ * @dev: DRM device
+ * @color_mode: Preferred color mode for the device
+ *
+ * This function sets up the in-kernel DRM clients. It is equivalent
+ * to drm_client_setup(), but expects a color mode as second argument.
+ *
+ * Do not use this function in new drivers. Prefer drm_client_setup() with a
+ * format of NULL.
+ */
+void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
+{
+	u32 fourcc = drm_driver_color_mode_format(dev, color_mode);
+
+	drm_client_setup_with_fourcc(dev, fourcc);
+}
+EXPORT_SYMBOL(drm_client_setup_with_color_mode);
diff --git a/include/drm/drm_client_setup.h b/include/drm/drm_client_setup.h
new file mode 100644
index 000000000000..6c0396b4f815
--- /dev/null
+++ b/include/drm/drm_client_setup.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_CLIENT_SETUP_H
+#define DRM_CLIENT_SETUP_H
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_format_info;
+
+void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format);
+void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc);
+void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
+
+#endif
-- 
2.46.0


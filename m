Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FE983DCA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEE910E503;
	Tue, 24 Sep 2024 07:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dh1cTHrW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1mLbMfyr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dh1cTHrW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1mLbMfyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2C910E4E7;
 Tue, 24 Sep 2024 07:17:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25F3421B99;
 Tue, 24 Sep 2024 07:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4c1/SvsGAqsbgl55uLit/SES8ISi5+huvbJ5p0MEk=;
 b=dh1cTHrWZ8ziXtkx26JVupOrVWH7TjFgCqhRU/EplV+21v3nxBBgphYi3gR7lSDrlV0NR7
 dbQkbZoTp+f3s2+/r1oZE7lOR/CYG/aw0d5f/6JBaqW0Kmv2KWlJHVfGHYWdMlHKdBNmWU
 8B6YyyUMs8QYNt160Ljy6JUKGgqczG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4c1/SvsGAqsbgl55uLit/SES8ISi5+huvbJ5p0MEk=;
 b=1mLbMfyrxCI18767/9900JZMRd+WaPsBOWNQBjeq4Bq7E2tZgGftZNMEh0FncColClFikw
 8BpGiHytk+579OBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4c1/SvsGAqsbgl55uLit/SES8ISi5+huvbJ5p0MEk=;
 b=dh1cTHrWZ8ziXtkx26JVupOrVWH7TjFgCqhRU/EplV+21v3nxBBgphYi3gR7lSDrlV0NR7
 dbQkbZoTp+f3s2+/r1oZE7lOR/CYG/aw0d5f/6JBaqW0Kmv2KWlJHVfGHYWdMlHKdBNmWU
 8B6YyyUMs8QYNt160Ljy6JUKGgqczG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kH4c1/SvsGAqsbgl55uLit/SES8ISi5+huvbJ5p0MEk=;
 b=1mLbMfyrxCI18767/9900JZMRd+WaPsBOWNQBjeq4Bq7E2tZgGftZNMEh0FncColClFikw
 8BpGiHytk+579OBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D57091386E;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2ATrMpNn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 04/80] drm: Add client-agnostic setup helper
Date: Tue, 24 Sep 2024 09:12:02 +0200
Message-ID: <20240924071734.98201-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[renesas]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
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

Using the new interface requires the driver to select
DRM_CLIENT_SELECTION in its Kconfig. For now this only enables the
client-setup helpers if the fbdev client has been configured by the
user. A future patchset will further modularize client support and
rework DRM_CLIENT_SELECTION to select the correct dependencies for
all its clients.

v5:
- add CONFIG_DRM_CLIENT_SELECTION und DRM_CLIENT_SETUP
v4:
- fix docs for drm_client_setup_with_fourcc() (Geert)
v3:
- fix build error
v2:
- add drm_client_setup_with_fourcc() (Laurent)
- push default-format handling into actual clients

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/Kconfig            | 12 ++++++
 drivers/gpu/drm/Makefile           |  2 +
 drivers/gpu/drm/drm_client_setup.c | 66 ++++++++++++++++++++++++++++++
 include/drm/drm_client_setup.h     | 26 ++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_client_setup.c
 create mode 100644 include/drm/drm_client_setup.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1cb5a4f19293..f045ff0e8c99 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,6 +210,18 @@ config DRM_DEBUG_MODESET_LOCK
 
 	  If in doubt, say "N".
 
+config DRM_CLIENT_SELECTION
+	bool
+	depends on DRM
+	select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
+	help
+	  Drivers that support in-kernel DRM clients have to select this
+	  option.
+
+config DRM_CLIENT_SETUP
+	bool
+	depends on DRM_CLIENT_SELECTION
+
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index d7a684ae6a59..47d66fe28367 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -143,6 +143,8 @@ drm_kms_helper-y := \
 	drm_rect.o \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
+drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) += \
+	drm_client_setup.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
 	drm_fbdev_client.o \
diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
new file mode 100644
index 000000000000..5969c4ffe31b
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -0,0 +1,66 @@
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
index 000000000000..46aab3fb46be
--- /dev/null
+++ b/include/drm/drm_client_setup.h
@@ -0,0 +1,26 @@
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
+#if defined(CONFIG_DRM_CLIENT_SETUP)
+void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format);
+void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc);
+void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
+#else
+static inline void drm_client_setup(struct drm_device *dev,
+				    const struct drm_format_info *format)
+{ }
+static inline void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
+{ }
+static inline void drm_client_setup_with_color_mode(struct drm_device *dev,
+						    unsigned int color_mode)
+{ }
+#endif
+
+#endif
-- 
2.46.0


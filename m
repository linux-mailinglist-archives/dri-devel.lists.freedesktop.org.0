Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3D954948
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB41110E5ED;
	Fri, 16 Aug 2024 12:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NdfaDQFD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ekXnV6rM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdfaDQFD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ekXnV6rM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88310E52E;
 Fri, 16 Aug 2024 12:54:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 333FB200B9;
 Fri, 16 Aug 2024 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCYUyzLYMsJXNXU4B6s8y3k9Gis8uKMLrFe8o2bk1FY=;
 b=NdfaDQFD87iK0UtbZWD9PSzAHFyin9TkcvBWLzCXovQOEtUCRX142zkLOni7J5MB4sIvGa
 ZY/bCktB2+xUtrmdDk9R0rIclYWmeWL2bmQj9X7kJkCihqTSBhX0rEdsPHo4gd7xOUREhA
 qOUXnicE0OGQa33FwKJTwfsf9yffe1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCYUyzLYMsJXNXU4B6s8y3k9Gis8uKMLrFe8o2bk1FY=;
 b=ekXnV6rM1usGAzZkTRAYh12bUD0E0Fg62j87o/HuoeKXAVonpAasOFO6LfHsgkPkVopMYf
 EVS/H7O3L5CkEMAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCYUyzLYMsJXNXU4B6s8y3k9Gis8uKMLrFe8o2bk1FY=;
 b=NdfaDQFD87iK0UtbZWD9PSzAHFyin9TkcvBWLzCXovQOEtUCRX142zkLOni7J5MB4sIvGa
 ZY/bCktB2+xUtrmdDk9R0rIclYWmeWL2bmQj9X7kJkCihqTSBhX0rEdsPHo4gd7xOUREhA
 qOUXnicE0OGQa33FwKJTwfsf9yffe1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCYUyzLYMsJXNXU4B6s8y3k9Gis8uKMLrFe8o2bk1FY=;
 b=ekXnV6rM1usGAzZkTRAYh12bUD0E0Fg62j87o/HuoeKXAVonpAasOFO6LfHsgkPkVopMYf
 EVS/H7O3L5CkEMAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E038B13AE0;
 Fri, 16 Aug 2024 12:54:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CKh+NfNLv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/86] drm: Add client-agnostic setup helper
Date: Fri, 16 Aug 2024 14:22:30 +0200
Message-ID: <20240816125408.310253-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile           |  1 +
 drivers/gpu/drm/drm_client_setup.c | 55 ++++++++++++++++++++++++++++++
 include/drm/drm_client_setup.h     | 12 +++++++
 3 files changed, 68 insertions(+)
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
index 000000000000..2e3315f5c3e2
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -0,0 +1,55 @@
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
+ * @format: Preferred color format for the device. Use NULL, unless
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
+	if (!format)
+		format = drm_format_info(DRM_FORMAT_XRGB8888);
+
+	ret = drm_fbdev_client_setup(dev, format);
+	if (ret)
+		drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
+}
+EXPORT_SYMBOL(drm_client_setup);
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
+	uint32_t fmt = drm_driver_color_mode_format(dev, color_mode);
+
+	drm_client_setup(dev, drm_format_info(fmt));
+}
+EXPORT_SYMBOL(drm_client_setup_with_color_mode);
diff --git a/include/drm/drm_client_setup.h b/include/drm/drm_client_setup.h
new file mode 100644
index 000000000000..f5fd1fabd4b1
--- /dev/null
+++ b/include/drm/drm_client_setup.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_CLIENT_SETUP_H
+#define DRM_CLIENT_SETUP_H
+
+struct drm_device;
+struct drm_format_info;
+
+void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format);
+void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
+
+#endif
-- 
2.46.0


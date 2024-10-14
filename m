Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F799C460
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D53210E403;
	Mon, 14 Oct 2024 08:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1UynDwXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3pkr9j7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1UynDwXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K3pkr9j7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78C710E3F5;
 Mon, 14 Oct 2024 08:57:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D0551F785;
 Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So4R0eqWFdOJfcoXbcuPrvthb4HW2/gyES14q94wWd0=;
 b=1UynDwXTAJo4aL1Cfy/f6Rv99w6mq1RKs0hZyEVvpc98Nw/3es+PM6LY7/U0YkOnYlhMyP
 W67XevQfq0N3LNwCrBUFzntd89/Mc/qpoKUk6Az79+mQ0P6oDkKpSc0qwbb+TB88VLCWNw
 TNJ/aCKZBq7q5RK5SxWJ4bHgjWH0zS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So4R0eqWFdOJfcoXbcuPrvthb4HW2/gyES14q94wWd0=;
 b=K3pkr9j7l9QtZr2W0jEAlUKsxOpLegyGzhOI97TR+K99X8Duqc9FGNHLatximLsuFO1Gbi
 obtiYpshII2gtEAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So4R0eqWFdOJfcoXbcuPrvthb4HW2/gyES14q94wWd0=;
 b=1UynDwXTAJo4aL1Cfy/f6Rv99w6mq1RKs0hZyEVvpc98Nw/3es+PM6LY7/U0YkOnYlhMyP
 W67XevQfq0N3LNwCrBUFzntd89/Mc/qpoKUk6Az79+mQ0P6oDkKpSc0qwbb+TB88VLCWNw
 TNJ/aCKZBq7q5RK5SxWJ4bHgjWH0zS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So4R0eqWFdOJfcoXbcuPrvthb4HW2/gyES14q94wWd0=;
 b=K3pkr9j7l9QtZr2W0jEAlUKsxOpLegyGzhOI97TR+K99X8Duqc9FGNHLatximLsuFO1Gbi
 obtiYpshII2gtEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37D6C13A79;
 Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GFRQDA3dDGfXfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 08:57:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 11/12] drm/client: Make client support optional
Date: Mon, 14 Oct 2024 10:55:25 +0200
Message-ID: <20241014085740.582287-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
References: <20241014085740.582287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_TWELVE(0.00)[13]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLsz1b6kfjnxepzm54dz9rbnku)];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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

Only build client code if DRM_CLIENT has been selected. Automatially
do so if one of the default clients has been enabled. If client support
has been disabled, the helpers for client-related events are empty and
the regular client functions are not present.

Amdgpu has an internal DRM client, so it has to select DRM_CLIENT by
itself unconditionally.

v3:
- provide empty drm_client_debugfs_init() if DRM_CLIENT=n (kernel
  test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/Kconfig            | 10 ++++++++++
 drivers/gpu/drm/Makefile           |  7 ++++---
 drivers/gpu/drm/amd/amdgpu/Kconfig |  1 +
 drivers/gpu/drm/drm_client_event.c |  2 ++
 drivers/gpu/drm/drm_debugfs.c      |  1 -
 drivers/gpu/drm/drm_internal.h     |  8 ++++++++
 include/drm/drm_client.h           |  2 --
 include/drm/drm_client_event.h     | 13 +++++++++++++
 8 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 88c4837d070c..ea1cc924528c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -209,6 +209,15 @@ config DRM_DEBUG_MODESET_LOCK
 
 	  If in doubt, say "N".
 
+config DRM_CLIENT
+	bool
+	depends on DRM
+	help
+	  Enables support for DRM clients. DRM drivers that need
+	  struct drm_client_dev and its interfaces should select this
+	  option. Drivers that support the default clients should
+	  select DRM_CLIENT_SELECTION instead.
+
 config DRM_CLIENT_SELECTION
 	bool
 	depends on DRM
@@ -224,6 +233,7 @@ config DRM_CLIENT_SETUP
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
+	select DRM_CLIENT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default FB
 	help
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6b7d168ca790..c3e5d353588e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -41,9 +41,6 @@ drm-y := \
 	drm_blend.o \
 	drm_bridge.o \
 	drm_cache.o \
-	drm_client.o \
-	drm_client_event.o \
-	drm_client_modeset.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
 	drm_crtc.o \
@@ -77,6 +74,10 @@ drm-y := \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
 	drm_writeback.o
+drm-$(CONFIG_DRM_CLIENT) += \
+	drm_client.o \
+	drm_client_event.o \
+	drm_client_modeset.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 680a94c361ba..41fa3377d9cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -5,6 +5,7 @@ config DRM_AMDGPU
 	depends on DRM && PCI && MMU
 	depends on !UML
 	select FW_LOADER
+	select DRM_CLIENT
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DSC_HELPER
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index c52e93643672..e303de564485 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -14,6 +14,8 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+#include "drm_internal.h"
+
 /**
  * drm_client_dev_unregister - Unregister clients
  * @dev: DRM device
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 52783eac078e..536409a35df4 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -32,7 +32,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_client.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 9af72bab86d1..0bfcba6949b0 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -48,6 +48,14 @@ struct drm_prime_file_private;
 struct drm_printer;
 struct drm_vblank_crtc;
 
+/* drm_client_event.c */
+#if defined(CONFIG_DRM_CLIENT)
+void drm_client_debugfs_init(struct drm_device *dev);
+#else
+static inline void drm_client_debugfs_init(struct drm_device *dev)
+{ }
+#endif
+
 /* drm_file.c */
 extern struct mutex drm_global_mutex;
 bool drm_dev_needs_global_mutex(struct drm_device *dev);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index c03c4b0f3e94..3b13cf29ed55 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -236,6 +236,4 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-void drm_client_debugfs_init(struct drm_device *dev);
-
 #endif
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 72c97d111169..99863554b055 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -5,10 +5,23 @@
 
 struct drm_device;
 
+#if defined(CONFIG_DRM_CLIENT)
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
 void drm_client_dev_restore(struct drm_device *dev);
 void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
 void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
+#else
+static inline void drm_client_dev_unregister(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_hotplug(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_restore(struct drm_device *dev)
+{ }
+static inline void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
+{ }
+static inline void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
+{ }
+#endif
 
 #endif
-- 
2.46.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF198875E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55110ECC7;
	Fri, 27 Sep 2024 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="X4pUG402";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVvCkPHE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X4pUG402";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVvCkPHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9D610EC99;
 Fri, 27 Sep 2024 14:42:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B9C921BA2;
 Fri, 27 Sep 2024 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sVILQyXL2mQzYvh/bRPpgD1yEGQWs6mwcVVJ+Fy3FM=;
 b=X4pUG4029t4qyMfuQTduGc0YS5TMC5cIhjbEBFlZ7Oc+7/zFJ6GVLEYOYQN82fT3kdSZQl
 iJfl4eqOVniy/9U/wOr86nQrVaZgTo3rYc/tQDz+X9hzYvtlz44HppqKGGRxGKrwxQ8qsC
 dCzeRgCpXa7TTUbRW9UMrbHbP9k2kns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sVILQyXL2mQzYvh/bRPpgD1yEGQWs6mwcVVJ+Fy3FM=;
 b=tVvCkPHEpcYjVOmkdvnZjso0uBd+3RXFkFkfFE/i0nIA+j7n3z5KW5xInJvISn5cWSywcp
 ouI2ZYYLjoJF4MCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sVILQyXL2mQzYvh/bRPpgD1yEGQWs6mwcVVJ+Fy3FM=;
 b=X4pUG4029t4qyMfuQTduGc0YS5TMC5cIhjbEBFlZ7Oc+7/zFJ6GVLEYOYQN82fT3kdSZQl
 iJfl4eqOVniy/9U/wOr86nQrVaZgTo3rYc/tQDz+X9hzYvtlz44HppqKGGRxGKrwxQ8qsC
 dCzeRgCpXa7TTUbRW9UMrbHbP9k2kns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sVILQyXL2mQzYvh/bRPpgD1yEGQWs6mwcVVJ+Fy3FM=;
 b=tVvCkPHEpcYjVOmkdvnZjso0uBd+3RXFkFkfFE/i0nIA+j7n3z5KW5xInJvISn5cWSywcp
 ouI2ZYYLjoJF4MCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A75C13AA0;
 Fri, 27 Sep 2024 14:42:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SOruEHHE9mYFKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:42:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm: Add client-lib module
Date: Fri, 27 Sep 2024 16:37:30 +0200
Message-ID: <20240927144252.31813-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
References: <20240927144252.31813-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Add drm_client_lib.ko to contain most of the client code. Move the
existing client for fbdev emulation into the new module. Protect the
new module behind CONFIG_DRM_CLIENT.

The Kconfig rules separate the DRM drivers from the DRM clients. A
driver can opt into the default clients, but the user configures
each client individually. To do so, DRM drivers still select
DRM_CLIENT_SELECTION. The option is now a tristate that further
selects all dependencies of the enabled DRM clients. There's
a menu option for each client. Enabling at least one client also
selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
New DRM clients should depend on DRM_CLIENT_SELECTION.

The KMS-helper module now exports handful of symbols needed by the
DRM client library.

There are existing kernel options in drm_fb_helper.o, so leave this
file in the KMS-helper module for now.

Amdgpu has an internal DRM client, so it has to select DRM_CLIENT by
itself unconditionally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig            | 31 ++++++++++++++++++++++++------
 drivers/gpu/drm/Makefile           | 19 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/Kconfig |  1 +
 drivers/gpu/drm/drm_client.c       |  3 +++
 drivers/gpu/drm/drm_dumb_buffers.c |  2 ++
 drivers/gpu/drm/drm_file.c         |  2 ++
 drivers/gpu/drm/drm_framebuffer.c  |  2 ++
 drivers/gpu/drm/drm_gem.c          |  2 ++
 8 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 88b2ba55fe16..379fccf3a6ea 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -9,8 +9,6 @@ menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
-	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
-	select FB_CORE if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -209,21 +207,40 @@ config DRM_DEBUG_MODESET_LOCK
 
 	  If in doubt, say "N".
 
+config DRM_CLIENT
+	tristate
+	depends on DRM
+	help
+	  Enables the DRM client-lib module. DRM drivers that need
+	  struct drm_client_dev and its interfaces should select this
+	  option. Drivers that support the default clients should
+	  select DRM_CLIENT_SELECTION instead.
+
 config DRM_CLIENT_SELECTION
-	bool
+	tristate
 	depends on DRM
-	select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
+	select DRM_CLIENT if DRM_FBDEV_EMULATION
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  Drivers that support in-kernel DRM clients have to select this
-	  option.
+	  option. It selects all modules and components according to the
+	  enabled clients.
 
 config DRM_CLIENT_SETUP
 	bool
 	depends on DRM_CLIENT_SELECTION
+	help
+	  Enables the DRM client selection. DRM drivers that support the
+	  default clients should select DRM_CLIENT_SELECTION instead.
+
+menu "Supported DRM clients"
+	depends on DRM_CLIENT_SELECTION
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM
+	depends on DRM_CLIENT_SELECTION
+	select DRM_CLIENT_SETUP
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default FB
 	help
@@ -262,6 +279,8 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
 	  If in doubt, say "N" or spread the word to your closed source
 	  library vendor.
 
+endmenu
+
 config DRM_LOAD_EDID_FIRMWARE
 	bool "Allow to specify an EDID data set instead of probing for it"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c50443756457..419208b97f57 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -41,9 +41,7 @@ drm-y := \
 	drm_blend.o \
 	drm_bridge.o \
 	drm_cache.o \
-	drm_client.o \
 	drm_client_dev.o \
-	drm_client_modeset.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
 	drm_crtc.o \
@@ -144,14 +142,25 @@ drm_kms_helper-y := \
 	drm_probe_helper.o \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
-drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) += \
-	drm_client_setup.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
-	drm_fbdev_client.o \
 	drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
+#
+# DRM clients
+#
+
+drm_client_lib-y := \
+	drm_client.o \
+	drm_client_modeset.o
+drm_client_lib-$(CONFIG_DRM_CLIENT_SETUP) += \
+	drm_client_setup.o
+drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += \
+	drm_fbdev_client.o
+obj-$(CONFIG_DRM_CLIENT) += drm_client_lib.o
+
 #
 # Drivers and the rest
 #
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
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 549b28a5918c..864ee96e48cf 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -490,3 +490,6 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 					0, 0, NULL, 0);
 }
 EXPORT_SYMBOL(drm_client_framebuffer_flush);
+
+MODULE_DESCRIPTION("In-kernel DRM clients");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 70032bba1c97..7ed8f05a8d5c 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -95,6 +95,7 @@ int drm_mode_create_dumb(struct drm_device *dev,
 
 	return dev->driver->dumb_create(file_priv, dev, args);
 }
+EXPORT_SYMBOL(drm_mode_create_dumb);
 
 int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 			       void *data, struct drm_file *file_priv)
@@ -141,6 +142,7 @@ int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
 
 	return drm_gem_handle_delete(file_priv, handle);
 }
+EXPORT_SYMBOL(drm_mode_destroy_dumb);
 
 int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *file_priv)
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 01fde94fe2a9..dd847b574457 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -186,6 +186,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL(drm_file_alloc);
 
 static void drm_events_release(struct drm_file *file_priv)
 {
@@ -261,6 +262,7 @@ void drm_file_free(struct drm_file *file)
 	put_pid(rcu_access_pointer(file->pid));
 	kfree(file);
 }
+EXPORT_SYMBOL(drm_file_free);
 
 static void drm_close_helper(struct file *filp)
 {
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 47e6e8577b62..761262529416 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -349,6 +349,7 @@ int drm_mode_addfb2(struct drm_device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_mode_addfb2);
 
 int drm_mode_addfb2_ioctl(struct drm_device *dev,
 			  void *data, struct drm_file *file_priv)
@@ -473,6 +474,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_mode_rmfb);
 
 int drm_mode_rmfb_ioctl(struct drm_device *dev,
 			void *data, struct drm_file *file_priv)
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df..07ae82e35517 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1191,12 +1191,14 @@ int drm_gem_pin_locked(struct drm_gem_object *obj)
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_gem_pin_locked);
 
 void drm_gem_unpin_locked(struct drm_gem_object *obj)
 {
 	if (obj->funcs->unpin)
 		obj->funcs->unpin(obj);
 }
+EXPORT_SYMBOL(drm_gem_unpin_locked);
 
 int drm_gem_pin(struct drm_gem_object *obj)
 {
-- 
2.46.0


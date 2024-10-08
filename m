Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B7994833
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 14:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A24710E518;
	Tue,  8 Oct 2024 12:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gUQVrGrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="irro24VX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gUQVrGrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="irro24VX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43710E4F5;
 Tue,  8 Oct 2024 12:07:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68EF91FF3E;
 Tue,  8 Oct 2024 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728389222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIcG5P7X/N6kGaJg2Fj+xGtcJOxXRdDriHpA1opI2+s=;
 b=gUQVrGrltt0GUs/WYoCVtu3J+xSEqbNkHaKdCJrhzfDP+54nCmO7UOHSDh5UPydrXVyP1p
 GIFbecwUhJ8z3rtle/TaWlhxqdT9FlpkkO8VoWNgfC/2moz/Kv/ikjjOjWSMZkEE/QIgWc
 fY8dq4gUkah5fuJ35nVJ3dCj2PC/cxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728389222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIcG5P7X/N6kGaJg2Fj+xGtcJOxXRdDriHpA1opI2+s=;
 b=irro24VXkj5wPx2ABSAkaX+aUp+KstbUESCOwoF45AQ0G4VgTsmW45HVTxCixLO1rFh2+E
 URG8Dv9M6ydanGAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728389222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIcG5P7X/N6kGaJg2Fj+xGtcJOxXRdDriHpA1opI2+s=;
 b=gUQVrGrltt0GUs/WYoCVtu3J+xSEqbNkHaKdCJrhzfDP+54nCmO7UOHSDh5UPydrXVyP1p
 GIFbecwUhJ8z3rtle/TaWlhxqdT9FlpkkO8VoWNgfC/2moz/Kv/ikjjOjWSMZkEE/QIgWc
 fY8dq4gUkah5fuJ35nVJ3dCj2PC/cxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728389222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIcG5P7X/N6kGaJg2Fj+xGtcJOxXRdDriHpA1opI2+s=;
 b=irro24VXkj5wPx2ABSAkaX+aUp+KstbUESCOwoF45AQ0G4VgTsmW45HVTxCixLO1rFh2+E
 URG8Dv9M6ydanGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ACE01340C;
 Tue,  8 Oct 2024 12:07:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yGg+CWYgBWcCbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Oct 2024 12:07:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/12] drm/client: Add client-lib module
Date: Tue,  8 Oct 2024 13:59:31 +0200
Message-ID: <20241008120652.159190-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241008120652.159190-1-tzimmermann@suse.de>
References: <20241008120652.159190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Add drm_client_lib.ko to contain DRM's built-in client. Move the
existing client for fbdev emulation into the new module. Protect the
new module behind CONFIG_DRM_CLIENT_LIB.

The Kconfig rules separate the DRM drivers from the DRM clients. A
driver can opt into the default clients, but the user configures
each client individually. To do so, DRM drivers still select
DRM_CLIENT_SELECTION. The option is now a tristate that further
selects all dependencies of the enabled DRM clients. There's
a menu option for each client. Enabling at least one client also
selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
New DRM clients should depend on DRM_CLIENT_SELECTION.

There are existing kernel options in drm_fb_helper.o, so leave this
file in the KMS-helper module for now.

v3:
- fix commit changelog
v2:
- keep client code in core
- protect lib with DRM_CLIENT_LIB
- remove duplicate line from Makefile (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                 | 26 ++++++++++++++++++++-----
 drivers/gpu/drm/Makefile                | 14 +++++++++----
 drivers/gpu/drm/drm_client_setup.c      |  3 +++
 drivers/gpu/drm/drm_kms_helper_common.c |  3 +++
 4 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ea1cc924528c..a9055c0b9a1a 100644
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
@@ -218,10 +216,19 @@ config DRM_CLIENT
 	  option. Drivers that support the default clients should
 	  select DRM_CLIENT_SELECTION instead.
 
+config DRM_CLIENT_LIB
+	tristate
+	depends on DRM
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	help
+	  This option enables the DRM client library and selects all
+	  modules and components according to the enabled clients.
+
 config DRM_CLIENT_SELECTION
-	bool
+	tristate
 	depends on DRM
-	select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
+	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
 	help
 	  Drivers that support in-kernel DRM clients have to select this
 	  option.
@@ -229,11 +236,18 @@ config DRM_CLIENT_SELECTION
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
 	select DRM_CLIENT
+	select DRM_CLIENT_SETUP
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default FB
 	help
@@ -272,6 +286,8 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
 	  If in doubt, say "N" or spread the word to your closed source
 	  library vendor.
 
+endmenu
+
 config DRM_LOAD_EDID_FIRMWARE
 	bool "Allow to specify an EDID data set instead of probing for it"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c3e5d353588e..edfd2ebaf153 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -145,13 +145,19 @@ drm_kms_helper-y := \
 	drm_probe_helper.o \
 	drm_self_refresh_helper.o \
 	drm_simple_kms_helper.o
-drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) += \
-	drm_client_setup.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
-drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
+obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+
+#
+# DRM clients
+#
+
+drm_client_lib-y := \
+	drm_client_setup.o
+drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += \
 	drm_fbdev_client.o \
 	drm_fb_helper.o
-obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
 
 #
 # Drivers and the rest
diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
index 5969c4ffe31b..c14221ca5a0d 100644
--- a/drivers/gpu/drm/drm_client_setup.c
+++ b/drivers/gpu/drm/drm_client_setup.c
@@ -64,3 +64,6 @@ void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color
 	drm_client_setup_with_fourcc(dev, fourcc);
 }
 EXPORT_SYMBOL(drm_client_setup_with_color_mode);
+
+MODULE_DESCRIPTION("In-kernel DRM clients");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index cfdbc1ac88dc..ecff0b1414ac 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -31,11 +31,13 @@
 
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
 bool drm_fbdev_emulation = true;
+EXPORT_SYMBOL(drm_fbdev_emulation);
 module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
 MODULE_PARM_DESC(fbdev_emulation,
 		 "Enable legacy fbdev emulation [default=true]");
 
 int drm_fbdev_overalloc = CONFIG_DRM_FBDEV_OVERALLOC;
+EXPORT_SYMBOL(drm_fbdev_overalloc);
 module_param(drm_fbdev_overalloc, int, 0444);
 MODULE_PARM_DESC(drm_fbdev_overalloc,
 		 "Overallocation of the fbdev buffer (%) [default="
@@ -55,6 +57,7 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
  * considered as a broken and legacy behaviour from a modern fbdev device.
  */
 bool drm_leak_fbdev_smem;
+EXPORT_SYMBOL(drm_leak_fbdev_smem);
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
 MODULE_PARM_DESC(drm_leak_fbdev_smem,
-- 
2.46.0


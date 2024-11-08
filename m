Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B393A9C20E4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48E10E9F2;
	Fri,  8 Nov 2024 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0dgEcdBR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDs3m6sZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uFFoOhPy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QmhoRLmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1C010E9EB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:46:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD7B91FDAC;
 Fri,  8 Nov 2024 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWv9iyGB2vtA2ZSexCmC7m5V7hoNxx9H8msDX4sTIsE=;
 b=0dgEcdBRweR/Iv0wKfyJnhmTaGHLP/iAJiwpd8JH+pZ5VqQSYWjsur0qBBltt2ThkWDmFo
 /5m2bVaE5G39l8mQ+ePWGOwqjG1xza2w2Y3MiEU+ExYygH2sk1c4+7rps6k9qG+nyq38pB
 Wslxd6uYjSjc9cDv0AKwF3wLoUauq8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWv9iyGB2vtA2ZSexCmC7m5V7hoNxx9H8msDX4sTIsE=;
 b=lDs3m6sZlq2W9bRy3FEvzPwAJleIz5LFsIeBmEKxFsvoNoYnWLeQAjqzvuwQ4s2P1tvsHP
 1C+IxusrUFLBc5Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731080765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWv9iyGB2vtA2ZSexCmC7m5V7hoNxx9H8msDX4sTIsE=;
 b=uFFoOhPywHstU1KT96S1IBtEjC9Npj7umfiJNQtMSH4Irw9RilXAYE4jRrzJYaKmd5+VJP
 YI9ytV5lsrXEFqSht3vpggQwjRJV8ev3Cn0mUeqGlSWyH+PEbAqY1vsGmUa9AEzaGrTw9B
 TPqQ+8UoyJLJEUBvQKnsMER9bQ+2iGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731080765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWv9iyGB2vtA2ZSexCmC7m5V7hoNxx9H8msDX4sTIsE=;
 b=QmhoRLmG9QbtLhEn/aKnF+3cxnCJYHiNqOmUQ5tfv5vaiD5rPVf3HKSnvxRCjbMSn0CW1y
 07j5eIp9mPDcWfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B1BD13980;
 Fri,  8 Nov 2024 15:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8N+4HD0yLmcAHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Nov 2024 15:46:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm: Move client code to clients/ subdirectory
Date: Fri,  8 Nov 2024 16:42:37 +0100
Message-ID: <20241108154600.126162-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108154600.126162-1-tzimmermann@suse.de>
References: <20241108154600.126162-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.983];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Just move some files around to keep source code well organized. Plus
fix a type in the help text of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                       | 72 +-----------------
 drivers/gpu/drm/Makefile                      |  9 +--
 drivers/gpu/drm/clients/Kconfig               | 73 +++++++++++++++++++
 drivers/gpu/drm/clients/Makefile              |  5 ++
 .../gpu/drm/{ => clients}/drm_client_setup.c  |  0
 .../gpu/drm/{ => clients}/drm_fbdev_client.c  |  0
 6 files changed, 80 insertions(+), 79 deletions(-)
 create mode 100644 drivers/gpu/drm/clients/Kconfig
 create mode 100644 drivers/gpu/drm/clients/Makefile
 rename drivers/gpu/drm/{ => clients}/drm_client_setup.c (100%)
 rename drivers/gpu/drm/{ => clients}/drm_fbdev_client.c (100%)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5504721007cc..fd294ccca6bb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -217,77 +217,7 @@ config DRM_CLIENT
 	  option. Drivers that support the default clients should
 	  select DRM_CLIENT_SELECTION instead.
 
-config DRM_CLIENT_LIB
-	tristate
-	depends on DRM
-	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
-	select FB_CORE if DRM_FBDEV_EMULATION
-	help
-	  This option enables the DRM client library and selects all
-	  modules and components according to the enabled clients.
-
-config DRM_CLIENT_SELECTION
-	tristate
-	depends on DRM
-	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
-	help
-	  Drivers that support in-kernel DRM clients have to select this
-	  option.
-
-config DRM_CLIENT_SETUP
-	bool
-	depends on DRM_CLIENT_SELECTION
-	help
-	  Enables the DRM client selection. DRM drivers that support the
-	  default clients should select DRM_CLIENT_SELECTION instead.
-
-menu "Supported DRM clients"
-	depends on DRM_CLIENT_SELECTION
-
-config DRM_FBDEV_EMULATION
-	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM_CLIENT_SELECTION
-	select DRM_CLIENT
-	select DRM_CLIENT_SETUP
-	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
-	default FB
-	help
-	  Choose this option if you have a need for the legacy fbdev
-	  support. Note that this support also provides the linux console
-	  support on top of your modesetting driver.
-
-	  If in doubt, say "Y".
-
-config DRM_FBDEV_OVERALLOC
-	int "Overallocation of the fbdev buffer"
-	depends on DRM_FBDEV_EMULATION
-	default 100
-	help
-	  Defines the fbdev buffer overallocation in percent. Default
-	  is 100. Typical values for double buffering will be 200,
-	  triple buffering 300.
-
-config DRM_FBDEV_LEAK_PHYS_SMEM
-	bool "Shamelessly allow leaking of fbdev physical address (DANGEROUS)"
-	depends on DRM_FBDEV_EMULATION && EXPERT
-	default n
-	help
-	  In order to keep user-space compatibility, we want in certain
-	  use-cases to keep leaking the fbdev physical address to the
-	  user-space program handling the fbdev buffer.
-	  This affects, not only, Amlogic, Allwinner or Rockchip devices
-	  with ARM Mali GPUs using an userspace Blob.
-	  This option is not supported by upstream developers and should be
-	  removed as soon as possible and be considered as a broken and
-	  legacy behaviour from a modern fbdev device driver.
-
-	  Please send any bug reports when using this to your proprietary
-	  software vendor that requires this.
-
-	  If in doubt, say "N" or spread the word to your closed source
-	  library vendor.
-
-endmenu
+source "drivers/gpu/drm/clients/Kconfig"
 
 config DRM_LOAD_EDID_FIRMWARE
 	bool "Allow to specify an EDID data set instead of probing for it"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 463afad1b5ca..4f6585be14cc 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -148,14 +148,6 @@ drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
-#
-# DRM clients
-#
-
-drm_client_lib-y := drm_client_setup.o
-drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
-obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
-
 #
 # Drivers and the rest
 #
@@ -165,6 +157,7 @@ obj-y			+= tests/
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-y			+= arm/
+obj-y			+= clients/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
new file mode 100644
index 000000000000..01ad3b000130
--- /dev/null
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_CLIENT_LIB
+	tristate
+	depends on DRM
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	help
+	  This option enables the DRM client library and selects all
+	  modules and components according to the enabled clients.
+
+config DRM_CLIENT_SELECTION
+	tristate
+	depends on DRM
+	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
+	help
+	  Drivers that support in-kernel DRM clients have to select this
+	  option.
+
+config DRM_CLIENT_SETUP
+	bool
+	depends on DRM_CLIENT_SELECTION
+	help
+	  Enables the DRM client selection. DRM drivers that support the
+	  default clients should select DRM_CLIENT_SELECTION instead.
+
+menu "Supported DRM clients"
+	depends on DRM_CLIENT_SELECTION
+
+config DRM_FBDEV_EMULATION
+	bool "Enable legacy fbdev support for your modesetting driver"
+	depends on DRM_CLIENT_SELECTION
+	select DRM_CLIENT
+	select DRM_CLIENT_SETUP
+	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
+	default FB
+	help
+	  Choose this option if you have a need for the legacy fbdev
+	  support. Note that this support also provides the linux console
+	  support on top of your modesetting driver.
+
+	  If in doubt, say "Y".
+
+config DRM_FBDEV_OVERALLOC
+	int "Overallocation of the fbdev buffer"
+	depends on DRM_FBDEV_EMULATION
+	default 100
+	help
+	  Defines the fbdev buffer overallocation in percent. Default
+	  is 100. Typical values for double buffering will be 200,
+	  triple buffering 300.
+
+config DRM_FBDEV_LEAK_PHYS_SMEM
+	bool "Shamelessly allow leaking of fbdev physical address (DANGEROUS)"
+	depends on DRM_FBDEV_EMULATION && EXPERT
+	default n
+	help
+	  In order to keep user-space compatibility, we want in certain
+	  use-cases to keep leaking the fbdev physical address to the
+	  user-space program handling the fbdev buffer.
+	  This affects, not only, Amlogic, Allwinner or Rockchip devices
+	  with ARM Mali GPUs using a userspace Blob.
+	  This option is not supported by upstream developers and should be
+	  removed as soon as possible and be considered as a broken and
+	  legacy behaviour from a modern fbdev device driver.
+
+	  Please send any bug reports when using this to your proprietary
+	  software vendor that requires this.
+
+	  If in doubt, say "N" or spread the word to your closed source
+	  library vendor.
+
+endmenu
diff --git a/drivers/gpu/drm/clients/Makefile b/drivers/gpu/drm/clients/Makefile
new file mode 100644
index 000000000000..1d004ec92e1e
--- /dev/null
+++ b/drivers/gpu/drm/clients/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+drm_client_lib-y := drm_client_setup.o
+drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
+obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
similarity index 100%
rename from drivers/gpu/drm/drm_client_setup.c
rename to drivers/gpu/drm/clients/drm_client_setup.c
diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
similarity index 100%
rename from drivers/gpu/drm/drm_fbdev_client.c
rename to drivers/gpu/drm/clients/drm_fbdev_client.c
-- 
2.47.0


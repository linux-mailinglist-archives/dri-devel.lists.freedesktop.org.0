Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AFE82D6CE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16BB10E254;
	Mon, 15 Jan 2024 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B900010E253
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:09:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6175F1FD2F;
 Mon, 15 Jan 2024 10:09:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 309FA1372E;
 Mon, 15 Jan 2024 10:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uJWnCmUEpWWeJAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jan 2024 10:09:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 1/3] video/cmdline: Introduce CONFIG_VIDEO for video= parameter
Date: Mon, 15 Jan 2024 10:54:03 +0100
Message-ID: <20240115100939.21562-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115100939.21562-1-tzimmermann@suse.de>
References: <20240115100939.21562-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6175F1FD2F
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add CONFIG_VIDEO for common code in drivers/video/. Use the option to
select helpers for the video= parameter. Replaces CONFIG_VIDEO_CMDLINE.

Other common code in drivers/video/ can be moved behind CONFIG_VIDEO,
which will simplify the Kconfig rules.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig          | 2 +-
 drivers/video/Kconfig            | 3 ++-
 drivers/video/Makefile           | 2 +-
 drivers/video/fbdev/core/Kconfig | 2 +-
 include/video/cmdline.h          | 7 -------
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6ec33d36f3a4..e519e1987613 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -19,7 +19,7 @@ menuconfig DRM
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
-	select VIDEO_CMDLINE
+	select VIDEO
 	select VIDEO_NOMODESET
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index b694d7669d32..253b129a82dc 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -18,8 +18,9 @@ config STI_CORE
 	  STI refers to the HP "Standard Text Interface" which is a set of
 	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
 
-config VIDEO_CMDLINE
+config VIDEO
 	bool
+	default n
 
 config VIDEO_NOMODESET
 	bool
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 6bbc03950899..287c198f0c82 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -3,7 +3,7 @@
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_STI_CORE)            += sticore.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
-obj-$(CONFIG_VIDEO_CMDLINE)       += cmdline.o
+obj-$(CONFIG_VIDEO)               += cmdline.o
 obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 21053bf00dc5..db09fe87fcd4 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -4,7 +4,7 @@
 #
 
 config FB_CORE
-	select VIDEO_CMDLINE
+	select VIDEO
 	tristate
 
 config FB_NOTIFY
diff --git a/include/video/cmdline.h b/include/video/cmdline.h
index 26b80cdaef79..77292d1d6173 100644
--- a/include/video/cmdline.h
+++ b/include/video/cmdline.h
@@ -5,16 +5,9 @@
 
 #include <linux/types.h>
 
-#if defined(CONFIG_VIDEO_CMDLINE)
 const char *video_get_options(const char *name);
 
 /* exported for compatibility with fbdev; don't use in new code */
 bool __video_get_options(const char *name, const char **option, bool is_of);
-#else
-static inline const char *video_get_options(const char *name)
-{
-	return NULL;
-}
-#endif
 
 #endif
-- 
2.43.0


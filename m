Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15656ACAA45
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0DC10E2AE;
	Mon,  2 Jun 2025 07:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBB10E2AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:59:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEC8721264;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B589136C7;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AKeYJMpZPWhuYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jun 2025 07:59:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	javierm@redhat.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] video: Make global edid_info depend on
 CONFIG_FIRMWARE_EDID
Date: Mon,  2 Jun 2025 09:51:44 +0200
Message-ID: <20250602075537.137759-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602075537.137759-1-tzimmermann@suse.de>
References: <20250602075537.137759-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:9498, ipnet:::/1, country:IN]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CEC8721264
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
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

Protect global edid_info behind CONFIG_FIRMWARE_EDID and remove
the config tests for CONFIG_X86. Makes edid_info available iff
its option has been enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/x86/kernel/setup.c         | 4 ++++
 drivers/gpu/drm/sysfb/efidrm.c  | 2 +-
 drivers/gpu/drm/sysfb/vesadrm.c | 2 +-
 include/video/edid.h            | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833..cfe501d323d5 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -217,8 +217,10 @@ arch_initcall(init_x86_sysctl);
  */
 struct screen_info screen_info;
 EXPORT_SYMBOL(screen_info);
+#if defined(CONFIG_FIRMWARE_EDID)
 struct edid_info edid_info;
 EXPORT_SYMBOL_GPL(edid_info);
+#endif
 
 extern int root_mountflags;
 
@@ -503,7 +505,9 @@ static void __init parse_boot_params(void)
 {
 	ROOT_DEV = old_decode_dev(boot_params.hdr.root_dev);
 	screen_info = boot_params.screen_info;
+#if defined(CONFIG_FIRMWARE_EDID)
 	edid_info = boot_params.edid_info;
+#endif
 #ifdef CONFIG_X86_32
 	apm_info.bios = boot_params.apm_bios_info;
 	ist_info = boot_params.ist_info;
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 46912924636a..a8b1305b6e13 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -202,7 +202,7 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d bytes\n",
 		&format->format, width, height, stride);
 
-#ifdef CONFIG_X86
+#if defined(CONFIG_FIRMWARE_EDID)
 	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
 		sysfb->edid = edid_info.dummy;
 #endif
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 7945544ba73e..c5216dbe21ec 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -344,7 +344,7 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 #endif
 	}
 
-#ifdef CONFIG_X86
+#if defined(CONFIG_FIRMWARE_EDID)
 	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
 		sysfb->edid = edid_info.dummy;
 #endif
diff --git a/include/video/edid.h b/include/video/edid.h
index f614371e9116..c2b186b1933a 100644
--- a/include/video/edid.h
+++ b/include/video/edid.h
@@ -4,7 +4,8 @@
 
 #include <uapi/video/edid.h>
 
-#ifdef CONFIG_X86
+#if defined(CONFIG_FIRMWARE_EDID)
 extern struct edid_info edid_info;
 #endif
+
 #endif /* __linux_video_edid_h__ */
-- 
2.49.0


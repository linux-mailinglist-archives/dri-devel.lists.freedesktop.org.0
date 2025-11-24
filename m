Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D8C81AEA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72AE10E311;
	Mon, 24 Nov 2025 16:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZuBlnnBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOoAZ9pM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZuBlnnBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOoAZ9pM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5E810E307
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:51:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 957765BD02;
 Mon, 24 Nov 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764003089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
 b=ZuBlnnBI/FPFHvSIg3dvx5YpAZ2e9rlfCP03v1lWv1IGV0TBxVeaOGLnmMuGOUbCVEtLUa
 UxNE+PQbvs2gFLIppcuHEeD14Lx8AaQZGXTrSlVbyVkeLhfw4x8lxU7RiRYr83FFMyyuDr
 hfdDb8r30G+G746mvNOpD1X77Dv7ZOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764003089;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
 b=LOoAZ9pMNSxSfE3mgBgbTl/EXiNdf07OiOXNKducmrvAS4oyglkKv8mdayRIfuDWCPbC1i
 DFoJvSF1Le9CTnCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZuBlnnBI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LOoAZ9pM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764003089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
 b=ZuBlnnBI/FPFHvSIg3dvx5YpAZ2e9rlfCP03v1lWv1IGV0TBxVeaOGLnmMuGOUbCVEtLUa
 UxNE+PQbvs2gFLIppcuHEeD14Lx8AaQZGXTrSlVbyVkeLhfw4x8lxU7RiRYr83FFMyyuDr
 hfdDb8r30G+G746mvNOpD1X77Dv7ZOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764003089;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrrbJ3alRtzOMTMhYJrDntjaxvd3iXypW6GUIunVDTk=;
 b=LOoAZ9pMNSxSfE3mgBgbTl/EXiNdf07OiOXNKducmrvAS4oyglkKv8mdayRIfuDWCPbC1i
 DFoJvSF1Le9CTnCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32C253EA63;
 Mon, 24 Nov 2025 16:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GHfoChGNJGm3GgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Nov 2025 16:51:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/10] efi: libstub: Simplify interfaces for primary_display
Date: Mon, 24 Nov 2025 17:40:22 +0100
Message-ID: <20251124165116.502813-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124165116.502813-1-tzimmermann@suse.de>
References: <20251124165116.502813-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 957765BD02
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Rename alloc_primary_display() and __alloc_primary_display(), clarify
free semantics to make interfaces easier to understand.

Rename alloc_primary_display() to lookup_primary_display() as it
does not necessarily allocate. Then rename __alloc_primary_display()
to the new alloc_primary_display(). The helper belongs to
free_primary_display), so it should be named without underscores.

The lookup helper does not necessarily allocate, so the output
parameter needs_free to indicate when free should be called. Pass
an argument through the calls to track this state. Put the free
handling into release_primary_display() for simplificy.

Also move the comment fro primary_display.c to efi-stub-entry.c,
where it now describes lookup_primary_display().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/efi/libstub/efi-stub-entry.c | 23 +++++++++++++++++--
 drivers/firmware/efi/libstub/efi-stub.c       | 22 ++++++++++++------
 drivers/firmware/efi/libstub/efistub.h        |  2 +-
 .../firmware/efi/libstub/primary_display.c    | 17 +-------------
 drivers/firmware/efi/libstub/zboot.c          |  6 +++--
 5 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index aa85e910fe59..3077b51fe0b2 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -14,10 +14,29 @@ static void *kernel_image_addr(void *addr)
 	return addr + kernel_image_offset;
 }
 
-struct sysfb_display_info *alloc_primary_display(void)
+/*
+ * There are two ways of populating the core kernel's sysfb_primary_display
+ * via the stub:
+ *
+ *   - using a configuration table, which relies on the EFI init code to
+ *     locate the table and copy the contents; or
+ *
+ *   - by linking directly to the core kernel's copy of the global symbol.
+ *
+ * The latter is preferred because it makes the EFIFB earlycon available very
+ * early, but it only works if the EFI stub is part of the core kernel image
+ * itself. The zboot decompressor can only use the configuration table
+ * approach.
+ */
+
+struct sysfb_display_info *lookup_primary_display(bool *needs_free)
 {
+	*needs_free = true;
+
 	if (IS_ENABLED(CONFIG_ARM))
-		return __alloc_primary_display();
+		return alloc_primary_display();
+
+	*needs_free = false;
 
 	if (IS_ENABLED(CONFIG_X86) ||
 	    IS_ENABLED(CONFIG_EFI_EARLYCON) ||
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 42d6073bcd06..dc545f62c62b 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -51,14 +51,14 @@ static bool flat_va_mapping = (EFI_RT_VIRTUAL_OFFSET != 0);
 void __weak free_primary_display(struct sysfb_display_info *dpy)
 { }
 
-static struct sysfb_display_info *setup_primary_display(void)
+static struct sysfb_display_info *setup_primary_display(bool *dpy_needs_free)
 {
 	struct sysfb_display_info *dpy;
 	struct screen_info *screen = NULL;
 	struct edid_info *edid = NULL;
 	efi_status_t status;
 
-	dpy = alloc_primary_display();
+	dpy = lookup_primary_display(dpy_needs_free);
 	if (!dpy)
 		return NULL;
 	screen = &dpy->screen;
@@ -68,15 +68,22 @@ static struct sysfb_display_info *setup_primary_display(void)
 
 	status = efi_setup_graphics(screen, edid);
 	if (status != EFI_SUCCESS)
-		goto err_free_primary_display;
+		goto err___free_primary_display;
 
 	return dpy;
 
-err_free_primary_display:
-	free_primary_display(dpy);
+err___free_primary_display:
+	if (*dpy_needs_free)
+		free_primary_display(dpy);
 	return NULL;
 }
 
+static void release_primary_display(struct sysfb_display_info *dpy, bool dpy_needs_free)
+{
+	if (dpy && dpy_needs_free)
+		free_primary_display(dpy);
+}
+
 static void install_memreserve_table(void)
 {
 	struct linux_efi_memreserve *rsv;
@@ -156,13 +163,14 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 			     char *cmdline_ptr)
 {
 	struct sysfb_display_info *dpy;
+	bool dpy_needs_free;
 	efi_status_t status;
 
 	status = check_platform_features();
 	if (status != EFI_SUCCESS)
 		return status;
 
-	dpy = setup_primary_display();
+	dpy = setup_primary_display(&dpy_needs_free);
 
 	efi_retrieve_eventlog();
 
@@ -182,7 +190,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 
 	status = efi_boot_kernel(handle, image, image_addr, cmdline_ptr);
 
-	free_primary_display(dpy);
+	release_primary_display(dpy, dpy_needs_free);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 979a21818cc1..1503ffb82903 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1176,8 +1176,8 @@ efi_enable_reset_attack_mitigation(void) { }
 
 void efi_retrieve_eventlog(void);
 
+struct sysfb_display_info *lookup_primary_display(bool *needs_free);
 struct sysfb_display_info *alloc_primary_display(void);
-struct sysfb_display_info *__alloc_primary_display(void);
 void free_primary_display(struct sysfb_display_info *dpy);
 
 void efi_cache_sync_image(unsigned long image_base,
diff --git a/drivers/firmware/efi/libstub/primary_display.c b/drivers/firmware/efi/libstub/primary_display.c
index cdaebab26514..34c54ac1e02a 100644
--- a/drivers/firmware/efi/libstub/primary_display.c
+++ b/drivers/firmware/efi/libstub/primary_display.c
@@ -7,24 +7,9 @@
 
 #include "efistub.h"
 
-/*
- * There are two ways of populating the core kernel's sysfb_primary_display
- * via the stub:
- *
- *   - using a configuration table, which relies on the EFI init code to
- *     locate the table and copy the contents; or
- *
- *   - by linking directly to the core kernel's copy of the global symbol.
- *
- * The latter is preferred because it makes the EFIFB earlycon available very
- * early, but it only works if the EFI stub is part of the core kernel image
- * itself. The zboot decompressor can only use the configuration table
- * approach.
- */
-
 static efi_guid_t primary_display_guid = LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID;
 
-struct sysfb_display_info *__alloc_primary_display(void)
+struct sysfb_display_info *alloc_primary_display(void)
 {
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4b76f74c56da..c1fd1fdbcb08 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -26,9 +26,11 @@ void __weak efi_cache_sync_image(unsigned long image_base,
 	// executable code loaded into memory to be safe for execution.
 }
 
-struct sysfb_display_info *alloc_primary_display(void)
+struct sysfb_display_info *lookup_primary_display(bool *needs_free)
 {
-	return __alloc_primary_display();
+	*needs_free = true;
+
+	return alloc_primary_display();
 }
 
 asmlinkage efi_status_t __efiapi
-- 
2.51.1


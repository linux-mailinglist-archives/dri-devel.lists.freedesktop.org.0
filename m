Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCAC8AD68
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76810E66A;
	Wed, 26 Nov 2025 16:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Wpkbnc+k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgtGCIKZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wpkbnc+k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bgtGCIKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8368D10E679
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:09:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD778336FF;
 Wed, 26 Nov 2025 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
 b=Wpkbnc+k0kKvvGOiKFASknuCHCqghjFClurIlEXzjxaFqHELVQ18ekmIH7pnuJeBJLQ407
 pTIer8/y3bJVQ5gKGqrvsUfQ1GjTXzxbewPHof9trj42nfZ30iz/SnI+CZwHhSTEK3x1Z5
 2mFAAO2WcFoKtQ6dPTC9uOV/rZ+zstg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764173342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
 b=bgtGCIKZh4CqvNCsVl3HJZm+x/P4Cw5EpAZOcFW5B2qfb5488B7Cx5DD8qKd/IedRsBRKh
 FUMBQrGf+RdadgBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
 b=Wpkbnc+k0kKvvGOiKFASknuCHCqghjFClurIlEXzjxaFqHELVQ18ekmIH7pnuJeBJLQ407
 pTIer8/y3bJVQ5gKGqrvsUfQ1GjTXzxbewPHof9trj42nfZ30iz/SnI+CZwHhSTEK3x1Z5
 2mFAAO2WcFoKtQ6dPTC9uOV/rZ+zstg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764173342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
 b=bgtGCIKZh4CqvNCsVl3HJZm+x/P4Cw5EpAZOcFW5B2qfb5488B7Cx5DD8qKd/IedRsBRKh
 FUMBQrGf+RdadgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FF643EA65;
 Wed, 26 Nov 2025 16:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EG4aEh4mJ2lnIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:09:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com,
 helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/9] efi: Refactor init_primary_display() helpers
Date: Wed, 26 Nov 2025 17:03:24 +0100
Message-ID: <20251126160854.553077-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
 RCVD_TLS_ALL(0.00)[]
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

Rework the kernel's init_primary_display() helpers to allow for later
support of additional config-table entries and EDID information. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/loongarch/kernel/efi.c     | 22 +++++++++++-----------
 drivers/firmware/efi/efi-init.c | 19 ++++++++++---------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 638a392d2cd2..1ef38036e8ae 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -81,19 +81,19 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
 
 static void __init init_primary_display(void)
 {
-	struct screen_info *si;
-
-	if (screen_info_table == EFI_INVALID_TABLE_ADDR)
-		return;
-
-	si = early_memremap(screen_info_table, sizeof(*si));
-	if (!si) {
-		pr_err("Could not map screen_info config table\n");
+	if (screen_info_table == EFI_INVALID_TABLE_ADDR) {
+		struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
+
+		if (!si) {
+			pr_err("Could not map screen_info config table\n");
+			return;
+		}
+		sysfb_primary_display.screen = *si;
+		memset(si, 0, sizeof(*si));
+		early_memunmap(si, sizeof(*si));
+	} else {
 		return;
 	}
-	sysfb_primary_display.screen = *si;
-	memset(si, 0, sizeof(*si));
-	early_memunmap(si, sizeof(*si));
 
 	memblock_reserve(__screen_info_lfb_base(&sysfb_primary_display.screen),
 			 sysfb_primary_display.screen.lfb_size);
diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index d1d418a34407..ca697d485116 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -67,10 +67,9 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
 
 static void __init init_primary_display(void)
 {
-	struct screen_info *si;
-
 	if (screen_info_table != EFI_INVALID_TABLE_ADDR) {
-		si = early_memremap(screen_info_table, sizeof(*si));
+		struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
+
 		if (!si) {
 			pr_err("Could not map screen_info config table\n");
 			return;
@@ -78,14 +77,16 @@ static void __init init_primary_display(void)
 		sysfb_primary_display.screen = *si;
 		memset(si, 0, sizeof(*si));
 		early_memunmap(si, sizeof(*si));
+	} else {
+		return;
+	}
 
-		if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
-			memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
-					    sysfb_primary_display.screen.lfb_size);
+	if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
+		memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
+				    sysfb_primary_display.screen.lfb_size);
 
-		if (IS_ENABLED(CONFIG_EFI_EARLYCON))
-			efi_earlycon_reprobe();
-	}
+	if (IS_ENABLED(CONFIG_EFI_EARLYCON))
+		efi_earlycon_reprobe();
 }
 
 static int __init uefi_init(u64 efi_system_table)
-- 
2.51.1


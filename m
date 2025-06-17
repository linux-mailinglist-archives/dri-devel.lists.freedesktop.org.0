Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17CADCF00
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E5710E3F8;
	Tue, 17 Jun 2025 14:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MBcCW8rL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ij/8+Q1s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BwNT/Rce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Skzv/Uv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E021E10E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:12:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9594211CF;
 Tue, 17 Jun 2025 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750169576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b8QCjZmOBpee5iL8BS3OVLiqMOBfrP9Ftap0nwyyeWc=;
 b=MBcCW8rLVBz0haLuN9wch6vAmPme/aKqLEoQgu/SWLtG9QIXzagyXjz2TpkBldwRC7sr0m
 CbAOFtf5Oce5SJJxF1onzIn3fsQk4rgNJ9R0TKmcX8z97atGbL54qT0XevGcZWxSzztsQ0
 B+tOPEGWHquyBnItqEOs7IVPn+tAqgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750169576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b8QCjZmOBpee5iL8BS3OVLiqMOBfrP9Ftap0nwyyeWc=;
 b=ij/8+Q1sXlII7wT4ihfWGwhFYhaXA9ZRKjWD7bCuTp7CkkCDQrEegckWkgPbkKK7cUGzzG
 umGBxDgdDa+SpxCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="BwNT/Rce";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Skzv/Uv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750169575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b8QCjZmOBpee5iL8BS3OVLiqMOBfrP9Ftap0nwyyeWc=;
 b=BwNT/Rce1kPShvhQspaytobFUSBHdZ6dk/MNsB1rb7jRS1TK312sWefln2fpSbLCI13Nqt
 ssNj8qKAS1PVqkQfmP85HExYUBrjBR3YM7e04b4j6I9Fj3CyAZEjXpKJ95sfgN+FJ91C5u
 HwZoeNIku6TAdJJUnq2CWdDG12fxS0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750169575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b8QCjZmOBpee5iL8BS3OVLiqMOBfrP9Ftap0nwyyeWc=;
 b=Skzv/Uv9xBkNXjSP5whcrG213GDXnACF7suVNh3WA1aVgDHRAf1ou7ZXpCdyDBC94iYJ9O
 pcgHRiGO5KnKMrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7D6813A69;
 Tue, 17 Jun 2025 14:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id U3JdL+d3UWglZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:12:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/vesadrm: Avoid NULL-ptr deref in vesadrm_pmi_cmap_write()
Date: Tue, 17 Jun 2025 16:09:34 +0200
Message-ID: <20250617140944.142392-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E9594211CF
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email,bootlin.com:url,lists.freedesktop.org:email];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Only set PMI fields if the screen_info's Vesa PM segment has been
set. Vesa PMI is the power-management interface. It also provides
means to set the color palette. The interface is optional, so not
all VESA graphics cards support it. Print vesafb's warning [1] if
the hardware palette cannot be set at all.

If unsupported the field PrimaryPalette in struct vesadrm.pmi is
NULL, which results in a segmentation fault. Happens with qemu's
Cirrus emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 814d270b31d2 ("drm/sysfb: vesadrm: Add gamma correction")
Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/video/fbdev/vesafb.c#L375 # 1
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/sysfb/vesadrm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index c5216dbe21ec..074d2bae9db3 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -334,14 +334,19 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 
 	if (!__screen_info_vbe_mode_nonvga(si)) {
 		vesa->cmap_write = vesadrm_vga_cmap_write;
-#if defined(CONFIG_X86_32)
 	} else {
+#if defined(CONFIG_X86_32)
 		phys_addr_t pmi_base = __screen_info_vesapm_info_base(si);
-		const u16 *pmi_addr = phys_to_virt(pmi_base);
 
-		vesa->pmi.PrimaryPalette = (u8 *)pmi_addr + pmi_addr[2];
-		vesa->cmap_write = vesadrm_pmi_cmap_write;
+		if (pmi_base) {
+			const u16 *pmi_addr = phys_to_virt(pmi_base);
+
+			vesa->pmi.PrimaryPalette = (u8 *)pmi_addr + pmi_addr[2];
+			vesa->cmap_write = vesadrm_pmi_cmap_write;
+		} else
 #endif
+		if (format->is_color_indexed)
+			drm_warn(dev, "hardware palette is unchangeable, colors may be incorrect\n");
 	}
 
 #if defined(CONFIG_FIRMWARE_EDID)
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5CFBDF8F2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B85710E85D;
	Wed, 15 Oct 2025 16:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Hqo147/p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2F3VxCDC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hqo147/p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2F3VxCDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0AB10E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:08:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24928210BD;
 Wed, 15 Oct 2025 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9o6wbaGBzG+1WYts7/O+R79Vl4+tBO2OwLz1IXi4EM=;
 b=Hqo147/pGWeC14HMFrWF5ewq9M+xmzKxspSuUhzL0YJDkLSnmDmzbdclBEF5FDkBkr4CnS
 VqfRXwCU061wkZARWza8PcOFazfXB8Ru1Es7mKWwLOwYb1iwb/vccbuG0YGYYpx9PzdRAl
 RBck3VUzhIXFEEYi1lt/B/KpEBK6/kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9o6wbaGBzG+1WYts7/O+R79Vl4+tBO2OwLz1IXi4EM=;
 b=2F3VxCDCzbCzVlCNIT9W1z5Kkquhptt/Qw4Sztiy45ccUSycFlKC5haHM9gH4upP2aoyg8
 zWPZIfY0rELOpaBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Hqo147/p";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2F3VxCDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9o6wbaGBzG+1WYts7/O+R79Vl4+tBO2OwLz1IXi4EM=;
 b=Hqo147/pGWeC14HMFrWF5ewq9M+xmzKxspSuUhzL0YJDkLSnmDmzbdclBEF5FDkBkr4CnS
 VqfRXwCU061wkZARWza8PcOFazfXB8Ru1Es7mKWwLOwYb1iwb/vccbuG0YGYYpx9PzdRAl
 RBck3VUzhIXFEEYi1lt/B/KpEBK6/kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9o6wbaGBzG+1WYts7/O+R79Vl4+tBO2OwLz1IXi4EM=;
 b=2F3VxCDCzbCzVlCNIT9W1z5Kkquhptt/Qw4Sztiy45ccUSycFlKC5haHM9gH4upP2aoyg8
 zWPZIfY0rELOpaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E38DB13A42;
 Wed, 15 Oct 2025 16:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kGlcNvXG72inaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Oct 2025 16:08:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	jonathan@marek.ca,
	javierm@redhat.com
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] efi/libstub: gop: Find GOP handle instead of GOP data
Date: Wed, 15 Oct 2025 17:56:31 +0200
Message-ID: <20251015160816.525825-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160816.525825-1-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 24928210BD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

The device handle of the GOP device is required to retrieve the
correct EDID data. Find the handle instead of the GOP data. Still
return the GOP data in the function arguments, as we already looked
it up.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/efi/libstub/gop.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/efi/libstub/gop.c b/drivers/firmware/efi/libstub/gop.c
index 3785fb4986b4..fd32be8dd146 100644
--- a/drivers/firmware/efi/libstub/gop.c
+++ b/drivers/firmware/efi/libstub/gop.c
@@ -402,12 +402,13 @@ setup_pixel_info(struct screen_info *si, u32 pixels_per_scan_line,
 	}
 }
 
-static efi_graphics_output_protocol_t *find_gop(unsigned long num,
-						const efi_handle_t handles[])
+static efi_handle_t find_handle_with_primary_gop(unsigned long num, const efi_handle_t handles[],
+						 efi_graphics_output_protocol_t **found_gop)
 {
 	efi_graphics_output_protocol_t *first_gop;
-	efi_handle_t h;
+	efi_handle_t h, first_gop_handle;
 
+	first_gop_handle = NULL;
 	first_gop = NULL;
 
 	for_each_efi_handle(h, handles, num) {
@@ -442,19 +443,25 @@ static efi_graphics_output_protocol_t *find_gop(unsigned long num,
 		 */
 		status = efi_bs_call(handle_protocol, h,
 				     &EFI_CONSOLE_OUT_DEVICE_GUID, &dummy);
-		if (status == EFI_SUCCESS)
-			return gop;
-
-		if (!first_gop)
+		if (status == EFI_SUCCESS) {
+			if (found_gop)
+				*found_gop = gop;
+			return h;
+		} else if (!first_gop_handle) {
+			first_gop_handle = h;
 			first_gop = gop;
+		}
 	}
 
-	return first_gop;
+	if (found_gop)
+		*found_gop = first_gop;
+	return first_gop_handle;
 }
 
 efi_status_t efi_setup_gop(struct screen_info *si)
 {
 	efi_handle_t *handles __free(efi_pool) = NULL;
+	efi_handle_t handle;
 	efi_graphics_output_protocol_mode_t *mode;
 	efi_graphics_output_mode_info_t *info;
 	efi_graphics_output_protocol_t *gop;
@@ -467,8 +474,8 @@ efi_status_t efi_setup_gop(struct screen_info *si)
 	if (status != EFI_SUCCESS)
 		return status;
 
-	gop = find_gop(num, handles);
-	if (!gop)
+	handle = find_handle_with_primary_gop(num, handles, &gop);
+	if (!handle)
 		return EFI_NOT_FOUND;
 
 	/* Change mode if requested */
-- 
2.51.0


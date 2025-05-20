Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70EABD026
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D893710E0FC;
	Tue, 20 May 2025 07:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jRpCNbQs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/DK7HFP3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C2b2MQ/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xH+q0fbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED45910E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:17:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC0EC2228E;
 Tue, 20 May 2025 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747725434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/X6S6/bCWZmUJrcNoSW9IqCVsbt0BrJkVECymPGZju8=;
 b=jRpCNbQsrwGdsG50l8Udeh2QvYb4xWBl/o/SJCo3WynhJnJ4Rs1e3NT/ygTf1iA9LcnO+r
 VzZjIfG58YENBkCxJ3+3Rid2IhfmBnBow+P6GMPGfKd2yuyJ+K/oRu1atREvteO67TB5pf
 AFAy9/AL8PJZ1AoDRct1axLO2gt+J9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747725434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/X6S6/bCWZmUJrcNoSW9IqCVsbt0BrJkVECymPGZju8=;
 b=/DK7HFP3+0AHHaPZi5YBYCDDbOvM0xqNv4CLPFhkw59jsEQiYFCrSqZHSlCTNJfPRB46Xs
 5Cdfj0I0M5bqG9Cg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="C2b2MQ/I";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xH+q0fbC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747725433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/X6S6/bCWZmUJrcNoSW9IqCVsbt0BrJkVECymPGZju8=;
 b=C2b2MQ/In3XsmTEFFJ7lntxxxda6LA6WpjzPTk3xx60Y4uwwUaxp2GTpc/Yd9tNTobBLaw
 +cDS3epecrrAfN/TNy30JWnOH2Vrjn7GTaFwlLEk3QPDQEPyIhIWZboWgg4Pwi/8VbNXmM
 +MmEW2U7MM+elUgVMMjZeE+NP17k6a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747725433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/X6S6/bCWZmUJrcNoSW9IqCVsbt0BrJkVECymPGZju8=;
 b=xH+q0fbCEaEG5O6J80vd6HE4OPU4VHMUGfmrL+vjdUamWBeyYFlrz0n5daKzmQuoMHLRDx
 LczI73giHgTuQeAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8358913A3E;
 Tue, 20 May 2025 07:17:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gSpMHnksLGiZNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 07:17:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org, hdegoede@redhat.com, arvidjaar@gmail.com,
 tiwai@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org
Subject: [PATCH v2] dummycon: Trigger redraw when switching consoles with
 deferred takeover
Date: Tue, 20 May 2025 09:14:00 +0200
Message-ID: <20250520071418.8462-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DC0EC2228E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 URIBL_BLOCKED(0.00)[suse.com:url,suse.de:email,suse.de:mid,suse.de:dkim,lists.freedesktop.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[linuxfoundation.org,redhat.com,gmail.com,suse.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,lists.freedesktop.org:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_SEVEN(0.00)[10];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Signal vt subsystem to redraw console when switching to dummycon
with deferred takeover enabled. Makes the console switch to fbcon
and displays the available output.

With deferred takeover enabled, dummycon acts as the placeholder
until the first output to the console happens. At that point, fbcon
takes over. If the output happens while dummycon is not active, it
cannot inform fbcon. This is the case if the vt subsystem runs in
graphics mode.

A typical graphical boot starts plymouth, a display manager and a
compositor; all while leaving out dummycon. Switching to a text-mode
console leaves the console with dummycon even if a getty terminal
has been started.

Returning true from dummycon's con_switch helper signals the vt
subsystem to redraw the screen. If there's output available dummycon's
con_putc{s} helpers trigger deferred takeover of fbcon, which sets a
display mode and displays the output. If no output is available,
dummycon remains active.

v2:
- make the comment slightly more verbose (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Andrei Borzenkov <arvidjaar@gmail.com>
Closes: https://bugzilla.suse.com/show_bug.cgi?id=1242191
Tested-by: Andrei Borzenkov <arvidjaar@gmail.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Fixes: 83d83bebf401 ("console/fbcon: Add support for deferred console takeover")
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/video/console/dummycon.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 139049368fdc..7d02470f19b9 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -85,6 +85,15 @@ static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 	/* Redraw, so that we get putc(s) for output done while blanked */
 	return true;
 }
+
+static bool dummycon_switch(struct vc_data *vc)
+{
+	/*
+	 * Redraw, so that we get putc(s) for output done while switched
+	 * away. Informs deferred consoles to take over the display.
+	 */
+	return true;
+}
 #else
 static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
 			  unsigned int x) { }
@@ -95,6 +104,10 @@ static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 {
 	return false;
 }
+static bool dummycon_switch(struct vc_data *vc)
+{
+	return false;
+}
 #endif
 
 static const char *dummycon_startup(void)
@@ -124,11 +137,6 @@ static bool dummycon_scroll(struct vc_data *vc, unsigned int top,
 	return false;
 }
 
-static bool dummycon_switch(struct vc_data *vc)
-{
-	return false;
-}
-
 /*
  *  The console `switch' structure for the dummy console
  *
-- 
2.49.0


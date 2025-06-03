Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB958ACCA96
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 17:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BBC10E5EE;
	Tue,  3 Jun 2025 15:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tlHAVM2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rUE07HBX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LWr5n/Au";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/yIPd/Dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC8210E5EE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 15:52:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D62FD21AAE;
 Tue,  3 Jun 2025 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748965936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnYa67cqiWnPUqruK5qg6QSnua73y8Kcq4VF0lmQj/M=;
 b=tlHAVM2WezBxXX/tBJvyKQ5CcGntV6d+M0vykYW6sIhRx1U5DpZWdgMu5W+l6/tfjHk3X4
 cX7ST35YsjIKlk/KINXBsNpSS704V3+bJJMGq+mfet2Lo5jNyST5zvW7V41YIUJAyY/v+m
 PwO6osQEFoxZB1K2EcJClF50r86EcA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748965936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnYa67cqiWnPUqruK5qg6QSnua73y8Kcq4VF0lmQj/M=;
 b=rUE07HBXslhRIiCBYLKr03x9EnOJNTRVhMHoBc61swIrc40juE+6hiYfu0BVmjWjasbHo0
 EKzNyxafxhZ8O5BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748965935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnYa67cqiWnPUqruK5qg6QSnua73y8Kcq4VF0lmQj/M=;
 b=LWr5n/AuFo2/M7gnxepHhn8A81bNW4noPSn8nzXbfiijY6DIa40C5DQJt3QMbAdVIVbobT
 EljsLd/fI88Q1oalZMb/04QDmxttvj1Mdb6sslaNAWS8q+Kr2AsQTbNxR1aO9juRHGAFPC
 Vja4cKs2NIPOc1SXKtmR5ZEYLZ4kfzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748965935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnYa67cqiWnPUqruK5qg6QSnua73y8Kcq4VF0lmQj/M=;
 b=/yIPd/DvZa3xsX3iSFGapQsVpAj+aRA9K7o22xDsGLVUC6MILi1PbBWK8ILvLwHywVekBW
 avgDHxeh8VpEpRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D99A13A92;
 Tue,  3 Jun 2025 15:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eR7kIC8aP2gCPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jun 2025 15:52:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, stable@vger.kernel.org
Subject: [PATCH] sysfb: Fix screen_info type check for VGA
Date: Tue,  3 Jun 2025 17:48:20 +0200
Message-ID: <20250603154838.401882-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,suse.de,amd.com,kernel.org,gmx.de,baylibre.com,c64.rulez.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

Use the helper screen_info_video_type() to get the framebuffer
type from struct screen_info. Handle supported values in sorted
switch statement.

Reading orig_video_isVGA is unreliable. On most systems it is a
VIDEO_TYPE_ constant. On some systems with VGA it is simply set
to 1 to signal the presence of a VGA output. See vga_probe() for
an example. Retrieving the screen_info type with the helper
screen_info_video_type() detects these cases and returns the
appropriate VIDEO_TYPE_ constant. For VGA, sysfb creates a device
named "vga-framebuffer".

The sysfb code has been taken from vga16fb, where it likely didn't
work correctly either. With this bugfix applied, vga16fb loads for
compatible vga-framebuffer devices.

Fixes: 0db5b61e0dc0 ("fbdev/vga16fb: Create EGA/VGA devices in sysfb code")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/sysfb.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 7c5c03f274b9..889e5b05c739 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -143,6 +143,7 @@ static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
 	struct device *parent;
+	unsigned int type;
 	struct simplefb_platform_data mode;
 	const char *name;
 	bool compatible;
@@ -170,17 +171,26 @@ static __init int sysfb_init(void)
 			goto put_device;
 	}
 
+	type = screen_info_video_type(si);
+
 	/* if the FB is incompatible, create a legacy framebuffer device */
-	if (si->orig_video_isVGA == VIDEO_TYPE_EFI)
-		name = "efi-framebuffer";
-	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
-		name = "vesa-framebuffer";
-	else if (si->orig_video_isVGA == VIDEO_TYPE_VGAC)
-		name = "vga-framebuffer";
-	else if (si->orig_video_isVGA == VIDEO_TYPE_EGAC)
+	switch (type) {
+	case VIDEO_TYPE_EGAC:
 		name = "ega-framebuffer";
-	else
+		break;
+	case VIDEO_TYPE_VGAC:
+		name = "vga-framebuffer";
+		break;
+	case VIDEO_TYPE_VLFB:
+		name = "vesa-framebuffer";
+		break;
+	case VIDEO_TYPE_EFI:
+		name = "efi-framebuffer";
+		break;
+	default:
 		name = "platform-framebuffer";
+		break;
+	}
 
 	pd = platform_device_alloc(name, 0);
 	if (!pd) {
-- 
2.49.0


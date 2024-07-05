Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2F92882E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B638010EB8A;
	Fri,  5 Jul 2024 11:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bxX9rdwH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BP8uQ0Iv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bxX9rdwH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BP8uQ0Iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC310EB78
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C7F4218ED;
 Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK/uBjtNTJUsP4JkfRHacUZH7DR0hL+1RYtao+gELn0=;
 b=bxX9rdwHWae+q2wzyvVZuN9DJ5rcfqOkhDGYhX214nEH62nq9n9tRE14Ljol0rHH32L499
 i4l3m+evluuV0LRDJPKMX/GgP4DbW3iWRzd+MKwPYB6a9n7bO4h8tfHGze0NtPYVlvykDz
 2/bfLEwZStZ1ht13IL9LAEzSTmaJkEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK/uBjtNTJUsP4JkfRHacUZH7DR0hL+1RYtao+gELn0=;
 b=BP8uQ0IviUiS/HkQKreqAhS1TAIZ0wrm2bfOkxpSuZH3bPUd4YliPiUCtm8Jaz4GfsmR3j
 Jt1Tb/teoKONQYCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK/uBjtNTJUsP4JkfRHacUZH7DR0hL+1RYtao+gELn0=;
 b=bxX9rdwHWae+q2wzyvVZuN9DJ5rcfqOkhDGYhX214nEH62nq9n9tRE14Ljol0rHH32L499
 i4l3m+evluuV0LRDJPKMX/GgP4DbW3iWRzd+MKwPYB6a9n7bO4h8tfHGze0NtPYVlvykDz
 2/bfLEwZStZ1ht13IL9LAEzSTmaJkEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK/uBjtNTJUsP4JkfRHacUZH7DR0hL+1RYtao+gELn0=;
 b=BP8uQ0IviUiS/HkQKreqAhS1TAIZ0wrm2bfOkxpSuZH3bPUd4YliPiUCtm8Jaz4GfsmR3j
 Jt1Tb/teoKONQYCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE8BE13889;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WDD3NLLdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 4/7] drm/mgag200: Add dedicated variables for blanking
 fields
Date: Fri,  5 Jul 2024 13:47:47 +0200
Message-ID: <20240705114900.572-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705114900.572-1-tzimmermann@suse.de>
References: <20240705114900.572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FROM_HAS_DN(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Represent fields for horizontal and vertical blanking with <hblkstr>,
<hblkend>, <vblkstr> and <vblkend>. Aligns the code with the Matrox
programming manuals.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 29 ++++++++++++++------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ccad5bd5960d..1cd28e7bea32 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -204,23 +204,26 @@ void mgag200_init_registers(struct mga_device *mdev)
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode)
 {
 	const struct mgag200_device_info *info = mdev->info;
-	unsigned int hdispend, hsyncstr, hsyncend, htotal;
-	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
+	unsigned int hdispend, hsyncstr, hsyncend, htotal, hblkstr, hblkend;
+	unsigned int vdispend, vsyncstr, vsyncend, vtotal, vblkstr, vblkend;
 	u8 misc, crtcext1, crtcext2, crtcext5;
 
 	hdispend = mode->crtc_hdisplay / 8 - 1;
 	hsyncstr = mode->crtc_hsync_start / 8 - 1;
 	hsyncend = mode->crtc_hsync_end / 8 - 1;
 	htotal = mode->crtc_htotal / 8 - 1;
-
 	/* Work around hardware quirk */
 	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
 		htotal++;
+	hblkstr = mode->crtc_hblank_start / 8 - 1;
+	hblkend = htotal;
 
 	vdispend = mode->crtc_vdisplay - 1;
 	vsyncstr = mode->crtc_vsync_start - 1;
 	vsyncend = mode->crtc_vsync_end - 1;
 	vtotal = mode->crtc_vtotal - 2;
+	vblkstr = mode->crtc_vblank_start;
+	vblkend = vtotal + 1;
 
 	misc = RREG8(MGA_MISC_IN);
 
@@ -235,43 +238,43 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		misc &= ~MGAREG_MISC_VSYNCPOL;
 
 	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
-		    ((hdispend & 0x100) >> 7) |
+		    ((hblkstr & 0x100) >> 7) |
 		    ((hsyncstr & 0x100) >> 6) |
-		     (htotal & 0x40);
+		     (hblkend & 0x40);
 	if (info->has_vidrst)
 		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
 			    MGAREG_CRTCEXT1_HRSTEN;
 
 	crtcext2 = ((vtotal & 0xc00) >> 10) |
 		   ((vdispend & 0x400) >> 8) |
-		   ((vdispend & 0xc00) >> 7) |
+		   ((vblkstr & 0xc00) >> 7) |
 		   ((vsyncstr & 0xc00) >> 5) |
 		   ((vdispend & 0x400) >> 3);
 	crtcext5 = 0x00;
 
 	WREG_CRT(0x00, htotal - 4);
 	WREG_CRT(0x01, hdispend);
-	WREG_CRT(0x02, hdispend);
-	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
+	WREG_CRT(0x02, hblkstr);
+	WREG_CRT(0x03, (hblkend & 0x1f) | 0x80);
 	WREG_CRT(0x04, hsyncstr);
-	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
+	WREG_CRT(0x05, ((hblkend & 0x20) << 2) | (hsyncend & 0x1f));
 	WREG_CRT(0x06, vtotal & 0xff);
 	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
 		       ((vdispend & 0x100) >> 7) |
 		       ((vsyncstr & 0x100) >> 6) |
-		       ((vdispend & 0x100) >> 5) |
+		       ((vblkstr & 0x100) >> 5) |
 		       ((vdispend & 0x100) >> 4) | /* linecomp */
 		       ((vtotal & 0x200) >> 4) |
 		       ((vdispend & 0x200) >> 3) |
 		       ((vsyncstr & 0x200) >> 2));
-	WREG_CRT(0x09, ((vdispend & 0x200) >> 4) |
+	WREG_CRT(0x09, ((vblkstr & 0x200) >> 4) |
 		       ((vdispend & 0x200) >> 3));
 	WREG_CRT(0x10, vsyncstr & 0xff);
 	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
 	WREG_CRT(0x12, vdispend & 0xff);
 	WREG_CRT(0x14, 0);
-	WREG_CRT(0x15, vdispend & 0xff);
-	WREG_CRT(0x16, (vtotal + 1) & 0xff);
+	WREG_CRT(0x15, vblkstr & 0xff);
+	WREG_CRT(0x16, vblkend & 0xff);
 	WREG_CRT(0x17, 0xc3);
 	WREG_CRT(0x18, vdispend & 0xff);
 
-- 
2.45.2


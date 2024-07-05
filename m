Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A497D928830
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B368F10EB88;
	Fri,  5 Jul 2024 11:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uOcqXlGM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AgXixSWG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uOcqXlGM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AgXixSWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12BB10EB78
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7864921941;
 Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r52ymmrVx0WW8o1VMB+cpxjKuEtskGVIdVqZKNrp1Zg=;
 b=uOcqXlGMrhjNHdG+WgchuMjqrfVkGVJN26GUkA2ESg0SaR95MQzcBTje+Ue6zpZsBXcZlv
 Y6oIHuuKYA6GkcAObXcfc8WFtFDTRvD+rfhd0h9OXz8Y0woznipE6NF8ELBG/gnU9NcZWR
 4ZvAFHmulZaRn/3hOjYBZdhlC4i5q/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r52ymmrVx0WW8o1VMB+cpxjKuEtskGVIdVqZKNrp1Zg=;
 b=AgXixSWGzHLVhKOk4EliZ5hZ5dv1gBSTMefgveaqnPycVrMuMa5DAXCNUao0p+CnGgI5Lk
 AJrN3xVh8jw7uMDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r52ymmrVx0WW8o1VMB+cpxjKuEtskGVIdVqZKNrp1Zg=;
 b=uOcqXlGMrhjNHdG+WgchuMjqrfVkGVJN26GUkA2ESg0SaR95MQzcBTje+Ue6zpZsBXcZlv
 Y6oIHuuKYA6GkcAObXcfc8WFtFDTRvD+rfhd0h9OXz8Y0woznipE6NF8ELBG/gnU9NcZWR
 4ZvAFHmulZaRn/3hOjYBZdhlC4i5q/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r52ymmrVx0WW8o1VMB+cpxjKuEtskGVIdVqZKNrp1Zg=;
 b=AgXixSWGzHLVhKOk4EliZ5hZ5dv1gBSTMefgveaqnPycVrMuMa5DAXCNUao0p+CnGgI5Lk
 AJrN3xVh8jw7uMDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34BEB13974;
 Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YEdrC7Pdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/7] drm/mgag200: Add dedicted variable for <linecomp> field
Date: Fri,  5 Jul 2024 13:47:48 +0200
Message-ID: <20240705114900.572-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705114900.572-1-tzimmermann@suse.de>
References: <20240705114900.572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spam-Flag: NO
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

Replace the line-compare value of <vdispend> with a dedicated variable
<linecomp>. Improves readability and prepares for vblank support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1cd28e7bea32..da2cbe81d4e6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -206,6 +206,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	const struct mgag200_device_info *info = mdev->info;
 	unsigned int hdispend, hsyncstr, hsyncend, htotal, hblkstr, hblkend;
 	unsigned int vdispend, vsyncstr, vsyncend, vtotal, vblkstr, vblkend;
+	unsigned int linecomp;
 	u8 misc, crtcext1, crtcext2, crtcext5;
 
 	hdispend = mode->crtc_hdisplay / 8 - 1;
@@ -225,6 +226,8 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	vblkstr = mode->crtc_vblank_start;
 	vblkend = vtotal + 1;
 
+	linecomp = vdispend;
+
 	misc = RREG8(MGA_MISC_IN);
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -249,7 +252,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		   ((vdispend & 0x400) >> 8) |
 		   ((vblkstr & 0xc00) >> 7) |
 		   ((vsyncstr & 0xc00) >> 5) |
-		   ((vdispend & 0x400) >> 3);
+		   ((linecomp & 0x400) >> 3);
 	crtcext5 = 0x00;
 
 	WREG_CRT(0x00, htotal - 4);
@@ -263,12 +266,12 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		       ((vdispend & 0x100) >> 7) |
 		       ((vsyncstr & 0x100) >> 6) |
 		       ((vblkstr & 0x100) >> 5) |
-		       ((vdispend & 0x100) >> 4) | /* linecomp */
+		       ((linecomp & 0x100) >> 4) |
 		       ((vtotal & 0x200) >> 4) |
 		       ((vdispend & 0x200) >> 3) |
 		       ((vsyncstr & 0x200) >> 2));
 	WREG_CRT(0x09, ((vblkstr & 0x200) >> 4) |
-		       ((vdispend & 0x200) >> 3));
+		       ((linecomp & 0x200) >> 3));
 	WREG_CRT(0x10, vsyncstr & 0xff);
 	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
 	WREG_CRT(0x12, vdispend & 0xff);
@@ -276,7 +279,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	WREG_CRT(0x15, vblkstr & 0xff);
 	WREG_CRT(0x16, vblkend & 0xff);
 	WREG_CRT(0x17, 0xc3);
-	WREG_CRT(0x18, vdispend & 0xff);
+	WREG_CRT(0x18, linecomp & 0xff);
 
 	WREG_ECRT(0x01, crtcext1);
 	WREG_ECRT(0x02, crtcext2);
-- 
2.45.2


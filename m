Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4FA92882D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56410EB86;
	Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ygPNx4O8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="29Kki0QW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ygPNx4O8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="29Kki0QW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2153310EB83
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7D3F1FD26;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmCwM/64/MF3/xVu6IpHr7G4q7V2Gp0raKmxGvtYO9Y=;
 b=ygPNx4O8imY1a0Xs2qxWeWE0F0iHAp8JdnnJK61rKsoN5vFrFRMkFluquMT8O6U6TaMPMh
 JRqNYpPjxswnt/Ot2k2SuxsLvDY0t8ZCmdNmmTGseHewRtZ4nhbc6y8eU1oFnxNevblwYy
 EFk+Ra2I32DYDz07NakbD/U6tJiTlUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmCwM/64/MF3/xVu6IpHr7G4q7V2Gp0raKmxGvtYO9Y=;
 b=29Kki0QWgx8yPsy9rj1kxNdWoKK9r7ZZ3Ml8Xdwswe9U9pCBMV/tNKQUdw/UQo/tw2e+Th
 tzGo8Mk5AUgFMaBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmCwM/64/MF3/xVu6IpHr7G4q7V2Gp0raKmxGvtYO9Y=;
 b=ygPNx4O8imY1a0Xs2qxWeWE0F0iHAp8JdnnJK61rKsoN5vFrFRMkFluquMT8O6U6TaMPMh
 JRqNYpPjxswnt/Ot2k2SuxsLvDY0t8ZCmdNmmTGseHewRtZ4nhbc6y8eU1oFnxNevblwYy
 EFk+Ra2I32DYDz07NakbD/U6tJiTlUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmCwM/64/MF3/xVu6IpHr7G4q7V2Gp0raKmxGvtYO9Y=;
 b=29Kki0QWgx8yPsy9rj1kxNdWoKK9r7ZZ3Ml8Xdwswe9U9pCBMV/tNKQUdw/UQo/tw2e+Th
 tzGo8Mk5AUgFMaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9252213974;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IHVmIrLdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 3/7] drm/mgag200: Use adjusted mode values for CRTCs
Date: Fri,  5 Jul 2024 13:47:46 +0200
Message-ID: <20240705114900.572-4-tzimmermann@suse.de>
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

Use the values with the crtc_ prefix from struct drm_display_mode to
program hardware. The DRM core adjusted these values to the requirements
of CRTC hardware.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 09e2a5b80403..ccad5bd5960d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -208,19 +208,19 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	unsigned int vdispend, vsyncstr, vsyncend, vtotal;
 	u8 misc, crtcext1, crtcext2, crtcext5;
 
-	hdispend = mode->hdisplay / 8 - 1;
-	hsyncstr = mode->hsync_start / 8 - 1;
-	hsyncend = mode->hsync_end / 8 - 1;
-	htotal = mode->htotal / 8 - 1;
+	hdispend = mode->crtc_hdisplay / 8 - 1;
+	hsyncstr = mode->crtc_hsync_start / 8 - 1;
+	hsyncend = mode->crtc_hsync_end / 8 - 1;
+	htotal = mode->crtc_htotal / 8 - 1;
 
 	/* Work around hardware quirk */
 	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
 		htotal++;
 
-	vdispend = mode->vdisplay - 1;
-	vsyncstr = mode->vsync_start - 1;
-	vsyncend = mode->vsync_end - 1;
-	vtotal = mode->vtotal - 2;
+	vdispend = mode->crtc_vdisplay - 1;
+	vsyncstr = mode->crtc_vsync_start - 1;
+	vsyncend = mode->crtc_vsync_end - 1;
+	vtotal = mode->crtc_vtotal - 2;
 
 	misc = RREG8(MGA_MISC_IN);
 
-- 
2.45.2


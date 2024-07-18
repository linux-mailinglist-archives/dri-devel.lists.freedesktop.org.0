Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4239934BDC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94610E755;
	Thu, 18 Jul 2024 10:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D9710E743
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3272A21AA9;
 Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6247136F7;
 Thu, 18 Jul 2024 10:45:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aDIGN2PymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 5/7] drm/mgag200: Add dedicted variable for <linecomp> field
Date: Thu, 18 Jul 2024 12:44:15 +0200
Message-ID: <20240718104551.575912-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718104551.575912-1-tzimmermann@suse.de>
References: <20240718104551.575912-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 3272A21AA9
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
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

Replace the line-compare value of <vdispend> with a dedicated variable
<linecomp>. Improves readability and prepares for vblank support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 89bb869b3090..ff90f29b0612 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -206,6 +206,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 {
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


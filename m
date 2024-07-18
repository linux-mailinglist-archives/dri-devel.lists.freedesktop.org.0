Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAABE934BDA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FA410E73C;
	Thu, 18 Jul 2024 10:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA910E73C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E3281FBB9;
 Thu, 18 Jul 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0D2E137EB;
 Thu, 18 Jul 2024 10:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mL+7LWLymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 1/7] drm/mgag200: Use hexadecimal register indeces
Date: Thu, 18 Jul 2024 12:44:11 +0200
Message-ID: <20240718104551.575912-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718104551.575912-1-tzimmermann@suse.de>
References: <20240718104551.575912-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: 0E3281FBB9
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
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

In mgag200_set_mode_regs(), use hexadecimal indices for accessing
registers. Aligns the code with the register indices in the Matrox
programming manuals. Also convert to lower-case hexadecimal values.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 50 +++++++++++++-------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ec6f5e9e2d8f..18b127841dd9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -249,31 +249,31 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 		   ((vdisplay & 0x400) >> 3);
 	crtcext5 = 0x00;
 
-	WREG_CRT(0, htotal - 4);
-	WREG_CRT(1, hdisplay);
-	WREG_CRT(2, hdisplay);
-	WREG_CRT(3, (htotal & 0x1F) | 0x80);
-	WREG_CRT(4, hsyncstart);
-	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
-	WREG_CRT(6, vtotal & 0xFF);
-	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
-		 ((vdisplay & 0x100) >> 7) |
-		 ((vsyncstart & 0x100) >> 6) |
-		 ((vdisplay & 0x100) >> 5) |
-		 ((vdisplay & 0x100) >> 4) | /* linecomp */
-		 ((vtotal & 0x200) >> 4) |
-		 ((vdisplay & 0x200) >> 3) |
-		 ((vsyncstart & 0x200) >> 2));
-	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
-		 ((vdisplay & 0x200) >> 3));
-	WREG_CRT(16, vsyncstart & 0xFF);
-	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
-	WREG_CRT(18, vdisplay & 0xFF);
-	WREG_CRT(20, 0);
-	WREG_CRT(21, vdisplay & 0xFF);
-	WREG_CRT(22, (vtotal + 1) & 0xFF);
-	WREG_CRT(23, 0xc3);
-	WREG_CRT(24, vdisplay & 0xFF);
+	WREG_CRT(0x00, htotal - 4);
+	WREG_CRT(0x01, hdisplay);
+	WREG_CRT(0x02, hdisplay);
+	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
+	WREG_CRT(0x04, hsyncstart);
+	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
+	WREG_CRT(0x06, vtotal & 0xff);
+	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
+		       ((vdisplay & 0x100) >> 7) |
+		       ((vsyncstart & 0x100) >> 6) |
+		       ((vdisplay & 0x100) >> 5) |
+		       ((vdisplay & 0x100) >> 4) | /* linecomp */
+		       ((vtotal & 0x200) >> 4) |
+		       ((vdisplay & 0x200) >> 3) |
+		       ((vsyncstart & 0x200) >> 2));
+	WREG_CRT(0x09, ((vdisplay & 0x200) >> 4) |
+		       ((vdisplay & 0x200) >> 3));
+	WREG_CRT(0x10, vsyncstart & 0xff);
+	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
+	WREG_CRT(0x12, vdisplay & 0xff);
+	WREG_CRT(0x14, 0);
+	WREG_CRT(0x15, vdisplay & 0xff);
+	WREG_CRT(0x16, (vtotal + 1) & 0xff);
+	WREG_CRT(0x17, 0xc3);
+	WREG_CRT(0x18, vdisplay & 0xff);
 
 	WREG_ECRT(0x01, crtcext1);
 	WREG_ECRT(0x02, crtcext2);
-- 
2.45.2


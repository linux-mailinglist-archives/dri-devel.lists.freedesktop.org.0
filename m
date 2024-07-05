Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F103792882C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6010EB85;
	Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AohUgv0M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDqhQ5YX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AohUgv0M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDqhQ5YX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ABC10EB83
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 40E6F1FD00;
 Fri,  5 Jul 2024 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLJtU5qrVBgJuCDgh+13cOQ/gWo/eqI+i2mq8PQTpBM=;
 b=AohUgv0MCHRXBViO8ZdTyOkMFRv+GwbVoqaxS/7ZMFx+W9C5Mtj0fzm45AKwHisOMg7JE0
 zHnCe3YYf3u/S+ILlO1GlXIh5kA+BZ0iViWDPzsdDkcb5ZX6mGZLGQlAC8NL3bLtpJdAIM
 pbkj5WwPW9sZAwpr0oEQATQP1ZwRj3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLJtU5qrVBgJuCDgh+13cOQ/gWo/eqI+i2mq8PQTpBM=;
 b=SDqhQ5YXOqVqKHYHcxqUWk6UG8Jt3DpJ51/O33gtgIBp7oATpmvOZLdi/DgUxMMMG95qoh
 IUAuZt3+uOuNS9DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AohUgv0M;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SDqhQ5YX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLJtU5qrVBgJuCDgh+13cOQ/gWo/eqI+i2mq8PQTpBM=;
 b=AohUgv0MCHRXBViO8ZdTyOkMFRv+GwbVoqaxS/7ZMFx+W9C5Mtj0fzm45AKwHisOMg7JE0
 zHnCe3YYf3u/S+ILlO1GlXIh5kA+BZ0iViWDPzsdDkcb5ZX6mGZLGQlAC8NL3bLtpJdAIM
 pbkj5WwPW9sZAwpr0oEQATQP1ZwRj3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLJtU5qrVBgJuCDgh+13cOQ/gWo/eqI+i2mq8PQTpBM=;
 b=SDqhQ5YXOqVqKHYHcxqUWk6UG8Jt3DpJ51/O33gtgIBp7oATpmvOZLdi/DgUxMMMG95qoh
 IUAuZt3+uOuNS9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F12A213974;
 Fri,  5 Jul 2024 11:49:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eHubObHdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 1/7] drm/mgag200: Use hexadecimal register indeces
Date: Fri,  5 Jul 2024 13:47:44 +0200
Message-ID: <20240705114900.572-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705114900.572-1-tzimmermann@suse.de>
References: <20240705114900.572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 40E6F1FD00
X-Spam-Score: -1.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 50 +++++++++++++-------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index d4550e4b3b01..4ceaa33e8d42 100644
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


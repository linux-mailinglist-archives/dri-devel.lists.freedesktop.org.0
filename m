Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC1ADD01D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0154010E74F;
	Tue, 17 Jun 2025 14:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wzTojOaJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q+Gi73Uk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzTojOaJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q+Gi73Uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045310E750
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:40:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5692B211D6;
 Tue, 17 Jun 2025 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJnDRHGVL6Pz+6g++FphOPbxNRk4OZMbg58a3kKHO6g=;
 b=wzTojOaJUoEhzirX8ArjrH37FbpVYnc1fGHGq13Ckio2Mj1+UtU2AjofO4DrypkKHjNG9B
 9f14pMjn21opJj84S0BS5pH4cMZMESEXGg9NLdfrfnQgIuz1Lumf7LtJQcbV8DNU6EWgnf
 hAAG0j8YZKHx6nGeDexubfaQ3szz+WY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJnDRHGVL6Pz+6g++FphOPbxNRk4OZMbg58a3kKHO6g=;
 b=Q+Gi73UkjOzODJhd2IJC/DnuMqD8V8VNgRn0au9hblZIFnBXvHTZqI4SVizhPYluCQMNIj
 RvdTRUPSSbg3MqCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJnDRHGVL6Pz+6g++FphOPbxNRk4OZMbg58a3kKHO6g=;
 b=wzTojOaJUoEhzirX8ArjrH37FbpVYnc1fGHGq13Ckio2Mj1+UtU2AjofO4DrypkKHjNG9B
 9f14pMjn21opJj84S0BS5pH4cMZMESEXGg9NLdfrfnQgIuz1Lumf7LtJQcbV8DNU6EWgnf
 hAAG0j8YZKHx6nGeDexubfaQ3szz+WY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171189;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJnDRHGVL6Pz+6g++FphOPbxNRk4OZMbg58a3kKHO6g=;
 b=Q+Gi73UkjOzODJhd2IJC/DnuMqD8V8VNgRn0au9hblZIFnBXvHTZqI4SVizhPYluCQMNIj
 RvdTRUPSSbg3MqCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3000013AE1;
 Tue, 17 Jun 2025 14:39:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8PVQCjV+UWh8bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:39:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/9] drm/vesadrm: Prepare color management for palette-based
 framebuffers
Date: Tue, 17 Jun 2025 16:23:20 +0200
Message-ID: <20250617143649.143967-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617143649.143967-1-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Distiguish between component-based formats and 'the rest' in vesadrm's
color management. Scanout buffers with component-based format allow
for gamma correction. Palette-based formats (i.e., 'the rest') require
palette setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index ea5ca8745c27..559650a00857 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -223,15 +223,22 @@ static void vesadrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 * plane's color format.
 	 */
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
-		if (sysfb_crtc_state->format == sysfb->fb_format) {
-			if (crtc_state->gamma_lut)
-				vesadrm_load_gamma_lut(vesa,
-						       sysfb_crtc_state->format,
-						       crtc_state->gamma_lut->data);
-			else
+		switch (sysfb->fb_format->format) {
+		/*
+		 * Component formats
+		 */
+		default:
+			if (sysfb_crtc_state->format == sysfb->fb_format) {
+				if (crtc_state->gamma_lut)
+					vesadrm_load_gamma_lut(vesa,
+							       sysfb_crtc_state->format,
+							       crtc_state->gamma_lut->data);
+				else
+					vesadrm_fill_gamma_lut(vesa, sysfb_crtc_state->format);
+			} else {
 				vesadrm_fill_gamma_lut(vesa, sysfb_crtc_state->format);
-		} else {
-			vesadrm_fill_gamma_lut(vesa, sysfb_crtc_state->format);
+			}
+			break;
 		}
 	}
 }
-- 
2.49.0


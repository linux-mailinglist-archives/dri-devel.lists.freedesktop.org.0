Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD6A54D33
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33EF10E9AD;
	Thu,  6 Mar 2025 14:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="t6S+Vr5z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8u8uV1CI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t6S+Vr5z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8u8uV1CI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD6A10E9B4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:13:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08A751F787;
 Thu,  6 Mar 2025 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvYKe1PL53tncL1HepXzz3Nd1y4xvbOTBwyiq7uTibs=;
 b=t6S+Vr5z0BpM/E4uLJH1GnyOt+aJht59BNsrst5mml9qyxXsbJBoz1M2mR32Ain4qi5li2
 rxts3c+Y795pnQavn/+mzrQHRQhTZGIFpapUal62hSqtUvs+Uy7RoXCQQlvI9RPyFoIneY
 UjNmWMz2Lz0DQ+OhOyN6mHiX0Fj3FSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270393;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvYKe1PL53tncL1HepXzz3Nd1y4xvbOTBwyiq7uTibs=;
 b=8u8uV1CISrI44m4NCJsivv+YiK4PIElkFFl6FkJWGCYASX2/7mSJp3S5FudBJorvPQr1sa
 mIGbRb5zMyobZsBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvYKe1PL53tncL1HepXzz3Nd1y4xvbOTBwyiq7uTibs=;
 b=t6S+Vr5z0BpM/E4uLJH1GnyOt+aJht59BNsrst5mml9qyxXsbJBoz1M2mR32Ain4qi5li2
 rxts3c+Y795pnQavn/+mzrQHRQhTZGIFpapUal62hSqtUvs+Uy7RoXCQQlvI9RPyFoIneY
 UjNmWMz2Lz0DQ+OhOyN6mHiX0Fj3FSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270393;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvYKe1PL53tncL1HepXzz3Nd1y4xvbOTBwyiq7uTibs=;
 b=8u8uV1CISrI44m4NCJsivv+YiK4PIElkFFl6FkJWGCYASX2/7mSJp3S5FudBJorvPQr1sa
 mIGbRb5zMyobZsBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B314D13A91;
 Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GOtoKnityWeveQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 11/11] fbdev: Remove constants of unused events
Date: Thu,  6 Mar 2025 15:05:53 +0100
Message-ID: <20250306140947.580324-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

The constants FB_EVENT_MODE_CHANGE and FB_EVENT_BLANK are unused.
Remove them from the header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index d45bd220cb8f..2497321e30bb 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -129,18 +129,12 @@ struct fb_cursor_user {
  * Register/unregister for framebuffer events
  */
 
-/*	The resolution of the passed in fb_info about to change */
-#define FB_EVENT_MODE_CHANGE		0x01
-
 #ifdef CONFIG_GUMSTIX_AM200EPD
 /* only used by mach-pxa/am200epd.c */
 #define FB_EVENT_FB_REGISTERED          0x05
 #define FB_EVENT_FB_UNREGISTERED        0x06
 #endif
 
-/*      A display blank is requested       */
-#define FB_EVENT_BLANK                  0x09
-
 struct fb_event {
 	struct fb_info *info;
 	void *data;
-- 
2.48.1


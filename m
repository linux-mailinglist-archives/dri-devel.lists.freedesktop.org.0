Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481EB29F80
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9310E426;
	Mon, 18 Aug 2025 10:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sJiA3U+Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5tDbxFiQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sJiA3U+Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5tDbxFiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A4210E426
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45EC91F453;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
 b=sJiA3U+YIdigkzfeNGN6rSA6X5y7QA5l3KK10Kmq7tLmRWoQ4MFDVEPvbfGqmowbcK0RkW
 VSkmYYCh2F50w/xmSOq6mwci5PHB6pJF8gndrNfavnP1V5WrFTqN869KXGSsJ3AxMFKvIY
 PJV+7AWAzsUkSCCH7atBkThKc7U4n6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
 b=5tDbxFiQ3zTYfX/mEe/DMBZAn9n++AvUbkzMCb4o7A2nQf8tMEKfFJVCUWWLInDW5hvHk8
 PpBMKawV1Ri3EsAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
 b=sJiA3U+YIdigkzfeNGN6rSA6X5y7QA5l3KK10Kmq7tLmRWoQ4MFDVEPvbfGqmowbcK0RkW
 VSkmYYCh2F50w/xmSOq6mwci5PHB6pJF8gndrNfavnP1V5WrFTqN869KXGSsJ3AxMFKvIY
 PJV+7AWAzsUkSCCH7atBkThKc7U4n6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlwBaOHMbntngllLxUjfFjKuq9yqNdldF6MaODxPOy0=;
 b=5tDbxFiQ3zTYfX/mEe/DMBZAn9n++AvUbkzMCb4o7A2nQf8tMEKfFJVCUWWLInDW5hvHk8
 PpBMKawV1Ri3EsAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1522F13A73;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OBTxA0kFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/6] fbcon: Fix empty lines in fbcon.h
Date: Mon, 18 Aug 2025 12:36:36 +0200
Message-ID: <20250818104655.235001-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Add and remove empty lines as necessary to fix coding style. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 4d97e6d8a16a..c535d8f84356 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -87,6 +87,7 @@ struct fbcon_ops {
 	u32    cursor_size;
 	u32    fd_size;
 };
+
     /*
      *  Attribute Decoding
      */
@@ -106,7 +107,6 @@ struct fbcon_ops {
 	((s) & 0x400)
 #define attr_blink(s) \
 	((s) & 0x8000)
-	
 
 static inline int mono_col(const struct fb_info *info)
 {
-- 
2.50.1


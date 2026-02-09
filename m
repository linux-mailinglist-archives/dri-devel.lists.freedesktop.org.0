Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDLvAFQIimluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:16:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D631126B1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E6910E430;
	Mon,  9 Feb 2026 16:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yww2QzeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFEEXYVQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yww2QzeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GFEEXYVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C004D10E430
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 16:16:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6DF0A3E6FF;
 Mon,  9 Feb 2026 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770653774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X86IAh52a94rH8KQhJRtN5yCtrGXFChcLrcOuLe7rtg=;
 b=yww2QzeEvSskfSPAmRcIyoR7midu0P4M/jDxSniwcH8604TGzr7Wbk0/flStvQsiQf5lFW
 JegooLmiBfleDyjB0CRJDnCV0Tii8qbwstEWWfMU/LiLyi45Vw2nL2DqFb9YHlEegD3aLt
 97brbKaSV+MRg292pc0+FiuVkbHTyKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770653774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X86IAh52a94rH8KQhJRtN5yCtrGXFChcLrcOuLe7rtg=;
 b=GFEEXYVQ5qOXfo3KovAVxMn8j3hB8WL9C/rpZUdakbqlKnGHJuot8HBAWI84hAvH/CjfOR
 UkWkFtM3lvd1QIAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yww2QzeE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GFEEXYVQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770653774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X86IAh52a94rH8KQhJRtN5yCtrGXFChcLrcOuLe7rtg=;
 b=yww2QzeEvSskfSPAmRcIyoR7midu0P4M/jDxSniwcH8604TGzr7Wbk0/flStvQsiQf5lFW
 JegooLmiBfleDyjB0CRJDnCV0Tii8qbwstEWWfMU/LiLyi45Vw2nL2DqFb9YHlEegD3aLt
 97brbKaSV+MRg292pc0+FiuVkbHTyKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770653774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X86IAh52a94rH8KQhJRtN5yCtrGXFChcLrcOuLe7rtg=;
 b=GFEEXYVQ5qOXfo3KovAVxMn8j3hB8WL9C/rpZUdakbqlKnGHJuot8HBAWI84hAvH/CjfOR
 UkWkFtM3lvd1QIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E9793EA63;
 Mon,  9 Feb 2026 16:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WD3uCU4IimlcYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 16:16:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	geert@linux-m68k.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: [PATCH] fbcon: Remove struct fbcon_display.inverse
Date: Mon,  9 Feb 2026 17:15:43 +0100
Message-ID: <20260209161609.251510-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:geert@linux-m68k.org,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,linux-m68k.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 51D631126B1
X-Rspamd-Action: no action

The field inverse in struct fbcon_display is unused. Remove it.

The field apparently never did anything. Commit c7ef5e285c84 ("video:
fbdev: atari: Fix inverse handling") converted its final user to call
fb_invert_cmaps() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: c7ef5e285c84 ("video: fbdev: atari: Fix inverse handling")
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v6.0+
---
 drivers/video/fbdev/core/fbcon.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 1cd10a7faab0..fca14e9b729b 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -30,7 +30,6 @@ struct fbcon_display {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
     u_short scrollmode;             /* Scroll Method, use fb_scrollmode() */
 #endif
-    u_short inverse;                /* != 0 text black on white as default */
     short yscroll;                  /* Hardware scrolling */
     int vrows;                      /* number of virtual rows */
     int cursor_shape;
-- 
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDFCACDE2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7849310E421;
	Mon,  8 Dec 2025 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GNlSvCO/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="klEqEbXD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GNlSvCO/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="klEqEbXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AAC10E428
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:29:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DF74336D2;
 Mon,  8 Dec 2025 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELQjSzlIeejBBqU4pR7dmh0DEIoe4QyJRdFXyn2OpCg=;
 b=GNlSvCO/9QfnaWvdncPetLph2KwLZzmN2CrA3zfQW8BX4yOh2teCe5DsNyVcXgVpiUdBxj
 y2BlmM64swFF0WjN5vFwnaiNnR7Yx8UtZr4v+jLzwGwUyXtNXyVEfkyttNpDeMG79q2RgQ
 kMt3ks0D3w8Va39jNtlq5OYjreHmeqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELQjSzlIeejBBqU4pR7dmh0DEIoe4QyJRdFXyn2OpCg=;
 b=klEqEbXDGCQPH7HPYXYkAY6mru+Xj4aICioqyGxXLLW9NwAOlqh9EztX5OH6CBzosfdynL
 74XfDW6i24U91MBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELQjSzlIeejBBqU4pR7dmh0DEIoe4QyJRdFXyn2OpCg=;
 b=GNlSvCO/9QfnaWvdncPetLph2KwLZzmN2CrA3zfQW8BX4yOh2teCe5DsNyVcXgVpiUdBxj
 y2BlmM64swFF0WjN5vFwnaiNnR7Yx8UtZr4v+jLzwGwUyXtNXyVEfkyttNpDeMG79q2RgQ
 kMt3ks0D3w8Va39jNtlq5OYjreHmeqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELQjSzlIeejBBqU4pR7dmh0DEIoe4QyJRdFXyn2OpCg=;
 b=klEqEbXDGCQPH7HPYXYkAY6mru+Xj4aICioqyGxXLLW9NwAOlqh9EztX5OH6CBzosfdynL
 74XfDW6i24U91MBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BB3B3EA66;
 Mon,  8 Dec 2025 10:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aJAKEWeoNmm7VQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 10:28:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, simona@ffwll.ch,
 airlied@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] vt: Remove con_debug_enter/_leave from struct consw
Date: Mon,  8 Dec 2025 11:17:34 +0100
Message-ID: <20251208102851.40894-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208102851.40894-1-tzimmermann@suse.de>
References: <20251208102851.40894-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,ffwll.ch,gmail.com];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
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

There are no implementations of con_debug_enter and con_debug_leave.
Remove the callbacks from struct consw and clean up the caller.

This is a functional revert of commit b45cfba4e900 ("vt,console,kdb:
implement atomic console enter/leave functions").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/tty/vt/vt.c     | 30 +-----------------------------
 include/linux/console.h |  8 --------
 2 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 86a510e5f3d7..0bc3ea12b415 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -187,19 +187,12 @@ static DECLARE_WORK(con_driver_unregister_work, con_driver_unregister_callback);
  * fg_console is the current virtual console,
  * last_console is the last used one,
  * want_console is the console we want to switch to,
- * saved_* variants are for save/restore around kernel debugger enter/leave
  */
 int fg_console;
 EXPORT_SYMBOL(fg_console);
 int last_console;
 int want_console = -1;
 
-static int saved_fg_console;
-static int saved_last_console;
-static int saved_want_console;
-static int saved_vc_mode;
-static int saved_console_blanked;
-
 /*
  * For each existing display, we have a pointer to console currently visible
  * on that display, allowing consoles other than fg_console to be refreshed
@@ -4287,15 +4280,6 @@ EXPORT_SYMBOL(con_is_visible);
  */
 void con_debug_enter(struct vc_data *vc)
 {
-	saved_fg_console = fg_console;
-	saved_last_console = last_console;
-	saved_want_console = want_console;
-	saved_vc_mode = vc->vc_mode;
-	saved_console_blanked = console_blanked;
-	vc->vc_mode = KD_TEXT;
-	console_blanked = 0;
-	if (vc->vc_sw->con_debug_enter)
-		vc->vc_sw->con_debug_enter(vc);
 #ifdef CONFIG_KGDB_KDB
 	/* Set the initial LINES variable if it is not already set */
 	if (vc->vc_rows < 999) {
@@ -4335,19 +4319,7 @@ EXPORT_SYMBOL_GPL(con_debug_enter);
  * was invoked.
  */
 void con_debug_leave(void)
-{
-	struct vc_data *vc;
-
-	fg_console = saved_fg_console;
-	last_console = saved_last_console;
-	want_console = saved_want_console;
-	console_blanked = saved_console_blanked;
-	vc_cons[fg_console].d->vc_mode = saved_vc_mode;
-
-	vc = vc_cons[fg_console].d;
-	if (vc->vc_sw->con_debug_leave)
-		vc->vc_sw->con_debug_leave(vc);
-}
+{ }
 EXPORT_SYMBOL_GPL(con_debug_leave);
 
 static int do_register_con_driver(const struct consw *csw, int first, int last)
diff --git a/include/linux/console.h b/include/linux/console.h
index 031a58dc2b91..99d67fc41fb5 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -78,12 +78,6 @@ enum vc_intensity;
  *		characters. (optional)
  * @con_invert_region: invert a region of length @count on @vc starting at @p.
  *		(optional)
- * @con_debug_enter: prepare the console for the debugger. This includes, but
- *		is not limited to, unblanking the console, loading an
- *		appropriate palette, and allowing debugger generated output.
- *		(optional)
- * @con_debug_leave: restore the console to its pre-debug state as closely as
- *		possible. (optional)
  */
 struct consw {
 	struct module *owner;
@@ -122,8 +116,6 @@ struct consw {
 			enum vc_intensity intensity,
 			bool blink, bool underline, bool reverse, bool italic);
 	void	(*con_invert_region)(struct vc_data *vc, u16 *p, int count);
-	void	(*con_debug_enter)(struct vc_data *vc);
-	void	(*con_debug_leave)(struct vc_data *vc);
 };
 
 extern const struct consw *conswitchp;
-- 
2.52.0


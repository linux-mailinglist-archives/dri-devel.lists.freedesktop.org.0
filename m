Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261BB91822
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D376710E4AE;
	Mon, 22 Sep 2025 13:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="V4olzZ1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jb4G78GC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V4olzZ1s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jb4G78GC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D686A10E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 13:49:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 349621F79A;
 Mon, 22 Sep 2025 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758548949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7TzD8bMv0gdipWLQ/wOu3P08SLqKkylmdgnKiucqS+8=;
 b=V4olzZ1sVE6zlzQYJ9cqO2/GPIzc9f3v/C2WFa3nzC07/9UtK46eNSkp5Q+ZODqBIcq7km
 VxYXSBdkebX8PDURYy9lLZwtWInJuB8+7hav0DHWYEpCDNcaQOhJ/5cWcuQLGVOUdgfu0I
 2zCXR0pnzQPp4LmEf8mhpKM+JwofUU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758548949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7TzD8bMv0gdipWLQ/wOu3P08SLqKkylmdgnKiucqS+8=;
 b=Jb4G78GCOKJ7HMid6++qn5pfiNCZTNmUiXh/eihDkAn76Kw5FJyRTcWWt9V5qNxyIgl0A2
 vgE6apw3X4EBX/Bw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V4olzZ1s;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jb4G78GC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758548949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7TzD8bMv0gdipWLQ/wOu3P08SLqKkylmdgnKiucqS+8=;
 b=V4olzZ1sVE6zlzQYJ9cqO2/GPIzc9f3v/C2WFa3nzC07/9UtK46eNSkp5Q+ZODqBIcq7km
 VxYXSBdkebX8PDURYy9lLZwtWInJuB8+7hav0DHWYEpCDNcaQOhJ/5cWcuQLGVOUdgfu0I
 2zCXR0pnzQPp4LmEf8mhpKM+JwofUU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758548949;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7TzD8bMv0gdipWLQ/wOu3P08SLqKkylmdgnKiucqS+8=;
 b=Jb4G78GCOKJ7HMid6++qn5pfiNCZTNmUiXh/eihDkAn76Kw5FJyRTcWWt9V5qNxyIgl0A2
 vgE6apw3X4EBX/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C067313A63;
 Mon, 22 Sep 2025 13:49:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uN1KLdRT0WguAgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 13:49:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, samasth.norway.ananda@oracle.com,
 simona@ffwll.ch, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Qianqiang Liu <qianqiang.liu@163.com>,
 Shixiong Ou <oushixiong@kylinos.cn>, Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org, Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH] fbcon: Fix OOB access in font allocation
Date: Mon, 22 Sep 2025 15:45:54 +0200
Message-ID: <20250922134619.257684-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[16]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,oracle.com,ffwll.ch,gmx.de];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[163.com,gmx.de]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,oracle.com,linuxfoundation.org,linux.intel.com,ravnborg.org,163.com,kylinos.cn,kernel.org,c64.rulez.org];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 intel.com:email, imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 349621F79A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

Commit 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
introduced an out-of-bounds access by storing data and allocation sizes
in the same variable. Restore the old size calculation and use the new
variable 'alloc_size' for the allocation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15020
Cc: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: George Kennedy <george.kennedy@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Qianqiang Liu <qianqiang.liu@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>
Cc: Kees Cook <kees@kernel.org>
Cc: <stable@vger.kernel.org> # v5.9+
Cc: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/fbcon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 5fade44931b8..c1c0cdd7597c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2518,7 +2518,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	unsigned charcount = font->charcount;
 	int w = font->width;
 	int h = font->height;
-	int size;
+	int size, alloc_size;
 	int i, csum;
 	u8 *new_data, *data = font->data;
 	int pitch = PITCH(font->width);
@@ -2551,10 +2551,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 		return -EINVAL;
 
 	/* Check for overflow in allocation size calculation */
-	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
+	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &alloc_size))
 		return -EINVAL;
 
-	new_data = kmalloc(size, GFP_USER);
+	new_data = kmalloc(alloc_size, GFP_USER);
 
 	if (!new_data)
 		return -ENOMEM;
-- 
2.51.0


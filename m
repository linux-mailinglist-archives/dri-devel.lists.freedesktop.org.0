Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKseAPeapWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314B1DA774
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70C910E4FF;
	Mon,  2 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b/u9Tzrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bzrEPAw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b/u9Tzrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bzrEPAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E543B10E505
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 509533F7F5;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
 b=b/u9Tzrl23HDfTAr90zvkPHr63R035p7r+FyICMT8ZQumcqWU7eL5ecb8SV9Qj707+IxWd
 0mG2lZPPuPv7AWQ+RFmu9jqwilsqx2tnYrQnFQnL3q59u+iJe7RfoxlnjS77aYfgSpilN/
 8F1+6GWa42fXkNqlOaeAtjY0TTco9Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
 b=2bzrEPAw0didfkJOyLaWaBHQqwWbt6TQuxMZyJFJg7tRuKaPumkoNQnUl9UElDqZMcuxS9
 2yJmNa3twN6Rq/Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="b/u9Tzrl";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2bzrEPAw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
 b=b/u9Tzrl23HDfTAr90zvkPHr63R035p7r+FyICMT8ZQumcqWU7eL5ecb8SV9Qj707+IxWd
 0mG2lZPPuPv7AWQ+RFmu9jqwilsqx2tnYrQnFQnL3q59u+iJe7RfoxlnjS77aYfgSpilN/
 8F1+6GWa42fXkNqlOaeAtjY0TTco9Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
 b=2bzrEPAw0didfkJOyLaWaBHQqwWbt6TQuxMZyJFJg7tRuKaPumkoNQnUl9UElDqZMcuxS9
 2yJmNa3twN6Rq/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E39B3EA6C;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QND9Be2apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/13] lib/fonts: Remove trailing whitespaces
Date: Mon,  2 Mar 2026 15:08:39 +0100
Message-ID: <20260302141255.518657-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
References: <20260302141255.518657-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 9314B1DA774
X-Rspamd-Action: no action

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 lib/fonts/font_acorn_8x8.c | 2 +-
 lib/fonts/font_mini_4x6.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 18755c33d249..af5fa72aa8b7 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -68,7 +68,7 @@ static const struct font_data acorndata_8x8 = {
 /* 3A */  0x00, 0x00, 0x18, 0x18, 0x00, 0x18, 0x18, 0x00, /* : */
 /* 3B */  0x00, 0x00, 0x18, 0x18, 0x00, 0x18, 0x18, 0x30, /* ; */
 /* 3C */  0x0C, 0x18, 0x30, 0x60, 0x30, 0x18, 0x0C, 0x00, /* < */
-/* 3D */  0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00, /* = */ 
+/* 3D */  0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00, /* = */
 /* 3E */  0x30, 0x18, 0x0C, 0x06, 0x0C, 0x18, 0x30, 0x00, /* > */
 /* 3F */  0x3C, 0x66, 0x0C, 0x18, 0x18, 0x00, 0x18, 0x00, /* ? */
 /* 40 */  0x3C, 0x66, 0x6E, 0x6A, 0x6E, 0x60, 0x3C, 0x00, /* @ */
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index 8d39fd447952..cc21dc70cfd1 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -18,15 +18,15 @@
 s{((0x)?[0-9a-fA-F]+)(.*\[([\*\ ]{4})\])}{
 
 	($num,$pat,$bits) = ($1,$3,$4);
-	
+
 	$bits =~ s/([^\s0])|(.)/ defined($1) + 0 /ge;
-	
+
 	$num = ord(pack("B8", $bits));
 	$num |= $num >> 4;
 	$num = sprintf("0x%.2x", $num);
-	
+
 	#print "$num,$pat,$bits\n";
-	
+
 	$num . $pat;
 }ge;
 
-- 
2.53.0


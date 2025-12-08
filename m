Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338DCACDDF
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718110E424;
	Mon,  8 Dec 2025 10:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u6lB3A1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k92STsFY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u6lB3A1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k92STsFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942BD10E43F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:28:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47110211C6;
 Mon,  8 Dec 2025 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43ynIOjf0auEEzrTYZvbJmvZYZroUbYZxoCw+mldzwc=;
 b=u6lB3A1xzUjy6pZGCYvYkfVpem4UT8tgmIbFHTI/uZ5Jpk1221RjV1Uu+PSAIiEbzq6rew
 USpTnHxuKCqdabWkejkTmCLsJKZBDTia/LE8wIUrof/En40oG8Pqxv5TjzfjaPLcVqHjcU
 JS8M4HsRGfpf0/LHs/o1aobNckW80SQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43ynIOjf0auEEzrTYZvbJmvZYZroUbYZxoCw+mldzwc=;
 b=k92STsFYK04rtoKWCcS1/K4hgL7Y33mwgI/JvlcE9KeSbB2TSUCj3lZ3gq3KFgq+yvo0Di
 ibiuUJV/Jb+brmDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43ynIOjf0auEEzrTYZvbJmvZYZroUbYZxoCw+mldzwc=;
 b=u6lB3A1xzUjy6pZGCYvYkfVpem4UT8tgmIbFHTI/uZ5Jpk1221RjV1Uu+PSAIiEbzq6rew
 USpTnHxuKCqdabWkejkTmCLsJKZBDTia/LE8wIUrof/En40oG8Pqxv5TjzfjaPLcVqHjcU
 JS8M4HsRGfpf0/LHs/o1aobNckW80SQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43ynIOjf0auEEzrTYZvbJmvZYZroUbYZxoCw+mldzwc=;
 b=k92STsFYK04rtoKWCcS1/K4hgL7Y33mwgI/JvlcE9KeSbB2TSUCj3lZ3gq3KFgq+yvo0Di
 ibiuUJV/Jb+brmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEB383EA65;
 Mon,  8 Dec 2025 10:28:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4FTxOGaoNmm7VQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 10:28:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, simona@ffwll.ch,
 airlied@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] vt: Remove trailing whitespace
Date: Mon,  8 Dec 2025 11:17:33 +0100
Message-ID: <20251208102851.40894-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208102851.40894-1-tzimmermann@suse.de>
References: <20251208102851.40894-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,ffwll.ch,gmail.com];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Fix coding style in vt.c

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/tty/vt/vt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 6e0089b85c27..86a510e5f3d7 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -38,7 +38,7 @@
  *
  *     - Arno Griffioen <arno@usn.nl>
  *     - David Carter <carter@cs.bris.ac.uk>
- * 
+ *
  *   The abstract console driver provides a generic interface for a text
  *   console. It supports VGA text mode, frame buffer based graphical consoles
  *   and special graphics processors that are only accessible through some
-- 
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2AAD3465
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8C10E50C;
	Tue, 10 Jun 2025 11:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PoAQ/kJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMALhC3K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PoAQ/kJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMALhC3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD5410E509
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9700D2198A;
 Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
 b=PoAQ/kJISkgAsO2n8UpEUiOnq1x0Ah4F9e8nhBJzh34xqOY+70MDaZT6N4YjFfUaI1dEop
 SWu4xYTflEqajoJblIGdNJc2nPnMSf0fhNd1e2lMdyhwPWYb7mfEfaFbBvbMZtbh5d1853
 zKvbMd+M2CNh610VZDy5BBFB4rhBrK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
 b=FMALhC3KJfL2IayFNPBOeGXAlSChQWkCjxBuX8Jp0Z0Ct8F+5PZXzpdZ6l/kKz14HtG8Wc
 D4dgfeFskIP4zUCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
 b=PoAQ/kJISkgAsO2n8UpEUiOnq1x0Ah4F9e8nhBJzh34xqOY+70MDaZT6N4YjFfUaI1dEop
 SWu4xYTflEqajoJblIGdNJc2nPnMSf0fhNd1e2lMdyhwPWYb7mfEfaFbBvbMZtbh5d1853
 zKvbMd+M2CNh610VZDy5BBFB4rhBrK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
 b=FMALhC3KJfL2IayFNPBOeGXAlSChQWkCjxBuX8Jp0Z0Ct8F+5PZXzpdZ6l/kKz14HtG8Wc
 D4dgfeFskIP4zUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46A2A13A17;
 Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6DXrD/8QSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/14] fbdev/sisfb: Unexport symbols
Date: Tue, 10 Jun 2025 12:56:45 +0200
Message-ID: <20250610105948.384540-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Fix the compile-time warning

  drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 75033e6be15a..1802d109d8f2 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6832,12 +6832,3 @@ MODULE_PARM_DESC(videoram,
 #endif
 
 #endif 	   /*  /MODULE  */
-
-/* _GPL only for new symbols. */
-EXPORT_SYMBOL(sis_malloc);
-EXPORT_SYMBOL(sis_free);
-EXPORT_SYMBOL_GPL(sis_malloc_new);
-EXPORT_SYMBOL_GPL(sis_free_new);
-
-
-
-- 
2.49.0


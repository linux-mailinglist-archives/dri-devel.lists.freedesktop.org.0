Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A651BD2AD8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2410E1E6;
	Mon, 13 Oct 2025 10:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hwkGlBiB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rh8DHwgJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwkGlBiB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rh8DHwgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFC110E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:58:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0567A1F385;
 Mon, 13 Oct 2025 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760353122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Om6ZPfjwSlp6q2PwWF0jqfHJqAEmmliy824FFBE3R1Y=;
 b=hwkGlBiBohy06ULTNqZjH473CHvo48xnxWYXF13HAaxeNu5DpOCLhAN0pDNkuv2B4MbP2j
 gDrYa/p+96PBu9em0LSiIrC3eKN/b4WRTxGFdlJeXx59gdrU/7KzhwY66b3ctLsFUTLSDq
 R3VTItngpPuV7ZiAonK/vBESYdwHMxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760353122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Om6ZPfjwSlp6q2PwWF0jqfHJqAEmmliy824FFBE3R1Y=;
 b=Rh8DHwgJc+XBTCQqHh6WkBpSJF51UBk2i3iuOaZvbTdH7TTjeOmatr8MvRjMcMV2m9Ix87
 SkuQO31Rz24vm4Dg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hwkGlBiB;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rh8DHwgJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760353122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Om6ZPfjwSlp6q2PwWF0jqfHJqAEmmliy824FFBE3R1Y=;
 b=hwkGlBiBohy06ULTNqZjH473CHvo48xnxWYXF13HAaxeNu5DpOCLhAN0pDNkuv2B4MbP2j
 gDrYa/p+96PBu9em0LSiIrC3eKN/b4WRTxGFdlJeXx59gdrU/7KzhwY66b3ctLsFUTLSDq
 R3VTItngpPuV7ZiAonK/vBESYdwHMxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760353122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Om6ZPfjwSlp6q2PwWF0jqfHJqAEmmliy824FFBE3R1Y=;
 b=Rh8DHwgJc+XBTCQqHh6WkBpSJF51UBk2i3iuOaZvbTdH7TTjeOmatr8MvRjMcMV2m9Ix87
 SkuQO31Rz24vm4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C58CF1374A;
 Mon, 13 Oct 2025 10:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zwzSLmHb7GhRRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Oct 2025 10:58:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH] backlight: Do not include <linux/fb.h> in header file
Date: Mon, 13 Oct 2025 12:51:57 +0200
Message-ID: <20251013105553.836715-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0567A1F385
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

The backlight interfaces don't require anything from <linux/fb.h>, so
don't include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
---
This patch got dropped from a previous series, [1] as it depended
on changes in other trees. With v6.18-rc1 out, this should no longer
be a problem.

[1] https://patchwork.freedesktop.org/series/150454/
---
 include/linux/backlight.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10e626db7eee..f29a9ef1052e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -10,7 +10,6 @@
 #define _LINUX_BACKLIGHT_H
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.51.0


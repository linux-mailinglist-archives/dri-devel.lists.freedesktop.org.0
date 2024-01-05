Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257E824FD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 09:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411AA10E17B;
	Fri,  5 Jan 2024 08:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0B210E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 08:27:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5ECE221D6C;
 Fri,  5 Jan 2024 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704443236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OpN6EeaaI04pvefAUfwHCq17LW8bm3ZkYcph1u3TrWk=;
 b=YWXIh4PytI66QY1Aik9gtWgfKZPY+FsbyO2D0D5lZ2ZoFfmSRQBfLWTd0U90tEtAwwLA53
 vGwvlUiQvaarBO6L2m+Pekc063DOAuRLLZBx/j74Ccn0POrgwJ0XP1wa0+A9pOYrXJTjaO
 Knu+qL2x24V+qs1nCwX+FbqlcoZQ4GM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704443236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OpN6EeaaI04pvefAUfwHCq17LW8bm3ZkYcph1u3TrWk=;
 b=5xysmEJqrZXEPvZyx5P0AGe9F//mUBArK6keeaaA1P5D/hBkogjK51ycf9VB69oaAlLOCo
 3k09CYi2x1VB60Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704443236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OpN6EeaaI04pvefAUfwHCq17LW8bm3ZkYcph1u3TrWk=;
 b=YWXIh4PytI66QY1Aik9gtWgfKZPY+FsbyO2D0D5lZ2ZoFfmSRQBfLWTd0U90tEtAwwLA53
 vGwvlUiQvaarBO6L2m+Pekc063DOAuRLLZBx/j74Ccn0POrgwJ0XP1wa0+A9pOYrXJTjaO
 Knu+qL2x24V+qs1nCwX+FbqlcoZQ4GM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704443236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OpN6EeaaI04pvefAUfwHCq17LW8bm3ZkYcph1u3TrWk=;
 b=5xysmEJqrZXEPvZyx5P0AGe9F//mUBArK6keeaaA1P5D/hBkogjK51ycf9VB69oaAlLOCo
 3k09CYi2x1VB60Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C674137E8;
 Fri,  5 Jan 2024 08:27:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id R9LyCGS9l2X7PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jan 2024 08:27:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: Fix caching setup for remapped video memory
Date: Fri,  5 Jan 2024 09:25:17 +0100
Message-ID: <20240105082714.21881-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.49
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5ECE221D6C
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YWXIh4Py;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5xysmEJq
X-Spam-Level: *
X-Spamd-Bar: +
X-Spam-Flag: NO
X-Spamd-Result: default: False [1.49 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCPT_COUNT_FIVE(0.00)[5];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[23.48%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I/O video memory for the framebuffer supports write-combine caching
mode. Simplify the driver's code that sets up the caching mode.

 * Map video memory with ioremap_wc(), which automatically sets up
the PAT entry with write-combine caching.

 * Remove the now obsolete call to devm_arch_io_reserve_memtype_wc().
It is only required to mmap the video memory to user space, which the
driver doesn't do.

 * According to the PAT documentation, arch_phys_wc_add() is best
called after remapping I/O memory, so move it after ioremap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 2fb18b782b05..54fce00e2136 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -146,14 +146,13 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	}
 	mdev->vram_res = res;
 
-	/* Don't fail on errors, but performance might be reduced. */
-	devm_arch_io_reserve_memtype_wc(dev->dev, res->start, resource_size(res));
-	devm_arch_phys_wc_add(dev->dev, res->start, resource_size(res));
-
-	mdev->vram = devm_ioremap(dev->dev, res->start, resource_size(res));
+	mdev->vram = devm_ioremap_wc(dev->dev, res->start, resource_size(res));
 	if (!mdev->vram)
 		return -ENOMEM;
 
+	/* Don't fail on errors, but performance might be reduced. */
+	devm_arch_phys_wc_add(dev->dev, res->start, resource_size(res));
+
 	return 0;
 }
 
-- 
2.43.0


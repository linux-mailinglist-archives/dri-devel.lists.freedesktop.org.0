Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7FA500FB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D520F10E7AF;
	Wed,  5 Mar 2025 13:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EFp+a6xD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4b51rHc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EFp+a6xD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4b51rHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F4610E781
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4F9921196;
 Wed,  5 Mar 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9NzZJGC0pCm6rJRIyrEaoN1qpiJG19B/B41IXjt8U04=;
 b=EFp+a6xD+WHm54lM0PM5YS+d4NshGLPxfa1x7hbEEUG/YfmL5j2kUU4NIYcBjuu8xxuFKo
 qGugAXwiqgGjSVBTuPzAZyxIw2Mcll0p0x9fQZe0e/jSYAWleihUre0rQrhpc61kIX496/
 ATz9diSsHGUCICk14I6VNh3cPVFtNTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9NzZJGC0pCm6rJRIyrEaoN1qpiJG19B/B41IXjt8U04=;
 b=+4b51rHchraJEMjyUjM8at0elm0aFyH6UpJBgDzTJ+bXHwv9IUOx5yeN0VFVIFJP0U4OOb
 iw3eOVEfIhw3ArBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EFp+a6xD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+4b51rHc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9NzZJGC0pCm6rJRIyrEaoN1qpiJG19B/B41IXjt8U04=;
 b=EFp+a6xD+WHm54lM0PM5YS+d4NshGLPxfa1x7hbEEUG/YfmL5j2kUU4NIYcBjuu8xxuFKo
 qGugAXwiqgGjSVBTuPzAZyxIw2Mcll0p0x9fQZe0e/jSYAWleihUre0rQrhpc61kIX496/
 ATz9diSsHGUCICk14I6VNh3cPVFtNTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9NzZJGC0pCm6rJRIyrEaoN1qpiJG19B/B41IXjt8U04=;
 b=+4b51rHchraJEMjyUjM8at0elm0aFyH6UpJBgDzTJ+bXHwv9IUOx5yeN0VFVIFJP0U4OOb
 iw3eOVEfIhw3ArBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF7331366F;
 Wed,  5 Mar 2025 13:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EGZ8KdJVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/ast: Various changes for video memory
Date: Wed,  5 Mar 2025 14:35:40 +0100
Message-ID: <20250305134401.60609-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4F9921196
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Various changes to detecting and organizing video memory on Aspeed
hardware. Resolves code duplication and cruft.

Patches 1 to 3 do a number of cleanups to the code for detecting
the size of the video memory. Patches 4 to 7 provide helpers for
calculating framebuffer and cursor locations within the video
memory.

Tested on AST2600 hardware.

Thomas Zimmermann (7):
  drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_ constants
  drm/ast: Add VGACRAA register constants
  drm/ast: Add VGACR99 register constants
  drm/ast: cursor: Add helpers for computing location in video memory
  drm/ast: Add helper for computing framebuffer location in video memory
  drm/ast: Remove vram_fb_available from struct ast_device
  drm/ast: cursor: Drop page alignment

 drivers/gpu/drm/ast/ast_cursor.c | 36 +++++++++++++++++++-------------
 drivers/gpu/drm/ast/ast_drv.h    | 13 +-----------
 drivers/gpu/drm/ast/ast_mm.c     | 26 +++++++++++------------
 drivers/gpu/drm/ast/ast_mode.c   | 25 ++++++++++++++++++----
 drivers/gpu/drm/ast/ast_post.c   | 24 ++++++++++-----------
 drivers/gpu/drm/ast/ast_reg.h    |  2 ++
 6 files changed, 69 insertions(+), 57 deletions(-)

-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F338A504FF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621310E804;
	Wed,  5 Mar 2025 16:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ukjIpgph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOVgLRhU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ukjIpgph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOVgLRhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB1610E801
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D29D211B1;
 Wed,  5 Mar 2025 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aB80VKXn7kteY9+LGUxpjeH+y0uw4fZJEEZ1W7ophr0=;
 b=ukjIpgph9qfRtDC8+cHOxF4TIzd/0xKMANwRswPvzj9jlndsi6x8X5yt03sd1Wrvai4U6A
 EC5UmT5ZJqXY8DK5rDwLCKJLPXv3H2hJLGa1PNLFrpmqkylesbc6LfQxWKtZFpUQYJGI0u
 7k2pUVCBq0vQUppfDeM+iZF1+EYcehQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aB80VKXn7kteY9+LGUxpjeH+y0uw4fZJEEZ1W7ophr0=;
 b=cOVgLRhU+Z80Zsiy0AjMn5RIq4lydAwnAZ9RDz1EGsEpeHskyrQNZTFVvpGDEbuU4xDv41
 0tDainxVE+3GQKDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aB80VKXn7kteY9+LGUxpjeH+y0uw4fZJEEZ1W7ophr0=;
 b=ukjIpgph9qfRtDC8+cHOxF4TIzd/0xKMANwRswPvzj9jlndsi6x8X5yt03sd1Wrvai4U6A
 EC5UmT5ZJqXY8DK5rDwLCKJLPXv3H2hJLGa1PNLFrpmqkylesbc6LfQxWKtZFpUQYJGI0u
 7k2pUVCBq0vQUppfDeM+iZF1+EYcehQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aB80VKXn7kteY9+LGUxpjeH+y0uw4fZJEEZ1W7ophr0=;
 b=cOVgLRhU+Z80Zsiy0AjMn5RIq4lydAwnAZ9RDz1EGsEpeHskyrQNZTFVvpGDEbuU4xDv41
 0tDainxVE+3GQKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C35A1366F;
 Wed,  5 Mar 2025 16:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kYHwGDl9yGfxfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/7]  drm/ast: Various changes for video memory
Date: Wed,  5 Mar 2025 17:30:39 +0100
Message-ID: <20250305163207.267650-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
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

Various changes to detecting and organizing video memory on Aspeed
hardware. Resolves code duplication and cruft.

Patches 1 to 3 do a number of cleanups to the code for detecting
the size of the video memory. Patches 4 to 7 provide helpers for
calculating framebuffer and cursor locations within the video
memory.

Tested on AST2600 hardware.

v2:
- initialize cursor-plane size

Thomas Zimmermann (7):
  drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_ constants
  drm/ast: Add VGACRAA register constants
  drm/ast: Add VGACR99 register constants
  drm/ast: cursor: Add helpers for computing location in video memory
  drm/ast: Add helper for computing framebuffer location in video memory
  drm/ast: Remove vram_fb_available from struct ast_device
  drm/ast: cursor: Drop page alignment

 drivers/gpu/drm/ast/ast_cursor.c | 39 +++++++++++++++++++-------------
 drivers/gpu/drm/ast/ast_drv.h    | 13 +----------
 drivers/gpu/drm/ast/ast_mm.c     | 26 ++++++++++-----------
 drivers/gpu/drm/ast/ast_mode.c   | 25 ++++++++++++++++----
 drivers/gpu/drm/ast/ast_post.c   | 24 ++++++++++----------
 drivers/gpu/drm/ast/ast_reg.h    |  2 ++
 6 files changed, 71 insertions(+), 58 deletions(-)

-- 
2.48.1


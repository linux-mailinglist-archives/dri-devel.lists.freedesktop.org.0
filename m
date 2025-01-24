Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C464A1B145
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA2710E2C2;
	Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nUR+K3U7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ltL2I38T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nUR+K3U7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ltL2I38T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9310E2C2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0D3F21166;
 Fri, 24 Jan 2025 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMKa/DYbKUmZX8q+SwZjUcXovSJA//bG8DZR1FdGyuU=;
 b=nUR+K3U7zJol/w850vx3BLudtCLu+oDk8dpICMZBJPdFjRhtNc/n2AHzIX5XCWXZHL3cgU
 h7fL33ofOrb7DJ/f7IlxBaSGbjJw/J8L0SeqMOl0gT1gP1C7/uAWa8QUbEaBcYb9i2EixW
 85ojC4CkgimUQK9PXBdc60f3rON/D34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMKa/DYbKUmZX8q+SwZjUcXovSJA//bG8DZR1FdGyuU=;
 b=ltL2I38TkFXpHMEf/TTd4v36cdvafKA1EoE9QlIfiduEnJT4pcWJ1F2QlV4mBleYxPE9iQ
 sCSzkNW7+D+Z44Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMKa/DYbKUmZX8q+SwZjUcXovSJA//bG8DZR1FdGyuU=;
 b=nUR+K3U7zJol/w850vx3BLudtCLu+oDk8dpICMZBJPdFjRhtNc/n2AHzIX5XCWXZHL3cgU
 h7fL33ofOrb7DJ/f7IlxBaSGbjJw/J8L0SeqMOl0gT1gP1C7/uAWa8QUbEaBcYb9i2EixW
 85ojC4CkgimUQK9PXBdc60f3rON/D34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMKa/DYbKUmZX8q+SwZjUcXovSJA//bG8DZR1FdGyuU=;
 b=ltL2I38TkFXpHMEf/TTd4v36cdvafKA1EoE9QlIfiduEnJT4pcWJ1F2QlV4mBleYxPE9iQ
 sCSzkNW7+D+Z44Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B24E139CB;
 Fri, 24 Jan 2025 08:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Hjl4JN9Jk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/15] drm/ast: Clean up display-mode detection and validation
Date: Fri, 24 Jan 2025 08:57:38 +0100
Message-ID: <20250124080546.9956-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
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

The ast driver detects support for display modes from hardware features
and internal mode tables. Streamline the detection code and put all
validation into a single place.

Patches 1 to 6 refactor the code for detecting support for widescreen
modes. Regular 4:3 modes are supported by all hardware Gens; support
for widescreen modes differs among hardware Gens and individual boards.
The series moves all hardware-related code into a single helper 
function that set state flags accordingly. Other places within the
driver then refer to these flags.

Building up this, patches 7 to 15 refactor display-mode validation.
The ast driver contains a list of display modes supported by the VBIOS.
The series changes the driver to validate DRM display modes against
the VBIOS modes.

Tested on various hardware Gens and display modes.

Thomas Zimmermann (15):
  drm/ast: Remove 1152x864 from list of widescreen resolutions
  drm/ast: Align naming in widescreen detection code to manual
  drm/ast: Reorganize widescreen test around hardware Gens
  drm/ast: Rename support_widescreen to support_wsxga_p
  drm/ast: Add support_fullhd flag to struct ast_device
  drm/ast: Add support_wuxga flag to struct ast_device
  drm/ast: Always validate H/V sync flags
  drm/ast: Find VBIOS mode from regular display size
  drm/ast: Add empty initializer for VBIOS modes
  drm/ast: Add helpers for VBIOS mode lookup
  drm/ast: Validate DRM display modes against VBIOS modes
  drm/ast: Inline ast_get_vbios_mode_info()
  drm/ast: astdp: Rework display-mode setting
  drm/ast: Remove struct ast_vbios_mode_info
  drm/ast: Only look up VBIOS mode on full modesets

 drivers/gpu/drm/ast/Makefile     |   1 +
 drivers/gpu/drm/ast/ast_dp.c     | 174 +++++++++--------
 drivers/gpu/drm/ast/ast_drv.c    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h    |  30 +--
 drivers/gpu/drm/ast/ast_main.c   | 108 ++++++++---
 drivers/gpu/drm/ast/ast_mode.c   | 308 +++++++++----------------------
 drivers/gpu/drm/ast/ast_post.c   |   2 +-
 drivers/gpu/drm/ast/ast_reg.h    |  30 ++-
 drivers/gpu/drm/ast/ast_tables.h | 187 +------------------
 drivers/gpu/drm/ast/ast_vbios.c  | 261 ++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_vbios.h  | 108 +++++++++++
 11 files changed, 659 insertions(+), 552 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.h


base-commit: 9afc49c1b29a25d9efba5e29e43c9ce3986e569c
-- 
2.47.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A2A21A7F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4A10E77B;
	Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TaZ/Mlc7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VE4Dykmy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TaZ/Mlc7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VE4Dykmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E710E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEB0F21102;
 Wed, 29 Jan 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6RNYWH70aEmFezZpkiXa8aGbtjfWd3ZuxrY84c7+9qE=;
 b=TaZ/Mlc7VoEFzwLDwo9IdPNpU4vw9utJB2mLTIM+vDcBTq4pnJpLZTH5TjCshhJTuC6Nws
 /tVKED9wuerhAlr58kBvuXxVP1+Jh0497bsXjSaUmT9tG8v1RiSZnJX62oTBKMu8B7lBNw
 DvHAMF+l2qVrnS96mfpjZnWpbz33oMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6RNYWH70aEmFezZpkiXa8aGbtjfWd3ZuxrY84c7+9qE=;
 b=VE4DykmyE27nJSmCSoP7JCchxBchWrfRVeqe6mANPPtkO7omxeHnfQAg4Ml6S2es5Guc3U
 Pe4pmzlN264uMCDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6RNYWH70aEmFezZpkiXa8aGbtjfWd3ZuxrY84c7+9qE=;
 b=TaZ/Mlc7VoEFzwLDwo9IdPNpU4vw9utJB2mLTIM+vDcBTq4pnJpLZTH5TjCshhJTuC6Nws
 /tVKED9wuerhAlr58kBvuXxVP1+Jh0497bsXjSaUmT9tG8v1RiSZnJX62oTBKMu8B7lBNw
 DvHAMF+l2qVrnS96mfpjZnWpbz33oMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6RNYWH70aEmFezZpkiXa8aGbtjfWd3ZuxrY84c7+9qE=;
 b=VE4DykmyE27nJSmCSoP7JCchxBchWrfRVeqe6mANPPtkO7omxeHnfQAg4Ml6S2es5Guc3U
 Pe4pmzlN264uMCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84828137DB;
 Wed, 29 Jan 2025 09:58:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jR2PHtb7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/16] drm/ast: Clean up display-mode detection and
 validation
Date: Wed, 29 Jan 2025 10:54:46 +0100
Message-ID: <20250129095840.20629-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
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

The ast driver detects support for display modes from hardware features
and internal mode tables. Streamline the detection code and put all
validation into a single place.

Patches 1 to 6 refactor the code for detecting support for widescreen
modes. Regular 4:3 modes are supported by all hardware Gens; support
for widescreen modes differs among hardware Gens and individual boards.
The series moves all hardware-related code into a single helper 
function that set state flags accordingly. Other places within the
driver then refer to these flags.

Building upon this, patches 7 to 16 refactor display-mode validation.
The ast driver contains a list of display modes supported by the VBIOS.
The series changes the driver to validate DRM display modes against
the VBIOS modes.

Tested on various hardware Gens and display modes.

v2:
- move mode detection into helper functions (Jocelyn)
- replace various large switch statements with LUTs (Jocelyn)
- set max width/height from fullhd flag

Thomas Zimmermann (16):
  drm/ast: Remove 1152x864 from list of widescreen resolutions
  drm/ast: Align naming in widescreen detection code to manual
  drm/ast: Rename support_wide_screen to support_wsxga_p
  drm/ast: Reorganize widescreen test around hardware Gens
  drm/ast: Add support_fullhd flag to struct ast_device
  drm/ast: Add support_wuxga flag to struct ast_device
  drm/ast: Always validate H/V sync flags
  drm/ast: Find VBIOS mode from regular display size
  drm/ast: Add empty initializer for VBIOS modes
  drm/ast: Add helpers for VBIOS mode lookup
  drm/ast: Validate DRM display modes against VBIOS modes
  drm/ast: Inline ast_get_vbios_mode_info()
  drm/ast: astdp: Rework display-mode setting
  drm/ast: astdp: Look up mode index from table
  drm/ast: Remove struct ast_vbios_mode_info
  drm/ast: Only look up VBIOS mode on full modesets

 drivers/gpu/drm/ast/Makefile     |   1 +
 drivers/gpu/drm/ast/ast_dp.c     | 168 +++++++++--------
 drivers/gpu/drm/ast/ast_drv.c    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h    |  30 +--
 drivers/gpu/drm/ast/ast_main.c   | 102 +++++++---
 drivers/gpu/drm/ast/ast_mode.c   | 315 +++++++++----------------------
 drivers/gpu/drm/ast/ast_post.c   |   2 +-
 drivers/gpu/drm/ast/ast_reg.h    |  30 ++-
 drivers/gpu/drm/ast/ast_tables.h | 187 +-----------------
 drivers/gpu/drm/ast/ast_vbios.c  | 241 +++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_vbios.h  | 108 +++++++++++
 11 files changed, 628 insertions(+), 558 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.h


base-commit: 9afc49c1b29a25d9efba5e29e43c9ce3986e569c
-- 
2.48.1


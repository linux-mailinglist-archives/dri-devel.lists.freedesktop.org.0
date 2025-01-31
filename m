Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C7A23B55
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D8110EA4E;
	Fri, 31 Jan 2025 09:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hAdlxvdY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ROhqkQRi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hAdlxvdY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ROhqkQRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB59510E053
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 746071F38D;
 Fri, 31 Jan 2025 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JRKlYPppKtYo0sY18P5lBDGiHoz4qNrEozO48q4/goc=;
 b=hAdlxvdYxQNdZ2MkN7sOh57vxZYnNyWA/ptKsA2OhG3DE2Tm3cq9h9gi0zmaBiJhQUxU6B
 gipfCjKtlDf+TaEmKtl5dnbH0VyQNoNh8z9YUQbd4arfBihSEhB6sQpLV723SP1je0EhAp
 9YjvTUu+DbF520qJLD5HWwN4Wwo2i0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JRKlYPppKtYo0sY18P5lBDGiHoz4qNrEozO48q4/goc=;
 b=ROhqkQRihQeXLjD2Fm1rsNXIhrSBlcTBsrveXtoAAydnJPUcBbrAeWeNoQQwKJdiLdTUD6
 6inMhfecQUrdKFBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JRKlYPppKtYo0sY18P5lBDGiHoz4qNrEozO48q4/goc=;
 b=hAdlxvdYxQNdZ2MkN7sOh57vxZYnNyWA/ptKsA2OhG3DE2Tm3cq9h9gi0zmaBiJhQUxU6B
 gipfCjKtlDf+TaEmKtl5dnbH0VyQNoNh8z9YUQbd4arfBihSEhB6sQpLV723SP1je0EhAp
 9YjvTUu+DbF520qJLD5HWwN4Wwo2i0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JRKlYPppKtYo0sY18P5lBDGiHoz4qNrEozO48q4/goc=;
 b=ROhqkQRihQeXLjD2Fm1rsNXIhrSBlcTBsrveXtoAAydnJPUcBbrAeWeNoQQwKJdiLdTUD6
 6inMhfecQUrdKFBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CC941364B;
 Fri, 31 Jan 2025 09:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sRcYEXaWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/16] drm/ast: Clean up display-mode detection and
 validation
Date: Fri, 31 Jan 2025 10:21:00 +0100
Message-ID: <20250131092257.115596-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
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

v3:
- clarify commit messages on astdp changes (Jocelyn)
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
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
prerequisite-patch-id: 3f99a9f751f2659d0fbb07e88abc3904dca961e1
prerequisite-patch-id: 838dd5f8f6a89bda83ee22ec918adf1be2fe70e5
prerequisite-patch-id: 68d3a49734dc01e652902fe59dea1a6f79ae212f
prerequisite-patch-id: 4043e36e87c74b8fc89ce9b38fd875c6c58aa591
prerequisite-patch-id: cb8fb20896035f39d61086ac0c432b15b09130c9
prerequisite-patch-id: ca36d50bffbd3adaf5bcd6419eeca3331ac1e554
prerequisite-patch-id: 0fa92030ec82bc84b12c9614c4d043c908283a02
prerequisite-patch-id: c20dacec2a612e566e0f4be254d7ced143466d60
prerequisite-patch-id: 8264e077bed425b3945e85169ed13620c54cddc7
prerequisite-patch-id: c3705fe8a5b349da66fdaa66bd33f0b78dd154ca
-- 
2.48.1


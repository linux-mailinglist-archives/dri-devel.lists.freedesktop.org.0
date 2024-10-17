Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C39A2187
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 13:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA1C10E7F9;
	Thu, 17 Oct 2024 11:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AagwBsl1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="546Pcq2r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AagwBsl1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="546Pcq2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A0A10E7F8;
 Thu, 17 Oct 2024 11:55:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C30F1FCD8;
 Thu, 17 Oct 2024 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729166118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kR9BaCLXnlcad/67YshRlnefaKRNHgduvgR2nx5Lae8=;
 b=AagwBsl12g0Y/Dm5PjoL6+94wOwT7evCK8BoHZo7SG7nHmjjgjD4Fy4M36Jupiqu5zVH7F
 d3XWrkZ2knXsAW35AJROyGG/nsIzJHxRdOeSIRHIdhyTwsgik4oO4moO9ChyFC6HGVokPb
 dcB1MMf7piPXxz2/GSL5mZVFUY9+7rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729166118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kR9BaCLXnlcad/67YshRlnefaKRNHgduvgR2nx5Lae8=;
 b=546Pcq2rUmlzIHpt8lvcvJRJwspaLt6yD2DTQMTHpZcN9xZdwptfOIoAIwai612rAaXPSn
 JQtNYTzG6hhyaDDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729166118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kR9BaCLXnlcad/67YshRlnefaKRNHgduvgR2nx5Lae8=;
 b=AagwBsl12g0Y/Dm5PjoL6+94wOwT7evCK8BoHZo7SG7nHmjjgjD4Fy4M36Jupiqu5zVH7F
 d3XWrkZ2knXsAW35AJROyGG/nsIzJHxRdOeSIRHIdhyTwsgik4oO4moO9ChyFC6HGVokPb
 dcB1MMf7piPXxz2/GSL5mZVFUY9+7rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729166118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kR9BaCLXnlcad/67YshRlnefaKRNHgduvgR2nx5Lae8=;
 b=546Pcq2rUmlzIHpt8lvcvJRJwspaLt6yD2DTQMTHpZcN9xZdwptfOIoAIwai612rAaXPSn
 JQtNYTzG6hhyaDDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FD7B13A53;
 Thu, 17 Oct 2024 11:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AfXZJSX7EGdqdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Oct 2024 11:55:17 +0000
Date: Thu, 17 Oct 2024 13:55:16 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20241017115516.GA196624@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here are the fixes from the misc tree for this week.

Best regards
Thomas

drm-misc-fixes-2024-10-17:
Short summary of fixes pull:

ast:
- Clear EDID on unplugged connectors

host1x:
- Fix boot on Tegra186
- Set DMA parameters

mgag200:
- Revert VBLANK support

panel:
- himax-hx83192: Adjust power and gamma

qaic:
- Sgtable loop fixes

vmwgfx:
- Limit display layout allocatino size
- Handle allocation errors in connector checks
- Clean up KMS code for 2d-only setup
- Report surface-check errors correctly
- Remove NULL test around kvfree()
The following changes since commit fcddc71ec7ecf15b4df3c41288c9cf0b8e886111:

  drm/fbdev-dma: Only cleanup deferred I/O if necessary (2024-10-10 09:49:25 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-10-17

for you to fetch changes up to c09c4f2a972ca7cd9c8926594aa2099bcbcd3b79:

  drm/ast: vga: Clear EDID if no display is connected (2024-10-17 08:50:14 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

ast:
- Clear EDID on unplugged connectors

host1x:
- Fix boot on Tegra186
- Set DMA parameters

mgag200:
- Revert VBLANK support

panel:
- himax-hx83192: Adjust power and gamma

qaic:
- Sgtable loop fixes

vmwgfx:
- Limit display layout allocatino size
- Handle allocation errors in connector checks
- Clean up KMS code for 2d-only setup
- Report surface-check errors correctly
- Remove NULL test around kvfree()

----------------------------------------------------------------
Cong Yang (1):
      drm/panel: himax-hx83102: Adjust power and gamma to optimize brightness

Ian Forbes (2):
      drm/vmwgfx: Limit display layout ioctl array size to VMWGFX_NUM_DISPLAY_UNITS
      drm/vmwgfx: Handle possible ENOMEM in vmw_stdu_connector_atomic_check

Jon Hunter (1):
      gpu: host1x: Fix boot regression for Tegra

Nikolay Kuratov (1):
      drm/vmwgfx: Handle surface check failure correctly

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Fix the for loop used to walk SG table

Thierry Reding (1):
      gpu: host1x: Set up device DMA parameters

Thomas Zimmermann (3):
      Revert "drm/mgag200: Add vblank support"
      drm/ast: sil164: Clear EDID if no display is connected
      drm/ast: vga: Clear EDID if no display is connected

Thorsten Blum (1):
      drm/vmwgfx: Remove unnecessary NULL checks before kvfree()

Zack Rusin (1):
      drm/vmwgfx: Cleanup kms setup without 3d

 drivers/accel/qaic/qaic_control.c           |  2 +-
 drivers/accel/qaic/qaic_data.c              |  6 +--
 drivers/gpu/drm/ast/ast_sil164.c            |  2 +
 drivers/gpu/drm/ast/ast_vga.c               |  2 +
 drivers/gpu/drm/mgag200/mgag200_drv.c       | 38 --------------
 drivers/gpu/drm/mgag200/mgag200_drv.h       | 14 +-----
 drivers/gpu/drm/mgag200/mgag200_g200.c      |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200eh.c    |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c   |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200er.c    | 10 +---
 drivers/gpu/drm/mgag200/mgag200_g200ev.c    | 10 +---
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c   |  5 --
 drivers/gpu/drm/mgag200/mgag200_g200se.c    | 10 +---
 drivers/gpu/drm/mgag200/mgag200_g200wb.c    |  5 --
 drivers/gpu/drm/mgag200/mgag200_mode.c      | 77 +----------------------------
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c        |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h         |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         | 34 ++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h         |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c        |  4 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c     |  9 ++--
 drivers/gpu/host1x/context.c                |  1 +
 drivers/gpu/host1x/dev.c                    | 18 +++----
 include/linux/host1x.h                      |  1 +
 25 files changed, 48 insertions(+), 240 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

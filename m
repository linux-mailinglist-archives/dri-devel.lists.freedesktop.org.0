Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8F8A93EC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B467A10FB21;
	Thu, 18 Apr 2024 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KC8pprqa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mnAvlcNm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KC8pprqa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mnAvlcNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E8F10F5E7;
 Thu, 18 Apr 2024 07:22:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1376A5C5BC;
 Thu, 18 Apr 2024 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713424951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2m0LDKh5j6ZeXWaIZyy0/3+5aPcg6P/dgbYhl/SJAz4=;
 b=KC8pprqacNGoA+p4XL/7VaKi20MLlmTD0ZbMRHfEXLKPHl5+wMf3Or3hnriXDKCRW3836t
 2T/M8aoJ3wkpcg1g4n+4w1AQnjd7WDVxO6FubZChxSCkhtcswlKkjUue74bIODeBgHXwXU
 JEu6sjMeMBHsyGmigr6fstk7RzCPseM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713424951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2m0LDKh5j6ZeXWaIZyy0/3+5aPcg6P/dgbYhl/SJAz4=;
 b=mnAvlcNmFNagkRqqk4yaJKJGCmjah1aFynCDJS31HgvSfH9LunZQFjzGY43uUWUjF9Uk0e
 V2+x3n1KsMlmgHDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713424951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2m0LDKh5j6ZeXWaIZyy0/3+5aPcg6P/dgbYhl/SJAz4=;
 b=KC8pprqacNGoA+p4XL/7VaKi20MLlmTD0ZbMRHfEXLKPHl5+wMf3Or3hnriXDKCRW3836t
 2T/M8aoJ3wkpcg1g4n+4w1AQnjd7WDVxO6FubZChxSCkhtcswlKkjUue74bIODeBgHXwXU
 JEu6sjMeMBHsyGmigr6fstk7RzCPseM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713424951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2m0LDKh5j6ZeXWaIZyy0/3+5aPcg6P/dgbYhl/SJAz4=;
 b=mnAvlcNmFNagkRqqk4yaJKJGCmjah1aFynCDJS31HgvSfH9LunZQFjzGY43uUWUjF9Uk0e
 V2+x3n1KsMlmgHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A85981384C;
 Thu, 18 Apr 2024 07:22:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sYOrJzbKIGahBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Apr 2024 07:22:30 +0000
Date: Thu, 18 Apr 2024 09:22:29 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240418072229.GA8983@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
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

this is the PR for drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2024-04-18:
Short summary of fixes pull:

nouveau:
- dp: Don't probe DP ports twice
- nv04: Fix OOB access
- nv50: Disable AUX bus for disconnected DP ports
- nvkm: Fix race condition

panel:
- Don't unregister DSI devices in several drivers

ttm:
- Stop pooling cached NUMA pages

v3d:
- Fix enabled_ns increment

vmwgfx:
- Fix PRIME import/export
- Fix CRTC's atomic check for primary planes
- Sort plane formats by preference
The following changes since commit 4c08f01934ab67d1d283d5cbaa52b923abcfe4cd:

  drm/vmwgfx: Enable DMA mappings with SEV (2024-04-09 13:36:05 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-04-18

for you to fetch changes up to 941c0bdbc176df825adf77052263b2d63db6fef7:

  drm/panel: novatek-nt36682e: don't unregister DSI device (2024-04-16 23:17:59 +0300)

----------------------------------------------------------------
Short summary of fixes pull:

nouveau:
- dp: Don't probe DP ports twice
- nv04: Fix OOB access
- nv50: Disable AUX bus for disconnected DP ports
- nvkm: Fix race condition

panel:
- Don't unregister DSI devices in several drivers

ttm:
- Stop pooling cached NUMA pages

v3d:
- Fix enabled_ns increment

vmwgfx:
- Fix PRIME import/export
- Fix CRTC's atomic check for primary planes
- Sort plane formats by preference

----------------------------------------------------------------
Christian König (1):
      drm/ttm: stop pooling cached NUMA pages v2

Dave Airlie (1):
      nouveau: fix instmem race condition around ptr stores

Dmitry Baryshkov (2):
      drm/panel: visionox-rm69299: don't unregister DSI device
      drm/panel: novatek-nt36682e: don't unregister DSI device

Lyude Paul (2):
      drm/nouveau/kms/nv50-: Disable AUX bus for disconnected DP ports
      drm/nouveau/dp: Don't probe eDP ports twice harder

Maíra Canal (1):
      drm/v3d: Don't increment `enabled_ns` twice

Mikhail Kobuk (1):
      drm: nv04: Fix out of bounds access

Zack Rusin (3):
      drm/vmwgfx: Fix prime import/export
      drm/vmwgfx: Fix crtc's atomic check conditional
      drm/vmwgfx: Sort primary plane formats by order of preference

 drivers/gpu/drm/nouveau/nouveau_bios.c             | 13 ++++---
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 23 ++++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |  7 +++-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  2 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |  2 -
 drivers/gpu/drm/ttm/ttm_pool.c                     | 38 ++++++++++++++-----
 drivers/gpu/drm/v3d/v3d_irq.c                      |  4 --
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               | 35 +++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  7 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  3 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                | 32 ++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 11 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c              | 15 +++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         | 44 +++++++++++++++-------
 17 files changed, 186 insertions(+), 57 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

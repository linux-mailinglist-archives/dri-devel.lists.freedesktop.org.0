Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D768D5240
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 21:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A61410E8B0;
	Thu, 30 May 2024 19:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uT1afrCy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrKUbx7r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="drf8qR4C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G31J9puh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCD010E8B0;
 Thu, 30 May 2024 19:23:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D43C41F449;
 Thu, 30 May 2024 19:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717096989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiHNh8cqxHXGDsLyXprQRcHbBgQ7ObuylejtGIY5GHM=;
 b=uT1afrCyYfjZgyeUuLqbQ7oTz0V+Qsj+7UKsv10ehILH5F4C6gcI7bze9F/W9gLN2bJauJ
 4L4DbY0GcT00cnwH2+tr35w4Lyj9HdvG2Op4ZLh+0POJnyjlUnNMgOfJxZAwH2+rPOB56g
 8+O6s3dKOmdmrBDI3ACyzj9DcFYST1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717096989;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiHNh8cqxHXGDsLyXprQRcHbBgQ7ObuylejtGIY5GHM=;
 b=PrKUbx7rZJwlVD/WfRQGO6F4PSzHWE21n65OheFi2sMx41hGPRpGOrYd7hmRz74xTOPzWW
 zCUQhhKwP8kjabAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=drf8qR4C;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=G31J9puh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717096988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiHNh8cqxHXGDsLyXprQRcHbBgQ7ObuylejtGIY5GHM=;
 b=drf8qR4CZ9vW1mFhVBhqXRcmLhEuI/APe1WWfNtp+HYigdajal4Hnsqj4R3QiWIW6Fn6w1
 NfLXTKd+t7iXDedOL7x2LNANBWjE2QI0cvcZgTY4zFSpMtKcbkxXpAi5AYreZVCKRXq+o0
 lV9hbjmI2OiFf2QILf2vZpZrymQO8lM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717096988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiHNh8cqxHXGDsLyXprQRcHbBgQ7ObuylejtGIY5GHM=;
 b=G31J9puh3MH3N4rBBPriqlpXTG3L1K/lG5kNB3RzM4lbLnUL+y1dNtLeO61slPOs7BwiuT
 7OG2k9gk3pz0o5Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6266413A42;
 Thu, 30 May 2024 19:23:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F9xyFhzSWGZxOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 30 May 2024 19:23:08 +0000
Date: Thu, 30 May 2024 21:23:07 +0200
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
Message-ID: <20240530192307.GA14809@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D43C41F449
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
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

this is the PR for drm-misc-fixes or this week. FYI I had to run dim
pull-request with the -f option, so that it ignored the following error

dim: 779aa4d74785 ("drm/nouveau/nvif: Avoid build error due to potential integer overflows"): Fixes: SHA1 in not pointing at an ancestor:
dim:     a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
dim: ERROR: issues in commits detected, aborting

The commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
across the subsystem") apparently got in before the commit it fixes.

Best regards
Thomas

drm-misc-fixes-2024-05-30:
Short summary of fixes pull:

dma-buf:
- sw-sync: Don't interfere with IRQ handling
- Fix kthreads-handling error path

gem-shmem:
- Warn when trying to pin imported objects

lima:
- Fix dma_resv-related deadlock in object pin

msm:
- Remove build-time dependency on Python 3.9

nouveau:
- nvif: Fix possible integer overflow

panel:
- lg-sw43408: Select DP helpers; Declare backlight ops as static
- sitronix-st7789v: Various fixes for jt240mhqs_hwt_ek_e3 panel

panfrost:
- Fix dma_resv-related deadlock in object pin
The following changes since commit 3e049b6b8f32f25c6967f4cffd8eac6e1e5316f6:

  Merge tag 'drm-misc-fixes-2024-05-23' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2024-05-27 13:47:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-05-30

for you to fetch changes up to bb195358806847217efba98de62b7decec3b371f:

  drm/msm: remove python 3.9 dependency for compiling msm (2024-05-30 18:49:23 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

dma-buf:
- sw-sync: Don't interfere with IRQ handling
- Fix kthreads-handling error path

gem-shmem:
- Warn when trying to pin imported objects

lima:
- Fix dma_resv-related deadlock in object pin

msm:
- Remove build-time dependency on Python 3.9

nouveau:
- nvif: Fix possible integer overflow

panel:
- lg-sw43408: Select DP helpers; Declare backlight ops as static
- sitronix-st7789v: Various fixes for jt240mhqs_hwt_ek_e3 panel

panfrost:
- Fix dma_resv-related deadlock in object pin

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm: remove python 3.9 dependency for compiling msm

Adrián Larumbe (3):
      drm/panfrost: Fix dma_resv deadlock at drm object pin time
      drm/lima: Fix dma_resv deadlock at drm object pin time
      drm/gem-shmem: Add import attachment warning to locked pin function

Dmitry Baryshkov (2):
      drm/panel/lg-sw43408: select CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static

Fedor Pchelkin (1):
      dma-buf: handle testing kthreads creation failure

Gerald Loacker (3):
      drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel

Guenter Roeck (1):
      drm/nouveau/nvif: Avoid build error due to potential integer overflows

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Tetsuo Handa (1):
      dma-buf/sw-sync: don't enable IRQ from sync_print_obj()

 drivers/dma-buf/st-dma-fence.c                 |  6 ++++++
 drivers/dma-buf/sync_debug.c                   |  4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c         |  2 ++
 drivers/gpu/drm/lima/lima_gem.c                |  2 +-
 drivers/gpu/drm/msm/registers/gen_header.py    |  5 +++--
 drivers/gpu/drm/nouveau/nvif/object.c          | 24 ++++++++++++++++++------
 drivers/gpu/drm/panel/Kconfig                  |  2 ++
 drivers/gpu/drm/panel/panel-lg-sw43408.c       |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 16 ++++++++--------
 drivers/gpu/drm/panfrost/panfrost_gem.c        |  2 +-
 10 files changed, 44 insertions(+), 21 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

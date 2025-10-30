Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8367C2217F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2BC88DE5;
	Thu, 30 Oct 2025 19:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NjcLN3aJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nMElmBya";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NjcLN3aJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nMElmBya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876910EA17
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:56:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BF6F1F7E9;
 Thu, 30 Oct 2025 19:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761854210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+cOzXkrD9iHoTwsBb1OIiPMoa22kbXss62UFbuJX2Ac=;
 b=NjcLN3aJ5bssH1BTlzyH7xwTOjObX5RRqe0x4d1iTrqlrf3+aIARaDCgU1Vsh0A1heP4G7
 F6jPtdcwQVMovdmYJVGV6oTo5iaf8eg/WFlGgfZd54SRT/q2VgdrWECglfpbiyCbB/OsYE
 xaU6tgLAf9jaJMjtMVnuQPtkr9zLSwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761854210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+cOzXkrD9iHoTwsBb1OIiPMoa22kbXss62UFbuJX2Ac=;
 b=nMElmByaa1mrPr+J4/nhWAeEKDdwAkVI+2Tpzyz8LN3ijrfpaf/ZQc+7xfuJngRqq+ifHP
 fHohSM73D5VID3CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761854210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+cOzXkrD9iHoTwsBb1OIiPMoa22kbXss62UFbuJX2Ac=;
 b=NjcLN3aJ5bssH1BTlzyH7xwTOjObX5RRqe0x4d1iTrqlrf3+aIARaDCgU1Vsh0A1heP4G7
 F6jPtdcwQVMovdmYJVGV6oTo5iaf8eg/WFlGgfZd54SRT/q2VgdrWECglfpbiyCbB/OsYE
 xaU6tgLAf9jaJMjtMVnuQPtkr9zLSwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761854210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=+cOzXkrD9iHoTwsBb1OIiPMoa22kbXss62UFbuJX2Ac=;
 b=nMElmByaa1mrPr+J4/nhWAeEKDdwAkVI+2Tpzyz8LN3ijrfpaf/ZQc+7xfuJngRqq+ifHP
 fHohSM73D5VID3CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B155D1396A;
 Thu, 30 Oct 2025 19:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q4FaKQHDA2nlYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Oct 2025 19:56:49 +0000
Date: Thu, 30 Oct 2025 20:56:44 +0100
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
Message-ID: <20251030195644.GA188441@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,
 localhost.localdomain:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here's the drm-misc-fixes PR for this week.

Best regards
Thomas

drm-misc-fixes-2025-10-30:
Short summary of fixes pull:

ast:
- Preserve correct bits on register I/O

dma-fence:
- Use correct timeline name

etnaviv:
- Use correct GPU adress space for flush

imx:
- parallel-display: Fix bridge handling

nouveau:
- Fix locking in scheduler

panel:
- kingdisplay-kd097d04: Disable EOT packet
- sitronix-st7789v: Use correct SYNC flags

sched:
- Fix locking to avoid race condition
- Fix SIGKILL handling

sysfb:
- Avoid NULL-pointer access
The following changes since commit 23437509a69476d4f896891032d62ac868731668:

  drm/panic: Fix 24bit pixel crossing page boundaries (2025-10-21 11:28:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-10-30

for you to fetch changes up to a9fb41b5def8e1e0103d5fd1453787993587281e:

  drm/ast: Clear preserved bits from register output value (2025-10-30 20:44:44 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

ast:
- Preserve correct bits on register I/O

dma-fence:
- Use correct timeline name

etnaviv:
- Use correct GPU adress space for flush

imx:
- parallel-display: Fix bridge handling

nouveau:
- Fix locking in scheduler

panel:
- kingdisplay-kd097d04: Disable EOT packet
- sitronix-st7789v: Use correct SYNC flags

sched:
- Fix locking to avoid race condition
- Fix SIGKILL handling

sysfb:
- Avoid NULL-pointer access

----------------------------------------------------------------
Akash Goel (1):
      dma-fence: Fix safe access wrapper to call timeline name method

David Rosca (1):
      drm/sched: avoid killing parent entity on child SIGKILL

Luca Ceresoli (2):
      drm/imx: parallel-display: convert to devm_drm_bridge_alloc() API
      drm/imx: parallel-display: add the bridge before attaching it

Philipp Stanner (2):
      drm/sched: Fix race in drm_sched_entity_select_rq()
      drm/nouveau: Fix race in nouveau_sched_fini()

Sebastian Fleer (1):
      drm/panel: kingdisplay-kd097d04: Disable EoTp

Sebastian Reichel (1):
      drm/panel: sitronix-st7789v: fix sync flags for t28cp45tn89

Thomas Zimmermann (2):
      drm/sysfb: Do not dereference NULL pointer in plane reset
      drm/ast: Clear preserved bits from register output value

Tomeu Vizoso (1):
      drm/etnaviv: fix flush sequence logic

 drivers/dma-buf/dma-fence.c                        |  2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  8 ++++----
 drivers/gpu/drm/drm_gem_atomic_helper.c            |  8 ++++++--
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |  2 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 18 +++++++++---------
 drivers/gpu/drm/nouveau/nouveau_sched.c            | 14 ++++++++++++--
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  7 ++++++-
 drivers/gpu/drm/scheduler/sched_entity.c           |  6 ++++--
 9 files changed, 44 insertions(+), 23 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

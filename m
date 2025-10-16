Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB20BE3DC1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D47610E9FA;
	Thu, 16 Oct 2025 14:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zlt+UnnN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IqrEDhAl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jHy0/mwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+NzSJ3AG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199610E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:16:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E11F321BF7;
 Thu, 16 Oct 2025 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760624169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U9HiW0csL64PGVLL/A7OOQURLF/VAC4SlrUV07GW78k=;
 b=zlt+UnnNjEH2mkLR2bIJQVAerNQS88FjcFSYm8phXM2Yf1US34K+fnW3jdIHRqW1S2+zqJ
 5ycnExrncNv9n3bhDWq3SRx1pQ8pcDDYZJoF5wrKJ1oiXuCa0G5jJVKNAvrv9GYtoeVTtN
 Zipdxk7w/t1ezEjtzUHk0ZYHF3F0D0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760624169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U9HiW0csL64PGVLL/A7OOQURLF/VAC4SlrUV07GW78k=;
 b=IqrEDhAlVXc00Jwe24Nk+LV4HGT4u9xCG8WnEGESk8K6N9+XPGz0TFALiRdki38cjzixJ1
 okMV4MbhQhPNRlCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760624168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U9HiW0csL64PGVLL/A7OOQURLF/VAC4SlrUV07GW78k=;
 b=jHy0/mwMNqAY3UF07ZFfbxLNy6RdrQ/dGZuUwZiZ2FuDjBe2Zh0DxKA+8IdyF32j45bAWh
 2ipbOGYhb1KvTSOqmY9ILRbRQUx1mmP1y8cDtJRRewrotv/MPD6G1q/4rhT8Chr2ULZ7FB
 7XnFQn7LCLvrLn/vaGJpmQxgPU28YzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760624168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=U9HiW0csL64PGVLL/A7OOQURLF/VAC4SlrUV07GW78k=;
 b=+NzSJ3AGasAl9JV7yTSWbOWZY0JdL72gdjcA93+RAPg+Ev+nuIfql6dfPETt3kZ8GmXNXa
 FbvdSYB2hHYdxqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63B661376E;
 Thu, 16 Oct 2025 14:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4OPqFij+8GgWdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 14:16:08 +0000
Date: Thu, 16 Oct 2025 16:16:07 +0200
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
Message-ID: <20251016141607.GA73919@linux.fritz.box>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

this is the weekly PR from drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-10-16:
Short summary of fixes pull:

ast:
- Fix display output after reboot

bridge:
- lt9211: Fix version check

core:
- draw: Avoid color truncation
- gpuvm: Avoid kernel-doc warning
- sched: Avoid double free

panthor:
- Fix MCU suspend

qaic:
- Init bootlog in correct order
- Treat remaining == 0 as error in find_and_map_user_pages()
- Lock access to DBC request queue

rockchip:
- vop2: Fix destination size in atomic check
The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-10-16

for you to fetch changes up to 5801e65206b065b0b2af032f7f1eef222aa2fd83:

  drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies (2025-10-16 14:26:05 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

ast:
- Fix display output after reboot

bridge:
- lt9211: Fix version check

core:
- draw: Avoid color truncation
- gpuvm: Avoid kernel-doc warning
- sched: Avoid double free

panthor:
- Fix MCU suspend

qaic:
- Init bootlog in correct order
- Treat remaining == 0 as error in find_and_map_user_pages()
- Lock access to DBC request queue

rockchip:
- vop2: Fix destination size in atomic check

----------------------------------------------------------------
Alok Tiwari (1):
      drm/rockchip: vop2: use correct destination rectangle height check

Ankan Biswas (1):
      drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map

Francesco Valla (1):
      drm/draw: fix color truncation in drm_draw_fill24

Jeff Hugo (1):
      accel/qaic: Fix bootlog initialization ordering

Ketil Johnsen (1):
      drm/panthor: Ensure MCU is disabled on suspend

Marek Vasut (1):
      drm/bridge: lt9211: Drop check for last nibble of version register

Pranjal Ramajor Asha Kanojiya (1):
      accel/qaic: Synchronize access to DBC request queue head & tail pointer

Thomas Zimmermann (2):
      Merge drm/drm-fixes into drm-misc-fixes
      drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off

Tvrtko Ursulin (1):
      drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies

Youssef Samir (1):
      accel/qaic: Treat remaining == 0 as error in find_and_map_user_pages()

 drivers/accel/qaic/qaic.h                    |  2 ++
 drivers/accel/qaic/qaic_control.c            |  2 +-
 drivers/accel/qaic/qaic_data.c               | 12 ++++++++++--
 drivers/accel/qaic/qaic_debugfs.c            |  5 +++--
 drivers/accel/qaic/qaic_drv.c                |  3 +++
 drivers/gpu/drm/ast/ast_mode.c               | 18 ++++++++++--------
 drivers/gpu/drm/ast/ast_reg.h                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c      |  3 +--
 drivers/gpu/drm/drm_draw.c                   |  2 +-
 drivers/gpu/drm/drm_draw_internal.h          |  2 +-
 drivers/gpu/drm/panthor/panthor_fw.c         |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 13 +++++++------
 include/drm/drm_gpuvm.h                      |  2 +-
 14 files changed, 43 insertions(+), 25 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B99987D8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB1710E8F8;
	Thu, 10 Oct 2024 13:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rz3Uf+ha";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MUZJ8tp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rz3Uf+ha";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6MUZJ8tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110A10E297;
 Thu, 10 Oct 2024 13:37:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1BA221FA1;
 Thu, 10 Oct 2024 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728567430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rE4V5kj1uZvndrZk/9bvSar0PfV0NXBQ4O6TIk6c2Hs=;
 b=rz3Uf+hayhFLKTua9IV0L0Bwym5sCB+i0W+l9C1CwQ4xmyATV7EUtVm4pAgcBfhDUAzacm
 5+uCi6om+zsmUO0moPTOtC2WlCqbxwO2OlwRhdFnvv/XPeTPXUqB4hp2jHe3ZdVVjxzbSs
 ep9UH+rL4u7YfYaDzDb8P6P+GCRTOwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728567430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rE4V5kj1uZvndrZk/9bvSar0PfV0NXBQ4O6TIk6c2Hs=;
 b=6MUZJ8tpsuuQqX+RkfOb2L8721AtasomfXMUtkWglGOkJH6fx48VQfxBuPmUjUMI6xzviT
 +AjzIqdIz/JNobDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rz3Uf+ha;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6MUZJ8tp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728567430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rE4V5kj1uZvndrZk/9bvSar0PfV0NXBQ4O6TIk6c2Hs=;
 b=rz3Uf+hayhFLKTua9IV0L0Bwym5sCB+i0W+l9C1CwQ4xmyATV7EUtVm4pAgcBfhDUAzacm
 5+uCi6om+zsmUO0moPTOtC2WlCqbxwO2OlwRhdFnvv/XPeTPXUqB4hp2jHe3ZdVVjxzbSs
 ep9UH+rL4u7YfYaDzDb8P6P+GCRTOwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728567430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rE4V5kj1uZvndrZk/9bvSar0PfV0NXBQ4O6TIk6c2Hs=;
 b=6MUZJ8tpsuuQqX+RkfOb2L8721AtasomfXMUtkWglGOkJH6fx48VQfxBuPmUjUMI6xzviT
 +AjzIqdIz/JNobDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DC7E13A6E;
 Thu, 10 Oct 2024 13:37:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xhWzEYbYB2euVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Oct 2024 13:37:10 +0000
Date: Thu, 10 Oct 2024 15:37:08 +0200
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
Message-ID: <20241010133708.GA461532@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1BA221FA1
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

here's drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2024-10-10:
Short summary of fixes pull:

fbdev-dma:
- Only clean up deferred I/O if instanciated

nouveau:
- dmem: Fix privileged error in copy engine channel; Fix possible
data leak in migrate_to_ram()
- gsp: Fix coding style

sched:
- Avoid leaking lockdep map

v3d:
- Stop active perfmon before destroying it

vc4:
- Stop active perfmon before destroying it

xe:
- Drop GuC submit_wq pool
The following changes since commit f9e7ac6e2e9986c2ee63224992cb5c8276e46b2a:

  drm/panthor: Don't add write fences to the shared BOs (2024-10-01 18:41:02 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-10-10

for you to fetch changes up to fcddc71ec7ecf15b4df3c41288c9cf0b8e886111:

  drm/fbdev-dma: Only cleanup deferred I/O if necessary (2024-10-10 09:49:25 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

fbdev-dma:
- Only clean up deferred I/O if instanciated

nouveau:
- dmem: Fix privileged error in copy engine channel; Fix possible
data leak in migrate_to_ram()
- gsp: Fix coding style

sched:
- Avoid leaking lockdep map

v3d:
- Stop active perfmon before destroying it

vc4:
- Stop active perfmon before destroying it

xe:
- Drop GuC submit_wq pool

----------------------------------------------------------------
Colin Ian King (1):
      drm/nouveau/gsp: remove extraneous ; after mutex

Janne Grunau (1):
      drm/fbdev-dma: Only cleanup deferred I/O if necessary

Matthew Brost (2):
      drm/sched: Use drm sched lockdep map for submit_wq
      drm/xe: Drop GuC submit_wq pool

Maíra Canal (2):
      drm/v3d: Stop the active perfmon before being destroyed
      drm/vc4: Stop the active perfmon before being destroyed

Yonatan Maman (2):
      nouveau/dmem: Fix privileged error in copy engine channel
      nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error

 drivers/gpu/drm/drm_fbdev_dma.c                   |  3 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c            | 11 +++++
 drivers/gpu/drm/v3d/v3d_perfmon.c                 |  9 +++-
 drivers/gpu/drm/vc4/vc4_perfmon.c                 |  7 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c                | 60 +----------------------
 drivers/gpu/drm/xe/xe_guc_types.h                 |  7 ---
 9 files changed, 31 insertions(+), 72 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

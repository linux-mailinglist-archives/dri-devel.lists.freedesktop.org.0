Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73698CDA28
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 20:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1401310E168;
	Thu, 23 May 2024 18:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1TnrUGYu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Xv4RIxH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1TnrUGYu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Xv4RIxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2C10E168;
 Thu, 23 May 2024 18:47:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4885A22B4D;
 Thu, 23 May 2024 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716490067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6TGOWDz52ylx34beWfEfV/KUSryb3vfNDP976fjkRUY=;
 b=1TnrUGYuXdd6KnECtCE8fBnSnBra0Z0KSZkMMI22Kcn4tp4o+yT6/JJ70Rc+q5gFdeEbr6
 SGmvzyzk681dxyabPgskVmPU5rNTXcCZLuDxVYKiggDZrI3lXtDgZP14R4dltqlsDNZ42J
 1DlSNbSldqleEoTmDe8TNin1rKwgRsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716490067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6TGOWDz52ylx34beWfEfV/KUSryb3vfNDP976fjkRUY=;
 b=9Xv4RIxHqdDF7qi5mB35d+2PcXDmPgLWqNJSuH7f7YyQYmLLeS/4/BLMLA6rfMPMcnEN4c
 IKC0vl/lTPUHDlCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716490067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6TGOWDz52ylx34beWfEfV/KUSryb3vfNDP976fjkRUY=;
 b=1TnrUGYuXdd6KnECtCE8fBnSnBra0Z0KSZkMMI22Kcn4tp4o+yT6/JJ70Rc+q5gFdeEbr6
 SGmvzyzk681dxyabPgskVmPU5rNTXcCZLuDxVYKiggDZrI3lXtDgZP14R4dltqlsDNZ42J
 1DlSNbSldqleEoTmDe8TNin1rKwgRsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716490067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6TGOWDz52ylx34beWfEfV/KUSryb3vfNDP976fjkRUY=;
 b=9Xv4RIxHqdDF7qi5mB35d+2PcXDmPgLWqNJSuH7f7YyQYmLLeS/4/BLMLA6rfMPMcnEN4c
 IKC0vl/lTPUHDlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDDD213A6B;
 Thu, 23 May 2024 18:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4ViWMFKPT2aWPQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 May 2024 18:47:46 +0000
Date: Thu, 23 May 2024 20:47:45 +0200
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
Message-ID: <20240523184745.GA11363@localhost.localdomain>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

here's the weekly PR for drm-misc-fixes. There's one important
patch included, which fixes a kernel panic that can be triggered
from userspace.

Best regards
Thomas

drm-misc-fixes-2024-05-23:
Short summary of fixes pull:

buddy:
- stop using PAGE_SIZE

shmem-helper:
- avoid kernel panic in mmap()

tests:
- buddy: fix PAGE_SIZE dependency
The following changes since commit 6897204ea3df808d342c8e4613135728bc538bcd:

  drm/connector: Add \n to message about demoting connector force-probes (2024-05-07 09:17:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-05-23

for you to fetch changes up to 39bc27bd688066a63e56f7f64ad34fae03fbe3b8:

  drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE) (2024-05-21 14:38:51 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

buddy:
- stop using PAGE_SIZE

shmem-helper:
- avoid kernel panic in mmap()

tests:
- buddy: fix PAGE_SIZE dependency

----------------------------------------------------------------
Matthew Auld (2):
      drm/buddy: stop using PAGE_SIZE
      drm/tests/buddy: stop using PAGE_SIZE

Mohamed Ahmed (1):
      drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations

Wachowski, Karol (1):
      drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE)

 drivers/gpu/drm/drm_buddy.c             |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c  |  3 +++
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 +++
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 ++++++++++++++-------------------
 drivers/gpu/drm/tests/drm_buddy_test.c  | 42 +++++++++++++++----------------
 include/drm/drm_buddy.h                 |  6 ++---
 include/uapi/drm/nouveau_drm.h          |  7 ++++++
 7 files changed, 57 insertions(+), 50 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

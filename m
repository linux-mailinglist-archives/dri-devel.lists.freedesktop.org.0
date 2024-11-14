Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0619C8CC6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 15:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B985510E2B3;
	Thu, 14 Nov 2024 14:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w/0PNcbI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oCSEDGoQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w/0PNcbI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oCSEDGoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1210E2AC;
 Thu, 14 Nov 2024 14:22:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FA1E21114;
 Thu, 14 Nov 2024 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731594178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=F+y1P9M95dgiWBu3crw/B2d+lkOG0mfFqeYHfb14gVQ=;
 b=w/0PNcbIac50UWtYJD0AAUjfdK9HWV/a4FZSdPiIhqMOFcvvyOUHwWNKt8uoCzAxepsAsp
 OhIryUw01Hb14Qp6qGciGQ0qCCNF/l7BRlOmxwD8eoCxsjNPuKD2qraEaz4ob3/TPGwejq
 /SW6ofOdNyTEkxw7OVEHulCEYyr+dl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731594178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=F+y1P9M95dgiWBu3crw/B2d+lkOG0mfFqeYHfb14gVQ=;
 b=oCSEDGoQ/kMTfc99zm3dfb1op7X//lcix/5s14P9U9TCMJ7tnWbWfeXYXBz+mjbue1frXZ
 w1PlvETUSQwpyoBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="w/0PNcbI";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oCSEDGoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731594178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=F+y1P9M95dgiWBu3crw/B2d+lkOG0mfFqeYHfb14gVQ=;
 b=w/0PNcbIac50UWtYJD0AAUjfdK9HWV/a4FZSdPiIhqMOFcvvyOUHwWNKt8uoCzAxepsAsp
 OhIryUw01Hb14Qp6qGciGQ0qCCNF/l7BRlOmxwD8eoCxsjNPuKD2qraEaz4ob3/TPGwejq
 /SW6ofOdNyTEkxw7OVEHulCEYyr+dl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731594178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=F+y1P9M95dgiWBu3crw/B2d+lkOG0mfFqeYHfb14gVQ=;
 b=oCSEDGoQ/kMTfc99zm3dfb1op7X//lcix/5s14P9U9TCMJ7tnWbWfeXYXBz+mjbue1frXZ
 w1PlvETUSQwpyoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD60513721;
 Thu, 14 Nov 2024 14:22:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RGB4NMEHNmfjcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Nov 2024 14:22:57 +0000
Date: Thu, 14 Nov 2024 15:22:56 +0100
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
Message-ID: <20241114142256.GA86810@2a02-2454-fd5e-fd00-4ce-489-4b34-bd1a.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4FA1E21114
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi Dave, Sima,

here's the drm-misc-fixes PR for this week.

Best regards
Thomas

drm-misc-fixes-2024-11-14:
Short summary of fixes pull:

bridge:
- tc358768: Fix DSI command tx

nouveau:
- Fix GSP AUX error handling
- dp: Handle retires for AUX CH transfers with GSP
- fw: Sync DMA after setup

panthor:
- Fix partial BO mappings to GPU

rockchip:
- vop: Avoid null-ptr deref in plane-state check

vmwgfx:
- Avoid null-ptr deref in surface creation
The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-11-14

for you to fetch changes up to 32c4514455b2b8fde506f8c0962f15c7e4c26f1d:

  drm/bridge: tc358768: Fix DSI command tx (2024-11-14 11:29:42 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- tc358768: Fix DSI command tx

nouveau:
- Fix GSP AUX error handling
- dp: Handle retires for AUX CH transfers with GSP
- fw: Sync DMA after setup

panthor:
- Fix partial BO mappings to GPU

rockchip:
- vop: Avoid null-ptr deref in plane-state check

vmwgfx:
- Avoid null-ptr deref in surface creation

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Fix handling of partial GPU mapping of BOs

Andy Yan (1):
      drm/rockchip: vop: Fix a dereferenced before check warning

Chen Ridong (1):
      drm/vmwgfx: avoid null_ptr_deref in vmw_framebuffer_surface_create_handle

Dave Airlie (3):
      nouveau: fw: sync dma after setup is called.
      nouveau: handle EBUSY and EAGAIN for GSP aux errors.
      nouveau/dp: handle retries for AUX CH transfers with GSP.

Francesco Dolcini (1):
      drm/bridge: tc358768: Fix DSI command tx

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/gpu/drm/bridge/tc358768.c               | 21 ++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 61 +++++++++++++++----------
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c        | 11 +++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  |  6 +--
 drivers/gpu/drm/panthor/panthor_mmu.c           |  2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  8 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  2 +
 7 files changed, 72 insertions(+), 39 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

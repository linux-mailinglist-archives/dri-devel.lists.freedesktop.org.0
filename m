Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951A89855F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB74411B3D1;
	Thu,  4 Apr 2024 10:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Jk6J5UUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ITfNdB4G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F0411B3CE;
 Thu,  4 Apr 2024 10:48:16 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E46AC37ABE;
 Thu,  4 Apr 2024 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712227694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ifyVFdgsGutaFbG6us/talgSokPtLGYvOTFyqsTEK9A=;
 b=Jk6J5UUQD98vkrCn1Y9tSF1SuoMN4nUKRtn0W+Q0ExbuOIOzkgckn1eVW3lRr+y60Nt0zi
 uTx9kLrtAhVYw5c/bHqemR/9qA7MnUndXwxIuGduUTHV6dkT5rBYqCLavz62mx06J7/ATo
 rWRy1o9MvZnL97giH1wKC/6eyqBz600=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712227694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ifyVFdgsGutaFbG6us/talgSokPtLGYvOTFyqsTEK9A=;
 b=ITfNdB4G2uQm/UG2h1CUc8qNHLTCktdfGDCQVLR/zqHNCCgMH5LTksQHxkQZcUDUOORAOw
 E97Tm42+5NTetLAw==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F675139E8;
 Thu,  4 Apr 2024 10:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id peC4GW6FDmahPwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Apr 2024 10:48:14 +0000
Date: Thu, 4 Apr 2024 12:48:13 +0200
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
Message-ID: <20240404104813.GA27376@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.988]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
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

here's the drm-misc-fixes PR for this week.

Best regards
Thomas

drm-misc-fixes-2024-04-04:
Short summary of fixes pull:

display:
- fix typos in kerneldoc

nouveau:
- uvmm: fix remap address calculation
- minor cleanups

panfrost:
- fix power-transition timeouts

prime:
- unbreak dma-buf export for virt-gpu
The following changes since commit aba2a144c0bf1ecdcbc520525712fb661392e509:

  drm/qxl: remove unused variable from `qxl_process_single_command()` (2024-03-28 11:15:48 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-04-04

for you to fetch changes up to fddf09273807bf6e51537823aaae896e05f147f9:

  drm/display: fix typo (2024-04-01 22:35:16 +0300)

----------------------------------------------------------------
Short summary of fixes pull:

display:
- fix typos in kerneldoc

nouveau:
- uvmm: fix remap address calculation
- minor cleanups

panfrost:
- fix power-transition timeouts

prime:
- unbreak dma-buf export for virt-gpu

----------------------------------------------------------------
Christian Hewitt (1):
      drm/panfrost: fix power transition timeout warnings

Colin Ian King (1):
      drm/nouveau/gr/gf100: Remove second semicolon

Dave Airlie (1):
      nouveau/uvmm: fix addr/range calcs for remap operations

Oleksandr Natalenko (1):
      drm/display: fix typo

Rob Clark (1):
      drm/prime: Unbreak virtgpu dma-buf export

 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
 drivers/gpu/drm/drm_prime.c                       | 7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c            | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c    | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c           | 6 +++---
 5 files changed, 15 insertions(+), 10 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

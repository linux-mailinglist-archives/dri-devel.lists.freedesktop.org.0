Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B78B1F17
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 12:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6F310E9AA;
	Thu, 25 Apr 2024 10:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZMEalzq2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h/ZNo+eH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZMEalzq2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h/ZNo+eH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5F610E9AA;
 Thu, 25 Apr 2024 10:24:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0291C20790;
 Thu, 25 Apr 2024 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714040655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=QxJ5ARBThPMNYU9Nj28FCs28GYtz9vuPqSv1FxJel1Y=;
 b=ZMEalzq2JXYMYvksPoK9vOSjJAe+i0cgRwV4nEDngFYiJmrwiJc6/hmpchfE9SbQB0O/pK
 KX74Pj55AuxT2Cz4JPaPqQVQmFLrOAS/tjs1pSvFaaDEtlaQhhMIcCoCNrz95zYxUGaMvM
 8LqQvD8lVJz0AvaI9iz8qVA366/fK94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714040655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=QxJ5ARBThPMNYU9Nj28FCs28GYtz9vuPqSv1FxJel1Y=;
 b=h/ZNo+eHNggcI2edlloGTyHNP9rh4nWJARODZ3psVsp0W38xmjRmUuF0BkVADc+9BB3/2a
 J3A8miP50oa8yVCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZMEalzq2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="h/ZNo+eH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714040655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=QxJ5ARBThPMNYU9Nj28FCs28GYtz9vuPqSv1FxJel1Y=;
 b=ZMEalzq2JXYMYvksPoK9vOSjJAe+i0cgRwV4nEDngFYiJmrwiJc6/hmpchfE9SbQB0O/pK
 KX74Pj55AuxT2Cz4JPaPqQVQmFLrOAS/tjs1pSvFaaDEtlaQhhMIcCoCNrz95zYxUGaMvM
 8LqQvD8lVJz0AvaI9iz8qVA366/fK94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714040655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=QxJ5ARBThPMNYU9Nj28FCs28GYtz9vuPqSv1FxJel1Y=;
 b=h/ZNo+eHNggcI2edlloGTyHNP9rh4nWJARODZ3psVsp0W38xmjRmUuF0BkVADc+9BB3/2a
 J3A8miP50oa8yVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B533B13991;
 Thu, 25 Apr 2024 10:24:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oaV2K04vKmZ8PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 25 Apr 2024 10:24:14 +0000
Date: Thu, 25 Apr 2024 12:24:13 +0200
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
Message-ID: <20240425102413.GA6301@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0291C20790
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.51
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

here's the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-04-25:
Short summary of fixes pull:

atomic-helpers:
- Fix memory leak in drm_format_conv_state_copy()

fbdev:
- fbdefio: Fix address calculation

gma500:
- Fix crash during boot
The following changes since commit 941c0bdbc176df825adf77052263b2d63db6fef7:

  drm/panel: novatek-nt36682e: don't unregister DSI device (2024-04-16 23:17:59 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-04-25

for you to fetch changes up to 78d9161d2bcd442d93d917339297ffa057dbee8c:

  fbdev: fix incorrect address computation in deferred IO (2024-04-24 15:03:37 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

atomic-helpers:
- Fix memory leak in drm_format_conv_state_copy()

fbdev:
- fbdefio: Fix address calculation

gma500:
- Fix crash during boot

----------------------------------------------------------------
Lucas Stach (1):
      drm/atomic-helper: fix parameter order in drm_format_conv_state_copy() call

Nam Cao (1):
      fbdev: fix incorrect address computation in deferred IO

Patrik Jakobsson (1):
      drm/gma500: Remove lid code

 drivers/gpu/drm/drm_gem_atomic_helper.c |  4 +-
 drivers/gpu/drm/gma500/Makefile         |  1 -
 drivers/gpu/drm/gma500/psb_device.c     |  5 +--
 drivers/gpu/drm/gma500/psb_drv.h        |  9 ----
 drivers/gpu/drm/gma500/psb_lid.c        | 80 ---------------------------------
 drivers/video/fbdev/core/fb_defio.c     |  2 +-
 6 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 drivers/gpu/drm/gma500/psb_lid.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

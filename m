Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91858750C7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509CF10EAA6;
	Thu,  7 Mar 2024 13:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IrQDKeTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cjVj8y3H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrQDKeTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cjVj8y3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9B110E2C2;
 Thu,  7 Mar 2024 13:49:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3CD1C8CCEC;
 Thu,  7 Mar 2024 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709815602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=24aFDZuk3XPs6fOlpapZJjWjNaj0C3S0gbwWnt518bw=;
 b=IrQDKeTaHKmX6s7E+puWV9XjiH9xj2Xaf+h5MOYCQfln0c6LbeGMEnXG5O4iC92P9IV6M0
 PdernQJRmxb0WLmmtfodUtaDH1w24iB6FZnoubC8vQe0VAMOsNo4/S3Zuq6+QXSuDI9fq5
 zcpGIRiJlP1RfdvaNqxedczECPUCvzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709815602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=24aFDZuk3XPs6fOlpapZJjWjNaj0C3S0gbwWnt518bw=;
 b=cjVj8y3HLP7lfuDK/gSuWNKoEl/f8eJMCGr08lx3mSkKGaoBV/y7Y5zd/ndwfXb6nASoUl
 Gxxw4Lnwt+THC7Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709815602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=24aFDZuk3XPs6fOlpapZJjWjNaj0C3S0gbwWnt518bw=;
 b=IrQDKeTaHKmX6s7E+puWV9XjiH9xj2Xaf+h5MOYCQfln0c6LbeGMEnXG5O4iC92P9IV6M0
 PdernQJRmxb0WLmmtfodUtaDH1w24iB6FZnoubC8vQe0VAMOsNo4/S3Zuq6+QXSuDI9fq5
 zcpGIRiJlP1RfdvaNqxedczECPUCvzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709815602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=24aFDZuk3XPs6fOlpapZJjWjNaj0C3S0gbwWnt518bw=;
 b=cjVj8y3HLP7lfuDK/gSuWNKoEl/f8eJMCGr08lx3mSkKGaoBV/y7Y5zd/ndwfXb6nASoUl
 Gxxw4Lnwt+THC7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF0EB136BA;
 Thu,  7 Mar 2024 12:46:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PsMRLTG36WVxSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Mar 2024 12:46:41 +0000
Date: Thu, 7 Mar 2024 13:46:40 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20240307124640.GA18593@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IrQDKeTa;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cjVj8y3H
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-8.01 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-0.996];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -8.01
X-Rspamd-Queue-Id: 3CD1C8CCEC
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

this is the weekly PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2024-03-07:
Short summary of fixes pull:

- i915: Fix applying placement flags
- fbdev: Fix build on PowerMacs after header cleanup
The following changes since commit c6d6a82d8a9f8f9326b760accaa532b839b80140:

  Merge tag 'drm-misc-next-fixes-2024-02-29' of https://anongit.freedesktop.org/git/drm/drm-misc into drm-next (2024-03-01 19:38:13 +1000)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-next-fixes-2024-03-07

for you to fetch changes up to 838f865802b9f26135ea7df4e30f89ac2f50c23e:

  arch/powerpc: Remove <linux/fb.h> from backlight code (2024-03-07 13:34:14 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

- i915: Fix applying placement flags
- fbdev: Fix build on PowerMacs after header cleanup

----------------------------------------------------------------
Christian König (1):
      drm/i915: fix applying placement flag

Thomas Zimmermann (4):
      Merge drm/drm-next into drm-misc-next-fixes
      fbdev/chipsfb: Include <linux/backlight.h>
      macintosh/via-pmu-backlight: Include <linux/backlight.h>
      arch/powerpc: Remove <linux/fb.h> from backlight code

 arch/powerpc/include/asm/backlight.h        |  5 ++---
 arch/powerpc/platforms/powermac/backlight.c | 26 --------------------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c     |  2 +-
 drivers/macintosh/via-pmu-backlight.c       |  1 +
 drivers/video/fbdev/chipsfb.c               |  1 +
 5 files changed, 5 insertions(+), 30 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

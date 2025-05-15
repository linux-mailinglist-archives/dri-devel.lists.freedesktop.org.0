Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE62AB8710
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 14:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B596010E875;
	Thu, 15 May 2025 12:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HYswDzW8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLPkNvqM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYq2OfcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wp30eQbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FBC10E873
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 12:55:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C946A1F399;
 Thu, 15 May 2025 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747313736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=iIiXLI7RWE6W0llwQbozdAnXoInM3rcgNahsL0wiUuk=;
 b=HYswDzW87uYtxpovecPBTUtmByM103Bvl9PpWdLQyO3V6Y9R+0FKrbBRF5ILAunSqX8VLt
 avR7iG0bjsA4aLgdrfDn7SaCdWxm+0rgqTPzeHfXASmK7qa2iynB/39TniM7ZVOIq5NAts
 hOYIpzYPwqRhobZv4jXYYmetogcjODM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747313736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=iIiXLI7RWE6W0llwQbozdAnXoInM3rcgNahsL0wiUuk=;
 b=PLPkNvqMVTKEL+X0fFK3atbfXdQ8AAPKtnPojUpxiTTTzx2PXuwmv8k7bPOJbtYvFobZhH
 SlhThIy2l5QePyCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JYq2OfcU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wp30eQbB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747313735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=iIiXLI7RWE6W0llwQbozdAnXoInM3rcgNahsL0wiUuk=;
 b=JYq2OfcUIXP60im++swdaG+hoRAV126FMkhlOkIQ5GNHUp9IvpYW/TksbUzKk3WdVjvgfZ
 qZqXl1tu8Mx94ZrikT0PInzvmzCTW484JiiedlN1TG8nJiGR9DqcnVp/dTUZZFGbIrSzSZ
 YTk2HWaKsxrPtIX8oVd1shAJ7vK+Y5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747313735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=iIiXLI7RWE6W0llwQbozdAnXoInM3rcgNahsL0wiUuk=;
 b=wp30eQbBBpMn9TvscZMCTac241upE0z3k1lLdiRL0U8eI/wMMVG9ByVq1O/OH/3Djy7rEy
 fEN7K9cV/nWErzCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 650D6139D0;
 Thu, 15 May 2025 12:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +vlyF0fkJWiQEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 May 2025 12:55:35 +0000
Date: Thu, 15 May 2025 14:55:34 +0200
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
Message-ID: <20250515125534.GA41174@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C946A1F399
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
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

here's the weekly PR for drm-misc-fixes. The dma-buf fix affects
multiple subsystems.

Best regards
Thomas

drm-misc-fixes-2025-05-15:
Short summary of fixes pull:

dma-buf:
- Avoid memory reordering in fence handling

ivpu:
- Fix buffer size in debugfs code

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()
The following changes since commit 7c6fa1797a725732981f2d77711c867166737719:

  drm/panel: simple: Update timings for AUO G101EVN010 (2025-05-06 13:58:46 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-05-15

for you to fetch changes up to 72c7d62583ebce7baeb61acce6057c361f73be4a:

  dma-buf: insert memory barrier before updating num_fences (2025-05-14 15:31:23 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

dma-buf:
- Avoid memory reordering in fence handling

ivpu:
- Fix buffer size in debugfs code

meson:
- Avoid integer overflow in mode-clock calculations

panel-mipi-dbi:
- Fix output with drm_client_setup_with_fourcc()

----------------------------------------------------------------
Fabio Estevam (1):
      drm/tiny: panel-mipi-dbi: Use drm_client_setup_with_fourcc()

Hyejeong Choi (1):
      dma-buf: insert memory barrier before updating num_fences

I Hsin Cheng (1):
      drm/meson: Use 1000ULL when operating with mode->clock

Markus Burri (1):
      accel/ivpu: Use effective buffer size for zero terminator

 drivers/accel/ivpu/ivpu_debugfs.c          | 2 +-
 drivers/dma-buf/dma-resv.c                 | 5 +++--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c      | 5 ++++-
 4 files changed, 10 insertions(+), 6 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E13A1B1B8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1072310E919;
	Fri, 24 Jan 2025 08:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JQ8dZu9g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7bfgr94b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wp5TAYXU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u+Esgftw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96810E2B8;
 Fri, 24 Jan 2025 08:29:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D681D1F38F;
 Fri, 24 Jan 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737707375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=y+tmx7eWnJ7qvWaN9HX6ZeHVjgCS8dsZQjFEghbUT6g=;
 b=JQ8dZu9gbamtuOyCu0IGePS56hdrQZcW8SPvHzOhWJR29KlVjavAyTgRs4E5T8pYoeo4FD
 xvNEt2Kw5Pyd7q9csh12g1fdkYqX6wkqlaKq/wbVYv0nQdS/0hXqBc72evVlAuSxkstbfd
 BYx/Qtdtric198RebYeaC+14ETKaOlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737707375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=y+tmx7eWnJ7qvWaN9HX6ZeHVjgCS8dsZQjFEghbUT6g=;
 b=7bfgr94bPSWuwR+bGVzQugvC4O6KbYYJmgnH62zFee7bEYoENqWjdBykWatkKFjVEpMKZA
 mlYtFvJ/uwRGtmAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wp5TAYXU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u+Esgftw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737707374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=y+tmx7eWnJ7qvWaN9HX6ZeHVjgCS8dsZQjFEghbUT6g=;
 b=Wp5TAYXUAl9n9aSpX0fQkw/OiLV2qEuDZh+SsjcN9JP/qwHZLi3inbHatxzXDFn9mFXXa/
 vuaYzgqHNzoMu06qqvhfUwXjztmifjiQ9V/G7qEYApNa+1QeGkq4cDMNUsIUoz1sBKCInv
 3vN48s1TOToeEjFUPrU5THV8CZCqQ4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737707374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=y+tmx7eWnJ7qvWaN9HX6ZeHVjgCS8dsZQjFEghbUT6g=;
 b=u+Esgftw/uwsq/fD/K+sKyHDBN7+XV0f0jnnCi3E0vu59IbT/7MWKQv2azN4eXqI2YhDgY
 vFKuyeUdcRaaokBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 727C7139CB;
 Fri, 24 Jan 2025 08:29:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KcGlGm5Pk2cAcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:29:34 +0000
Date: Fri, 24 Jan 2025 09:29:32 +0100
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
Message-ID: <20250124082932.GA13715@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: D681D1F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim]
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

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-01-24:
Short summary of fixes pull:

bochs:
- Fix double-free on driver removal

client:
- Improve support for tile-based modes
- Fix fbdev Kconfig select rules

xlnx:
- zynqmp_dp: Add locking to DP-bridge enable helper
The following changes since commit ef84aee151bd6c2c9223c8b430cae21d57b5e1c1:

  drm/bridge: ite-it6263: Prevent error pointer dereference in probe() (2025-01-15 11:27:08 +0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-01-24

for you to fetch changes up to 0a1ee19d46b71691c5acdf234bb6105913bd9add:

  drm: zynqmp_dp: Unlock on error in zynqmp_dp_bridge_atomic_enable() (2025-01-24 09:26:45 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

bochs:
- Fix double-free on driver removal

client:
- Improve support for tile-based modes
- Fix fbdev Kconfig select rules

xlnx:
- zynqmp_dp: Add locking to DP-bridge enable helper

----------------------------------------------------------------
Arnd Bergmann (1):
      drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER

Dan Carpenter (1):
      drm: zynqmp_dp: Unlock on error in zynqmp_dp_bridge_atomic_enable()

Maarten Lankhorst (2):
      drm/modeset: Handle tiled displays in pan_display_atomic.
      drm/client: Handle tiled displays better

Thomas Zimmermann (1):
      drm/bochs: Do not put DRM device in PCI remove callback

 drivers/gpu/drm/Kconfig              |  3 +++
 drivers/gpu/drm/drm_client_modeset.c |  9 +++++++++
 drivers/gpu/drm/drm_fb_helper.c      | 14 ++++++++------
 drivers/gpu/drm/tiny/bochs.c         |  1 -
 drivers/gpu/drm/xlnx/zynqmp_dp.c     |  3 +--
 5 files changed, 21 insertions(+), 9 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

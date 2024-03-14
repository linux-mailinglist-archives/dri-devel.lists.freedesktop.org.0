Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FC87B943
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CC810F97D;
	Thu, 14 Mar 2024 08:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mnRiWAbE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KV+d02jv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mnRiWAbE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KV+d02jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89B510F965;
 Thu, 14 Mar 2024 08:28:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 30A6B1F812;
 Thu, 14 Mar 2024 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710404915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=W/PwK9NmBZy7kAoDA/4HoaQwsTKIoX8v8arhci1DZhY=;
 b=mnRiWAbEvMTMxB9YnnCWDn3u2k5/jBVQ1C9m44HhPNJUuIw3ZJ5ZGBbUhAE2RLqQmDPjGf
 9fa/Qkg0yPDrv6v3N5yKZ3fqF3/eSESkice4lIAiYIGcHE8hrzYvIWH/ncrtMdwKmk1l/6
 impDjlH8NA1+ZpC97jUP4hIr5DTxOok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710404915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=W/PwK9NmBZy7kAoDA/4HoaQwsTKIoX8v8arhci1DZhY=;
 b=KV+d02jvSNOSO0AJvzpH+FtyFZnsGbX/gfahX8DItO5vnuRezZEG2bSHyxguDhctqKl735
 nziCWYiF82/ierCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710404915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=W/PwK9NmBZy7kAoDA/4HoaQwsTKIoX8v8arhci1DZhY=;
 b=mnRiWAbEvMTMxB9YnnCWDn3u2k5/jBVQ1C9m44HhPNJUuIw3ZJ5ZGBbUhAE2RLqQmDPjGf
 9fa/Qkg0yPDrv6v3N5yKZ3fqF3/eSESkice4lIAiYIGcHE8hrzYvIWH/ncrtMdwKmk1l/6
 impDjlH8NA1+ZpC97jUP4hIr5DTxOok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710404915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=W/PwK9NmBZy7kAoDA/4HoaQwsTKIoX8v8arhci1DZhY=;
 b=KV+d02jvSNOSO0AJvzpH+FtyFZnsGbX/gfahX8DItO5vnuRezZEG2bSHyxguDhctqKl735
 nziCWYiF82/ierCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B15171386D;
 Thu, 14 Mar 2024 08:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7p3LKTK18mV7JAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Mar 2024 08:28:34 +0000
Date: Thu, 14 Mar 2024 09:28:33 +0100
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
Message-ID: <20240314082833.GA8761@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mnRiWAbE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KV+d02jv
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 30A6B1F812
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

here's the PR for drm-misc-next-fixes for this week. There's a fix
for nouveau BOs and quite a few fixes for get_modes() functions.

Best regards
Thomas

drm-misc-next-fixes-2024-03-14:
Short summary of fixes pull:

probe-helper:
- never return negative values from .get_modes() plus driver fixes

nouveau:
- clear bo resource bus after eviction
- documentation fixes
The following changes since commit 838f865802b9f26135ea7df4e30f89ac2f50c23e:

  arch/powerpc: Remove <linux/fb.h> from backlight code (2024-03-07 13:34:14 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-03-14

for you to fetch changes up to 9dd81b2e1ec72a3759f8d6bb6e9cbef93aab6227:

  drm/exynos: simplify the return value handling in exynos_dp_get_modes() (2024-03-13 10:44:14 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

probe-helper:
- never return negative values from .get_modes() plus driver fixes

nouveau:
- clear bo resource bus after eviction
- documentation fixes

----------------------------------------------------------------
Dave Airlie (1):
      nouveau: reset the bo resource bus info after an eviction

Jani Nikula (8):
      drm/probe-helper: warn about negative .get_modes()
      drm/panel: do not return negative error codes from drm_panel_get_modes()
      drm/exynos: do not return negative values from .get_modes()
      drm/bridge: lt8912b: do not return negative values from .get_modes()
      drm/imx/ipuv3: do not return negative values from .get_modes()
      drm/vc4: hdmi: do not return negative values from .get_modes()
      drm/bridge: lt9611uxc: use int for holding number of modes
      drm/exynos: simplify the return value handling in exynos_dp_get_modes()

Timur Tabi (1):
      drm/nouveau: fix kerneldoc warnings

 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 16 +++++++---------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  2 +-
 drivers/gpu/drm/drm_panel.c                    | 17 +++++++++++------
 drivers/gpu/drm/drm_probe_helper.c             |  7 +++++++
 drivers/gpu/drm/exynos/exynos_dp.c             |  7 +++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c       |  4 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c           |  4 ++--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c   |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c           |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c |  9 +++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                 |  2 +-
 include/drm/drm_modeset_helper_vtables.h       |  3 ++-
 12 files changed, 49 insertions(+), 28 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

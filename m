Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F10B21E90
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936F510E59D;
	Tue, 12 Aug 2025 06:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qlFkYx7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wRMxzebO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qlFkYx7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wRMxzebO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B6A10E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:47:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35B001F452;
 Tue, 12 Aug 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754981234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtuKeKIeuEjLg0XyFP88BorDdtzg+aRcI7SABs73KTI=;
 b=qlFkYx7JMt6EJtIw1pvz6gwwYtnQ4tpLkA1Vdu/H3RTbJ+2bStbq1AaV/al6KhTMoWGeXd
 px12grDeuAmKHCZAxPWuv/uydV1RSVP6L17Bbv8AZsAolEPQ/15gYEYV974rrBtXrYRL+Z
 7hHQS1BR50Zu6JTrJuOsYtHx6uBgdYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754981234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtuKeKIeuEjLg0XyFP88BorDdtzg+aRcI7SABs73KTI=;
 b=wRMxzebOxX+xeGApwcvIn3qA7IFOV64/I+Y+TKbrDn8asneyDVECUG4MCW24BqBgAKTx1v
 5QEk0PRUwB5vdVCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qlFkYx7J;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wRMxzebO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754981234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtuKeKIeuEjLg0XyFP88BorDdtzg+aRcI7SABs73KTI=;
 b=qlFkYx7JMt6EJtIw1pvz6gwwYtnQ4tpLkA1Vdu/H3RTbJ+2bStbq1AaV/al6KhTMoWGeXd
 px12grDeuAmKHCZAxPWuv/uydV1RSVP6L17Bbv8AZsAolEPQ/15gYEYV974rrBtXrYRL+Z
 7hHQS1BR50Zu6JTrJuOsYtHx6uBgdYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754981234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtuKeKIeuEjLg0XyFP88BorDdtzg+aRcI7SABs73KTI=;
 b=wRMxzebOxX+xeGApwcvIn3qA7IFOV64/I+Y+TKbrDn8asneyDVECUG4MCW24BqBgAKTx1v
 5QEk0PRUwB5vdVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5F5C1351A;
 Tue, 12 Aug 2025 06:47:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O7yXKnHjmmiUSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 06:47:13 +0000
Date: Tue, 12 Aug 2025 08:47:12 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250812064712.GA14554@2a02-2454-fd5e-fd00-2c49-c639-c55f-a125.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[16]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 35B001F452
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

this PR contains a number of left-over changes from drm-misc-next-fixes
for upstream. Most importantly, there's a fix for leaking OF nodes and
several fixes for format selection in fbdev emulation.

Best regards
Thomas

drm-misc-next-fixes-2025-08-12:
Short summary of fixes pull:

bridge:
- fix OF-node leak
- fix documentation

fbdev-emulation:
- pass correct format info to drm_helper_mode_fill_fb_struct()

panfrost:
- print correct RSS size
The following changes since commit 6531a2cf07ef156956840853692755cc7e1621b7:

  Merge tag 'drm-xe-next-fixes-2025-07-31' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-08-01 07:09:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-08-12

for you to fetch changes up to 54d4f445517fe8350d735624d7f4225e7511d9eb:

  drm/panfrost: Print RSS for tiler heap BO's in debugfs GEMS file (2025-08-12 08:31:47 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- fix OF-node leak
- fix documentation

fbdev-emulation:
- pass correct format info to drm_helper_mode_fill_fb_struct()

panfrost:
- print correct RSS size

----------------------------------------------------------------
Adrián Larumbe (1):
      drm/panfrost: Print RSS for tiler heap BO's in debugfs GEMS file

Andy Yan (1):
      drm/bridge: Describe the newly introduced drm_connector parameter for drm_bridge_detect

Dmitry Baryshkov (1):
      drm/bridge: document HDMI CEC callbacks

Imre Deak (3):
      drm/omap: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
      drm/nouveau: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
      drm/radeon: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()

Johan Hovold (1):
      drm/bridge: fix OF node leak

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next-fixes

 drivers/gpu/drm/bridge/aux-bridge.c       |  2 ++
 drivers/gpu/drm/drm_bridge.c              |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c |  9 ++----
 drivers/gpu/drm/nouveau/nouveau_display.h |  3 ++
 drivers/gpu/drm/omapdrm/omap_fb.c         | 23 +++++++--------
 drivers/gpu/drm/omapdrm/omap_fb.h         |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  5 +++-
 drivers/gpu/drm/panfrost/panfrost_gem.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_display.c   |  5 ++--
 drivers/gpu/drm/radeon/radeon_fbdev.c     | 11 +++----
 drivers/gpu/drm/radeon/radeon_mode.h      |  2 ++
 include/drm/drm_bridge.h                  | 48 +++++++++++++++++++++++++++++++
 12 files changed, 85 insertions(+), 28 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

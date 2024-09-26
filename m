Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D598734E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 14:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9026410EAA9;
	Thu, 26 Sep 2024 12:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jyXYjfot";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y/kf8SuE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jyXYjfot";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y/kf8SuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C579C10E315;
 Thu, 26 Sep 2024 12:10:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2DC021F871;
 Thu, 26 Sep 2024 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727352647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PysjdaUu0eBc4U+fMis6mSY9oLD35SSyBV7Sfu7nJYs=;
 b=jyXYjfotKpAPY5aJC5tpdz6EuJ+SNBHskVIBaqjvnwOnoenniiWIB7pxkkRvXFcCFsNtUl
 NWxRikEP3MnE1ZR9Qv/F6swCtduphpNrtHz17REM0gsc4l4K183XoCS9gtZLuascOmieF/
 uFAtP+wwpQL6zFbW7QjSc0n3oumLpxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727352647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PysjdaUu0eBc4U+fMis6mSY9oLD35SSyBV7Sfu7nJYs=;
 b=Y/kf8SuE0GQomCwv9+w+tEcEiDuLIP+nQZq/cfoeG9FTGFiLwk1ENqCv5YQ7yHKlegtZ9n
 q3BsxKK36nqFGLBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jyXYjfot;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Y/kf8SuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727352647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PysjdaUu0eBc4U+fMis6mSY9oLD35SSyBV7Sfu7nJYs=;
 b=jyXYjfotKpAPY5aJC5tpdz6EuJ+SNBHskVIBaqjvnwOnoenniiWIB7pxkkRvXFcCFsNtUl
 NWxRikEP3MnE1ZR9Qv/F6swCtduphpNrtHz17REM0gsc4l4K183XoCS9gtZLuascOmieF/
 uFAtP+wwpQL6zFbW7QjSc0n3oumLpxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727352647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PysjdaUu0eBc4U+fMis6mSY9oLD35SSyBV7Sfu7nJYs=;
 b=Y/kf8SuE0GQomCwv9+w+tEcEiDuLIP+nQZq/cfoeG9FTGFiLwk1ENqCv5YQ7yHKlegtZ9n
 q3BsxKK36nqFGLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9238613318;
 Thu, 26 Sep 2024 12:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MZI2IEZP9Wa3TQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Sep 2024 12:10:46 +0000
Date: Thu, 26 Sep 2024 14:10:45 +0200
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
Message-ID: <20240926121045.GA561653@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 2DC021F871
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.51
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

this is the PR for drm-misc-fixes for this week. Mostly the usual small
changes. That fix in the atomic-modesetting code touches UAPI code, but
does not change the UAPI itself.

Best regards
Thomas

drm-misc-fixes-2024-09-26:
Short summary of fixes pull:

atomic:
- Use correct type when reading damage rectangles

display:
- Fix kernel docs

dp-mst:
- Fix DSC decompression detection

hdmi:
- Fix infoframe size

panthor:
- Fix locking

sched:
- Update maintainers
- Fix race condition whne queueing up jobs

sysfb:
- Disable sysfb if framebuffer parent device is unknown

vbox:
- Fix VLA handling
The following changes since commit 45c690aea8ee5b7d012cd593bd288540a4bfdbf0:

  drm/tegra: Use iommu_paging_domain_alloc() (2024-09-10 15:40:27 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-09-26

for you to fetch changes up to ad604f0a4c040dcb8faf44dc72db25e457c28076:

  firmware/sysfb: Disable sysfb for firmware buffers with unknown parent (2024-09-26 08:22:20 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

atomic:
- Use correct type when reading damage rectangles

display:
- Fix kernel docs

dp-mst:
- Fix DSC decompression detection

hdmi:
- Fix infoframe size

panthor:
- Fix locking

sched:
- Update maintainers
- Fix race condition whne queueing up jobs

sysfb:
- Disable sysfb if framebuffer parent device is unknown

vbox:
- Fix VLA handling

----------------------------------------------------------------
Derek Foreman (1):
      drm/connector: hdmi: Fix writing Dynamic Range Mastering infoframes

Dmitry Baryshkov (1):
      drm/display: fix kerneldocs references

Hans de Goede (1):
      drm/vboxvideo: Replace fake VLA at end of vbva_mouse_pointer_shape with real VLA

Imre Deak (1):
      drm/dp_mst: Fix DSC decompression detection in Synaptics branch devices

Philipp Stanner (1):
      MAINTAINERS: drm/sched: Add new maintainers

Rob Clark (1):
      drm/sched: Fix dynamic job-flow control race

Steven Price (1):
      drm/panthor: Fix race when converting group handle to group object

Thomas Zimmermann (2):
      drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
      firmware/sysfb: Disable sysfb for firmware buffers with unknown parent

 Documentation/gpu/drm-kms-helpers.rst           |  4 ++--
 MAINTAINERS                                     |  2 ++
 drivers/firmware/sysfb.c                        |  4 +++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c   | 10 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +---
 drivers/gpu/drm/drm_atomic_uapi.c               |  2 +-
 drivers/gpu/drm/drm_debugfs.c                   |  4 +---
 drivers/gpu/drm/panthor/panthor_sched.c         | 16 ++++++++++++++--
 drivers/gpu/drm/scheduler/sched_entity.c        |  4 ++--
 drivers/gpu/drm/scheduler/sched_main.c          |  7 ++-----
 drivers/gpu/drm/vboxvideo/hgsmi_base.c          | 10 +++++++++-
 drivers/gpu/drm/vboxvideo/vboxvideo.h           |  4 +---
 include/drm/gpu_scheduler.h                     |  2 +-
 include/linux/hdmi.h                            |  9 +++++++++
 14 files changed, 56 insertions(+), 26 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

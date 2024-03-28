Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034288900A5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 14:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FFE10E91F;
	Thu, 28 Mar 2024 13:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iyfG39VZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ev2veOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C016910E334;
 Thu, 28 Mar 2024 13:44:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A7A2206AC;
 Thu, 28 Mar 2024 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711633465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kmTzfL3bcMEfCSVV0rBGQ1+Z9NzunCxP7J4N+YBNjGA=;
 b=iyfG39VZJrvzgzHnetjWOe+sVITq9OhhomNyxtjvbFtA8rsEbmblJPgfP0T0genjji/12N
 UpjqsBy6VgJfu5GoQleb3ulavTr5Yw3YiF6x7lVIFXT+AZYaWPK+Qeqk9V4BzdHmlxvFUa
 ++aTX7tN/1vdCsEpf1/0YmENn8lPwRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711633465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kmTzfL3bcMEfCSVV0rBGQ1+Z9NzunCxP7J4N+YBNjGA=;
 b=+ev2veOKxi+y4BfEi5wwpXt+7LDWVmnysEBxn8OLEKtXUWkRC7AcxyEhqj+HxlEp5mWaWl
 Kk0MRDgMRyBTBOAQ==
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CA9013AF7;
 Thu, 28 Mar 2024 13:44:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id +5mAGDh0BWbuQwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Mar 2024 13:44:24 +0000
Date: Thu, 28 Mar 2024 14:44:17 +0100
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
Message-ID: <20240328134417.GA8673@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-3.10 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,
 imap2.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.10
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

this is the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-03-28:
Short summary of fixes pull:

bridge:
- select DRM_KMS_HELPER

dma-buf:
- fix NULL-pointer deref

dp:
- fix div-by-zero in DP MST unplug code

fbdev:
- select FB_IOMEM_FOPS for SBus

nouveau:
- dmem: handle kcalloc() allocation failures

qxl:
- remove unused variables

rockchip:
- vop2: remove support for AR30 and AB30 formats

sched:
- fix NULL-pointer deref

vmwgfx:
- debugfs: create ttm_resource_manager entry only if needed
The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-03-28

for you to fetch changes up to aba2a144c0bf1ecdcbc520525712fb661392e509:

  drm/qxl: remove unused variable from `qxl_process_single_command()` (2024-03-28 11:15:48 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- select DRM_KMS_HELPER

dma-buf:
- fix NULL-pointer deref

dp:
- fix div-by-zero in DP MST unplug code

fbdev:
- select FB_IOMEM_FOPS for SBus

nouveau:
- dmem: handle kcalloc() allocation failures

qxl:
- remove unused variables

rockchip:
- vop2: remove support for AR30 and AB30 formats

sched:
- fix NULL-pointer deref

vmwgfx:
- debugfs: create ttm_resource_manager entry only if needed

----------------------------------------------------------------
Andy Yan (1):
      drm/rockchip: vop2: Remove AR30 and AB30 format support

Chris Bainbridge (1):
      drm/dp: Fix divide-by-zero regression on DP MST unplug with nouveau

Duoming Zhou (1):
      nouveau/dmem: handle kcalloc() allocation failure

Jocelyn Falempe (1):
      drm/vmwgfx: Create debugfs ttm_resource_manager entry only if needed

Luca Weiss (1):
      drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE

Miguel Ojeda (2):
      drm/qxl: remove unused `count` variable from `qxl_surface_id_alloc()`
      drm/qxl: remove unused variable from `qxl_process_single_command()`

Neil Armstrong (1):
      Revert "drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE"

Pavel Sakharov (1):
      dma-buf: Fix NULL pointer dereference in sanitycheck()

Thomas Zimmermann (3):
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm/drm-fixes into drm-misc-fixes
      fbdev: Select I/O-memory framebuffer ops for SBus

Vitaly Prosyak (1):
      drm/sched: fix null-ptr-deref in init entity

 drivers/dma-buf/st-dma-fence-chain.c         |  6 +++---
 drivers/gpu/drm/display/drm_dp_helper.c      |  7 +++++++
 drivers/gpu/drm/nouveau/nouveau_dmem.c       | 12 ++++++------
 drivers/gpu/drm/qxl/qxl_cmd.c                |  2 --
 drivers/gpu/drm/qxl/qxl_ioctl.c              |  4 +---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  2 --
 drivers/gpu/drm/scheduler/sched_entity.c     | 12 +++++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          | 15 +++++++++------
 drivers/video/fbdev/Kconfig                  |  3 +++
 9 files changed, 38 insertions(+), 25 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B93A84302
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AF510E989;
	Thu, 10 Apr 2025 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nX8Jpc2V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Mn0WmhK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nX8Jpc2V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Mn0WmhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE010E98A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:24:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D3432116A;
 Thu, 10 Apr 2025 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744287856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TXPLsDwqNCm2caNORoFToERsilgnnF77WAFdS9SXJO0=;
 b=nX8Jpc2VY/mFo/WWuy0a3yI1APWRaauv2ceBggdKCowrNDN+Tmmhzl/xAXPGmcYYyAcYiH
 BqSeHY+kCBmNjG5DwbauZqsULy4+r4Ruq6CNSfgBHhakGvtbURICHMW6IiVeyqzCNofHV8
 yC8V5H/Bbzdqf31Xk0tqOt2Uu9PANOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744287856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TXPLsDwqNCm2caNORoFToERsilgnnF77WAFdS9SXJO0=;
 b=6Mn0WmhKLuCQCS4/BqlEuEmVW1YUxolr9NdDOYktwzZ+OaVsNtMChDT40bHPE/PDyS+vgM
 pkrqMH07D2Hv+kAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nX8Jpc2V;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6Mn0WmhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744287856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TXPLsDwqNCm2caNORoFToERsilgnnF77WAFdS9SXJO0=;
 b=nX8Jpc2VY/mFo/WWuy0a3yI1APWRaauv2ceBggdKCowrNDN+Tmmhzl/xAXPGmcYYyAcYiH
 BqSeHY+kCBmNjG5DwbauZqsULy4+r4Ruq6CNSfgBHhakGvtbURICHMW6IiVeyqzCNofHV8
 yC8V5H/Bbzdqf31Xk0tqOt2Uu9PANOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744287856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TXPLsDwqNCm2caNORoFToERsilgnnF77WAFdS9SXJO0=;
 b=6Mn0WmhKLuCQCS4/BqlEuEmVW1YUxolr9NdDOYktwzZ+OaVsNtMChDT40bHPE/PDyS+vgM
 pkrqMH07D2Hv+kAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29A5A132D8;
 Thu, 10 Apr 2025 12:24:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oVb0CHC492c8UwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 12:24:16 +0000
Date: Thu, 10 Apr 2025 14:24:14 +0200
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
Message-ID: <20250410122414.GA32202@2a02-2454-fd5e-fd00-d686-8907-6053-f8d8.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 8D3432116A
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
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

this is the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-04-10:
Short summary of fixes pull:

imagination:
- Fix overflow
- Fix use-after-free

ivpu:
- Fix suspend/resume

nouveau:
- Do not deref dangling pointer

rockchip:
- Set DP/HDMI registers correctly

tests:
- Clean up struct drm_display_mode in various places

udmabuf:
- Fix overflow

virtgpu:
- Set reservation lock on dma-buf import
- Fix error handling in prepare_fb
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-04-10

for you to fetch changes up to 1d34597a1e23004c7dd0ab5f58ba1ef95fd9ded5:

  drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume (2025-04-10 10:51:06 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

imagination:
- Fix overflow
- Fix use-after-free

ivpu:
- Fix suspend/resume

nouveau:
- Do not deref dangling pointer

rockchip:
- Set DP/HDMI registers correctly

tests:
- Clean up struct drm_display_mode in various places

udmabuf:
- Fix overflow

virtgpu:
- Set reservation lock on dma-buf import
- Fix error handling in prepare_fb

----------------------------------------------------------------
Andy Yan (2):
      drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
      drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume

Brendan King (2):
      drm/imagination: take paired job reference
      drm/imagination: fix firmware memory leaks

Chris Bainbridge (1):
      drm/nouveau: prime: fix ttm_bo_delayed_delete oops

Dmitry Osipenko (2):
      drm/virtio: Don't attach GEM to a non-created context in gem_object_open()
      drm/virtio: Fix missed dmabuf unpinning in error path of prepare_fb()

Jacek Lawrynowicz (3):
      accel/ivpu: Fix warning in ivpu_ipc_send_receive_internal()
      accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
      accel/ivpu: Fix PM related deadlocks in MS IOCTLs

Maxime Ripard (7):
      drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: cmdline: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: probe-helper: Fix drm_display_mode memory leak

Rolf Eike Beer (1):
      drm/sti: remove duplicate object names

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Vivek Kasireddy (1):
      drm/virtio: Fix flickering issue seen with imported dmabufs

Xiaogang Chen (1):
      udmabuf: fix a buf size overflow issue during udmabuf creation

 drivers/accel/ivpu/ivpu_debugfs.c               |  4 ++--
 drivers/accel/ivpu/ivpu_ipc.c                   |  3 ++-
 drivers/accel/ivpu/ivpu_ms.c                    | 24 ++++++++++++++++++++++
 drivers/dma-buf/udmabuf.c                       |  2 +-
 drivers/gpu/drm/imagination/pvr_fw.c            | 27 ++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_job.c           |  7 +++++++
 drivers/gpu/drm/imagination/pvr_queue.c         |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_bo.c            |  3 +++
 drivers/gpu/drm/nouveau/nouveau_gem.c           |  3 ---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 23 +++------------------
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c    |  6 +++---
 drivers/gpu/drm/sti/Makefile                    |  2 --
 drivers/gpu/drm/tests/drm_client_modeset_test.c |  9 ++++++++-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 10 ++++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 22 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_modes_test.c          | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |  8 +++++++-
 drivers/gpu/drm/virtio/virtgpu_gem.c            | 11 +++++-----
 drivers/gpu/drm/virtio/virtgpu_plane.c          | 20 ++++++++++++------
 drivers/gpu/drm/virtio/virtgpu_prime.c          |  1 +
 include/drm/drm_kunit_helpers.h                 |  3 +++
 21 files changed, 165 insertions(+), 53 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

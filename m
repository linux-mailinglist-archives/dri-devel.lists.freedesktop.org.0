Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79EAD700B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C037B10E4A9;
	Thu, 12 Jun 2025 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sEbcU+xO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FwSt2SlW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sEbcU+xO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FwSt2SlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C339310E4A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82C9C219B3;
 Thu, 12 Jun 2025 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MOwZkJEWyHMmzJkeXRXenN/SETl9Yy3PvxVdgO5qqUc=;
 b=sEbcU+xOw73fq5XcLGjtRNvKjEszCZe4V+AQfRAh7SY9nLU3zjsxRlSNko6jb6eHTi0vQQ
 MOYO4+Wa+wLdLfF7u1+8LPm6ZrCvj1FxVvdKTML7PRb18uwPNDVveFfdll5+UHdTCpNp9O
 EzHMZGeaK4LnaQv3DCOKvyTLdC171r8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MOwZkJEWyHMmzJkeXRXenN/SETl9Yy3PvxVdgO5qqUc=;
 b=FwSt2SlWzhbW4nrgHMZ4EQiaSrY0A3uS5Y0GiIsPsqwOaoq6per8osooyGWkdL1Dy8/mBZ
 2Tpo2IhiN74xw8AA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sEbcU+xO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FwSt2SlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MOwZkJEWyHMmzJkeXRXenN/SETl9Yy3PvxVdgO5qqUc=;
 b=sEbcU+xOw73fq5XcLGjtRNvKjEszCZe4V+AQfRAh7SY9nLU3zjsxRlSNko6jb6eHTi0vQQ
 MOYO4+Wa+wLdLfF7u1+8LPm6ZrCvj1FxVvdKTML7PRb18uwPNDVveFfdll5+UHdTCpNp9O
 EzHMZGeaK4LnaQv3DCOKvyTLdC171r8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MOwZkJEWyHMmzJkeXRXenN/SETl9Yy3PvxVdgO5qqUc=;
 b=FwSt2SlWzhbW4nrgHMZ4EQiaSrY0A3uS5Y0GiIsPsqwOaoq6per8osooyGWkdL1Dy8/mBZ
 2Tpo2IhiN74xw8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 500F9132D8;
 Thu, 12 Jun 2025 12:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hDUyEgPGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm: Fix includes of <linux/export.h>
Date: Thu, 12 Jun 2025 14:09:54 +0200
Message-ID: <20250612121633.229222-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 82C9C219B3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

Some source files in DRM do not include <linux/export.h> properly;
others do when they don't have to. The build scripts now warn about
these cases.

This series fixes DRM core and helpers. There are a few more warnings
in drivers.

Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
<linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
check missing #include <linux/export.h> when W=1") added these new
warnings in v6.16-rc1.

Thomas Zimmermann (9):
  drm: Do not include <linux/export.h>
  drm: Include <linux/export.h>
  drm/bridge: Include <linux/export.h>
  drm/client: Include <linux/export.h>
  drm/display: Include <linux/export.h>
  drm/gem: Include <linux/export.h>
  drm/panel: Include <linux/export.h>
  drm/scheduler: Include <linux/export.h>
  drm/ttm: Include <linux/export.h>

 drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c    | 2 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c     | 1 +
 drivers/gpu/drm/bridge/aux-bridge.c                    | 1 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c                | 1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c         | 2 ++
 drivers/gpu/drm/bridge/panel.c                         | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c                  | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c           | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c          | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c         | 1 +
 drivers/gpu/drm/clients/drm_client_setup.c             | 2 ++
 drivers/gpu/drm/display/drm_bridge_connector.c         | 1 +
 drivers/gpu/drm/display/drm_dp_aux_bus.c               | 1 +
 drivers/gpu/drm/display/drm_dp_cec.c                   | 1 +
 drivers/gpu/drm/display/drm_dp_helper.c                | 1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c          | 1 +
 drivers/gpu/drm/display/drm_dp_tunnel.c                | 1 +
 drivers/gpu/drm/display/drm_dsc_helper.c               | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c        | 1 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c          | 1 +
 drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c | 1 +
 drivers/gpu/drm/display/drm_hdmi_helper.c              | 1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c        | 2 ++
 drivers/gpu/drm/display/drm_scdc_helper.c              | 1 +
 drivers/gpu/drm/drm_atomic.c                           | 2 +-
 drivers/gpu/drm/drm_atomic_helper.c                    | 1 +
 drivers/gpu/drm/drm_atomic_state_helper.c              | 1 +
 drivers/gpu/drm/drm_atomic_uapi.c                      | 1 +
 drivers/gpu/drm/drm_auth.c                             | 1 +
 drivers/gpu/drm/drm_bridge.c                           | 1 +
 drivers/gpu/drm/drm_bridge_helper.c                    | 2 ++
 drivers/gpu/drm/drm_buddy.c                            | 1 +
 drivers/gpu/drm/drm_client.c                           | 1 +
 drivers/gpu/drm/drm_client_event.c                     | 1 +
 drivers/gpu/drm/drm_client_modeset.c                   | 2 ++
 drivers/gpu/drm/drm_color_mgmt.c                       | 1 +
 drivers/gpu/drm/drm_connector.c                        | 1 +
 drivers/gpu/drm/drm_damage_helper.c                    | 2 ++
 drivers/gpu/drm/drm_debugfs_crc.c                      | 1 +
 drivers/gpu/drm/drm_drv.c                              | 1 +
 drivers/gpu/drm/drm_edid.c                             | 1 +
 drivers/gpu/drm/drm_exec.c                             | 2 ++
 drivers/gpu/drm/drm_fb_dma_helper.c                    | 2 ++
 drivers/gpu/drm/drm_fb_helper.c                        | 1 +
 drivers/gpu/drm/drm_fbdev_dma.c                        | 1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                      | 1 +
 drivers/gpu/drm/drm_fbdev_ttm.c                        | 1 +
 drivers/gpu/drm/drm_file.c                             | 1 +
 drivers/gpu/drm/drm_flip_work.c                        | 1 +
 drivers/gpu/drm/drm_format_helper.c                    | 1 +
 drivers/gpu/drm/drm_gem.c                              | 1 +
 drivers/gpu/drm/drm_gem_atomic_helper.c                | 1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c           | 1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c                   | 1 +
 drivers/gpu/drm/drm_gem_vram_helper.c                  | 1 +
 drivers/gpu/drm/drm_gpusvm.c                           | 1 +
 drivers/gpu/drm/drm_gpuvm.c                            | 1 +
 drivers/gpu/drm/drm_managed.c                          | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                         | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c                         | 1 +
 drivers/gpu/drm/drm_mode_config.c                      | 1 +
 drivers/gpu/drm/drm_modeset_helper.c                   | 2 ++
 drivers/gpu/drm/drm_modeset_lock.c                     | 2 ++
 drivers/gpu/drm/drm_panel.c                            | 1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c           | 1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c         | 1 +
 drivers/gpu/drm/drm_panic.c                            | 1 +
 drivers/gpu/drm/drm_pci.c                              | 1 -
 drivers/gpu/drm/drm_plane.c                            | 1 +
 drivers/gpu/drm/drm_plane_helper.c                     | 1 +
 drivers/gpu/drm/drm_print.c                            | 1 +
 drivers/gpu/drm/drm_privacy_screen.c                   | 1 +
 drivers/gpu/drm/drm_self_refresh_helper.c              | 1 +
 drivers/gpu/drm/drm_simple_kms_helper.c                | 1 +
 drivers/gpu/drm/drm_suballoc.c                         | 2 ++
 drivers/gpu/drm/drm_syncobj.c                          | 1 +
 drivers/gpu/drm/drm_vblank_work.c                      | 2 ++
 drivers/gpu/drm/drm_vma_manager.c                      | 1 +
 drivers/gpu/drm/drm_writeback.c                        | 1 +
 drivers/gpu/drm/lib/drm_random.c                       | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c          | 1 +
 drivers/gpu/drm/scheduler/sched_entity.c               | 1 +
 drivers/gpu/drm/scheduler/sched_fence.c                | 1 +
 drivers/gpu/drm/scheduler/sched_main.c                 | 1 +
 drivers/gpu/drm/tests/drm_kunit_helpers.c              | 1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c          | 3 +++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c           | 3 +++
 drivers/gpu/drm/ttm/ttm_agp_backend.c                  | 1 +
 drivers/gpu/drm/ttm/ttm_backup.c                       | 2 ++
 drivers/gpu/drm/ttm/ttm_bo.c                           | 1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                      | 2 ++
 drivers/gpu/drm/ttm/ttm_bo_vm.c                        | 2 ++
 drivers/gpu/drm/ttm/ttm_device.c                       | 1 +
 drivers/gpu/drm/ttm/ttm_execbuf_util.c                 | 2 ++
 drivers/gpu/drm/ttm/ttm_pool.c                         | 1 +
 drivers/gpu/drm/ttm/ttm_range_manager.c                | 2 ++
 drivers/gpu/drm/ttm/ttm_resource.c                     | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c                           | 1 +
 99 files changed, 120 insertions(+), 2 deletions(-)

-- 
2.49.0


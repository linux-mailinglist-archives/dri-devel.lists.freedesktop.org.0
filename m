Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7AA54B7E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4436110E243;
	Thu,  6 Mar 2025 13:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="G2CaK7t0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9VuQUlgN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G2CaK7t0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9VuQUlgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07C710E70E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:07:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99F6B21197;
 Thu,  6 Mar 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741266422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=//bza1jLAQ9R5hXs1RulT31MB11FmOi8bVtR4lC1ToY=;
 b=G2CaK7t0f7ZExDFV2Id7dgFeMF8DC0be/3FFRt/4u06avaj2ecGgOT1m6Uy239alWpZBV9
 ForlNvAklH290uyXGvBcFqdQzknbMnBZ8zpbVqVbzlGbqp7VD6dTuFStqSHd9cRrS+1aZF
 Q26AhG+lX75cjk69nJO8Wx8Rw8BSa7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741266422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=//bza1jLAQ9R5hXs1RulT31MB11FmOi8bVtR4lC1ToY=;
 b=9VuQUlgN7EwaF1fcSl8v0e247abUsVFOoVJModgzZtutll5etDiQqqfB7KTw/diyUit7NP
 kYfBJoUEcet+x1CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741266422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=//bza1jLAQ9R5hXs1RulT31MB11FmOi8bVtR4lC1ToY=;
 b=G2CaK7t0f7ZExDFV2Id7dgFeMF8DC0be/3FFRt/4u06avaj2ecGgOT1m6Uy239alWpZBV9
 ForlNvAklH290uyXGvBcFqdQzknbMnBZ8zpbVqVbzlGbqp7VD6dTuFStqSHd9cRrS+1aZF
 Q26AhG+lX75cjk69nJO8Wx8Rw8BSa7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741266422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=//bza1jLAQ9R5hXs1RulT31MB11FmOi8bVtR4lC1ToY=;
 b=9VuQUlgN7EwaF1fcSl8v0e247abUsVFOoVJModgzZtutll5etDiQqqfB7KTw/diyUit7NP
 kYfBJoUEcet+x1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3535D13A61;
 Thu,  6 Mar 2025 13:07:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cyunC/adyWfTXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 13:07:02 +0000
Date: Thu, 6 Mar 2025 14:07:00 +0100
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
Subject: [PULL] drm-misc-next
Message-ID: <20250306130700.GA485504@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

here's the PR for drm-misc-next. It includes two new drivers for Apple
Touch Bar displays. There are new helpers for TTM's shrinker, which xe
now uses. There are a number of changes to the rockchip driver.

There are also cross-subsystem changes for drivers/base and fbdev. The
latter is actually a change required for memory management.

Best regards
Thomas

drm-misc-next-2025-03-06:
drm-misc-next for v6.15:

Cross-subsystem Changes:

base:
- component: Provide helper to query bound status

fbdev:
- fbtft: Remove access to page->index

Core Changes:

- Fix usage of logging macros in several places

gem:
- Add test function for imported dma-bufs and use it in core and helpers
- Avoid struct drm_gem_object.import_attach

tests:
- Fix lockdep warnings

ttm:
- Add helpers for TTM shrinker

Driver Changes:

adp:
- Add support for Apple Touch Bar displays on M1/M2

amdxdna:
- Fix interrupt handling

appletbdrm:
- Add support for Apple Touch Bar displays on x86

bridge:
- synopsys: Add HDMI audio support
- ti-sn65dsi83: Support negative DE polarity

ipu-v3:
- Remove unused code

nouveau:
- Avoid multiple -Wflex-array-member-not-at-end warnings

panthor:
- Fix CS_STATUS_ defines
- Improve locking

rockchip:
- analogix_dp: Add eDP support
- lvds: Improve logging
- vop2: Improve HDMI mode handling; Add support for RK3576
- Fix shutdown
- Support rk3562-mali

xe:
- Use TTM shrinker
The following changes since commit 7cb3274341bfa5977f3c90503b632986a82705fa:

  drm/panel: Add Visionox RM692E5 panel driver (2025-02-27 09:43:38 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-03-06

for you to fetch changes up to 4423e607ff50157aaf088854b145936cbab4d560:

  drm/gma500: fix inconsistent indenting warning (2025-03-06 10:29:31 +0100)

----------------------------------------------------------------
drm-misc-next for v6.15:

Cross-subsystem Changes:

base:
- component: Provide helper to query bound status

fbdev:
- fbtft: Remove access to page->index

Core Changes:

- Fix usage of logging macros in several places

gem:
- Add test function for imported dma-bufs and use it in core and helpers
- Avoid struct drm_gem_object.import_attach

tests:
- Fix lockdep warnings

ttm:
- Add helpers for TTM shrinker

Driver Changes:

adp:
- Add support for Apple Touch Bar displays on M1/M2

amdxdna:
- Fix interrupt handling

appletbdrm:
- Add support for Apple Touch Bar displays on x86

bridge:
- synopsys: Add HDMI audio support
- ti-sn65dsi83: Support negative DE polarity

ipu-v3:
- Remove unused code

nouveau:
- Avoid multiple -Wflex-array-member-not-at-end warnings

panthor:
- Fix CS_STATUS_ defines
- Improve locking

rockchip:
- analogix_dp: Add eDP support
- lvds: Improve logging
- vop2: Improve HDMI mode handling; Add support for RK3576
- Fix shutdown
- Support rk3562-mali

xe:
- Use TTM shrinker

----------------------------------------------------------------
Adrián Larumbe (2):
      drm/panthor: Replace sleep locks with spinlocks in fdinfo path
      drm/panthor: Avoid sleep locking in the internal BO size path

Alexander Stein (1):
      drm/bridge: ti-sn65dsi83: Support negative DE polarity

Andy Yan (13):
      drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
      drm/rockchip: vop2: Remove AFBC from TRANSFORM_OFFSET register macro
      drm/rockchip: vop2: Add platform specific callback
      drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
      drm/rockchip: vop2: Support for different layer select configuration between VPs
      drm/rockchip: vop2: Introduce vop hardware version
      drm/rockchip: vop2: Register the primary plane and overlay plane separately
      drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
      drm/rockchip: vop2: Add uv swap for cluster window
      dt-bindings: display: vop2: describe constraint SoC by SoC
      dt-bindings: display: vop2: Add missing rockchip,grf property for rk3566/8
      dt-bindings: display: vop2: Add rk3576 support
      drm/rockchip: vop2: Add support for rk3576

Arnd Bergmann (1):
      drm/panel: fix Visionox RM692E5 dependencies

Ashley Smith (1):
      drm/panthor: Update CS_STATUS_ defines to correct values

Charles Han (1):
      drm/gma500: fix inconsistent indenting warning

Colin Ian King (1):
      drm/bridge: Fix spelling mistake "gettin" -> "getting"

Cristian Ciocaltea (2):
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      drm/rockchip: vop2: Consistently use dev_err_probe()

Damon Ding (2):
      drm/rockchip: analogix_dp: Use formalized struct definition for grf field
      drm/rockchip: analogix_dp: Expand device data to support multiple edp display

Dan Carpenter (1):
      drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs

Dr. David Alan Gilbert (9):
      drm/vboxvideo: Remove unused hgsmi_cursor_position
      gpu: host1x: Remove unused host1x_debug_dump_syncpts
      gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
      gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
      gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
      gpu: ipu-v3: Remove unused ipu_image_convert_* functions
      gpu: ipu-v3: Remove unused ipu_vdi_unsetup
      gpu: ipu-v3: ipu-csi: Remove unused functions
      gpu: ipu-v3 ipu-cpmem: Remove unused functions

Gustavo A. R. Silva (1):
      drm/nouveau: Avoid multiple -Wflex-array-member-not-at-end warnings

Heiko Stuebner (6):
      drivers: base: component: add function to query the bound status
      drm/rockchip: Fix shutdown when no drm-device is set up
      drm/rockchip: vop2: add missing bitfield.h include
      drm/rockchip: lvds: move pclk preparation in with clk_get
      drm/rockchip: lvds: Hide scary error messages on probe deferral
      drm/rockchip: lvds: lower log severity for missing pinctrl settings

Jani Nikula (4):
      drm/mipi-dsi: stop passing non struct drm_device to drm_err() and friends
      drm/rockchip: stop passing non struct drm_device to drm_err() and friends
      drm/sched: stop passing non struct drm_device to drm_err() and friends
      drm/print: require struct drm_device for drm_err() and friends

Jiapeng Chong (1):
      drm: adp: Remove unnecessary print function dev_err()

Kerem Karabay (2):
      drm/format-helper: Add conversion from XRGB8888 to BGR888
      drm/tiny: add driver for Apple Touch Bars in x86 Macs

Kever Yang (1):
      dt-bindings: gpu: Add rockchip,rk3562-mali compatible

Lizhi Hou (1):
      accel/amdxdna: Check interrupt register before mailbox_rx_worker exits

Matthew Wilcox (Oracle) (1):
      fbtft: Remove access to page->index

Maxime Ripard (1):
      drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()

Nathan Chancellor (1):
      drm/appletbdrm: Fix format specifier for size_t variables

Philipp Stanner (1):
      drm/sched: drm_sched_job_cleanup(): correct false doc

Sasha Finkelstein (3):
      dt-bindings: display: Add Apple pre-DCP display controller
      drm: adp: Add Apple Display Pipe driver
      MAINTAINERS: Add entries for touchbar display driver

Steven Price (1):
      drm/panthor: Clean up FW version information display

Sugar Zhang (1):
      drm/bridge: synopsys: Add audio support for dw-hdmi-qp

Thomas Hellström (7):
      drm/ttm: Provide a shmem backup implementation
      drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
      drm/ttm: Use fault-injection to test error paths
      drm/ttm: Add a macro to perform LRU iteration
      drm/ttm: Add helpers for shrinking
      drm/xe: Add a shrinker for xe bos
      drm/xe: Increase the XE_PL_TT watermark

Thomas Zimmermann (10):
      drm/gem: Test for imported GEM buffers with helper
      drm/gem-dma: Test for imported buffers with drm_gem_is_imported()
      drm/gem-dma: Use dma_buf from GEM object instance
      drm/gem-shmem: Test for imported buffers with drm_gem_is_imported()
      drm/gem-shmem: Use dma_buf from GEM object instance
      drm/gem-framebuffer: Test for imported buffers with drm_gem_is_imported()
      drm/gem-framebuffer: Use dma_buf from GEM object instance
      drm/fb-dma-helper: Test for imported buffers with drm_gem_is_imported()
      drm/mipi-dbi: Test for imported buffers with drm_gem_is_imported()
      drm/prime: Use dma_buf from GEM object instance

Thorsten Blum (1):
      drm/gma500: Replace deprecated strncpy() with strscpy()

 .../display/apple,h7-display-pipe-mipi.yaml        |   83 +
 .../bindings/display/apple,h7-display-pipe.yaml    |   88 +
 .../bindings/display/panel/apple,summit.yaml       |   58 +
 .../bindings/display/rockchip/rockchip-vop2.yaml   |  111 +-
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    1 +
 MAINTAINERS                                        |   24 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |   17 +-
 drivers/base/component.c                           |   14 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/adp/Kconfig                        |   17 +
 drivers/gpu/drm/adp/Makefile                       |    5 +
 drivers/gpu/drm/adp/adp-mipi.c                     |  276 +++
 drivers/gpu/drm/adp/adp_drv.c                      |  612 +++++++
 drivers/gpu/drm/bridge/sii902x.c                   |    2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  489 ++++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    2 +
 drivers/gpu/drm/drm_fb_dma_helper.c                |    2 +-
 drivers/gpu/drm/drm_format_helper.c                |   54 +
 drivers/gpu/drm/drm_gem.c                          |    4 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |    4 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   30 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |    2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   12 +-
 drivers/gpu/drm/drm_prime.c                        |    8 +-
 drivers/gpu/drm/gma500/cdv_device.c                |    2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    3 +-
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h       |   32 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |    4 +-
 drivers/gpu/drm/nouveau/nvif/object.c              |   12 +-
 drivers/gpu/drm/panel/Kconfig                      |    2 +
 drivers/gpu/drm/panthor/panthor_fw.c               |    9 +-
 drivers/gpu/drm/panthor/panthor_fw.h               |    6 +-
 drivers/gpu/drm/panthor/panthor_heap.c             |   62 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |    8 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   26 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  114 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   16 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   16 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 1574 ++++-------------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |  278 ++-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   80 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       | 1798 +++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c           |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   32 +-
 drivers/gpu/drm/tests/drm_atomic_state_test.c      |   24 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   81 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  254 +--
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   41 -
 drivers/gpu/drm/tiny/Kconfig                       |   12 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/appletbdrm.c                  |  841 +++++++++
 drivers/gpu/drm/ttm/Makefile                       |    2 +-
 drivers/gpu/drm/ttm/ttm_backup.c                   |  207 +++
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  247 ++-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  577 ++++++-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   83 +
 drivers/gpu/drm/vboxvideo/hgsmi_base.c             |   37 -
 drivers/gpu/drm/vboxvideo/vboxvideo_guest.h        |    2 -
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |   46 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   28 +-
 drivers/gpu/drm/xe/Makefile                        |    1 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |    6 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  202 ++-
 drivers/gpu/drm/xe/xe_bo.h                         |   36 +
 drivers/gpu/drm/xe/xe_device.c                     |    8 +
 drivers/gpu/drm/xe/xe_device_types.h               |    2 +
 drivers/gpu/drm/xe/xe_shrinker.c                   |  258 +++
 drivers/gpu/drm/xe/xe_shrinker.h                   |   18 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |    3 +-
 drivers/gpu/host1x/debug.c                         |    9 -
 drivers/gpu/host1x/debug.h                         |    1 -
 drivers/gpu/ipu-v3/ipu-common.c                    |   38 -
 drivers/gpu/ipu-v3/ipu-cpmem.c                     |   23 -
 drivers/gpu/ipu-v3/ipu-csi.c                       |  108 --
 drivers/gpu/ipu-v3/ipu-ic.c                        |   73 -
 drivers/gpu/ipu-v3/ipu-image-convert.c             |   48 -
 drivers/gpu/ipu-v3/ipu-prv.h                       |    2 -
 drivers/gpu/ipu-v3/ipu-vdi.c                       |   11 -
 drivers/staging/fbtft/fbtft-core.c                 |    4 +-
 include/drm/drm_format_helper.h                    |    3 +
 include/drm/drm_gem.h                              |   14 +
 include/drm/drm_gem_shmem_helper.h                 |    2 +-
 include/drm/drm_kunit_helpers.h                    |    2 -
 include/drm/drm_print.h                            |   41 +-
 include/drm/ttm/ttm_backup.h                       |   74 +
 include/drm/ttm/ttm_bo.h                           |   93 +
 include/drm/ttm/ttm_pool.h                         |    8 +
 include/drm/ttm/ttm_tt.h                           |   69 +-
 include/linux/component.h                          |    4 +-
 include/video/imx-ipu-image-convert.h              |   32 -
 include/video/imx-ipu-v3.h                         |   14 -
 94 files changed, 7439 insertions(+), 2263 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 create mode 100644 drivers/gpu/drm/adp/Kconfig
 create mode 100644 drivers/gpu/drm/adp/Makefile
 create mode 100644 drivers/gpu/drm/adp/adp-mipi.c
 create mode 100644 drivers/gpu/drm/adp/adp_drv.c
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

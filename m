Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928889F3AD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04111336D;
	Wed, 10 Apr 2024 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ymCyDg7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jZvTftuS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OEkDUpGy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zA6u6Fbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B17113341
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D4EB5CDA1;
 Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtZnqalSd+A0uPhKiJi0V4AwHvucmsa8PK8RRzy4GwM=;
 b=ymCyDg7dwVaGsYVNa2G1gkpcg8C0ZljI3SHcgM1ggOB5FjvSrLPfmr3y3pEQDwJr3Nn4+i
 DXhW0sMKikNApjOj3eobXXGoqcKJKy9gjnTTCTvf49ZFzKupimPDx+UYf3PQrX/71msB9P
 3ciSFbShV2B0M5gihri0Qd+bepkGYuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtZnqalSd+A0uPhKiJi0V4AwHvucmsa8PK8RRzy4GwM=;
 b=jZvTftuSNFNZoFQr97Edh3PUCjObZx47cw8B1iq9I7gziYR1GZs23lt9aO1REMYhmqitTB
 QDY5rNb9eojQaVCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtZnqalSd+A0uPhKiJi0V4AwHvucmsa8PK8RRzy4GwM=;
 b=OEkDUpGytXf9JkRH+SxBuoAowpdL+xvhoxQHJnCgIq4uFEu2Yw6wHwit7JNEWPcuk2qbDm
 GjAIOMko6cdM/1VjzWHUgcns4N8rJqDFexHOB575N5w4B2mv+g1bILWqUgekShSjqXwb7o
 HAK/5gjJvn29N94BnYmDSaLCPkGU8oY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtZnqalSd+A0uPhKiJi0V4AwHvucmsa8PK8RRzy4GwM=;
 b=zA6u6FbqeHvAGO1odkLH1JbOJi0mfEsMqEbztaDRVD4Ye8eEcIzzbS5vpZcUun2gQxoJgv
 n2PVPdr8UVfQFUBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AACF1390D;
 Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vk8sBbeOFmYdEgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:05:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/43] drm: Provide fbdev emulation per memory manager
Date: Wed, 10 Apr 2024 15:01:56 +0200
Message-ID: <20240410130557.31572-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.30
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

DRM provides 3 different memory managers with slightly different
characteristics: DMA-based, SHMEM-based and TTM. This affects fbdev
emulation as each requires different handling of mmap(). This series
reworks fbdev emulation to provide an optimized emulation for each
of the memory managers.

Patch 1 fixes a minor bug in fbdev-generic.

Patches 2 to 8 implement fbdev-shmem, which is optimized for drivers
with SHMEM-based allocation. Patches 2 to 7 prepare deferred I/O to
support driver-custom page lookups. When the mmap'ed framebuffer sees
a pagefault, the deferred-I/O code can ask the graphics driver of the
page (instead of trying to detect it by itself). Using this hook,
patch 8 implements fbdev-shmem. The code is similar to fbdev-generic,
but does not require an additional shadow buffer for mmap(). Mmap'ed
pages are instead provided from the GEM buffer object. That saves a
few MiB of framebuffer memory and copying between the internal buffers.

Patches 9 to 20 convert SHMEM-based drivers to fbdev-shmem.

Patch 21 adds damage handling and deferred I/O to fbdev-dma. Such
code has been tested on the DMA-based omapdrm and can be adopted for
all drivers.

Patches 22 to 41 convert DMA-based drivers to fbdev-dma. These drivers
could not use it because of the missing support for damage handling.

Patch 42 renames fbdev-generic to fbdev-ttm. Only TTM-based drivers
still use it, so building it can be linked to TTM as well.

Patch 43 cleans up the documentation.

Tested with simpledrm, vc4 and amdgpu.

v2:
- fb-shmem: use drm_driver_legacy_fb_format()
- fix a few typos

Thomas Zimmermann (43):
  drm/fbdev-generic: Do not set physical framebuffer address
  fbdev/deferred-io: Move pageref setup into separate helper
  fbdev/deferred-io: Clean up pageref on lastclose
  fbdev/deferred-io: Test screen_buffer for vmalloc'ed memory
  fbdev/deferred-io: Test smem_start for I/O memory
  fbdev/deferred-io: Always call get_page() for framebuffer pages
  fbdev/deferred-io: Provide get_page hook in struct fb_deferred_io
  drm/fbdev: Add fbdev-shmem
  drm/ast: Use fbdev-shmem
  drm/gud: Use fbdev-shmem
  drm/hyperv: Use fbdev-shmem
  drm/mgag200: Use fbdev-shmem
  drm/solomon: Use fbdev-shmem
  drm/tiny/cirrus: Use fbdev-shmem
  drm/tiny/gm12u320: Use fbdev-shmem
  drm/tiny/ofdrm: Use fbdev-shmem
  drm/tiny/simpledrm: Use fbdev-shmem
  drm/udl: Use fbdev-shmem
  drm/virtio: Use fbdev-shmem
  drm/vkms: Use fbdev-shmem
  drm/fbdev-dma: Implement damage handling and deferred I/O
  drm/arm/komeda: Use fbdev-dma
  drm/hisilicon/kirin: Use fbdev-dma
  drm/imx/lcdc: Use fbdev-dma
  drm/ingenic: Use fbdev-dma
  drm/mediatek: Use fbdev-dma
  drm/panel/panel-ilitek-9341: Use fbdev-dma
  drm/renesas/rcar-du: Use fbdev-dma
  drm/renesas/rz-du: Use fbdev-dma
  drm/renesas/shmobile: Use fbdev-dma
  drm/rockchip: Use fbdev-dma
  drm/tiny/hx8357d: Use fbdev-dma
  drm/tiny/ili9163: Use fbdev-dma
  drm/tiny/ili9225: Use fbdev-dma
  drm/tiny/ili9341: Use fbdev-dma
  drm/tiny/ili9486: Use fbdev-dma
  drm/tiny/mi0283qt: Use fbdev-dma
  drm/tiny/panel-mipi-dbi: Use fbdev-dma
  drm/tiny/repaper: Use fbdev-dma
  drm/tiny/st7586: Use fbdev-dma
  drm/tiny/st7735r: Use fbdev-dma
  drm/fbdev-generic: Convert to fbdev-ttm
  drm/fbdev: Clean up fbdev documentation

 Documentation/gpu/drm-kms-helpers.rst         |  12 +-
 Documentation/gpu/todo.rst                    |  13 -
 drivers/gpu/drm/Makefile                      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 +-
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   4 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   4 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               |  11 +-
 drivers/gpu/drm/drm_fbdev_dma.c               |  65 +++-
 drivers/gpu/drm/drm_fbdev_shmem.c             | 316 ++++++++++++++++++
 .../{drm_fbdev_generic.c => drm_fbdev_ttm.c}  |  81 +++--
 drivers/gpu/drm/gud/gud_drv.c                 |   4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   4 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |   4 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |   4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   4 +-
 drivers/gpu/drm/loongson/Kconfig              |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   4 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |   4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |   4 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   4 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   4 +-
 drivers/gpu/drm/tiny/bochs.c                  |   4 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   4 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
 drivers/gpu/drm/tiny/ili9163.c                |   4 +-
 drivers/gpu/drm/tiny/ili9225.c                |   4 +-
 drivers/gpu/drm/tiny/ili9341.c                |   4 +-
 drivers/gpu/drm/tiny/ili9486.c                |   4 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   4 +-
 drivers/gpu/drm/tiny/repaper.c                |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   4 +-
 drivers/gpu/drm/tiny/st7586.c                 |   4 +-
 drivers/gpu/drm/tiny/st7735r.c                |   4 +-
 drivers/gpu/drm/udl/udl_drv.c                 |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   4 +-
 drivers/video/fbdev/core/fb_defio.c           |  82 +++--
 include/drm/drm_fbdev_generic.h               |  15 -
 include/drm/drm_fbdev_shmem.h                 |  15 +
 include/drm/drm_fbdev_ttm.h                   |  15 +
 include/drm/drm_mode_config.h                 |   4 +-
 include/linux/fb.h                            |   1 +
 55 files changed, 593 insertions(+), 210 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fbdev_shmem.c
 rename drivers/gpu/drm/{drm_fbdev_generic.c => drm_fbdev_ttm.c} (76%)
 delete mode 100644 include/drm/drm_fbdev_generic.h
 create mode 100644 include/drm/drm_fbdev_shmem.h
 create mode 100644 include/drm/drm_fbdev_ttm.h

-- 
2.44.0


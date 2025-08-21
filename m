Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D261DB2EFDF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733C10E891;
	Thu, 21 Aug 2025 07:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1Zz8+1en";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWs5qJZ0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Zz8+1en";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWs5qJZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1C610E897
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:38:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D6D31F38C;
 Thu, 21 Aug 2025 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755761904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=YvSgPjvnH1dvUR+47yzShT+PF0RxFiRZfZRUVAloGCI=;
 b=1Zz8+1enWN/vswdzTvzcgdGnIB1bhEguSmOW7J9SckbPRCvXbzologzEEWGMh6T8brAx4y
 lh93dtXAZZMX9XcCBtzdNAceLcSqEw1XArHsyn1/lJMsJz848WYOss4Jn45pKZGOi2z8P0
 aAmasB4wsnJj4Alt50fwStPkDgNC3xU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755761904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=YvSgPjvnH1dvUR+47yzShT+PF0RxFiRZfZRUVAloGCI=;
 b=wWs5qJZ0vdpGDhlQBcH9hm5ilOLOxeYc3fmqYgf6Y4ptgrt266jqqam6KVVreLxeC3xjkV
 Lx9hAjsJ7P8/4aBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1Zz8+1en;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wWs5qJZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755761904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=YvSgPjvnH1dvUR+47yzShT+PF0RxFiRZfZRUVAloGCI=;
 b=1Zz8+1enWN/vswdzTvzcgdGnIB1bhEguSmOW7J9SckbPRCvXbzologzEEWGMh6T8brAx4y
 lh93dtXAZZMX9XcCBtzdNAceLcSqEw1XArHsyn1/lJMsJz848WYOss4Jn45pKZGOi2z8P0
 aAmasB4wsnJj4Alt50fwStPkDgNC3xU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755761904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=YvSgPjvnH1dvUR+47yzShT+PF0RxFiRZfZRUVAloGCI=;
 b=wWs5qJZ0vdpGDhlQBcH9hm5ilOLOxeYc3fmqYgf6Y4ptgrt266jqqam6KVVreLxeC3xjkV
 Lx9hAjsJ7P8/4aBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE45613867;
 Thu, 21 Aug 2025 07:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id y1YSKe/MpmhLBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 07:38:23 +0000
Date: Thu, 21 Aug 2025 09:38:22 +0200
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
Message-ID: <20250821073822.GA45904@2a02-2454-fd5e-fd00-8f09-b5f-980b-a7ef.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2D6D31F38C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
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

another quiet week in drm-misc-next. There's the usual number of refactorings
and smaller fixes. The highlight of the PR is panthor adding/improving support
for a large number of GPU models.

Best regards
Thomas

drm-misc-next-2025-08-21:
drm-misc-next for v6.18:

Core Changes:

bridge:
- Support Content Protection property

gpuvm:
- Support madvice in Xe driver

mipi:
- Add more multi-read/write helpers for improved error handling

Driver Changes:

amdxdna:
- Refactoring wrt. hardware contexts

bridge:
- display-connector: Improve DP display detection

panel:
- Fix includes in various drivers

panthor:
- Add support for Mali G710, G510, G310, Gx15, Gx20, Gx25
- Improve cache flushing
The following changes since commit dd489c01c3971778c417630f328460021fc8fc61:

  Merge tag 'drm-misc-next-2025-08-14' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-08-19 07:02:30 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-08-21

for you to fetch changes up to 043d9c6928b010be7902a01b5cdfa7d754535b1a:

  drm/bridge: anx7625: register content protect property (2025-08-20 08:22:01 -0700)

----------------------------------------------------------------
drm-misc-next for v6.18:

Core Changes:

bridge:
- Support Content Protection property

gpuvm:
- Support madvice in Xe driver

mipi:
- Add more multi-read/write helpers for improved error handling

Driver Changes:

amdxdna:
- Refactoring wrt. hardware contexts

bridge:
- display-connector: Improve DP display detection

panel:
- Fix includes in various drivers

panthor:
- Add support for Mali G710, G510, G310, Gx15, Gx20, Gx25
- Improve cache flushing

----------------------------------------------------------------
Athul Raj Kollareth (1):
      drm/virtio: clean up minor codestyle issues

Boris Brezillon (2):
      drm/gpuvm: Pass map arguments through a struct
      drm/gpuvm: Kill drm_gpuva_init()

Brigham Campbell (2):
      drm: Add MIPI read_multi func and two write macros
      drm/panel: novatek-nt35560: Clean up driver

Dmitry Baryshkov (1):
      drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts

Himal Prasad Ghimiray (2):
      drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
      drm/gpusvm: Make drm_gpusvm_for_each_* macros public

Hsin-Yi Wang (2):
      drm_bridge: register content protect property
      drm/bridge: anx7625: register content protect property

Karunika Choo (7):
      drm/panthor: Add panthor_hw and move gpu_info initialization into it
      drm/panthor: Simplify getting the GPU model name
      drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
      drm/panthor: Add support for Mali-Gx15 family of GPUs
      drm/panthor: Serialize GPU cache flush operations
      drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
      drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

Lizhi Hou (1):
      accel/amdxdna: Add a function to walk hardware contexts

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Sakari Ailus (1):
      drm/panfrost: Remove redundant pm_runtime_mark_last_busy() calls

Shankari Anand (1):
      rust: drm: update ARef and AlwaysRefCounted imports from sync::aref

Thomas Zimmermann (1):
      drm/panel: panel-samsung-s6e88a0-ams427ap24: Fix includes

 drivers/accel/amdxdna/aie2_ctx.c                   |  38 +--
 drivers/accel/amdxdna/aie2_message.c               |  21 +-
 drivers/accel/amdxdna/aie2_pci.c                   |  97 ++++---
 drivers/accel/amdxdna/aie2_pci.h                   |   2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |  26 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |   8 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   7 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |   2 -
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   1 +
 drivers/gpu/drm/bridge/display-connector.c         |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   9 +
 drivers/gpu/drm/drm_gpusvm.c                       | 124 ++-------
 drivers/gpu/drm/drm_gpuvm.c                        | 287 +++++++++++++++------
 drivers/gpu/drm/drm_mipi_dsi.c                     |  37 +++
 drivers/gpu/drm/imagination/pvr_vm.c               |  15 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  35 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  11 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      | 198 +++++---------
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |   2 +
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   2 -
 drivers/gpu/drm/panthor/Makefile                   |   1 +
 drivers/gpu/drm/panthor/panthor_device.c           |   5 +
 drivers/gpu/drm/panthor/panthor_fw.c               |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c              | 100 +------
 drivers/gpu/drm/panthor/panthor_hw.c               | 125 +++++++++
 drivers/gpu/drm/panthor/panthor_hw.h               |  11 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |  46 +++-
 drivers/gpu/drm/panthor/panthor_regs.h             |   3 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   3 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |  20 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   2 +
 drivers/gpu/drm/xe/xe_vm.c                         |  13 +-
 include/drm/drm_bridge.h                           |   4 +
 include/drm/drm_gpusvm.h                           |  70 +++++
 include/drm/drm_gpuvm.h                            |  38 +--
 include/drm/drm_mipi_dsi.h                         |  35 +++
 include/uapi/drm/panthor_drm.h                     |   3 +
 rust/kernel/drm/device.rs                          |   3 +-
 rust/kernel/drm/driver.rs                          |   2 +-
 rust/kernel/drm/gem/mod.rs                         |   3 +-
 42 files changed, 861 insertions(+), 562 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

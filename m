Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728779648EB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C06710E6D4;
	Thu, 29 Aug 2024 14:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uvkfoIB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDhy3mWY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uvkfoIB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bDhy3mWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D80510E6D1;
 Thu, 29 Aug 2024 14:46:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BD6E1F394;
 Thu, 29 Aug 2024 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724942816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yt2eeuYrl8wWvZMiPL0SlR0Mubmd425u2ZNsZjB+gbc=;
 b=uvkfoIB7nw7cFIvNBobYslLJk3mWonA4svj290m7SgBX9vVwKfKJ5KxpNZRZkcRnScRfV6
 v5P2I4u7BynpUxDKQcYLlxAUZ2symfs/heovQQ2AGXNyCvJTs1ueYLb8QYFLb1RyvKPAFJ
 sTvSu1uVAuFnpWVZJg5PdxdpI1rk3UM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724942816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yt2eeuYrl8wWvZMiPL0SlR0Mubmd425u2ZNsZjB+gbc=;
 b=bDhy3mWYD5Udspg11i9i65xCaTXOUeEDX2FJyp/TwgFjFdHkTGy6NO16ncmOe8cHu9OfN7
 mvKKbah1N8Z4t8BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uvkfoIB7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bDhy3mWY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724942816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yt2eeuYrl8wWvZMiPL0SlR0Mubmd425u2ZNsZjB+gbc=;
 b=uvkfoIB7nw7cFIvNBobYslLJk3mWonA4svj290m7SgBX9vVwKfKJ5KxpNZRZkcRnScRfV6
 v5P2I4u7BynpUxDKQcYLlxAUZ2symfs/heovQQ2AGXNyCvJTs1ueYLb8QYFLb1RyvKPAFJ
 sTvSu1uVAuFnpWVZJg5PdxdpI1rk3UM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724942816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yt2eeuYrl8wWvZMiPL0SlR0Mubmd425u2ZNsZjB+gbc=;
 b=bDhy3mWYD5Udspg11i9i65xCaTXOUeEDX2FJyp/TwgFjFdHkTGy6NO16ncmOe8cHu9OfN7
 mvKKbah1N8Z4t8BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34E42139B0;
 Thu, 29 Aug 2024 14:46:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GZqlC+CJ0GaRWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Aug 2024 14:46:56 +0000
Date: Thu, 29 Aug 2024 16:46:54 +0200
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
Subject: [PULL] drm-misc-next
Message-ID: <20240829144654.GA145538@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9BD6E1F394
X-Spam-Score: -6.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

here's the PR for drm-misc-next for this week. There's one major
change where DRM can now use minor device numbers up to the limit set
by MINORBITS.

Best regards
Thomas

drm-misc-next-2024-08-29:
drm-misc-next for v6.12:

UAPI Changes:

devfs:
- support device numbers up to MINORBITS limit

Core Changes:

ci:
- increase job timeout

devfs:
- use XArray for minor ids

displayport:
- mst: GUID improvements

docs:
- add fixes and cleanups

panic:
- optionally display QR code

Driver Changes:

amdgpu:
- faster vblank disabling
- GUID improvements

gm12u320
- convert to struct drm_edid

host1x:
- fix syncpoint IRQ during resume
- use iommu_paging_domain_alloc()

imx:
- ipuv3: convert to struct drm_edid

omapdrm:
- improve error handling

panel:
- add support for BOE TV101WUM-LL2 plus DT bindings
- novatek-nt35950: improve error handling
- nv3051d: improve error handling
- panel-edp: add support for BOE NE140WUM-N6G; revert support for
  SDC ATNA45AF01
- visionox-vtdr6130: improve error handling; use
  devm_regulator_bulk_get_const()

renesas:
- rz-du: add support for RZ/G2UL plus DT bindings

sti:
- convert to struct drm_edid

tegra:
- gr3d: improve PM domain handling
- convert to struct drm_edid
The following changes since commit f60ef67ff21ede6f3d27d439a136481446dbd8aa:

  drm/vc4: v3d: simplify clock retrieval (2024-08-22 07:57:44 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-29

for you to fetch changes up to 84addde447fd9d713e101437db0d4924855eff4f:

  drm/tiny/gm12u320: convert to struct drm_edid (2024-08-29 14:30:15 +0300)

----------------------------------------------------------------
drm-misc-next for v6.12:

UAPI Changes:

devfs:
- support device numbers up to MINORBITS limit

Core Changes:

ci:
- increase job timeout

devfs:
- use XArray for minor ids

displayport:
- mst: GUID improvements

docs:
- add fixes and cleanups

panic:
- optionally display QR code

Driver Changes:

amdgpu:
- faster vblank disabling
- GUID improvements

gm12u320
- convert to struct drm_edid

host1x:
- fix syncpoint IRQ during resume
- use iommu_paging_domain_alloc()

imx:
- ipuv3: convert to struct drm_edid

omapdrm:
- improve error handling

panel:
- add support for BOE TV101WUM-LL2 plus DT bindings
- novatek-nt35950: improve error handling
- nv3051d: improve error handling
- panel-edp: add support for BOE NE140WUM-N6G; revert support for
  SDC ATNA45AF01
- visionox-vtdr6130: improve error handling; use
  devm_regulator_bulk_get_const()

renesas:
- rz-du: add support for RZ/G2UL plus DT bindings

sti:
- convert to struct drm_edid

tegra:
- gr3d: improve PM domain handling
- convert to struct drm_edid

----------------------------------------------------------------
Abel Vesa (1):
      drm/panel-edp: add BOE NE140WUM-N6G panel entry

Abhishek Tamboli (1):
      drm/panel: nv3051d: Transition to mipi_dsi_dcs_write_seq_multi

Biju Das (2):
      dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
      drm: renesas: rz-du: Add RZ/G2UL DU Support

Hamza Mahfooz (3):
      drm/amd/display: use new vblank enable policy for DCN35+
      drm/amd/display: use a more lax vblank enable policy for DCN35+
      drm/amd/display: use a more lax vblank enable policy for older ASICs

Jani Nikula (8):
      drm/ttm: fix kernel-doc typo for @trylock_only
      drm/mst: switch to guid_t type for GUID
      drm/mst: switch to guid_gen() to generate valid GUIDs
      drm/amd/display: switch to guid_gen() to generate valid GUIDs
      drm/sti/sti_hdmi: convert to struct drm_edid
      drm/tegra: convert to struct drm_edid
      drm/ipuv3/parallel: convert to struct drm_edid
      drm/tiny/gm12u320: convert to struct drm_edid

Jocelyn Falempe (4):
      drm/panic: Add integer scaling to blit()
      drm/rect: Add drm_rect_overlap()
      drm/panic: Simplify logo handling
      drm/panic: Add a QR code panic screen

Lad Prabhakar (1):
      drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du

Lu Baolu (1):
      gpu: host1x: Use iommu_paging_domain_alloc()

Ma Ke (1):
      drm: omapdrm: Add missing check for alloc_ordered_workqueue

Melissa Wen (1):
      MAINTAINERS: remove myself as a VKMS maintainer

Michał Winiarski (3):
      drm: Use XArray instead of IDR for minors
      accel: Use XArray instead of IDR for minors
      drm: Expand max DRM device number to full MINORBITS

Mikko Perttunen (1):
      gpu: host1x: Request syncpoint IRQs only during probe

Neil Armstrong (4):
      dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Panel
      drm/panel: add BOE tv101wum-ll2 panel driver
      drm/panel: visionox-vtdr6130: switch to mipi_dsi wrapped functions
      drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const

Stephan Gerhold (1):
      Revert "drm/panel-edp: Add SDC ATNA45AF01"

Tejas Vipin (1):
      drm/panel: novatek-nt35950: transition to mipi_dsi wrapped functions

Thorsten Blum (1):
      drm/tegra: hub: Use fn parameter directly to fix Coccinelle warning

Ulf Hansson (1):
      drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_list()

Vignesh Raman (1):
      drm/ci: increase timeout for all jobs

renjun wang (2):
      drm/atomic: fix kerneldoc for fake_commit field
      drm: Fix kerneldoc for "Returns" section

 .../bindings/display/panel/boe,tv101wum-ll2.yaml   |   63 ++
 .../bindings/display/renesas,rzg2l-du.yaml         |   32 +-
 MAINTAINERS                                        |    2 +-
 drivers/accel/drm_accel.c                          |  110 +--
 drivers/gpu/drm/Kconfig                            |   31 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   61 +-
 drivers/gpu/drm/ci/test.yml                        |    5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   71 +-
 drivers/gpu/drm/drm_atomic.c                       |    6 -
 drivers/gpu/drm/drm_atomic_helper.c                |    2 -
 drivers/gpu/drm/drm_crtc_internal.h                |    4 +
 drivers/gpu/drm/drm_drv.c                          |  100 +-
 drivers/gpu/drm/drm_file.c                         |    9 +-
 drivers/gpu/drm/drm_gem.c                          |    7 +-
 drivers/gpu/drm/drm_internal.h                     |    4 -
 drivers/gpu/drm/drm_modes.c                        |    1 -
 drivers/gpu/drm/drm_panic.c                        |  340 ++++++-
 drivers/gpu/drm/drm_panic_qr.rs                    | 1003 ++++++++++++++++++++
 drivers/gpu/drm/drm_rect.c                         |    1 -
 drivers/gpu/drm/drm_vblank.c                       |    2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    1 -
 drivers/gpu/drm/i915/i915_vma.h                    |    1 -
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   14 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    5 +
 drivers/gpu/drm/panel/Kconfig                      |    9 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     |  241 +++++
 drivers/gpu/drm/panel/panel-edp.c                  |    3 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |  367 +++----
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  211 ++--
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |  212 ++---
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |    8 -
 drivers/gpu/drm/renesas/rcar-du/Makefile           |    2 -
 drivers/gpu/drm/renesas/rz-du/Kconfig              |    8 +
 drivers/gpu/drm/renesas/rz-du/Makefile             |    2 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |    8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   11 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |    3 +-
 .../renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c    |    0
 .../{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h       |    0
 drivers/gpu/drm/sti/sti_hdmi.c                     |   24 +-
 drivers/gpu/drm/tegra/drm.h                        |    2 +-
 drivers/gpu/drm/tegra/gr3d.c                       |   46 +-
 drivers/gpu/drm/tegra/hub.c                        |    7 +-
 drivers/gpu/drm/tegra/output.c                     |   29 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   13 +-
 drivers/gpu/host1x/dev.c                           |    7 +-
 drivers/gpu/host1x/dev.h                           |    2 +
 drivers/gpu/host1x/hw/intr_hw.c                    |   37 +-
 drivers/gpu/host1x/intr.c                          |   21 +-
 drivers/gpu/host1x/intr.h                          |    5 +
 include/drm/display/drm_dp_mst_helper.h            |   12 +-
 include/drm/drm_accel.h                            |   18 +-
 include/drm/drm_atomic.h                           |    2 +-
 include/drm/drm_file.h                             |    5 +
 include/drm/drm_rect.h                             |   15 +
 include/drm/ttm/ttm_bo.h                           |    2 +-
 59 files changed, 2335 insertions(+), 875 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h (100%)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E03D7D67
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA8C6EA02;
	Tue, 27 Jul 2021 18:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC06E9ED;
 Tue, 27 Jul 2021 18:27:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B13F22232;
 Tue, 27 Jul 2021 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627410443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sQ6ZV92dJ08qx/qugWtkh00/YBKXreku+jL667Muqu0=;
 b=D0cLMEU9NsuCfTXvqQtEbX1HDtbx7wN14JyvEMEAicN/lujXZsMRpaMmHmozuySGPEJ1Uc
 +69RTnQEkpLP/arxjF2vEaZXcAHsp2fphBALU2b6A8hVafYHVRfazH1OMxNQGrIqoGn+rL
 F/hPnngabcThN20zbcKn02itDRhVtBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627410443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sQ6ZV92dJ08qx/qugWtkh00/YBKXreku+jL667Muqu0=;
 b=kRlL1QTjVdWAi74feH3SDtwagrTqK/hY9VDUZ4wLDMoVDiGyXLHa17V1fp4fSe589gMwL3
 4JeEzQqDDzsY/IDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E529F13B86;
 Tue, 27 Jul 2021 18:27:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MJLeNgpQAGGwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Jul 2021 18:27:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 sam@ravnborg.org, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org
Subject: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
Date: Tue, 27 Jul 2021 20:27:07 +0200
Message-Id: <20210727182721.17981-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
IRQ interfaces.

DRM provides IRQ helpers for setting up, receiving and removing IRQ
handlers. It's an abstraction over plain Linux functions. The code
is mid-layerish with several callbacks to hook into the rsp drivers.
Old UMS driver have their interrupts enabled via ioctl, so these
abstractions makes some sense. Modern KMS manage all their interrupts
internally. Using the DRM helpers adds indirection without benefits.

Most KMs drivers already use Linux IRQ functions instead of DRM's
abstraction layer. Patches 1 to 12 convert the remaining ones.
The patches also resolve a bug for devices without assigned interrupt
number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
not detect if the device has no interrupt assigned.

Patch 13 removes an unused function.

Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
the old non-KMS drivers still use the functionality.

Thomas Zimmermann (14):
  drm/amdgpu: Convert to Linux IRQ interfaces
  drm/arm/hdlcd: Convert to Linux IRQ interfaces
  drm/atmel-hlcdc: Convert to Linux IRQ interfaces
  drm/fsl-dcu: Convert to Linux IRQ interfaces
  drm/gma500: Convert to Linux IRQ interfaces
  drm/kmb: Convert to Linux IRQ interfaces
  drm/msm: Convert to Linux IRQ interfaces
  drm/mxsfb: Convert to Linux IRQ interfaces
  drm/radeon: Convert to Linux IRQ interfaces
  drm/tidss: Convert to Linux IRQ interfaces
  drm/tilcdc: Convert to Linux IRQ interfaces
  drm/vc4: Convert to Linux IRQ interfaces
  drm: Remove unused devm_drm_irq_install()
  drm: IRQ midlayer is now legacy

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c      |  21 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h      |   2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c              | 174 ++++++++++---------
 drivers/gpu/drm/arm/hdlcd_drv.h              |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c |  85 +++++----
 drivers/gpu/drm/drm_irq.c                    |  95 +---------
 drivers/gpu/drm/drm_legacy_misc.c            |   3 +-
 drivers/gpu/drm/drm_vblank.c                 |   8 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c    |  78 +++++----
 drivers/gpu/drm/gma500/power.c               |   1 +
 drivers/gpu/drm/gma500/psb_drv.c             |   8 +-
 drivers/gpu/drm/gma500/psb_drv.h             |   5 -
 drivers/gpu/drm/gma500/psb_irq.c             |  26 ++-
 drivers/gpu/drm/gma500/psb_irq.h             |   4 +-
 drivers/gpu/drm/i810/i810_dma.c              |   3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                |  26 ++-
 drivers/gpu/drm/mga/mga_dma.c                |   2 +-
 drivers/gpu/drm/mga/mga_drv.h                |   1 -
 drivers/gpu/drm/msm/msm_drv.c                | 113 +++++++-----
 drivers/gpu/drm/msm/msm_kms.h                |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c            |  81 +++++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.h            |   2 +
 drivers/gpu/drm/r128/r128_cce.c              |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.c          |   4 -
 drivers/gpu/drm/radeon/radeon_irq_kms.c      |  44 ++++-
 drivers/gpu/drm/radeon/radeon_kms.h          |   4 -
 drivers/gpu/drm/tidss/tidss_drv.c            |  15 +-
 drivers/gpu/drm/tidss/tidss_drv.h            |   2 +
 drivers/gpu/drm/tidss/tidss_irq.c            |  27 ++-
 drivers/gpu/drm/tidss/tidss_irq.h            |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c          |  51 ++++--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h          |   3 +
 drivers/gpu/drm/vc4/vc4_drv.c                |   4 -
 drivers/gpu/drm/vc4/vc4_drv.h                |   8 +-
 drivers/gpu/drm/vc4/vc4_irq.c                |  48 +++--
 drivers/gpu/drm/vc4/vc4_v3d.c                |  17 +-
 drivers/gpu/drm/via/via_mm.c                 |   3 +-
 include/drm/drm_device.h                     |  18 +-
 include/drm/drm_drv.h                        |  44 +----
 include/drm/drm_irq.h                        |  32 ----
 include/drm/drm_legacy.h                     |   3 +
 42 files changed, 572 insertions(+), 504 deletions(-)
 delete mode 100644 include/drm/drm_irq.h


base-commit: 2bda1ca4d4acb4892556fec3a7ea1f02afcd40bb
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.32.0


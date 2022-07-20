Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44F57B2FF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FA010EDA4;
	Wed, 20 Jul 2022 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3910FFE8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC086371A9;
 Wed, 20 Jul 2022 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TcQwFaKL1DTmXhBjc0StwbVIEHlFoqZGr5Xw0ItlGr0=;
 b=l/dBc2q5MQXHHrjbQAYyABwV1WW/ZaDo95424LFoXTdfyPfqUScSxUuJ2Lc/mRYGdmOh8F
 7nH1jrbLLPQ9ERKBZfgOccqjlgzzbJ5dpgF3uZ09DQmb1oNi8KjlsmpXxT6/AGf8Ons6u6
 VVXVn0X4riG0KrkorI0zOCiNStZySqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TcQwFaKL1DTmXhBjc0StwbVIEHlFoqZGr5Xw0ItlGr0=;
 b=PPuR2eIqymvjjDVIJ+hHFvjkBSn9yfifdC6c9KggxOPej/pKbM6v52g1B9Ytrow3lLQ93V
 gs6EasBvtqm2/rCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8D4913ABB;
 Wed, 20 Jul 2022 08:31:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X6wpLEe912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 0/7] drm: Clean up plane helpers
Date: Wed, 20 Jul 2022 10:30:51 +0200
Message-Id: <20220720083058.15371-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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
Cc: linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane helpers are included by dozens of files without any need. Only
a hand full of source files need anything from drm_plane_helper.h.

Untangle everything and tidy up the code a bit. The patches were built
on x64-64, aarch64 and arm without issues.

Thomas Zimmermann (7):
  drm/vmwgfx: Remove trailing whitespace
  drm/atomic-helper: Move DRM_PLANE_HELPER_NO_SCALING to atomic helpers
  drm/atomic-helper: Remove _HELPER_ infix from
    DRM_PLANE_HELPER_NO_SCALING
  drm: Remove unnecessary include statements of drm_plane_helper.h
  drm/plane-helper: Export individual helpers
  drm/armada: Use drm_plane_helper_destroy()
  drm/fsl-dcu: Use drm_plane_helper_destroy()

 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  1 -
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  1 -
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  5 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  1 -
 drivers/gpu/drm/armada/armada_crtc.c          |  1 -
 drivers/gpu/drm/armada/armada_overlay.c       |  8 +-
 drivers/gpu/drm/armada/armada_plane.c         |  2 +-
 drivers/gpu/drm/ast/ast_mode.c                |  9 +--
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  1 -
 drivers/gpu/drm/drm_atomic_helper.c           |  1 -
 drivers/gpu/drm/drm_crtc_helper.c             |  1 -
 drivers/gpu/drm/drm_modeset_helper.c          |  8 +-
 drivers/gpu/drm/drm_plane_helper.c            | 74 +++++++++++++------
 drivers/gpu/drm/drm_simple_kms_helper.c       |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  8 +-
 drivers/gpu/drm/gma500/psb_intel_display.c    |  2 -
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  1 -
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  5 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |  1 -
 .../gpu/drm/i915/display/intel_atomic_plane.c |  1 -
 drivers/gpu/drm/i915/display/intel_crtc.c     |  1 -
 drivers/gpu/drm/i915/display/intel_cursor.c   |  5 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 drivers/gpu/drm/i915/display/intel_sprite.c   |  9 +--
 .../drm/i915/display/skl_universal_plane.c    |  5 +-
 drivers/gpu/drm/i915/intel_pm.c               |  1 -
 drivers/gpu/drm/imx/imx-drm-core.c            |  1 -
 drivers/gpu/drm/imx/ipuv3-plane.c             |  5 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |  1 -
 drivers/gpu/drm/kmb/kmb_plane.c               |  5 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c       |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  9 +--
 drivers/gpu/drm/meson/meson_overlay.c         |  1 -
 drivers/gpu/drm/meson/meson_plane.c           |  3 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  1 -
 drivers/gpu/drm/msm/msm_drv.h                 |  1 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  5 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  5 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  8 +-
 drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  1 -
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  1 -
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  1 -
 drivers/gpu/drm/omapdrm/omap_overlay.c        |  1 -
 drivers/gpu/drm/omapdrm/omap_plane.c          |  1 -
 drivers/gpu/drm/qxl/qxl_display.c             |  4 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  5 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  9 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  1 -
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  1 -
 drivers/gpu/drm/sprd/sprd_dpu.c               |  5 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  1 -
 drivers/gpu/drm/sti/sti_plane.h               |  1 -
 drivers/gpu/drm/stm/ltdc.c                    |  1 -
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  1 -
 drivers/gpu/drm/sun4i/sun4i_layer.c           |  1 -
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  5 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  5 +-
 drivers/gpu/drm/tegra/dc.c                    |  1 -
 drivers/gpu/drm/tegra/plane.c                 |  1 -
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 33 ++++-----
 drivers/gpu/drm/tidss/tidss_crtc.c            |  1 -
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         |  1 -
 drivers/gpu/drm/vboxvideo/vbox_mode.c         | 12 +--
 drivers/gpu/drm/vc4/vc4_kms.c                 |  1 -
 drivers/gpu/drm/vc4/vc4_plane.c               |  1 -
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  5 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 11 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  1 -
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  5 +-
 include/drm/drm_atomic_helper.h               |  9 +++
 include/drm/drm_plane_helper.h                | 29 ++++----
 88 files changed, 189 insertions(+), 223 deletions(-)

-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781ECDA33C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DA510E008;
	Tue, 23 Dec 2025 18:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="FB7kt9Uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353D710E008
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512909; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nhikv8QN2PLa8vYZ9E/fW1azQiq+cs92oCQ2GDQ5gXjwCfmABc/swYiJV6PBx34Rlmek1e/iIduxd46ayXL/1mfyNQeHefd+26gEE8Bh1jeMCLfg/1gKNgEZiS6EX8ZNqebtBoK3g+3S2s4dMhr0jtr6/0Pnn8cyvNJodUgUdfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512909;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MsJ1QZniSDD+5EITzP+UrPN8oRW59aqUk/sWSedUXyI=; 
 b=cOWSN2YR5F+XsADDRwRfwc7hPIetNWaxV7h+gQ+JWjBl+W+cNmUTp0IOFpOrPThx3FAGOHUEgT7vi7cgzzuvQiZVqE+SWmeU6f1SeGdoib1m3T5iUAx7eqFsVhkLTsxFhDS5G2sHBgrybQr5nBMWWveT/IrYvkcQm1l6XBw5ECI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512909; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=MsJ1QZniSDD+5EITzP+UrPN8oRW59aqUk/sWSedUXyI=;
 b=FB7kt9UfXBkEhrqxAq6vSkgnrGHxc7lC0UvYvL4YSh3PkIgScvO8a5K1+VCmpA5F
 BunmyvAKi3r9F3L+iIIBJyX1PUz7vfnQp+HCvXva4WNROisTD/LxfIKWifHVM5KY/vI
 dWv+E7dV7lFTipgeW52bY2GmIyjXp2SxrqG6kC1A=
Received: by mx.zohomail.com with SMTPS id 1766512908289648.1607741516309;
 Tue, 23 Dec 2025 10:01:48 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v3 00/21] Introduce support for CRTC (post-blend) color
 pipeline
Date: Tue, 23 Dec 2025 15:01:20 -0300
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPHYSmkC/4XQwW6DMAwG4FdBOdcTCWGQnvYeUw8huKtVSGiSo
 k6Id58ph0m99BLpt+zPchaRMBImcSwWEXGmRMFzqA6FcBfrfxCo5yxUqeqyqUoY8xWmkDJ0A/o
 eXBhChIkmHMgjaNOitMa5ukLBxhTxTI+n/33ifKGUQ/x9rpvlVt3lVqk38iyhBGu0/uy1dbZVX
 9ww2C5E++HCKDZ9Vv+ikc07UW2i07qRHT91+yqu+wERb3f+l7xfITqbkKlxpHwsPD4ybPukkoY
 n1j9+aNmZUQEAAA==
X-Change-ID: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=6847;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=TNlJyxlKojej4zv0RZk+kwLQ87vuyffyqaMh0IyTO1E=;
 b=2jPmt15ST/F1BYdrP7k/ivbjeiR/AwghrkpxfGU2Wf+VQ74ZD/gRhhi27WUlgMyJOjTCD7ZKu
 J80wS+otxYxC4WYZJxUYHBmxYMgrAtT7UXCpoHKVRhk5mgE75M8UlCc
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

This series is based on "Color Pipeline API w/ VKMS" [1]. It reuses the
same concept of a color pipeline API but for the post-blend stage
instead of pre-blend, by attaching the COLOR_PIPELINE property to the
CRTC rather than a plane.

The patches in the series first implement the necessary changes in the
DRM core to allow for CRTC (post-blend) color pipelines and expose it 
through the uAPI, and then implement support in both the MediaTek KMS
driver and in VKMS.

This series has been tested with IGT, with the latest revision of patch
series "Support post-blend color pipeline API" [2] applied, on top of
VKMS, as well as with Weston, with a WIP branch [3], on a MT8195-Tomato
Chromebook and a MT8188 Genio 700 EVK, where both gamma LUT and CTM
color transformations have been simultaneously configured in hardware
through the API and validated (test commits for weston at [4]).

[1] https://lore.kernel.org/all/20251115000237.3561250-1-alex.hung@amd.com/
[2] https://lore.kernel.org/igt-dev/20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com/T/#t
[3] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
[4] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-color-pipeline-lut-ctm-test?ref_type=tags

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
Changes in v3:
- Aligned terminology between plane (pre-blend) and crtc (post-blend)
  color pipeline (Harry Wentland). Replaced all naming s/post-blend/crtc
- Reworked cleanup in vkms_initialize_post_blend_color_pipeline (Louis
  Chauvet).
- Added check on CLIENT_CAP while setting COLOR_PIPELINE property (Louis
  Chauvet).
- Moved common color_pipeline property initialization code to
  drivers/gpu/drm/drm_property.c
- Added missing support for CRTC (post-blend) color pipeline
  configuration in VKMS.
- Added missing return value checks in mtk_crtc_create()
- Added drm_color_lut_to_lut32() and made use of it in mtk_disp_gamma.c
- Added drm_color_ctm_to_ctm_3x4() and made use of it in mtk_disp_ccorr.c
- Split plane and crtc fields descriptions in struct drm_colorop
- Link to v2: https://lore.kernel.org/r/20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com

Changes in v2:
- Split core DRM changes for post-blend color pipelines from single
  commit into smaller changes
- Added post-blend color pipeline support in VKMS
- Introduced driver cap, and made client cap depend on it (daniels)
- Made deprecated color props (GAMMA_LUT, DEGAMMA_LUT, CTM) available as
  read-only when post-blend color pipelines are enabled (daniels)
- Created colorop_modeset_lock/unlock to commonize locking pattern for
  colorops (louis.chauvet)
- Added helper for post-blend 1D curve colorop creation
- Link to v1: https://lore.kernel.org/r/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com

---
Ariel D'Alessandro (2):
      drm: Add helper to extract a 3x4 matrix from any CTM matrix dimensions
      drm: Add helper to extract a LUT entry from either 16-bit or 32-bit LUT

Nícolas F. R. A. Prado (19):
      drm/crtc: Add color pipeline to CRTC state
      drm/colorop: Allow parenting colorop to CRTC
      drm: Factor out common color_pipeline property initialization code
      drm/crtc: Add COLOR_PIPELINE property
      drm: Introduce DRM_CAP_CRTC_COLOR_PIPELINE
      drm: Introduce DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE
      drm/atomic: Pass crtc_color_pipeline client cap to atomic check
      drm/atomic: Print the color pipeline as part of the CRTC state print
      drm/colorop: Factor out common paths from colorops helpers
      drm/colorop: Introduce colorop helpers for crtc
      drm/crtc: Track crtc color pipeline client cap in drm_crtc_state
      drm/mediatek: Support CRTC colorops for gamma and ctm
      drm/mediatek: ccorr: Support CRTC color pipeline API
      drm/mediatek: gamma: Support CRTC color pipeline API
      drm/mediatek: Set CRTC color pipeline driver cap
      drm/vkms: Rename existing color pipeline helpers to contain "plane"
      drm/vkms: Prepare pre_blend_color_transform() for CRTC color pipelines
      drm/vkms: Introduce support for post-blend color pipeline
      drm/vkms: Set CRTC color pipeline driver cap

 drivers/gpu/drm/drm_atomic.c                  |   9 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  71 +++++++-
 drivers/gpu/drm/drm_colorop.c                 | 242 +++++++++++++++++++++-----
 drivers/gpu/drm/drm_connector.c               |   1 +
 drivers/gpu/drm/drm_crtc.c                    |  31 ++++
 drivers/gpu/drm/drm_crtc_internal.h           |   1 +
 drivers/gpu/drm/drm_ioctl.c                   |  12 ++
 drivers/gpu/drm/drm_mode_object.c             |   9 +
 drivers/gpu/drm/drm_plane.c                   |  35 +---
 drivers/gpu/drm/drm_property.c                |  44 +++++
 drivers/gpu/drm/mediatek/mtk_crtc.c           | 222 ++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |  88 ++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |  68 ++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  70 +++++---
 drivers/gpu/drm/vkms/vkms_colorop.c           | 110 +++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c          |  13 +-
 drivers/gpu/drm/vkms/vkms_config.c            |   5 +-
 drivers/gpu/drm/vkms/vkms_config.h            |  29 ++-
 drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  10 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +-
 drivers/gpu/drm/vkms/vkms_output.c            |   3 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
 include/drm/drm_atomic.h                      |  20 +++
 include/drm/drm_atomic_uapi.h                 |   2 +
 include/drm/drm_color_mgmt.h                  |  61 +++++++
 include/drm/drm_colorop.h                     |  25 ++-
 include/drm/drm_crtc.h                        |  27 +++
 include/drm/drm_drv.h                         |   6 +
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_property.h                    |   5 +
 include/uapi/drm/drm.h                        |  25 +++
 36 files changed, 1109 insertions(+), 175 deletions(-)
---
base-commit: b96bcfba104c65db41378a04f5ccac186f79578f
change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e

Best regards,
-- 
Ariel D'Alessandro <ariel.dalessandro@collabora.com>


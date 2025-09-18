Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DCB8266C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5C610E055;
	Thu, 18 Sep 2025 00:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WqsN2hzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E88110E055;
 Thu, 18 Sep 2025 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156201;
 bh=fwja+jIVOKpZjH7+KQxRzsasOcEaL8lQ3dGMBxxIeLU=;
 h=From:Subject:Date:To:Cc:From;
 b=WqsN2hzHal89pywlVmYT6N3QqV3P4/tOJ8dD7lGPSrpC0EFvgH6ARDU56wfo5kI4D
 3NfA+OkIrqCJrcz6wV7WH2HxDd45UOzwQeHZLWv3T+rLJfdqK5hDVYKKm+noHWhxGD
 7SBSpCvRCYfYhJloh7uiUWKQOIH1QN+7JuRny/IiDokRss5b2xgRPizjLxZY+PNzvT
 Y7GFykgsbqtn4wNzLrnGACOwFblbKkbffuMEuMgfIsOlLI3GHprkLbK+H/DY9lTlMW
 Ku2d2USOpQysBFMoXrfW67n/mfNMBLRcgnfki+H0JKpjWHJazjJ/j/v07mve/XYqnu
 Fbl3FcXnPYVag==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4785E17E0109;
 Thu, 18 Sep 2025 02:43:14 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC v2 00/20] Introduce support for post-blend color pipeline
Date: Wed, 17 Sep 2025 20:43:09 -0400
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ1Vy2gC/4WNQQ6CMBBFr0Jm7ZhSQMGViYkHcGtY1DLKxNI2L
 SEawt1tegGX7/+f91eIFJginIoVAi0c2dkEcleAHpV9EfKQGKSQjThWAqf5jd7FGR+G7IDaGRf
 QsyfDlrDuWipVp3VTESSHD/TkT/bf4Xa9QJ/CkePswjd/LmWusr6V8o9+KVGg6ur6MNRKq1ae0
 8Cohwtqr90E/bZtP1WMfvnTAAAA
X-Change-ID: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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
DRM core to allow for post-blend color pipelines and expose it through
the uAPI, and then implement support in both the MediaTek KMS driver and
in VKMS.

This series has been tested with IGT, with the "Support post-blend color
pipeline API" series [2] applied, on top of VKMS, as well as with
Weston, with a WIP branch [3], on a MT8195-Tomato Chromebook, where both
gamma LUT and CTM color transformations have been simultaneously
configured in hardware through the API and validated (test commits for
weston at [4] and for kernel at [5]).

[1] https://lore.kernel.org/all/20250815035047.3319284-1-alex.hung@amd.com/
[2] https://lore.kernel.org/igt-dev/20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com/T/#t
[3] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
[4] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-color-pipeline-lut-ctm-test?ref_type=tags
[5] https://gitlab.collabora.com/nfraprado/linux/-/tree/debug-ctm-lut-data-post-blend-colorop?ref_type=tags

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
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
Nícolas F. R. A. Prado (20):
      drm/crtc: Add color pipeline to CRTC state
      drm/colorop: Allow parenting colorop to CRTC
      drm: Factor out common color_pipeline property initialization code
      drm/crtc: Add COLOR_PIPELINE property
      drm: Introduce DRM_CAP_POST_BLEND_COLOR_PIPELINE
      drm: Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
      drm/atomic: Pass post_blend_color_pipeline client cap to atomic check
      drm/atomic: Print the color pipeline as part of the CRTC state print
      drm/colorop: Factor out common paths from colorops helpers
      drm/colorop: Introduce colorop helpers for crtc
      drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
      drm/crtc: Track post-blend color pipeline client cap in drm_crtc_state
      drm/mediatek: Support post-blend colorops for gamma and ctm
      drm/mediatek: ccorr: Support post-blend color pipeline API
      drm/mediatek: gamma: Support post-blend color pipeline API
      drm/mediatek: Set post-blend color pipeline driver cap
      drm/vkms: Rename existing color pipeline helpers to contain "pre_blend"
      drm/vkms: Prepare pre_blend_color_transform() for post-blend pipelines
      drm/vkms: Introduce support for post-blend color pipeline
      drm/vkms: Set post-blend color pipeline driver cap

 drivers/gpu/drm/drm_atomic.c              |   9 +-
 drivers/gpu/drm/drm_atomic_uapi.c         |  65 +++++++-
 drivers/gpu/drm/drm_colorop.c             | 245 ++++++++++++++++++++++++------
 drivers/gpu/drm/drm_connector.c           |   1 +
 drivers/gpu/drm/drm_crtc.c                |  77 ++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   6 +
 drivers/gpu/drm/drm_ioctl.c               |  12 ++
 drivers/gpu/drm/drm_mode_object.c         |   9 ++
 drivers/gpu/drm/drm_plane.c               |  36 +----
 drivers/gpu/drm/mediatek/mtk_crtc.c       | 208 ++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +-
 drivers/gpu/drm/vkms/vkms_colorop.c       | 106 ++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c      |  13 +-
 drivers/gpu/drm/vkms/vkms_crtc.c          |   1 +
 drivers/gpu/drm/vkms/vkms_drv.c           |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h           |   3 +-
 drivers/gpu/drm/vkms/vkms_plane.c         |   2 +-
 include/drm/drm_atomic.h                  |  20 +++
 include/drm/drm_atomic_uapi.h             |   2 +
 include/drm/drm_colorop.h                 |  22 ++-
 include/drm/drm_crtc.h                    |  27 ++++
 include/drm/drm_drv.h                     |   6 +
 include/drm/drm_file.h                    |   7 +
 include/uapi/drm/drm.h                    |  25 +++
 29 files changed, 994 insertions(+), 135 deletions(-)
---
base-commit: 342e5ee08797cde0e8af30e6110a5dc1cba61e9c
change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


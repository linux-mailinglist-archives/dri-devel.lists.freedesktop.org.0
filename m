Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF35B3224D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344E810EB87;
	Fri, 22 Aug 2025 18:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qp1zDczV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DD610EB85;
 Fri, 22 Aug 2025 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755887795;
 bh=ojMWLu9sR6XdGXpcfVIIZPVqzPufzHlxziClp8RvZuc=;
 h=From:Subject:Date:To:Cc:From;
 b=Qp1zDczVZTuL+KKSr2IZlvqdH3/8Y6QxXavfHVcwdXakerqipjLzv1xqzn6zjw9nS
 JCt4PIpVo7dSuYysFkbX8+LcF1aa4CIOY9OodbCsczlOVGuh4sCDhLE3g4NPkxirWp
 XgDaCvVoU/10UIhfLRtl5ZSKp6Hs6R0AWhEeIgNQdVAfVIj3Rl0mxFu9mBf0bQyY/b
 XaBCBI2ft6njRroOTCJKWe6boNB/pNfe7amjyRE8JJi9/t9AQrWlcw2UK+szQZftP+
 JxoQ5GvUlQ4I8k4gCvBNXjJTD5tAKvPzO2LOE4SCra4hg9lLU36M7mK/kpFlTQFL4j
 E9deI22a44jgQ==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C6D017E110D;
 Fri, 22 Aug 2025 20:36:29 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC 0/5] Introduce support for post-blend color pipeline
Date: Fri, 22 Aug 2025 14:36:10 -0400
Message-Id: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJu4qGgC/x3MTQqDMBAG0KvIrB2If1S7FXqAbosLjV/t0DQJi
 RRBvLvB5du8nSKCINI92yngL1GcTSjyjPRntAtY5mQqVdmoW6X4t37Zu7jyZGBn1s64wF48jFh
 w3bUoxk7rpgKlwwe8Zbv+Fz0fPQ3HcQKcyOaBdAAAAA==
X-Change-ID: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
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

Patch 1 implements the necessary changes in the DRM core to make this
happen. The remaining patches implement support for this API in the
MediaTek DRM driver in particular.

This series has been tested on the MT8195-Tomato Chromebook with a WIP
Weston branch [2]. Both gamma LUT and CTM color transformations have
been simultaneously configured in hardware through the API and validated
(test commits in weston [3] and the kernel [4]).

This is a very early implementation but I'd like to get feedback from
the community before moving forward. For instance one notable thing
missing it to add init helpers for the post-blend case for the remaining
colorop types, as only 3x1d LUT and 3x4 Matrix were needed for gamma LUT
and CTM use cases.

[1] https://lore.kernel.org/all/20250815035047.3319284-1-alex.hung@amd.com/
[2] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
[3] https://gitlab.collabora.com/nfraprado/weston/-/commits/post-blend-color-pipeline-lut-ctm-test?ref_type=tags
[4] https://gitlab.collabora.com/nfraprado/linux/-/commits/post-blend-color-pipeline-ctm-lut-test?ref_type=tags

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (5):
      drm: Support post-blend color pipeline API
      drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
      drm/mediatek: Support post-blend colorops for gamma and ctm
      drm/mediatek: ccorr: Support post-blend color pipeline API
      drm/mediatek: gamma: Support post-blend color pipeline API

 drivers/gpu/drm/drm_atomic.c              |  32 ++++-
 drivers/gpu/drm/drm_atomic_uapi.c         |  50 ++++++-
 drivers/gpu/drm/drm_colorop.c             | 147 +++++++++++++++++----
 drivers/gpu/drm/drm_connector.c           |   1 +
 drivers/gpu/drm/drm_crtc.c                |  77 +++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   6 +
 drivers/gpu/drm/drm_ioctl.c               |   7 +
 drivers/gpu/drm/drm_mode_object.c         |  20 +++
 drivers/gpu/drm/drm_plane.c               |  36 +----
 drivers/gpu/drm/mediatek/mtk_crtc.c       | 211 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++++---
 include/drm/drm_atomic.h                  |  20 +++
 include/drm/drm_atomic_uapi.h             |   2 +
 include/drm/drm_colorop.h                 |  17 ++-
 include/drm/drm_crtc.h                    |  19 +++
 include/drm/drm_file.h                    |   7 +
 include/uapi/drm/drm.h                    |  16 +++
 21 files changed, 781 insertions(+), 108 deletions(-)
---
base-commit: d152eee7ae3b72e2ce70064a7ad9764f7ba8641d
change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


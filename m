Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE8BC4AEA
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB6C10E7E1;
	Wed,  8 Oct 2025 12:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KAp33rVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6684410E7E1;
 Wed,  8 Oct 2025 12:04:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59BD46120D;
 Wed,  8 Oct 2025 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBCCC4CEF4;
 Wed,  8 Oct 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925053;
 bh=hp6KAum/wSHP4jTL4LN3EtHOtSRvXYWkShztC5IovwE=;
 h=From:Subject:Date:To:Cc:From;
 b=KAp33rVWxmgy5qa+lyBrWZ8LAjg5ZJLLOvBvJYVPBMEbiYmR6R+qB7lihj9Gxwdbr
 TYlTYpXlcp8jbXTe2IJ29xTovV88AM2+wvPaJr15D8xM0/qRezSv5YdqFBF6NTrvoa
 O/z7OWTNNoEDLl2LdTED+vmYWCrArcc8A1gqCKthFCbdBbnstVFC4lFIYsYNtNniij
 8BoCxa4p1o0WjpjYrEbfT0C8eKI44ge/sTC6fn02tlhm02vFdCnXeyJy24uz2XK5hN
 WVypG/tpimvKGA9fpFAjtklWWdwzGh/EQGioBSzyV6RStgAA5GBeww5kxPr/uK+a/O
 jKhQDqOpsSDsw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/16] drm/atomic: Switch drm_private_obj to reset
Date: Wed, 08 Oct 2025 14:03:58 +0200
Message-Id: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5T5mgC/x3MSwqAMAxF0a1IxgbaoihuRRxUfWoEP6RSBHHvF
 odncO9DASoI1GQPKaIEOfYEm2c0LH6fwTImkzOutMbUPOrGp0r0F/joV1YEXOxh4arCGld5Su2
 pmOT+v233vh8PWkNgZwAAAA==
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3101; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hp6KAum/wSHP4jTL4LN3EtHOtSRvXYWkShztC5IovwE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgo3mR/6/kzlTdaeC1ITW9Ys8Zy29FZd8ucZHofWIt
 cOsBF7pjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARVTbG+uTHT5yPH9sSfzB7
 ZYjomjUamiGW7pt031QffFr1PcNh3Y7955PMpI6I33j4Ouu89ErPU4wNC7z3vtqjW1P4YP69qH9
 POS5l2HJNEF/C3qOQsi678sido5GsD+cJFTdt/Fu9ffqx+6sVAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

This series started from my work on the hardware state readout[1], and
was suggested by Dmitry[2].

This series deal with the fact that drm_private_obj (and thus bridges)
are not initialized using the same pattern than any other object. This
series solves that inconsistency by aligning it to what we're doing for
all the other objects.

This was tested on a TI SK-AM62, with three bridges.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (16):
      drm/atomic: Add dev pointer to drm_private_obj
      drm/atomic: Add reset to drm_private_obj
      drm/atomic-helper: Add private_obj reset helper
      drm/bridge: Switch private_obj initialization to reset
      drm/dp_mst: Switch private_obj initialization to reset
      drm/dp_tunnel: Switch private_obj initialization to reset
      drm/amdgpu: Switch private_obj initialization to reset
      drm/arm: komeda: Switch private_obj initialization to reset
      drm/ingenic: Switch private_obj initialization to reset
      drm/msm: mdp5: Switch private_obj initialization to reset
      drm/msm: dpu1: Switch private_obj initialization to reset
      drm/omapdrm: Switch private_obj initialization to reset
      drm/tegra: Switch private_obj initialization to reset
      drm/vc4: Switch private_obj initialization to reset
      drm/atomic: Remove state argument to drm_atomic_private_obj_init
      drm/mode_config: Call private obj reset with the other objects

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  53 ++---
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    | 232 +++++++++++++++------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  38 ++--
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  28 ++-
 drivers/gpu/drm/drm_atomic.c                       |   6 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  24 +++
 drivers/gpu/drm/drm_bridge.c                       |  30 +--
 drivers/gpu/drm/drm_mode_config.c                  |   6 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  30 ++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  30 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  30 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  30 ++-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  24 ++-
 drivers/gpu/drm/tegra/hub.c                        |  24 ++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  73 +++++--
 include/drm/drm_atomic.h                           |  15 +-
 include/drm/drm_atomic_state_helper.h              |   3 +
 18 files changed, 473 insertions(+), 205 deletions(-)
---
base-commit: aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


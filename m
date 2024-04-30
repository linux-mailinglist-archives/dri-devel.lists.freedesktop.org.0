Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A588B6DC7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 11:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92910F870;
	Tue, 30 Apr 2024 09:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KE5WpSPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5474210F866;
 Tue, 30 Apr 2024 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714468335;
 bh=Q6up+U23E5APYIMETLmfiB1ibki5YAl7MpYr3vD7xLE=;
 h=From:To:Cc:Subject:Date:From;
 b=KE5WpSPbzhjMWvlaKe8+wAl5amqx/bo+kGu0nR8qV0BnT+EpHef2nFuLTNyuV/FUG
 OXpRrnwMw0UusKK2qo2ccvla2/MnwHsXXViKbFIU4DVI9bgWcvF7BrypK/E88QMIps
 rdZcASyjzRKYXiKVE3dp/I6f7PDihykSPDSyfLLC57JF9XN8KO9V2BLtL/YW7vESVq
 td7cUTrvNX/lZgp9E0jndbl9NKdAxHOlJevkfK4U3P6PVYbMCbY3+oGnDCmfxGf9Lq
 SCZG8TAY0vrh76a6z+gUYV/jdriHAZQwzAlVfLDGy3e3skmZF3EvWxop+G6+DSlx+v
 C6OVGbLdQR+Gg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 53E3D3782165;
 Tue, 30 Apr 2024 09:12:11 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] drm/ci: uprev mesa and generate testlist
Date: Tue, 30 Apr 2024 14:41:16 +0530
Message-Id: <20240430091121.508099-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uprev mesa to the latest version and stop vendoring the
testlist into the kernel. Instead, use the testlist from the
IGT build to ensure we do not miss renamed or newly added tests.
Update the xfails with the latest testlist run.

Also build virtual GPU driver for virtio as module.

The flakes list needs to be reported upsteam. Will send it
after this series is reviewed.

https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1166575

Vignesh Raman (5):
  drm/ci: uprev mesa version
  drm/ci: generate testlist from build
  drm/ci: build virtual GPU driver as module
  drm/ci: skip driver specific tests
  drm/ci: update xfails for the new testlist

 drivers/gpu/drm/ci/build-igt.sh               |   23 +
 drivers/gpu/drm/ci/build.sh                   |    2 +-
 drivers/gpu/drm/ci/container.yml              |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   11 +-
 drivers/gpu/drm/ci/igt_runner.sh              |   15 +-
 drivers/gpu/drm/ci/image-tags.yml             |    7 +-
 drivers/gpu/drm/ci/test.yml                   |    3 +
 drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
 drivers/gpu/drm/ci/x86_64.config              |    2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   47 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |    8 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   29 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   22 +-
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    8 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   45 +-
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    5 +
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   26 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   26 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   20 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   28 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   26 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   39 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   10 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   35 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   75 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   27 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   46 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   22 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   47 +-
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   12 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   17 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |    5 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   14 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   20 +-
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    5 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   14 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   26 +-
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    5 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   14 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    5 +-
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    5 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   81 +-
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   34 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    5 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   15 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   34 +-
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |    5 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   15 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   75 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   26 +-
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   15 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   54 -
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   17 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   80 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |    7 -
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   15 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   82 +-
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   18 +-
 60 files changed, 886 insertions(+), 3289 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt

-- 
2.40.1


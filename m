Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE9893831
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 08:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDF110EEF9;
	Mon,  1 Apr 2024 06:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F/QFKQRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE9A10EEF9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711952009;
 bh=/x4kBCuY+ccxV+JdiuLGZjMTNXMcjW/HgSMYytFO9ik=;
 h=From:To:Cc:Subject:Date:From;
 b=F/QFKQRtdRPVizgrcaJWAlxYVtohziHdyu/AmgMpdoIP7elCwdztc7XL9psW7i7u3
 aD+wKiMNETxiEYYiOXSFsuZPC8BgsvJwirv8ZhR8rtuAg3d0gDkmpObIlEroLp2pOR
 E/GGTLFOQLFB0JvUOPic9KnBJCNwueqADiFThdT8OPTGq/XHKbW0gFjTOfXtS7yEp7
 iXvG/GMrlBnStRc5229+XJ8W3oHtR0zaLvxkePKPTONQFHny7OaBltIrYv8cCrCiMH
 qntmOqHngcl7vx6Ed+YCEtFzi9ZXPuRDmQRrJUKZIzL1QonUyUpKkD9Q7kr2z7MmQH
 fDl/oHvqPISDQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7749C3781360;
 Mon,  1 Apr 2024 06:13:25 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] drm/ci: Add support for GPU and display testing
Date: Mon,  1 Apr 2024 11:42:25 +0530
Message-Id: <20240401061235.192713-1-vignesh.raman@collabora.com>
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

Some ARM SOCs have a separate display controller and GPU, each with
different drivers. For mediatek mt8173, the GPU driver is powervr,
and the display driver is mediatek. In the case of mediatek mt8183,
the GPU driver is panfrost, and the display driver is mediatek.
With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
display driver is rockchip. For amlogic meson, the GPU driver is
panfrost, and the display driver is meson.

IGT tests run various tests with different xfails and can test both
GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
This leads to incomplete coverage since the display is never tested on
these platforms. This commit series adds support in drm-ci to run tests
for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
Meson platforms.

Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
tests to testlist. Add testlists to the MAINTAINERS file and skip
driver-specific tests.

This series also includes patch to add vkms testing to drm-ci.

Working pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1140647

Vignesh Raman (10):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: uprev mesa version
  drm/ci: uprev IGT and update testlist
  drm/ci: mediatek: Refactor existing mediatek jobs
  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
  drm/ci: meson: Refactor existing meson jobs
  drm/ci: meson: Add job to test panfrost GPU driver
  drm/ci: rockchip: Refactor existing rockchip jobs
  drm/ci: rockchip: Add job to test panfrost GPU driver
  drm/ci: add tests on vkms

 MAINTAINERS                                   |  11 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/build.sh                   |   2 +-
 drivers/gpu/drm/ci/container.yml              |   6 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  18 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  16 +-
 drivers/gpu/drm/ci/image-tags.yml             |   5 +-
 drivers/gpu/drm/ci/test.yml                   | 138 ++++++--
 drivers/gpu/drm/ci/testlist.txt               | 321 ++++++++++++++++++
 drivers/gpu/drm/ci/x86_64.config              |   1 +
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  25 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   9 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   9 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  15 -
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  13 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   6 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   8 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   6 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   5 -
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   6 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   5 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   8 +-
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   6 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   6 +
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   6 +
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   8 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   8 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   8 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   8 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  50 +--
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  15 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  38 +--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  11 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   9 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  33 ++
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  20 ++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |  23 ++
 52 files changed, 890 insertions(+), 144 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

-- 
2.40.1


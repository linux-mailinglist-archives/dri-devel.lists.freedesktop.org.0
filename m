Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4F842782
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F89113183;
	Tue, 30 Jan 2024 15:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEB4113183;
 Tue, 30 Jan 2024 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627095;
 bh=KxxppCtScPleTsQ2kw4mZIMAQ37g6r0K3U2qtG4xi28=;
 h=From:To:Cc:Subject:Date:From;
 b=UvMgL+trW/+tLi0dvGrqIsy2SfA/AI+pdWvP119oX0+1yc2WTLnlD4UM2xXuEt6CE
 3EdnWoFWNa+gmwBmmkAyzMkdPKV0SZuPVpfWinvPHXUmiCgb92v0+VOcOR7dF0G2lf
 1ca6XWe/GOiAEIhJ3T7YC//IzELVjjO0S8Tg1z0vcuFt2ZHHM4Cwopxc6JuHg/aNM3
 YaSd2DiXHmhIlNCUjnLVYFXvEA/IF6wp6hAut7hh325B4r/FwJ/iAjQ9AYuGquH/9q
 Zek91+t8CtkZFrEissD0I1hgMzkioc7ywVIqd3Pq01SDsaT2lZ6vjMF4G/PYne4OB/
 92lRVJ1Sh7fOA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8F5CD37811CF;
 Tue, 30 Jan 2024 15:04:50 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm/ci: Add support for GPU and display testing
Date: Tue, 30 Jan 2024 20:33:31 +0530
Message-Id: <20240130150340.687871-1-vignesh.raman@collabora.com>
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
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
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
tests to testlist. Have testlist.txt per driver and include a base
testlist so that the driver specific tests will run only on those hardware.

Vignesh Raman (9):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: mediatek: Rename exisitng job
  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
  drm/ci: meson: Rename exisitng job
  drm/ci: meson: Add job to test panfrost GPU driver
  drm/ci: rockchip: Rename existing job
  drm/ci: rockchip: Add job to test panfrost GPU driver
  drm/ci: uprev mesa version
  drm/ci: uprev IGT and update testlist

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/container.yml              |   6 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   8 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  34 ++--
 drivers/gpu/drm/ci/image-tags.yml             |   3 +-
 drivers/gpu/drm/ci/test.yml                   | 137 ++++++++++++----
 drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 ++++++++++++++++++
 drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
 drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
 drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
 drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
 drivers/gpu/drm/ci/testlist.txt               |  84 ++++------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  24 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   9 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  10 +-
 ....txt => mediatek-mt8173-display-fails.txt} |  13 --
 .../xfails/mediatek-mt8173-display-flakes.txt |  13 ++
 .../xfails/mediatek-mt8183-display-fails.txt  |  16 ++
 .../xfails/mediatek-mt8183-display-flakes.txt |   8 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  13 --
 .../ci/xfails/mediatek-mt8183-gpu-skips.txt   |   2 +
 ...fails.txt => meson-g12b-display-fails.txt} |   3 -
 .../drm/ci/xfails/meson-g12b-gpu-fails.txt    |   1 +
 .../drm/ci/xfails/meson-g12b-gpu-skips.txt    |   2 +
 .../xfails/rockchip-rk3288-display-fails.txt  |  21 +++
 .../xfails/rockchip-rk3288-display-flakes.txt |  17 ++
 .../xfails/rockchip-rk3288-display-skips.txt  |   8 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  54 -------
 .../ci/xfails/rockchip-rk3288-gpu-fails.txt   |   1 +
 .../ci/xfails/rockchip-rk3288-gpu-skips.txt   |   2 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  52 ------
 ....txt => rockchip-rk3399-display-fails.txt} |  38 +++--
 .../xfails/rockchip-rk3399-display-flakes.txt |  23 +++
 .../xfails/rockchip-rk3399-display-skips.txt  |   6 +
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   7 -
 .../ci/xfails/rockchip-rk3399-gpu-fails.txt   |   1 +
 .../ci/xfails/rockchip-rk3399-gpu-skips.txt   |   2 +
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 -
 39 files changed, 686 insertions(+), 279 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (59%)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => meson-g12b-display-fails.txt} (84%)
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-fails.txt => rockchip-rk3399-display-fails.txt} (71%)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt

-- 
2.40.1


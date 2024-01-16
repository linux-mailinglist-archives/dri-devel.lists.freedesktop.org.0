Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425F82EC4B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8A710E474;
	Tue, 16 Jan 2024 09:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D76D10E474
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705398933;
 bh=Br3uGw698JM/9pMD4T/qIt8jhsL/ZVXJur8i5VSo5mA=;
 h=From:To:Cc:Subject:Date:From;
 b=kUhMUzsrw1vmK+qacsxwDUYmr4rGABBLTRQS0y8kE2/LrieDRkb5D9GaSq+GpPnGa
 w03euI1BQuv0ZFC0Au8IrxLvh3k9KtPqCmVu/mx6mw3qUR6B6OWQrimKh0kZUiJyPJ
 bFP5++AjL2OxONjb1UVZjm4UxciDokO5zF0zg+S+XRGo09ot4FpCD0yZvQWCDyog1A
 CJWQIEysMbT3DuoZBJeqvjGTd+uBH6qQ7Hf/9UFYCafc6N2R/fga2WXBHWUohdGr4R
 OF6b3391CjsOAbSKeL6+fBAs0CS/VO9TTjvbfNWtXCys0PsUM0K69eM74stPcsPYuD
 3ELywJPSeaDSA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12A5F3782066;
 Tue, 16 Jan 2024 09:55:28 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/ci: Add support for GPU and display testing
Date: Tue, 16 Jan 2024 15:24:32 +0530
Message-Id: <20240116095439.107324-1-vignesh.raman@collabora.com>
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
 daniel@fooishbar.org, david.heidelberg@collabora.com,
 helen.koike@collabora.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com
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

Vignesh Raman (7):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: mediatek: Rename exisitng job
  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
  drm/ci: meson: Rename exisitng job
  drm/ci: meson: Add job to test panfrost GPU driver
  drm/ci: rockchip: Rename existing job
  drm/ci: rockchip: Add job to test panfrost GPU driver

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  10 --
 drivers/gpu/drm/ci/test.yml                   | 107 ++++++++++++++----
 ....txt => mediatek-mt8173-display-fails.txt} |   0
 .../xfails/mediatek-mt8173-display-flakes.txt |  13 +++
 .../xfails/mediatek-mt8183-display-fails.txt  |   7 ++
 .../xfails/mediatek-mt8183-display-flakes.txt |   8 ++
 .../ci/xfails/meson-g12b-display-fails.txt    |  13 +++
 ...-fails.txt => panfrost-g12b-gpu-fails.txt} |   0
 ...ails.txt => panfrost-mt8183-gpu-fails.txt} |   0
 ...ails.txt => panfrost-rk3288-gpu-fails.txt} |   0
 ...kips.txt => panfrost-rk3288-gpu-skips.txt} |   0
 ...ails.txt => panfrost-rk3399-gpu-fails.txt} |   0
 ...kes.txt => panfrost-rk3399-gpu-flakes.txt} |   0
 ...kips.txt => panfrost-rk3399-gpu-skips.txt} |   0
 .../xfails/rockchip-rk3288-display-fails.txt  |  15 +++
 .../xfails/rockchip-rk3288-display-flakes.txt |  13 +++
 .../xfails/rockchip-rk3288-display-skips.txt  |   8 ++
 .../xfails/rockchip-rk3399-display-fails.txt  |  69 +++++++++++
 .../xfails/rockchip-rk3399-display-flakes.txt |  20 ++++
 .../xfails/rockchip-rk3399-display-skips.txt  |   6 +
 22 files changed, 261 insertions(+), 30 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (100%)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => panfrost-g12b-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8183-fails.txt => panfrost-mt8183-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-fails.txt => panfrost-rk3288-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-skips.txt => panfrost-rk3288-gpu-skips.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-fails.txt => panfrost-rk3399-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-flakes.txt => panfrost-rk3399-gpu-flakes.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-skips.txt => panfrost-rk3399-gpu-skips.txt} (100%)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-skips.txt

-- 
2.40.1


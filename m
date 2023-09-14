Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA01579FF0E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 10:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C4610E551;
	Thu, 14 Sep 2023 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBA10E551
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F74E6607344;
 Thu, 14 Sep 2023 09:54:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694681680;
 bh=98i3LIp6vF6jp4ARL3aS2C6+JqUEnLhYgqrDUQrpz/k=;
 h=From:To:Cc:Subject:Date:From;
 b=b0+Z9s5S8ZPs1PfbL9xabGkwGj1RBldiXHA4acs5PaG3nSdo3YU89Vpz0OOcqU7LI
 4qXuwxIWPD0xLs7hLpj0xDVuegBClk7LkKZJATW94Jjlepj8JUEuVFLEjrjKiGa+0b
 ewjACR7YGLLJSz0nMdevMHKY5EffQLlfso3DJNYTSuNbNpJTeSLkEB4iFib8XExIUu
 qOq9qvGHsC4ndt9JcK0JcjWG36LrzCkAu07xStQmVgQDb4Tye7Hs5cNXWkJPn7vOG6
 fNvPsPs21a1wFbZpCzJkfhjv7RTaNpe7Zr5IS6xQlZ1uTa6PUh6G483hTv69abIa+J
 yCwUNIrn7a6YQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v4 0/7] drm: ci: fixes
Date: Thu, 14 Sep 2023 14:24:19 +0530
Message-Id: <20230914085426.883255-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.
This series is intended for drm branch drm-next.

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  - Reworded the commit message for enabling jobs
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
  - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
    This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

Vignesh Raman (7):
  drm: ci: igt_runner: Remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: Update ci variables
  drm: ci: Enable regulator
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 drivers/gpu/drm/ci/arm64.config                  |  1 +
 drivers/gpu/drm/ci/build.sh                      | 16 ++++++++--------
 drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
 drivers/gpu/drm/ci/test.yml                      | 16 +++++-----------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
 14 files changed, 41 insertions(+), 26 deletions(-)

-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D97989C5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2EA10E041;
	Fri,  8 Sep 2023 15:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB110E041
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:23:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 908B16607286;
 Fri,  8 Sep 2023 16:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694186580;
 bh=UH7JSXB6n2DATdqfhUnkdU+dfoIlqt8kj0cMfuz0osk=;
 h=From:To:Cc:Subject:Date:From;
 b=igyvzlqK5lTzT29SaRx5bCMKCwY4r6CFAJi1gYFmbWRaZUIY83Itg/T7tDjJxg+Wn
 +gmlb2G86StkbllazVja93Mzjxf4XsTrgVn8I8N6hw/eDKq/Axc90ABzulch+e8RNS
 qjMP2pa3vtcjcOeG1g7d7Bqxb+WRUsLG0HGWquZbuXJQBuo2boB/CVSqI6UH8VO/r1
 idwEN7nFMIxoCttRbLW9Bp+kusAs5wG6Ei2IyR6/x6OZS/32GCIjgRFG119PmOZuFL
 OB636AUb+930DyYaQwVKApws+/A14fHy4TZnPr2riikJjdg2wMAclhvSTLrEPQJqNr
 r98mp3sOMYKSw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] drm: ci: fixes
Date: Fri,  8 Sep 2023 20:52:16 +0530
Message-Id: <20230908152225.432139-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.
This series is intended for drm branch topic/drm-ci.

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  - Reworded the commit message for enabling jobs
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

Vignesh Raman (9):
  drm: ci: igt_runner: Remove todo
  arm64: dts: qcom: apq8016-sbc: Add overlay for usb host mode
  drm: ci: Force db410c to host mode
  drm: ci: virtio: Update ci variables
  drm: ci: Enable regulator
  arm64: defconfig: Enable DA9211 regulator
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 .../boot/dts/qcom/apq8016-sbc-usb-host.dtso   |  8 +++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/build.sh                   | 21 ++++++++++++-------
 drivers/gpu/drm/ci/igt_runner.sh              |  1 -
 drivers/gpu/drm/ci/test.yml                   | 14 ++++---------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  2 --
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 16 ++++++++++++++
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  2 ++
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  4 ++--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  3 +++
 16 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

-- 
2.40.1


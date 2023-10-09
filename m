Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC57BD191
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436F10E208;
	Mon,  9 Oct 2023 00:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0829810E208
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 00:57:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A7D3660708F;
 Mon,  9 Oct 2023 01:57:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696813037;
 bh=36KY2QEkuekKCMScZo5y6Lh+3n9nQdvTMqIaLNyaUiY=;
 h=From:To:Cc:Subject:Date:From;
 b=Wli7LhRFygJzUrdrsEV/VNagJ5syDI7JfalSqDMvsnpDt6/Nmgq5ic6jn9lRCkhdy
 RkBhbp90y0p92y2TSTuoyIKhL50cYt9dh9V+D+zUdFEujHyQPt+uV3kQJxAWQORg/K
 m+nPKctB6BmmSM9OpHecfOw5AwuZezHFW/59GIt/wuzNM9BjZ6sZbbiHSQVOWXSAN0
 D6yYaoVUJRh1Or+nKri1OIyR29sqaMWqxHOj1+o8Ud+t1ONgbd8hn3sWQp6Fww6m/5
 avcw+xE6hyoDkRfz8miHlpOYnbfNC8YC+tLyOQjnaHz893WSLLAIZ2NxAjMK+llNKS
 Km6hB0kAb421Q==
From: Helen Koike <helen.koike@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/9] drm/ci: fixes and improvements
Date: Sun,  8 Oct 2023 21:56:41 -0300
Message-Id: <20231009005642.207248-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-arm-kernel@lists.infradead.org,
 Helen Koike <helen.koike@collabora.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains the following several fixes, making drm/ci much
more reliable and useful.

To work properly, the following patches are also required:

[PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
https://patchwork.kernel.org/project/linux-arm-msm/patch/20231008132320.762542-2-dmitry.baryshkov@linaro.org/

[PATCH] drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
https://patchwork.kernel.org/project/dri-devel/patch/20231002164715.157298-1-robdclark@gmail.com/

Helen Koike (9):
  drm/ci: uprev mesa version - fix container build
  drm/ci: fix DEBIAN_ARCH and get amdgpu probing
  drm/ci: add helper script update-xfails.py
  drm/ci: uprev IGT and make sure core_getversion is run
  drm/ci: clean up xfails (specially flakes list)
  drm/ci: adjust the number of shards
  drm/ci: export kernel config
  drm/ci: do not automatically retry on error
  drm/ci: docs: add step about how to request priviledges

 Documentation/gpu/automated_testing.rst       |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   3 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  31 ++-
 drivers/gpu/drm/ci/igt_runner.sh              |  31 ++-
 drivers/gpu/drm/ci/image-tags.yml             |   4 +-
 drivers/gpu/drm/ci/lava-submit.sh             |   6 +-
 drivers/gpu/drm/ci/test.yml                   |  21 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  13 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  20 --
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   9 +
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  32 ---
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  11 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  15 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  38 ----
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  17 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  41 ----
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   7 +
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |  26 ---
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   1 -
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   5 -
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   1 -
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   0
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   5 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  14 --
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  14 +-
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |   4 -
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |   4 -
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   2 +
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   4 -
 .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |  15 +-
 .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |  24 ++-
 .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |  18 +-
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   9 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |  20 +-
 drivers/gpu/drm/ci/xfails/requirements.txt    |  17 ++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   6 +
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |   9 -
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  40 +++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +--
 drivers/gpu/drm/ci/xfails/update-xfails.py    | 203 ++++++++++++++++++
 .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |   0
 42 files changed, 445 insertions(+), 331 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 create mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt

-- 
2.34.1


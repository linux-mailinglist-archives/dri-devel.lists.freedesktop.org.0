Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0928ADC91
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 06:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785510F237;
	Tue, 23 Apr 2024 04:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pzeWLW4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBB510F237;
 Tue, 23 Apr 2024 04:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713845006;
 bh=goF/fTNE8wl6AsxxGJwpUshDKR4pSsFtLXytgcbYEpc=;
 h=From:To:Cc:Subject:Date:From;
 b=pzeWLW4MCujJs/GAp2jdHGWku8MU/8lFZnetCkkQJYGcsExtYo+WOp6uQR4b4YNAO
 fD/dz5wUIe0Dp00hWDfhOypem64p/TWXNDMcblcFN/tFl0ekLsgQt5K4qlAE09Iqc/
 0tGxE7Egs1RKPBzrqCJ+dyoeBNOMrOGyLX+97Cfgw6HZ+ERKqweCwTxl5ymRVKDEQb
 KL0F29j9bOqWv7GLG9oac+Z5qYK7le8tKeNsOQwCsCCEvbcFxXMW1ITaR/gEgDBcNF
 RNJEnjCvmWczgzWSDjkoEJedNFxdKll0tUGVdndK0HswnuvIFX/qNvL5Ltm44Ro/AZ
 TRYsLI1YLm/kw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E96DA378000B;
 Tue, 23 Apr 2024 04:03:22 +0000 (UTC)
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
Subject: [PATCH v1 0/4] Uprev mesa and IGT
Date: Tue, 23 Apr 2024 09:32:39 +0530
Message-Id: <20240423040243.448091-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Uprev mesa and IGT to the latest version. Stop vendoring the
testlist into the kernel. Instead, use the testlist from the
IGT build to ensure we do not miss renamed or newly added tests.
Update the xfails with the latest testlist run.

Also build virtual GPU driver for virtio as module.
This series also includes patch to add vkms testing to drm-ci.

The flakes list needs to be updated upsteam. Will send it
after this series is reviewed.

https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1161026

Vignesh Raman (4):
  drm/ci: uprev mesa version
  drm/ci: build virtual GPU driver as module
  drm/ci: uprev IGT and generate testlist from build
  drm/ci: add tests on vkms

 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/ci/build-igt.sh               |   23 +
 drivers/gpu/drm/ci/build.sh                   |    2 +-
 drivers/gpu/drm/ci/container.yml              |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              |   14 +-
 drivers/gpu/drm/ci/igt_runner.sh              |   15 +-
 drivers/gpu/drm/ci/image-tags.yml             |    7 +-
 drivers/gpu/drm/ci/test.yml                   |   33 +-
 drivers/gpu/drm/ci/testlist.txt               | 2761 -----------------
 drivers/gpu/drm/ci/x86_64.config              |    3 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   45 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   30 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   27 +
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |    9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   47 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   24 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   37 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   20 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   37 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   21 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   29 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |    1 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   34 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   27 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    6 +
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   28 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   57 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   21 +-
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   47 +-
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   13 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   18 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |    6 +
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   15 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   20 +-
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    7 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   15 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   25 +-
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    7 +
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   15 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    6 +-
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    6 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |  117 +-
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   40 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |    6 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   16 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   41 +-
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   11 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   16 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   76 +-
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   26 +-
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   16 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   54 -
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   60 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   79 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   13 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   17 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   99 +-
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   19 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   46 +
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |   21 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   30 +
 64 files changed, 1109 insertions(+), 3308 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
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
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

-- 
2.40.1


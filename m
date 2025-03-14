Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE33A60C63
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128510E989;
	Fri, 14 Mar 2025 08:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V2efJ7/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31410E31C;
 Fri, 14 Mar 2025 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741942750;
 bh=im+7eMeBUvMZK5Oih1Sdrmafx3HxHI3s8rS8+2FrRsI=;
 h=From:To:Cc:Subject:Date:From;
 b=V2efJ7/faLqbjg4QqJB+KxtSF80rtVeo7I3qwnD/gRrAcMeBvYqHzthod4M5IvwKi
 c8UEDD0X+IzuWuYhX5e6htMeNNg/lXYbLSUKLNiGIdY/4727guhdFOztosU8HDI0Of
 He1rWyV+zDNBK8JawM0IKOJG67Vg1lfxEMfr0uIVlQAHg+5b8MKGaesbIpitgOGc6O
 k5BpZXzJowIOX36jse+HRJGOlmUyQMT2+C1GyRYO54P5p5NNiHR52NQaWXGLVJR/Pr
 r8NmnbgiGno2pWtxK5Kz3Vrbg15C2thVqHTjyHdfVKgEDY5S2T5E4iFt4PrBXIj06w
 s2ZMyJfz2WAAQ==
Received: from debian.. (unknown [103.163.65.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D5CB117E0ABD;
 Fri, 14 Mar 2025 09:59:06 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: uprev mesa, IGT
Date: Fri, 14 Mar 2025 14:28:49 +0530
Message-ID: <20250314085858.39328-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Uprev mesa to fix lava-test-case argument parsing. LAVA recently fixed
parameter parsing in `lava-test-case` [1], eliminating the need for
repeated quotes in arguments.

Uprev IGT to the latest version. Also update expectation files.

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations. Enable PHY drivers for MediaTek platforms:

[1] https://gitlab.com/lava/lava/-/commit/18c9cf79  

Testing:
MR pipeline for drm/ci changes: https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/13
MR pipeline for kernel changes: https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/14
Scheduled pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1384221
Branch pipeline:
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1384158 (with lockdep patches after rebase with latest drm-misc-next)
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1383492 (without lockdep patches)

Vignesh Raman (3):
  drm/ci: uprev mesa
  drm/ci: uprev IGT
  drm/ci: arm64.config: mediatek: enable PHY drivers

 drivers/gpu/drm/ci/arm64.config               |   2 +
 drivers/gpu/drm/ci/build.sh                   |  16 +-
 drivers/gpu/drm/ci/build.yml                  |   8 +
 drivers/gpu/drm/ci/container.yml              |  24 ++
 drivers/gpu/drm/ci/gitlab-ci.yml              |  34 +-
 drivers/gpu/drm/ci/image-tags.yml             |   4 +-
 drivers/gpu/drm/ci/lava-submit.sh             |   3 +-
 drivers/gpu/drm/ci/test.yml                   |   2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  20 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   2 +-
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  32 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  13 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   5 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  22 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  20 ++
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   1 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  28 +-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  21 ++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 -
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   1 +
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |   7 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   4 +
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   7 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   1 +
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   7 +
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 313 ++++++++++++++++++
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   1 -
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  30 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   1 +
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 +
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  28 ++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   2 +
 56 files changed, 633 insertions(+), 106 deletions(-)

-- 
2.47.2


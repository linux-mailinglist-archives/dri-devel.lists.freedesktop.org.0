Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1393AF9B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130710E66A;
	Wed, 24 Jul 2024 10:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hkU6BPqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F110E66A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721815905;
 bh=y5eg6oSlMBrIqzM60aEB9SQlYliam1C5elKMQH5ygwc=;
 h=From:To:Cc:Subject:Date:From;
 b=hkU6BPqRXDOW/mdtaWAspm9aky7N21a7233n8yF9h1F819UjR87WSsYCLc8UIGXxq
 zkdgnU2TMZp89nDY6LLuOBuL94n096wKXKY0PJfMzd9WyGgr/y1NbHkEA4OSdR7V4G
 19MfhuBgQ43hYao5h04DldqhgpP98DSHtBST41ljA+zGF488cZ+Q5Euvgvt8+hz6CL
 A/NLzf9o1nepLAkEm4yQa9NJ1L2dsEP9sZ3R8NkRDY/dXvPWJohmwlzXRZKT+B8Dl2
 ORam3HCUH1z+UJnYPh77pghZQWUxAC+4Z2VW8RTnKY/67/podB2m7kxTcYgJj0RGd3
 5HqOz1Q2WmrOw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B36B37820DE;
 Wed, 24 Jul 2024 10:11:42 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 robdclark@gmail.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/5] drm/ci: Add support for GPU and display testing
Date: Wed, 24 Jul 2024 15:40:03 +0530
Message-ID: <20240724101015.523535-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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
display driver is rockchip. For amlogic meson G12B (A311D) SOC, the
GPU driver is panfrost, and the display driver is meson.

IGT tests run various tests with different xfails and can test both
GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
This leads to incomplete coverage since the display is never tested on
these platforms. This commit series adds support in drm-ci to run tests
for both GPU and display drivers for MediaTek mt8173/mt8183, Rockchip
rk3288/rk3399, and Amlogic Meson G12B (A311D) platforms.

Update the expectations file and skip driver-specific tests.

Working pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1231543

Vignesh Raman (5):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: mediatek: add tests for mediatek display driver
  drm/ci: mediatek: add tests for powervr gpu driver
  drm/ci: meson: add tests for meson display driver
  drm/ci: rockchip: add tests for rockchip display driver

 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |   3 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  10 --
 drivers/gpu/drm/ci/test.yml                   | 123 ++++++++++++++----
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  27 +++-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  13 ++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   4 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  18 ++-
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   4 +-
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   8 ++
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |  18 +++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  11 ++
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  18 +++
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   8 ++
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |  71 ++++++++++
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   8 ++
 .../drm/ci/xfails/panfrost-rk3399-flakes.txt  |   6 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |  24 ++++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  21 ++-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |   6 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  54 +-------
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  90 ++++++++++++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  50 ++++++-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   7 +-
 25 files changed, 478 insertions(+), 127 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt

-- 
2.43.0


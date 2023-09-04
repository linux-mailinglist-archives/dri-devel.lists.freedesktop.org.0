Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF471791B39
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017B610E165;
	Mon,  4 Sep 2023 16:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C06510E165
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:16:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 696FD660722B;
 Mon,  4 Sep 2023 17:15:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693844163;
 bh=xPXtvuiXMDVBWx/0jUHhIWmNJ5ZPDsCSW3gvJrwF0oY=;
 h=From:To:Cc:Subject:Date:From;
 b=k6JZBUwnNWNMmFP4LrNvMsJjMmMG8xtaztfYdO1KfVk7AcmpPoNW5n9A0eWaZUl6R
 1+9n3PXxe5e/uO1S8i6sfzaxJcyz6dAyT3GGQ4bQ6nmfUC1RwzFK8ij9LdMCe221VL
 YINmWrOLNMf8jBXVowAScLstpDHGYwV4pM26+xhfEyJNBFKAFYd6e8aZEKTLSQdd7U
 huHZaSeDa4ajqaOQ+qj4X/0qZ6jWuDYddHaiYTd6wbYzCn3GlaehkDH4wDrlAuQ6j7
 QmYj0in4HMVY7kOlc+Bdf29oqWskc4qrWG4oeRbwxoYs80F+4ede0LSPlLnPFvOIYq
 UR96GTDDVNZQg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm: ci: fixes
Date: Mon,  4 Sep 2023 21:45:09 +0530
Message-Id: <20230904161516.66751-1-vignesh.raman@collabora.com>
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
Cc: mripard@kernel.org, robdclark@google.com, daniels@collabora.com,
 emma@anholt.net, gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robclark@freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org
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

Vignesh Raman (7):
  drm: ci: igt_runner: remove todo
  drm: ci: Force db410c to host mode
  drm: ci: virtio: update ci variables
  drm: ci: Enable configs to fix mt8173 boot hang issue
  drm: ci: Update xfails
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs

 drivers/gpu/drm/ci/arm64.config               |  2 ++
 drivers/gpu/drm/ci/build.sh                   | 19 ++++++++++++-------
 .../ci/dt-overlays/apq8016-sbc-overlay.dts    | 13 +++++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  1 -
 drivers/gpu/drm/ci/test.yml                   | 14 ++++----------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  2 ++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |  1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  2 --
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 16 ++++++++++++++++
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  2 ++
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  1 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  4 ++--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  3 +++
 16 files changed, 59 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts

-- 
2.40.1


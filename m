Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF34940465
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 04:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0FB10E48F;
	Tue, 30 Jul 2024 02:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NuBWyRYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC810E48F;
 Tue, 30 Jul 2024 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722305821;
 bh=ecqJW+2XWWVpm15snuEjl1CVD1Wmd9kC+9jRhRK7KOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NuBWyRYQiw9NBiRLH/TwlH7amAmHyPC8ZY3m2aE+PhoGONn3zFEuFHOZ10bbJBWMF
 4nL6jOeuDVkzMRau/3Vg6TkxwzkdbBkaeLw71PzJRuQYsAynnr84b8exGcgEitlFFf
 qiuulI6cZozEtOwMC8Ma0KgL94noOC4d55RPmIFfDHAxwV8ozja7ydZRBo9enQFu6D
 d0xmgjtjRD8IA6ieQ/jsIe9dQsSQjKcr3b2kVTY8Xl8zAxrFeyx4DDv5BikRlWI8wR
 yRUaBeuPap8YGNbPh18JfXvic+mOdwYIpPDU9S5+a8wD0vQt/GlTdiPNavNEdHDZAM
 d9tP69Mn6JEtQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B6433782190;
 Tue, 30 Jul 2024 02:16:57 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com, melissa.srw@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/6] drm/ci: meson: add tests for meson display driver
Date: Tue, 30 Jul 2024 07:45:40 +0530
Message-ID: <20240730021545.912271-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
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

For Amlogic Meson G12B (A311D) SOC the display driver is meson and
gpu driver is panfrost. Currently, in drm-ci for Meson G12B (A311D),
only the gpu driver is tested. Refactor the existing meson jobs
and add support in drm-ci to test both display and gpu driver for
Amlogic Meson G12B (A311D) and update xfails.

Since the correct driver name is passed from the job to test gpu
and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name for meson jobs.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add meson-display job.

v6:
  - Squash commits for display and gpu driver testing. Reword the commit message.

v7:
  - Rebase with recent drm-ci fixes and retest with latest IGT.

v8:
  - No changes.

v9:
  - Skip display functionality tests for GPU-only drivers.

---
 drivers/gpu/drm/ci/igt_runner.sh              |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 23 +++++++++++++++----
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 18 ++++++++++-----
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |  4 +---
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |  1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 23 +++++++++++++++++++
 6 files changed, 56 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 6193865f23a3..1578a2a47a54 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,7 +20,7 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
+    rockchip)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
     amdgpu|vkms)
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 86875fb96eb5..5ccf57b3bf91 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -356,25 +356,38 @@ panfrost:mt8183:
     GPU_VERSION: mt8192
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
 
-.meson:
+.meson-device:
   extends:
     - .lava-igt:arm64
-  stage: meson
   variables:
-    DRIVER_NAME: meson
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: u-boot
     KERNEL_IMAGE_TYPE: "image"
 
-meson:g12b:
+.meson-display:
+  stage: meson
+  variables:
+    DRIVER_NAME: meson
+
+.g12b:
   extends:
-    - .meson
+    - .meson-device
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     GPU_VERSION: g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b:
+  extends:
+    - .g12b
+    - .meson-display
+
+panfrost:g12b:
+  extends:
+    - .g12b
+    - .panfrost-gpu
+
 virtio_gpu:none:
   stage: software-driver
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 70053ea74b5d..328967d3e23d 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,7 +1,13 @@
-dumb_buffer@create-clear,Fail
-dumb_buffer@create-valid-dumb,Fail
 dumb_buffer@invalid-bpp,Fail
-dumb_buffer@map-invalid-size,Fail
-dumb_buffer@map-uaf,Fail
-dumb_buffer@map-valid,Fail
-panfrost/panfrost_prime@gem-prime-import,Fail
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_lease@lease-uevent,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
index aeec535107c1..8198e06344a3 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -2,6 +2,7 @@
 ^amdgpu.*
 ^msm.*
 nouveau_.*
+^panfrost.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
@@ -11,9 +12,6 @@ gem_.*
 i915_.*
 tools_test.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
new file mode 100644
index 000000000000..fe8ce2ce33e6
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
@@ -0,0 +1 @@
+panfrost/panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
new file mode 100644
index 000000000000..3c7e494857b5
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
@@ -0,0 +1,23 @@
+# Skip driver specific tests
+^amdgpu.*
+^msm.*
+nouveau_.*
+^v3d.*
+^vc4.*
+^vmwgfx*
+
+# Skip intel specific tests
+gem_.*
+i915_.*
+tools_test.*
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip display functionality tests for GPU-only drivers
+dumb_buffer.*
+fbdev.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
-- 
2.43.0


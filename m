Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D148C92F7C6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5F10EC6F;
	Fri, 12 Jul 2024 09:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Mou1pYJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A61E10EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720775850;
 bh=WJYLZjUfriWi6tehlCYdP2N/q1rI4zoRDNa4p92RB4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mou1pYJXHTAAO8frg5QA194wv5p0+JReC8/7dFcTZgata+k5GB4XCG+rhhUceir3X
 yzHM7dWq5e7C816np9oiDNpvOkKQCO98dPygTwFZlO8WRcJcaIPDSo63aYZgCEAykn
 wHXU8a4roF7VvJfXKhwkmcOCrlaK62u6aXoOTEsk62UVrIt9K7SHoSPd8MHiMl9eDH
 Ub5rJMDNlWoSwF8OmxYP9Js61spZa79D6gVVIJ5UFofUobVXRIKNxHuKqjC4BmQJpJ
 Jwn65vbtB4vSn+GjoNbXMDoc/xf0yNy0Y/mmNKCtLrDEtTb5aNYlJAg7iTXgSJPzIY
 ZAzuwtk2mp6OA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 614E23782211;
 Fri, 12 Jul 2024 09:17:27 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 robdclark@gmail.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/5] drm/ci: rockchip: add tests for rockchip display driver
Date: Fri, 12 Jul 2024 14:45:49 +0530
Message-Id: <20240712091549.56635-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712091549.56635-1-vignesh.raman@collabora.com>
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
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

For rockchip rk3288 and rk3399, the display driver is rockchip
and gpu driver is panfrost. Currently, in drm-ci for rockchip
rk3288 and rk3399, only the gpu driver is tested. Refactor
the existing rockchip jobs to test both display and gpu driver
and update xfails.

Since the correct driver name is passed from the job to test gpu
and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name for rockchip jobs.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names
    instead of using DRIVER_NAME. Also update xfails.

v4:
  - Remove the display suffix in job and rename xfails accordingly.
    Remove the change adding job name in GPU_VERSION.

v5:
  - Add rockchip-display job and skip driver-specfic tests.

v6:
  - Squash commits for display and gpu driver testing. Reword the commit message.

v7:
  - Rebase with recent drm-ci fixes and retest with latest IGT.

---
 drivers/gpu/drm/ci/igt_runner.sh              |  3 -
 drivers/gpu/drm/ci/test.yml                   | 48 +++++++---
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  1 -
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |  8 ++
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   | 71 +++++++++++++++
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |  8 ++
 .../drm/ci/xfails/panfrost-rk3399-flakes.txt  |  6 ++
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   | 24 +++++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 21 +++--
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  6 ++
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   | 54 +----------
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 90 +++++++++++++++++--
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  | 13 ++-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  7 +-
 14 files changed, 270 insertions(+), 90 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 1578a2a47a54..f38836ec837c 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,9 +20,6 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip)
-        export IGT_FORCE_DRIVER="panfrost"
-        ;;
     amdgpu|vkms)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/. || true
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 5ccf57b3bf91..b22b2cf8f06f 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -160,33 +160,57 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
-rockchip:rk3288:
-  extends:
-    - .lava-igt:arm32
+.rockchip-device:
+  variables:
+    DTB: ${DEVICE_TYPE}
+    BOOT_METHOD: depthcharge
+
+.rockchip-display:
   stage: rockchip
   variables:
     DRIVER_NAME: rockchip
+
+.rk3288:
+  extends:
+    - .lava-igt:arm32
+    - .rockchip-device
+  variables:
     DEVICE_TYPE: rk3288-veyron-jaq
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
-    KERNEL_IMAGE_TYPE: "zimage"
     GPU_VERSION: rk3288
+    KERNEL_IMAGE_TYPE: "zimage"
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
 
-rockchip:rk3399:
+.rk3399:
   extends:
     - .lava-igt:arm64
-  stage: rockchip
+    - .rockchip-device
   parallel: 2
   variables:
-    DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
-    KERNEL_IMAGE_TYPE: ""
     GPU_VERSION: rk3399
+    KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288:
+  extends:
+    - .rk3288
+    - .rockchip-display
+
+panfrost:rk3288:
+  extends:
+    - .rk3288
+    - .panfrost-gpu
+
+rockchip:rk3399:
+  extends:
+    - .rk3399
+    - .rockchip-display
+
+panfrost:rk3399:
+  extends:
+    - .rk3399
+    - .panfrost-gpu
+
 .i915:
   extends:
     - .lava-igt:x86_64
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index cf3a747f7cec..826cca5efbff 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -13,7 +13,6 @@ kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
 kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_color@invalid-gamma-lut-sizes,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
new file mode 100644
index 000000000000..10689906da3a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
@@ -0,0 +1,8 @@
+dumb_buffer@create-clear,Crash
+dumb_buffer@create-valid-dumb,Crash
+dumb_buffer@invalid-bpp,Crash
+dumb_buffer@map-invalid-size,Crash
+dumb_buffer@map-uaf,Crash
+dumb_buffer@map-valid,Crash
+panfrost/panfrost_prime@gem-prime-import,Crash
+tools_test@tools_test,Crash
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
new file mode 100644
index 000000000000..b8cb31842323
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
@@ -0,0 +1,71 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
+
+# Started hanging the machine on Linux 5.19-rc2:
+#
+# [IGT] kms_plane_lowres: executing
+# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
+# [IGT] kms_plane_lowres: exiting, ret=77
+# Console: switching to colour frame buffer device 170x48
+# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
+# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
+# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
+# 8<--- cut here ---
+# Unable to handle kernel paging request at virtual address 7812078e
+# [7812078e] *pgd=00000000
+# Internal error: Oops: 5 [#1] SMP ARM
+# Modules linked in:
+# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
+# Hardware name: Rockchip (Device Tree)
+# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
+#  spin_dump from do_raw_spin_lock+0xa4/0xe8
+#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
+#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
+#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
+#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
+#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
+#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
+#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
+#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
+#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
+#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
+#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
+#  drm_client_dev_restore from drm_release+0xf4/0x114
+#  drm_release from __fput+0x74/0x240
+#  __fput from task_work_run+0x84/0xb4
+#  task_work_run from do_exit+0x34c/0xa20
+#  do_exit from do_group_exit+0x34/0x98
+#  do_group_exit from __wake_up_parent+0x0/0x18
+# Code: e595c008 12843d19 03e00000 03093168 (15940508)
+# ---[ end trace 0000000000000000 ]---
+# note: kms_plane_lowre[482] exited with preempt_count 1
+# Fixing recursive fault but reboot is needed!
+kms_plane_lowres@pipe-F-tiling-y
+
+# Take too long, we have only two machines, and these are very flaky
+kms_cursor_crc.*
+
+# Machine is hanging in this test, so skip it
+kms_pipe_crc_basic@disable-crc-after-crtc
+
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
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
new file mode 100644
index 000000000000..5b7d623f404b
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
@@ -0,0 +1,8 @@
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+panfrost/panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
new file mode 100644
index 000000000000..ac4f8f7244d4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/5cc34a8b-c1fa-4744-9031-2d33ecf41011@collabora.com/T/#u
+# Failure Rate: 50
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+panfrost/panfrost_submit@pan-unhandled-pagefault
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
new file mode 100644
index 000000000000..743f3eeb2f80
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
@@ -0,0 +1,24 @@
+# Suspend to RAM seems to be broken on this machine
+.*suspend.*
+
+# Too unstable, machine ends up hanging after lots of Oopses
+kms_cursor_legacy.*
+
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
+
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 10689906da3a..9961ef307bb4 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -1,8 +1,19 @@
+core_setmaster@master-drop-set-root,Crash
+core_setmaster@master-drop-set-user,Crash
+core_setmaster_vs_auth,Crash
+device_reset@cold-reset-bound,Crash
+device_reset@reset-bound,Crash
+device_reset@unbind-cold-reset-rebind,Crash
+device_reset@unbind-reset-rebind,Crash
 dumb_buffer@create-clear,Crash
-dumb_buffer@create-valid-dumb,Crash
 dumb_buffer@invalid-bpp,Crash
-dumb_buffer@map-invalid-size,Crash
-dumb_buffer@map-uaf,Crash
-dumb_buffer@map-valid,Crash
-panfrost/panfrost_prime@gem-prime-import,Crash
+fbdev@pan,Crash
+kms_cursor_crc@cursor-onscreen-32x10,Crash
+kms_cursor_crc@cursor-onscreen-32x32,Crash
+kms_cursor_crc@cursor-random-32x10,Crash
+kms_cursor_crc@cursor-sliding-32x32,Crash
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_prop_blob@invalid-set-prop,Crash
+kms_prop_blob@invalid-set-prop-any,Crash
 tools_test@tools_test,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
new file mode 100644
index 000000000000..1f9f01c88bea
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: rk3288-veyron-jaq
+# Bug Report: TBD
+# Failure Rate: 100
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_cursor_legacy@flip-vs-cursor-atomic
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index b8cb31842323..f28241b6581f 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -1,60 +1,11 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
 
-# Too unstable, machine ends up hanging after lots of Oopses
-kms_cursor_legacy.*
-
-# Started hanging the machine on Linux 5.19-rc2:
-#
-# [IGT] kms_plane_lowres: executing
-# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
-# [IGT] kms_plane_lowres: exiting, ret=77
-# Console: switching to colour frame buffer device 170x48
-# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
-# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
-# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
-# 8<--- cut here ---
-# Unable to handle kernel paging request at virtual address 7812078e
-# [7812078e] *pgd=00000000
-# Internal error: Oops: 5 [#1] SMP ARM
-# Modules linked in:
-# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
-# Hardware name: Rockchip (Device Tree)
-# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
-#  spin_dump from do_raw_spin_lock+0xa4/0xe8
-#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
-#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
-#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
-#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
-#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
-#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
-#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
-#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
-#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
-#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
-#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
-#  drm_client_dev_restore from drm_release+0xf4/0x114
-#  drm_release from __fput+0x74/0x240
-#  __fput from task_work_run+0x84/0xb4
-#  task_work_run from do_exit+0x34c/0xa20
-#  do_exit from do_group_exit+0x34/0x98
-#  do_group_exit from __wake_up_parent+0x0/0x18
-# Code: e595c008 12843d19 03e00000 03093168 (15940508)
-# ---[ end trace 0000000000000000 ]---
-# note: kms_plane_lowre[482] exited with preempt_count 1
-# Fixing recursive fault but reboot is needed!
-kms_plane_lowres@pipe-F-tiling-y
-
-# Take too long, we have only two machines, and these are very flaky
-kms_cursor_crc.*
-
-# Machine is hanging in this test, so skip it
-kms_pipe_crc_basic@disable-crc-after-crtc
-
 # Skip driver specific tests
 ^amdgpu.*
 ^msm.*
 nouveau_.*
+^panfrost.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
@@ -63,9 +14,6 @@ nouveau_.*
 gem_.*
 i915_.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 5b7d623f404b..3c0862faeaef 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,8 +1,86 @@
-dumb_buffer@create-clear,Fail
-dumb_buffer@create-valid-dumb,Fail
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@create-clear,Crash
 dumb_buffer@invalid-bpp,Fail
-dumb_buffer@map-invalid-size,Fail
-dumb_buffer@map-uaf,Fail
-dumb_buffer@map-valid,Fail
-panfrost/panfrost_prime@gem-prime-import,Fail
+kms_atomic_transition@modeset-transition,Fail
+kms_atomic_transition@modeset-transition-fencing,Fail
+kms_atomic_transition@plane-toggle-modeset-transition,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-64x21,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_edge_walk@64x64-left-edge,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@modeset-vs-vblank-race-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_invalid_mode@int-max-clock,Fail
+kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@disable-crc-after-crtc,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane@pixel-format,Crash
+kms_plane@pixel-format-source-clamping,Crash
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_multiple@tiling-none,Fail
+kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-functional,Fail
 tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index ac4f8f7244d4..107e34f46e61 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -1,6 +1,11 @@
 # Board Name: rk3399-gru-kevin
-# Bug Report: https://lore.kernel.org/dri-devel/5cc34a8b-c1fa-4744-9031-2d33ecf41011@collabora.com/T/#u
+# Bug Report: TBD
 # Failure Rate: 50
-# IGT Version: 1.28-g0df7b9b97
-# Linux Version: 6.9.0-rc7
-panfrost/panfrost_submit@pan-unhandled-pagefault
+# IGT Version: 1.28-gf13702b8e
+# Linux Version: 6.10.0-rc5
+kms_bw@linear-tiling-1-displays-2560x1440p
+kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
+kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@flip-vs-absolute-wf_vblank-interruptible
+kms_flip@flip-vs-wf_vblank-interruptible
+kms_setmode@basic
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 743f3eeb2f80..f28241b6581f 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -1,13 +1,11 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
 
-# Too unstable, machine ends up hanging after lots of Oopses
-kms_cursor_legacy.*
-
 # Skip driver specific tests
 ^amdgpu.*
 ^msm.*
 nouveau_.*
+^panfrost.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
@@ -16,9 +14,6 @@ nouveau_.*
 gem_.*
 i915_.*
 
-# Panfrost is not a KMS driver, so skip the KMS tests
-kms_.*
-
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
-- 
2.40.1


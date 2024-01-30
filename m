Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF63842790
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9921131C9;
	Tue, 30 Jan 2024 15:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927B1131C7;
 Tue, 30 Jan 2024 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627105;
 bh=/tqClr9qQe66p2hSz5Pm3c4S4wXSumTbpy05PTPesWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RoXdkvQOToYy1GWLKz8iEbdZHSbfuLGYucDgLV86jQlo1pckeuHxKHikzAmbqAzHo
 PlaD6X1WKxC1kYM8XWp67Dboja/mWMNTuLyGG7/6HIvaZENDuX2Ci1jdSyX9vuv0WE
 9ZGLYUYO+5YC6swLcdXn2oel9cTNnNqf68mN2vRJUhUz+jJDkxlUig9ljC09OxMMIh
 TXyO0zszy1p3KsmlYOZWP3QYtdxOOfoHZAVUbUioE76yDsWNIFEp3EwAUIWSMI0Mk+
 N44UBleVTnZSgq0R+WcLH3ME20ZMqJZkUhXg/lFsQXQv8CTek9FvYCzRWOwXICVHlx
 Gj5ALL6aqe2Wg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3348937811CF;
 Tue, 30 Jan 2024 15:05:00 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/9] drm/ci: mediatek: Rename exisitng job
Date: Tue, 30 Jan 2024 20:33:33 +0530
Message-Id: <20240130150340.687871-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
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
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For mediatek mt8173 and mt8183, the display driver is mediatek.
Currently, in drm-ci for mediatek, only the display driver is
tested. So rename the mediatek job to indicate that display driver is
tested. Rename the name of xfail files for mediatek (mt8173 and mt8183),
to include information about the tested driver and update xfails
accordingly. Since the correct driver name is passed from the job to
test gpu and display driver, remove the check to set IGT_FORCE_DRIVER
based on driver name.

Also add the job name in GPU_VERSION and use it for xfail file names
instead of using DRIVER_NAME.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
    script since it's now set by the job.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME. Also update xfails.

---
 drivers/gpu/drm/ci/igt_runner.sh              | 22 ++-----
 drivers/gpu/drm/ci/test.yml                   | 57 +++++++++++--------
 ....txt => mediatek-mt8173-display-fails.txt} | 13 -----
 .../xfails/mediatek-mt8173-display-flakes.txt | 13 +++++
 .../xfails/mediatek-mt8183-display-fails.txt  | 16 ++++++
 .../xfails/mediatek-mt8183-display-flakes.txt |  8 +++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 13 -----
 7 files changed, 77 insertions(+), 65 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (59%)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..f001e015d135 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
-        export IGT_FORCE_DRIVER="panfrost"
-        ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
@@ -37,16 +27,16 @@ case "$DRIVER_NAME" in
         ;;
 esac
 
-if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
-    IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
+if [ -e "/install/xfails/$GPU_VERSION-skips.txt" ]; then
+    IGT_SKIPS="--skips /install/xfails/$GPU_VERSION-skips.txt"
 fi
 
-if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-flakes.txt" ]; then
-    IGT_FLAKES="--flakes /install/xfails/$DRIVER_NAME-$GPU_VERSION-flakes.txt"
+if [ -e "/install/xfails/$GPU_VERSION-flakes.txt" ]; then
+    IGT_FLAKES="--flakes /install/xfails/$GPU_VERSION-flakes.txt"
 fi
 
-if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-fails.txt" ]; then
-    IGT_FAILS="--baseline /install/xfails/$DRIVER_NAME-$GPU_VERSION-fails.txt"
+if [ -e "/install/xfails/$GPU_VERSION-fails.txt" ]; then
+    IGT_FAILS="--baseline /install/xfails/$GPU_VERSION-fails.txt"
 fi
 
 if [ "`uname -m`" = "aarch64" ]; then
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 355b794ef2b1..0cd44e6ea18b 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -98,7 +98,7 @@ msm:sc7180-trogdor-lazor-limozeen:
   variables:
     DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
     DTB: sc7180-trogdor-lazor-limozeen-nots-r5
-    GPU_VERSION: ${DEVICE_TYPE}
+    GPU_VERSION: msm-${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-lazor-limozeen
 
 msm:sc7180-trogdor-kingoftown:
@@ -108,7 +108,7 @@ msm:sc7180-trogdor-kingoftown:
   variables:
     DEVICE_TYPE: sc7180-trogdor-kingoftown
     DTB: sc7180-trogdor-kingoftown
-    GPU_VERSION: ${DEVICE_TYPE}
+    GPU_VERSION: msm-${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
 msm:apq8016:
@@ -118,7 +118,7 @@ msm:apq8016:
   variables:
     DRIVER_NAME: msm
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
-    GPU_VERSION: apq8016
+    GPU_VERSION: msm-apq8016
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
     RUNNER_TAG: google-freedreno-db410c
   script:
@@ -132,7 +132,7 @@ msm:apq8096:
     DRIVER_NAME: msm
     BM_KERNEL_EXTRA_ARGS: maxcpus=2
     BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8096-db820c.dtb
-    GPU_VERSION: apq8096
+    GPU_VERSION: msm-apq8096
     RUNNER_TAG: google-freedreno-db820c
   script:
     - ./install/bare-metal/fastboot.sh
@@ -145,7 +145,7 @@ msm:sdm845:
   variables:
     DRIVER_NAME: msm
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
-    GPU_VERSION: sdm845
+    GPU_VERSION: msm-sdm845
     RUNNER_TAG: google-freedreno-cheza
   script:
     - ./install/bare-metal/cros-servo.sh
@@ -160,7 +160,7 @@ rockchip:rk3288:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: "zimage"
-    GPU_VERSION: rk3288
+    GPU_VERSION: rockchip-rk3288
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
 
 rockchip:rk3399:
@@ -174,7 +174,7 @@ rockchip:rk3399:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
-    GPU_VERSION: rk3399
+    GPU_VERSION: rockchip-rk3399
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
 .i915:
@@ -194,7 +194,7 @@ i915:apl:
   timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C523NA-A20057-coral
-    GPU_VERSION: apl
+    GPU_VERSION: i915-apl
     RUNNER_TAG: mesa-ci-x86-64-lava-asus-C523NA-A20057-coral
 
 i915:glk:
@@ -204,7 +204,7 @@ i915:glk:
   timeout: "1h30m"
   variables:
     DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
-    GPU_VERSION: glk
+    GPU_VERSION: i915-glk
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-x360-12b-ca0010nr-n4020-octopus
 
 i915:amly:
@@ -214,7 +214,7 @@ i915:amly:
   timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
-    GPU_VERSION: amly
+    GPU_VERSION: i915-amly
     RUNNER_TAG: mesa-ci-x86-64-lava-asus-C433TA-AJ0005-rammus
 
 i915:kbl:
@@ -223,7 +223,7 @@ i915:kbl:
   parallel: 3
   variables:
     DEVICE_TYPE: hp-x360-14-G1-sona
-    GPU_VERSION: kbl
+    GPU_VERSION: i915-kbl
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-x360-14-G1-sona
 
 i915:whl:
@@ -233,7 +233,7 @@ i915:whl:
   timeout: "1h30m"
   variables:
     DEVICE_TYPE: dell-latitude-5400-8665U-sarien
-    GPU_VERSION: whl
+    GPU_VERSION: i915-whl
     RUNNER_TAG: mesa-ci-x86-64-lava-dell-latitude-5400-8665U-sarien
 
 i915:cml:
@@ -243,7 +243,7 @@ i915:cml:
   timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
-    GPU_VERSION: cml
+    GPU_VERSION: i915-cml
     RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-flip-hatch
 
 i915:tgl:
@@ -252,7 +252,7 @@ i915:tgl:
   parallel: 8
   variables:
     DEVICE_TYPE: asus-cx9400-volteer
-    GPU_VERSION: tgl
+    GPU_VERSION: i915-tgl
     RUNNER_TAG: mesa-ci-x86-64-lava-asus-cx9400-volteer
 
 .amdgpu:
@@ -271,7 +271,7 @@ amdgpu:stoney:
   parallel: 2
   variables:
     DEVICE_TYPE: hp-11A-G6-EE-grunt
-    GPU_VERSION: stoney
+    GPU_VERSION: amdgpu-stoney
     RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
 
 .mediatek:
@@ -279,29 +279,40 @@ amdgpu:stoney:
     - .lava-igt:arm64
   stage: mediatek
   variables:
-    DRIVER_NAME: mediatek
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
 
-mediatek:mt8173:
+.mt8173:
   extends:
     - .mediatek
   parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
-    GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
 
-mediatek:mt8183:
+.mt8183:
   extends:
     - .mediatek
   parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
-    GPU_VERSION: mt8183
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173-display:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mediatek-mt8173-display
+    DRIVER_NAME: mediatek
+
+mediatek:mt8183-display:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mediatek-mt8183-display
+    DRIVER_NAME: mediatek
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
@@ -309,7 +320,7 @@ mediatek:mt8183:
   parallel: 3
   variables:
     DEVICE_TYPE: mt8192-asurada-spherion-r0
-    GPU_VERSION: mt8192
+    GPU_VERSION: mediatek-mt8192
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8192-asurada-spherion-r0
 
 .meson:
@@ -328,7 +339,7 @@ meson:g12b:
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
-    GPU_VERSION: g12b
+    GPU_VERSION: meson-g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
 virtio_gpu:none:
@@ -336,7 +347,7 @@ virtio_gpu:none:
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
-    GPU_VERSION: none
+    GPU_VERSION: virtio_gpu-none
   extends:
     - .test-gl
     - .test-rules
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
similarity index 59%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
rename to drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
index ef0cb7c3698c..de0a14589ad1 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
@@ -9,8 +9,6 @@ kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_color@invalid-gamma-lut-sizes,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -18,19 +16,8 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_force_connector_basic@force-edid,Fail
-kms_force_connector_basic@force-load-detect,Fail
-kms_force_connector_basic@prune-stale-modes,Fail
 kms_hdmi_inject@inject-4k,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
 kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@plane-properties-atomic,Fail
 kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
new file mode 100644
index 000000000000..64b30c092c85
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt
@@ -0,0 +1,13 @@
+# Board Name: mt8173-elm-hana.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 50
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+
+# Below test shows inconsistency across multiple runs,
+# giving results of Pass and Timeout/Fail alternately
+kms_prop_blob@invalid-set-prop
+kms_prop_blob@invalid-set-prop-any
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
new file mode 100644
index 000000000000..acf23a932851
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-fails.txt
@@ -0,0 +1,16 @@
+kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2560x1440p,Fail
+kms_bw@linear-tiling-2-displays-3840x2160p,Fail
+kms_color@invalid-gamma-lut-sizes,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@plane-properties-atomic,Fail
+kms_properties@plane-properties-legacy,Fail
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
new file mode 100644
index 000000000000..5885a950fa72
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
+# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
+# IGT Version: 1.28-gd2af13d9f
+# Failure Rate: 100
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
deleted file mode 100644
index 67d690fc4037..000000000000
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_rmfb@close-fd,Fail
-- 
2.40.1


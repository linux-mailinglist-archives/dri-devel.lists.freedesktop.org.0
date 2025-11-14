Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6456C5B0CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149DE10E994;
	Fri, 14 Nov 2025 03:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IatPK1vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A110E98E;
 Fri, 14 Nov 2025 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763089301;
 bh=fpctLSQF/NF2mNL/C7f8N8pXoyQ4/1yo7rKatwKgPTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IatPK1vqv1b1q8n64yFCQuI0yv79iGGbsiUEU/je1ECOG+vnkFXT0JEHz7ItV3uBz
 Tdbhh3lXGTcM5Z+OW6DvI/h7U9Awch1yjEAIyVXvLTWH7kJfF4sRwY7/kIpGBzfX74
 40ZVJNsTc6JLAjbo0+N1kH79cEq6nKWE+pI5G6MBQOBUk2ymGgb7byaq6gJzKA0HYf
 l8878T31xEP741UUamsaaQBE5JazwHXHEDJvwA2UIdrJk7Luw+mMfJ7FLmPQyDMSJA
 +96deSWaB83IhKHKFc/J4uqAVHMiSx2OlCrYIHeiB32DmJ8PWljrrjWr9+eyiLVBkn
 jH0H9l5w+B/lw==
Received: from debian (unknown [171.76.81.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D4A517E0E0A;
 Fri, 14 Nov 2025 04:01:35 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/ci: Move qualcomm baremetal jobs to lava
Date: Fri, 14 Nov 2025 08:30:51 +0530
Message-ID: <20251114030056.1139570-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114030056.1139570-1-vignesh.raman@collabora.com>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
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

Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
farm. So enable these jobs to use lava and update expectation
files.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
 4 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4d2493..b850b88787ad 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -83,6 +83,7 @@ CONFIG_SC_DISPCC_7180=y
 CONFIG_SC_GPUCC_7180=y
 CONFIG_SM_GPUCC_8350=y
 CONFIG_QCOM_SPMI_ADC5=y
+CONFIG_QCOM_SPMI_VADC=y
 CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index e56895626500..42f75993e190 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -67,31 +67,6 @@
     - testing:x86_64
     - igt:x86_64
 
-.baremetal-igt-arm64:
-  extends:
-    - .baremetal-test-arm64-gl
-    - .use-debian/baremetal_arm64_test-gl
-    - .allow_failure_lockdep
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - !reference [.google-freedreno-farm-rules, rules]
-    - when: on_success
-  variables:
-    FDO_CI_CONCURRENT: 10
-    HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    S3_ARTIFACT_NAME: "arm64/kernel-files"
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
-    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
-    FARM: google
-  needs:
-    - debian/baremetal_arm64_test-gl
-    - job: testing:arm64
-      artifacts: false
-    - igt:arm64
-  tags:
-    - $RUNNER_TAG
-
 .software-driver:
   stage: software-driver
   extends:
@@ -149,34 +124,37 @@ msm:sc7180-trogdor-kingoftown:
 
 msm:apq8016:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8016-sbc-usb-host
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-410c
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8016-sbc-usb-host
+    FARM: collabora
     GPU_VERSION: apq8016
-    # disabling unused clocks congests with the MDSS runtime PM trying to
-    # disable those clocks and causes boot to fail.
-    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
-    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
-    RUNNER_TAG: google-freedreno-db410c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-410c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:apq8096:
   extends:
-    - .baremetal-igt-arm64
+    - .lava-igt:arm64
   stage: msm
+  parallel: 3
   variables:
-    DEVICE_TYPE: apq8096-db820c
+    BOOT_METHOD: fastboot
+    DEVICE_TYPE: dragonboard-820c
     DRIVER_NAME: msm
-    BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
+    DTB: apq8096-db820c
+    FARM: collabora
     GPU_VERSION: apq8096
-    RUNNER_TAG: google-freedreno-db820c
-  script:
-    - ./install/bare-metal/fastboot.sh || exit $?
+    KERNEL_IMAGE_NAME: "Image.gz"
+    KERNEL_IMAGE_TYPE: ""
+    RUNNER_TAG: mesa-ci-x86-64-lava-dragonboard-820c
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sm8350-hdk:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 72c469021b66..4546363447ff 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,5 +1,9 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
 msm/msm_mapping@ring,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2893f98a6b97..0d5cb2a87e67 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
+msm/msm_mapping@memptrs,Fail
-- 
2.51.0


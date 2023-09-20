Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2647A8ACA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA7E10E52F;
	Wed, 20 Sep 2023 17:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360F10E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:45:07 +0000 (UTC)
Received: from ginger.. (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A4986607243;
 Wed, 20 Sep 2023 18:45:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695231905;
 bh=FHxCs/RXD0KkE8OoukpcyM8cVU2ZKFN242XtHGZDPUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isUomOmvtHm/JHVs2VbfOb4CLCTo2XQ7QGyUaTkExtf2bqFgaq2O566W3vTspNUZX
 Xzgns0Q22NogpJDo0ZOfXCfhKWU6iO5rBrAZLgUcyH9Ge75rLZmEigq9f+EjUxjGAB
 GR9nRtV82Obk4YqvIgOlI63K0IlWTl6QssUuGPHjyWE0IktiIox4tClfnwBQ6vTYHH
 14WpXdL6j+QTZuHN8NFXLEGZchcoL4YIqrtswLQN/O5TF0dNUcKh04Zb4x066ccyY+
 MKgEz2uXMo/bPDyQUaqbHso/Po1+JuLr7KfW4IglwYK1N1OvgZxE7GmT5lBL4adBbE
 uQ0uutn2V9lTw==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm: ci: add tests on vkms
Date: Wed, 20 Sep 2023 14:44:44 -0300
Message-Id: <20230920174444.409586-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920174444.409586-1-helen.koike@collabora.com>
References: <20230920174444.409586-1-helen.koike@collabora.com>
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
Cc: mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 michel.daenzer@mailbox.org, vignesh.raman@collabora.com,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, mairacanal@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add job that runs igt on top of vkms.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

See pipeline: https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/990494
---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/build.sh                   |  1 -
 drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
 drivers/gpu/drm/ci/image-tags.yml             |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 24 ++++++++++++++-
 drivers/gpu/drm/ci/x86_64.config              |  1 +
 .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |  0
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 29 +++++++++++++++++++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 10 +++++++
 10 files changed, 69 insertions(+), 6 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 740a2ce2689c..e47dbe31d221 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6813,6 +6813,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/vkms.rst
+F:	drivers/gpu/drm/ci/xfails/vkms*
 F:	drivers/gpu/drm/vkms/
 
 DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..9e510e77098b 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -146,7 +146,6 @@ fi
 
 mkdir -p artifacts/install/lib
 mv install/* artifacts/install/.
-rm -rf artifacts/install/modules
 ln -s common artifacts/install/ci-common
 
 for image in ${KERNEL_IMAGE_NAME}; do
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 73725070702b..4705b9ecbc72 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -122,6 +122,7 @@ stages:
   - rockchip
   - virtio-gpu
   - lint
+  - software-driver
 
 # YAML anchors for rule conditions
 # --------------------------------
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2bb759165063..c7f83d1b72e9 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -21,9 +21,9 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
-if [ "$IGT_FORCE_DRIVER" = "amdgpu" ]; then
-    mv /install/modules/lib/modules/* /lib/modules/.
-    modprobe amdgpu
+if [ "$IGT_FORCE_DRIVER" = "amdgpu" || "$IGT_FORCE_DRIVER" = "vkms" ]; then
+    mv /install/modules/lib/modules/* /lib/modules/. || true
+    modprobe --first-time "$IGT_FORCE_DRIVER"
 fi
 
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index f051b6c547c5..e05077ee29d2 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
+   DEBIAN_BUILD_TAG: "2023-09-20-vkms-module-2"
 
    KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
 
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6473cddaa7a9..e6ed8707423c 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -332,4 +332,26 @@ virtio_gpu:none:
     - igt:x86_64
   rules:
     # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
-    - when: never
\ No newline at end of file
+    - when: never
+
+vkms:none:
+  stage: software-driver
+  variables:
+    DRIVER_NAME: vkms
+    GPU_VERSION: none
+  extends:
+    - .test-gl
+  tags:
+    - kvm
+  script:
+    - ln -sf $CI_PROJECT_DIR/install /install
+    - mv install/bzImage /lava-files/bzImage
+    - mkdir -p /lib/modules
+    - mv install/modules/lib/modules/* /lib/modules/.
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
+    - ./install/crosvm-runner.sh ./install/igt_runner.sh
+  needs:
+    - debian/x86_64_test-gl
+    - testing:x86_64
+    - igt:x86_64
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
index 1cbd49a5b23a..8eaba388b141 100644
--- a/drivers/gpu/drm/ci/x86_64.config
+++ b/drivers/gpu/drm/ci/x86_64.config
@@ -24,6 +24,7 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_PWM_CROS_EC=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_DRM_VKMS=m
 
 # Strip out some stuff we don't need for graphics testing, to reduce
 # the build.
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
deleted file mode 100644
index e69de29bb2d1..000000000000
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
new file mode 100644
index 000000000000..a65196a19222
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -0,0 +1,29 @@
+kms_cursor_crc@cursor-rapid-movement-128x128,Fail
+kms_cursor_crc@cursor-rapid-movement-128x42,Fail
+kms_cursor_crc@cursor-rapid-movement-256x256,Fail
+kms_cursor_crc@cursor-rapid-movement-256x85,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-512x170,Fail
+kms_cursor_crc@cursor-rapid-movement-512x512,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_cursor_legacy@cursorA-vs-flipA-toggle,Fail
+kms_cursor_legacy@flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
+kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
+kms_cursor_legacy@flip-vs-cursor-legacy,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@suspend-read-crc,Fail
+kms_plane@plane-panning-bottom-right-suspend,Fail
+kms_universal_plane@universal-plane-pipe-A-sanity,Fail
+kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
new file mode 100644
index 000000000000..07aa62cff108
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -0,0 +1,10 @@
+# Hits:
+# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
+# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
+kms_prop_blob@invalid-get-prop
+
+# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
+kms_invalid_mode@int-max-clock
+
+# Suspend seems to be broken
+.*suspend.*
\ No newline at end of file
-- 
2.34.1


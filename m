Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D917D442E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8908510E25D;
	Tue, 24 Oct 2023 00:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC710E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:46:29 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 64A2C66071D4;
 Tue, 24 Oct 2023 01:46:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108388;
 bh=6KjYRfbuBh+/ylPXNLW71foNbJeaqFWiENanDlIKgzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i9wosHycCfMPJ8Wvx2AO1MF8yB7InUb6ZG2Oz/p7t2S8hC2tZR3WXgNgrehaxeqx6
 TkuI7+n8eRk/cw732GhBYCNxdBUeTI9cUM1juep7aj2wkL1ocJcWq5q16wZ4TEeLtd
 yemnb7gcGT11AxP5dwUbz5rrsmbhUIyUE42TlCSMy4ttrupxhb0q1PdbHzSm6elVu5
 EW2xAeEosiWI542YDoITLgTWjAtMPCPmfDy0zU2/DI70/vDt4IaROXr4oVwL4jd2XU
 zgJGGjhECwhfaQAxcQANIKxm61gg/x4eqqhxpjmFw4FeWPnlKEESGaX4wcHKfGJSGm
 8iVJYbFlmZk2w==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 04/10] drm/ci: uprev IGT and make sure core_getversion is
 run
Date: Mon, 23 Oct 2023 21:45:19 -0300
Message-Id: <20231024004525.169002-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IGT has recently merged a patch that makes code_getversion test to fails
if the driver isn't loaded or if it isn't the expected one defined in
variable IGT_FORCE_DRIVER.

Without this test, jobs were passing when the driver didn't load or
probe for some reason, giving the illusion that everything was ok.

Uprev IGT to include this modification and include core_getversion test
in all the shards.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- fixed typo in the commit message
v3:
- no changes
---
 drivers/gpu/drm/ci/gitlab-ci.yml  |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh  | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/ci/image-tags.yml |  2 +-
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 452b9c2532ae..c08ea6097b1d 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: 471bfababd070e1dac0ebb87470ac4f2ae85e663
+  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2bb759165063..2f815ee3a8a3 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,11 +20,16 @@ set +e
 cat /sys/kernel/debug/dri/*/state
 set -e
 
-# Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
-if [ "$IGT_FORCE_DRIVER" = "amdgpu" ]; then
-    mv /install/modules/lib/modules/* /lib/modules/.
-    modprobe amdgpu
-fi
+case "$DRIVER_NAME" in
+    rockchip|mediatek|meson)
+        export IGT_FORCE_DRIVER="panfrost"
+        ;;
+    amdgpu)
+        # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
+        mv /install/modules/lib/modules/* /lib/modules/.
+        modprobe amdgpu
+        ;;
+esac
 
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
     IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
@@ -48,6 +53,20 @@ fi
 
 curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${FDO_HTTP_CACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar --zstd -v -x -C /
 
+
+# If the job is parallel at the gitab job level, take the corresponding fraction
+# of the caselist.
+if [ -n "$CI_NODE_INDEX" ]; then
+    sed -ni $CI_NODE_INDEX~$CI_NODE_TOTAL"p" /install/testlist.txt
+fi
+
+# core_getversion checks if the driver is loaded and probed correctly
+# so run it in all shards
+if ! grep -q "core_getversion" /install/testlist.txt; then
+    # Add the line to the file
+    echo "core_getversion" >> /install/testlist.txt
+fi
+
 set +e
 igt-runner \
     run \
@@ -57,8 +76,6 @@ igt-runner \
     $IGT_SKIPS \
     $IGT_FLAKES \
     $IGT_FAILS \
-    --fraction-start $CI_NODE_INDEX \
-    --fraction $CI_NODE_TOTAL \
     --jobs 1
 ret=$?
 set -e
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index e1b387581c11..7dd3f995f8a2 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-06-amd"
+   DEBIAN_BUILD_TAG: "2023-10-08-igt"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
 
-- 
2.39.2


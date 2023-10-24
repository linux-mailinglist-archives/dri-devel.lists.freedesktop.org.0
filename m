Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C959E7D442A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EB510E258;
	Tue, 24 Oct 2023 00:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034E910E258
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:46:18 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F39166072A7;
 Tue, 24 Oct 2023 01:46:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108376;
 bh=TB/0rhokEDmZcdQSgbCRpSg8nQuhFIEjvqv1ehTU+Nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHRGXluePucVJ3019HJDmjkoYwyUXUE2P8ZmhUAzr0V6zI5SF5bgf3z6QvmuszU4t
 S62raDoe0s+YAXAwL3PmIMKhVxRuiRlcDRQR3/ZH9GpiBi+g53DeEq5M1CLxKxwDCs
 q/4w90SUidv7FbT1BMy/IuYDCNItJK9t3KAcqYectOACzqH59LlDn+WEIm7pYN+3fB
 hYqW2ZE4om2XBga/ZtgekbBwOYrIilaFmdSIIHE+3VZApKCu7iF4PF2da/s8bec4Q2
 lui6/4UgP75p3covG8IHpAtLD7+8J6WK/5NsSa9gw2u8ScOjgGxk0X+DAh8HsWZPJH
 7KSCqqrRrtjjA==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 02/10] drm/ci: fix DEBIAN_ARCH and get amdgpu probing
Date: Mon, 23 Oct 2023 21:45:17 -0300
Message-Id: <20231024004525.169002-3-helen.koike@collabora.com>
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
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu driver wasn't loading because amdgpu firmware wasn't being
installed in the rootfs due to the wrong DEBIAN_ARCH variable.

rename ARCH to DEBIAN_ARCH also, so we don't have the confusing
DEBIAN_ARCH, KERNEL_ARCH and ARCH.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- fix typos in commit message
v3:
- no changes
---
 drivers/gpu/drm/ci/build.sh       | 2 +-
 drivers/gpu/drm/ci/image-tags.yml | 4 ++--
 drivers/gpu/drm/ci/lava-submit.sh | 4 ++--
 drivers/gpu/drm/ci/test.yml       | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 20a6ba8a7b04..e3908f4d71cb 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -35,7 +35,7 @@ elif [[ "$KERNEL_ARCH" = "arm" ]]; then
     apt-get install -y libssl-dev:armhf
 else
     GCC_ARCH="x86_64-linux-gnu"
-    DEBIAN_ARCH="x86_64"
+    DEBIAN_ARCH="amd64"
     DEVICE_TREES=""
 fi
 
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 157d987149f0..e1b387581c11 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,9 +4,9 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
+   DEBIAN_BUILD_TAG: "2023-10-06-amd"
 
-   KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
+   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
    DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index 379f26ea87cc..3d39b0c916a8 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -37,8 +37,8 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--dump-yaml \
 	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
 	--rootfs-url-prefix "https://${BASE_SYSTEM_HOST_PATH}" \
-	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${ARCH}" \
-	--build-url "${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${ARCH}/kernel-files.tar.zst" \
+	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}" \
+	--build-url "${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
 	--job-rootfs-overlay-url "${FDO_HTTP_CACHE_URI:-}https://${JOB_ROOTFS_OVERLAY_PATH}" \
 	--job-timeout-min ${JOB_TIMEOUT:-80} \
 	--first-stage-init artifacts/ci-common/init-stage1.sh \
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6473cddaa7a9..3479d2a0108d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -23,7 +23,7 @@
     - .lava-test:arm32
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    ARCH: "armhf"
+    DEBIAN_ARCH: "armhf"
   dependencies:
     - testing:arm32
   needs:
@@ -38,7 +38,7 @@
     - .lava-test:arm64
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    ARCH: "arm64"
+    DEBIAN_ARCH: "arm64"
   dependencies:
     - testing:arm64
   needs:
@@ -53,7 +53,7 @@
     - .lava-test:x86_64
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
-    ARCH: "x86_64"
+    DEBIAN_ARCH: "amd64"
   dependencies:
     - testing:x86_64
   needs:
-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF687D4429
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06D410E025;
	Tue, 24 Oct 2023 00:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AAF10E025
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:46:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D66CF66071D4;
 Tue, 24 Oct 2023 01:46:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108371;
 bh=eM5B0H5DM/F8Ypq3UECeQguYvXrBHa9gewZKm2Ff4oI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B3Lreb8hsciiUiCdiLf2VG+zQYzz/y5+sDkdxg0ZPMIuTnraWqZL1f1V4pLBR0L41
 iqRNkN3LM+8RFkwIxYzWy5XtqE5aHYd3xNbpd1rlq3d/3QZ3X0dcrHaWsW1M+VmmWq
 uDtmLgYkG7LjeTDp1+tuLicY8IanDCO3WphHpquWm/ZuhDhaGQ3V95X8wLHGQ5Z6Bo
 gHNeSj3g3apnQ4cwyJtP01j/LF9TotEEB/GbqzDrHeYoWvouJE8S38+yD0AN07DqrG
 xJZD3XKr+i0CC/PHFL8WLr5EwZgCK7/8qkTL4lMBiENBDXWcF7MB5EqbLODfA0OCaR
 wd5vDaBHjodDg==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v3 01/10] drm/ci: uprev mesa version: fix container build &
 crosvm
Date: Mon, 23 Oct 2023 21:45:16 -0300
Message-Id: <20231024004525.169002-2-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com,
 rust-for-linux@vger.kernel.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building containers, some rust packages were installed without
locking the dependencies version, which got updated and started giving
errors like:

error: failed to compile `bindgen-cli v0.62.0`, intermediate artifacts can be found at `/tmp/cargo-installkNKRwf`
Caused by:
  package `rustix v0.38.13` cannot be built because it requires rustc 1.63 or newer, while the currently active rustc version is 1.60.0

A patch to Mesa was added fixing this error, so update it.

Also, commit in linux kernel 6.6 rc3 broke booting in crosvm.
Mesa has upreved crosvm to fix this issue.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
[crosvm mesa update]
Co-Developed-by: Vignesh Raman <vignesh.raman@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
[v1 container build uprev]
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- update to an even newer version of mesa to integrate crosvm uprev

v3:
- update to newest version of mesa, to get the patch that disables
  bare-metal retries
---
 drivers/gpu/drm/ci/build.yml      |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml  | 20 +++++++++++++++++++-
 drivers/gpu/drm/ci/image-tags.yml |  2 +-
 drivers/gpu/drm/ci/lava-submit.sh |  2 +-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index e6503f1c5927..17ab38304885 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -1,6 +1,7 @@
 .build:
   extends:
     - .build-rules
+    - .container+build-rules
   stage: build
   artifacts:
     paths:
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2c4df53f5dfe..452b9c2532ae 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 0dc961645c4f0241f8512cb0ec3ad59635842072
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha edfbf74df1d4d6ce54ffe24566108be0e1a98c3d
 
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
@@ -24,6 +24,8 @@ variables:
   PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
   # per-job artifact storage on MinIO
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
+  # default kernel for rootfs before injecting the current kernel tree
+  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/gfx-ci/linux/v6.4.12-for-mesa-ci-f6b4ad45f48d
 
   LAVA_JOB_PRIORITY: 30
 
@@ -86,6 +88,17 @@ include:
       - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/test/gitlab-ci.yml'
       - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
+      - '/src/microsoft/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/zink/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/crocus/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/softpipe/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/llvmpipe/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/virgl/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/drivers/nouveau/ci/gitlab-ci-inc.yml'
+      - '/src/gallium/frontends/lavapipe/ci/gitlab-ci-inc.yml'
+      - '/src/intel/ci/gitlab-ci-inc.yml'
+      - '/src/freedreno/ci/gitlab-ci-inc.yml'
+      - '/src/amd/ci/gitlab-ci-inc.yml'
   - drivers/gpu/drm/ci/image-tags.yml
   - drivers/gpu/drm/ci/container.yml
   - drivers/gpu/drm/ci/static-checks.yml
@@ -154,6 +167,11 @@ stages:
     # Run automatically once all dependency jobs have passed
     - when: on_success
 
+# When to automatically run the CI for container jobs
+.container+build-rules:
+  rules:
+    - !reference [.no_scheduled_pipelines-rules, rules]
+    - when: manual
 
 .ci-deqp-artifacts:
   artifacts:
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index f051b6c547c5..157d987149f0 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2023-08-10-mesa-uprev"
+   CONTAINER_TAG: "2023-10-11-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index 0c4456b21b0f..379f26ea87cc 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -22,7 +22,7 @@ cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
 
 # Prepare env vars for upload.
 section_start variables "Variables passed through:"
-KERNEL_IMAGE_BASE_URL="https://${BASE_SYSTEM_HOST_PATH}" \
+KERNEL_IMAGE_BASE="https://${BASE_SYSTEM_HOST_PATH}" \
 	artifacts/ci-common/generate-env.sh | tee results/job-rootfs-overlay/set-job-env-vars.sh
 section_end variables
 
-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4797D06FF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 05:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8C210E574;
	Fri, 20 Oct 2023 03:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC6E10E574
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 03:41:52 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BBE3D660734A;
 Fri, 20 Oct 2023 04:41:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697773310;
 bh=dgc/3W1RM5H+2wd9VuA1Go44+FYuTaauVu5NymEAR6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V3viAhn1/AWakXqzWODOWwtcgq5iEtJ3taYZJUOMC7AFbNxKO2P3Ro8GPAjdNrp9x
 SEZRNoQsrB0IK+K6Su/QqRA0fdiog5/3tn52Ki2JGdsofc/16gkoFl1wDt5wnkZKQ7
 sT3HS6Kl+jgY0o2IZuX60uK2G4MU2ntogTEJbq61bJAdXuytt4vDLf7Ao414a5fng7
 OEQRY7uK8CW8e7lMrPDROKASP34v9kkWyOlf0jPOb1ZM2pv3FvPgfy08i97ORRdDMf
 iABoNsCd8xmW6mJuo1prjg3TKhAsiHFY1/K0dB6/ClnUYNS3RS28EOlHCYqB55ZeIG
 Vyi17on468CrA==
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
Subject: [PATCH v2 1/9] drm/ci: uprev mesa version: fix container build &
 crosvm
Date: Fri, 20 Oct 2023 00:41:16 -0300
Message-Id: <20231020034124.136295-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, rust-for-linux@vger.kernel.org,
 vignesh.raman@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
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
index 2c4df53f5dfe..51b1af77b04f 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 0dc961645c4f0241f8512cb0ec3ad59635842072
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 26c2c96d6228e27cdaa1335f798bf962df147bf1
 
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


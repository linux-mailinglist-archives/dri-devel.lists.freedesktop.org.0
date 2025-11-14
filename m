Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F7C5B0C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DAA10E98C;
	Fri, 14 Nov 2025 03:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RUcfqb5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249610E98C;
 Fri, 14 Nov 2025 03:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763089294;
 bh=Qo4cCDhFjwUDdAEhxHgaM6vWFCyDJrUYttdxeu7fs6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RUcfqb5UHntzfMAZaBybbZpQmD7MzTHlw9Dt5jHmXyEJuk0fm3rQYi38d+Tb4STJY
 BQ5FcR5Eqi3n76xv7iTJCKqOKCLFZB6lKnShlGhAqjj9pGVfd6/FkRIO+M7iHiu1j4
 w0yFVBTreq0Y21nP4zsmWZMIO7AxAOWtDbF2A8FP8QZDV/pwCnEhJtJI7x5aiocTby
 ZHZM1+grBgERRIxn/H/pHmWaPZld+uqXd8vHVfLJ7shns6ozpgIBqK0kpq/PzRYumm
 OSnPwkVD3XG3C7Q+dIvRoFlVrWXOvPHoNTAU0Upb4v00mvfFNsOdl5JQpyTaUZ17Ma
 boIafxUmDMQvw==
Received: from debian (unknown [171.76.81.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6577517E0B46;
 Fri, 14 Nov 2025 04:01:28 +0100 (CET)
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
Subject: [PATCH v1 1/2] drm/ci: uprev mesa
Date: Fri, 14 Nov 2025 08:30:50 +0530
Message-ID: <20251114030056.1139570-2-vignesh.raman@collabora.com>
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

Uprev mesa to adapt to the latest changes in Mesa CI, including support
for firmware via LAVA overlays, removal of the python-artifacts job,
split container and build rules, use lava-job-submitter container,
and various misc fixes.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.yml         |  22 +++---
 drivers/gpu/drm/ci/container.yml     |  28 ++++++--
 drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
 drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
 drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
 drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
 drivers/gpu/drm/ci/static-checks.yml |   1 +
 drivers/gpu/drm/ci/test.yml          |  18 +++--
 8 files changed, 186 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index af27ff5de369..efbcaae49807 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -1,6 +1,6 @@
 .build:
   extends:
-    - .container+build-rules
+    - .build-rules
   stage: build-only
   artifacts:
     paths:
@@ -133,6 +133,10 @@ debian-arm32-asan:
   rules:
     - when: never
 
+debian-x86_64-msan:
+  rules:
+    - when: never
+
 debian-arm64:
   rules:
     - when: never
@@ -153,7 +157,7 @@ debian-arm64-ubsan:
   rules:
     - when: never
 
-debian-build-testing:
+debian-build-x86_64:
   rules:
     - when: never
 
@@ -177,31 +181,31 @@ debian-release:
   rules:
     - when: never
 
-debian-s390x:
+debian-riscv64:
   rules:
     - when: never
 
-debian-testing:
+debian-s390x:
   rules:
     - when: never
 
-debian-testing-asan:
+debian-vulkan:
   rules:
     - when: never
 
-debian-testing-msan:
+debian-x86_32:
   rules:
     - when: never
 
-debian-testing-ubsan:
+debian-x86_64:
   rules:
     - when: never
 
-debian-vulkan:
+debian-x86_64-asan:
   rules:
     - when: never
 
-debian-x86_32:
+debian-x86_64-ubsan:
   rules:
     - when: never
 
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 5f90508578a3..ce6007a45a07 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -5,21 +5,29 @@
 
 debian/x86_64_build-base:
   variables:
-    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod2 libkmod-dev libpciaccess-dev libproc2-dev libudev-dev libunwind-dev python3-docutils bc python3-ply libssl-dev bc"
+    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libkmod-dev libpciaccess-dev libproc2-dev libudev-dev libunwind-dev python3-docutils bc python3-ply libssl-dev bc"
+
+debian/arm64_build:
+  variables:
+    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libproc2-dev libkmod-dev libpciaccess-dev libudev-dev libunwind-dev python3-docutils libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libproc2-dev:armhf libunwind-dev:armhf libdw-dev:armhf libpixman-1-dev:armhf libcairo-dev:armhf libudev-dev:armhf libjson-c-dev:armhf"
 
 debian/x86_64_test-gl:
   variables:
-    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5 libkmod-dev libkmod2 libgles2 libproc2-dev"
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1"
 
-debian/arm64_build:
+debian/arm64_test-gl:
   variables:
-    EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libproc2-dev libkmod2 libkmod-dev libpciaccess-dev libudev-dev libunwind-dev python3-docutils libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libproc2-dev:armhf libunwind-dev:armhf libdw-dev:armhf libpixman-1-dev:armhf libcairo-dev:armhf libudev-dev:armhf libjson-c-dev:armhf"
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1"
 
-.kernel+rootfs:
+debian/arm32_test-gl:
   variables:
-    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5"
+    EXTRA_LOCAL_PACKAGES: "jq libasound2t64 libcairo2 libdw1t64 libglib2.0-0t64 libjson-c5 libkmod2 libgles2 libdrm-nouveau2 libdrm-amdgpu1 libunwind8"
 
 # Disable container jobs that we won't use
+alpine/x86_64_build:
+  rules:
+    - when: never
+
 debian/arm64_test-vk:
   rules:
     - when: never
@@ -28,6 +36,10 @@ debian/baremetal_arm32_test-gl:
   rules:
     - when: never
 
+debian/baremetal_arm64_test-gl:
+  rules:
+    - when: never
+
 debian/baremetal_arm64_test-vk:
   rules:
     - when: never
@@ -36,6 +48,10 @@ debian/ppc64el_build:
   rules:
     - when: never
 
+debian/riscv64_build:
+  rules:
+    - when: never
+
 debian/s390x_build:
   rules:
     - when: never
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 56638814bb28..e23a9110008c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 02337aec715c25dae7ff2479d986f831c77fe536
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha f07dab189928ee65865ef9cefcaa4eff05da99b5
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
@@ -11,7 +11,7 @@ variables:
   DEQP_RUNNER_GIT_TAG: v0.20.0
 
   FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
-  MESA_TEMPLATES_COMMIT: &ci-templates-commit c6aeb16f86e32525fa630fb99c66c4f3e62fc3cb
+  MESA_TEMPLATES_COMMIT: &ci-templates-commit aec7a6ce7bb38902c70641526f6611e27141784a
   DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
   CI_PRE_CLONE_SCRIPT: |-
           set -o xtrace
@@ -30,6 +30,8 @@ variables:
   S3_GITCACHE_BUCKET: git-cache
   # Bucket for the pipeline artifacts pushed to S3
   S3_ARTIFACTS_BUCKET: artifacts
+  # Base path used for various artifacts
+  S3_BASE_PATH: "${S3_HOST}/${S3_KERNEL_BUCKET}"
   # per-pipeline artifact storage on MinIO
   PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/${S3_ARTIFACTS_BUCKET}/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
   # per-job artifact storage on MinIO
@@ -44,6 +46,8 @@ variables:
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
+  # Mesa-specific variables that shouldn't be forwarded to DUTs and crosvm
+  CI_EXCLUDE_ENV_VAR_REGEX: 'SCRIPTS_DIR|RESULTS_DIR'
 
 
 default:
@@ -84,10 +88,11 @@ include:
   - project: *drm-ci-project-path
     ref: *drm-ci-commit-sha
     file:
+      - '/.gitlab-ci/bare-metal/gitlab-ci.yml'
       - '/.gitlab-ci/build/gitlab-ci.yml'
       - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/farm-rules.yml'
-      - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
+      - '/.gitlab-ci/lava/gitlab-ci.yml'
       - '/.gitlab-ci/test-source-dep.yml'
       - '/.gitlab-ci/test/gitlab-ci.yml'
       - '/src/amd/ci/gitlab-ci-inc.yml'
@@ -147,10 +152,10 @@ stages:
     - if: &is-merge-attempt $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"
     # post-merge pipeline
     - if: &is-post-merge $GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "push"
-    # Pre-merge pipeline
-    - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
+    # Pre-merge pipeline (because merge pipelines are already caught above)
+    - if: &is-merge-request $CI_PIPELINE_SOURCE == "merge_request_event"
     # Push to a branch on a fork
-    - if: &is-fork-push $CI_PIPELINE_SOURCE == "push"
+    - if: &is-push-to-fork $CI_PIPELINE_SOURCE == "push"
     # nightly pipeline
     - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
     # pipeline for direct pushes that bypassed the CI
@@ -160,17 +165,59 @@ stages:
 # Rules applied to every job in the pipeline
 .common-rules:
   rules:
-    - if: *is-fork-push
+    - if: *is-push-to-fork
       when: manual
 
-
 .never-post-merge-rules:
   rules:
     - if: *is-post-merge
       when: never
 
 
-.container+build-rules:
+# Note: make sure the branches in this list are the same as in
+# `.build-only-delayed-rules` below.
+.container-rules:
+  rules:
+    - !reference [.common-rules, rules]
+    # Run when re-enabling a disabled farm, but not when disabling it
+    - !reference [.disable-farm-mr-rules, rules]
+    # Never run immediately after merging, as we just ran everything
+    - !reference [.never-post-merge-rules, rules]
+    # Only rebuild containers in merge pipelines if any tags have been
+    # changed, else we'll just use the already-built containers
+    - if: *is-merge-attempt
+      changes: &image_tags_path
+        - drivers/gpu/drm/ci/image-tags.yml
+      when: on_success
+    # Skip everything for pre-merge and merge pipelines which don't change
+    # anything in the build; we only do this for marge-bot and not user
+    # pipelines in a MR, because we might still need to run it to copy the
+    # container into the user's namespace.
+    - if: *is-merge-attempt
+      when: never
+    # Any MR pipeline which changes image-tags.yml needs to be able to
+    # rebuild the containers
+    - if: *is-merge-request
+      changes: *image_tags_path
+      when: manual
+    # ... however for MRs running inside the user namespace, we may need to
+    # run these jobs to copy the container images from upstream
+    - if: *is-merge-request
+      when: manual
+    # Build everything after someone bypassed the CI
+    - if: *is-direct-push
+      when: manual
+    # Scheduled pipelines reuse already-built containers
+    - if: *is-scheduled-pipeline
+      when: never
+    # Allow building everything in fork pipelines, but build nothing unless
+    # manually triggered
+    - when: manual
+
+
+# Note: make sure the branches in this list are the same as in
+# `.build-only-delayed-rules` below.
+.build-rules:
   rules:
     - !reference [.common-rules, rules]
     # Run when re-enabling a disabled farm, but not when disabling it
@@ -181,7 +228,7 @@ stages:
     - if: *is-merge-attempt
       when: on_success
     # Same as above, but for pre-merge pipelines
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: manual
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
@@ -197,7 +244,7 @@ stages:
 # Repeat of the above but with `when: on_success` replaced with
 # `when: delayed` + `start_in:`, for build-only jobs.
 # Note: make sure the branches in this list are the same as in
-# `.container+build-rules` above.
+# `.build-rules` above.
 .build-only-delayed-rules:
   rules:
     - !reference [.common-rules, rules]
@@ -210,7 +257,7 @@ stages:
       when: delayed
       start_in: &build-delay 5 minutes
     # Same as above, but for pre-merge pipelines
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: manual
     # Build everything after someone bypassed the CI
     - if: *is-direct-push
@@ -237,11 +284,6 @@ stages:
       - _build/meson-logs/strace
 
 
-python-artifacts:
-  variables:
-    GIT_DEPTH: 10
-
-
 # Git archive
 make-git-archive:
   extends:
@@ -273,7 +315,7 @@ sanity:
   tags:
     - $FDO_RUNNER_JOB_PRIORITY_TAG_X86_64
   rules:
-    - if: *is-pre-merge
+    - if: *is-merge-request
       when: on_success
     - when: never
   variables:
@@ -284,7 +326,6 @@ sanity:
     - |
       set -eu
       image_tags=(
-        ALPINE_X86_64_LAVA_SSH_TAG
         CONTAINER_TAG
         DEBIAN_BASE_TAG
         DEBIAN_BUILD_TAG
@@ -347,3 +388,19 @@ linkcheck-docs:
 test-docs:
    rules:
     - when: never
+
+.ci-tron-x86_64-test-vk:
+   rules:
+    - when: never
+
+.ci-tron-x86_64-test-gl-manual:
+   rules:
+    - when: never
+
+.ci-tron-arm64-test-gl:
+   rules:
+    - when: never
+
+.ci-tron-x86_64-test-gl:
+   rules:
+    - when: never
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index b24d4bc53cda..1c01bda52237 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -1,6 +1,8 @@
-#!/bin/sh
+#!/usr/bin/env bash
 # SPDX-License-Identifier: MIT
 
+. "${SCRIPTS_DIR}/setup-test-env.sh"
+
 set -ex
 
 export IGT_FORCE_DRIVER=${DRIVER_NAME}
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7acc2e2a8eaa..1e6bcb166790 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,18 +1,22 @@
 variables:
-   CONTAINER_TAG: "20250502-mesa-uprev"
-   DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
+   CONTAINER_TAG: "20251113-mesa-uprev"
+
+   DEBIAN_BUILD_BASE_TAG: "${CONTAINER_TAG}"
    DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
+   DEBIAN_TEST_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
    # default kernel for rootfs before injecting the current kernel tree
-   KERNEL_TAG: "v6.14-mesa-0bdd"
+   KERNEL_TAG: "v6.16-mesa-9d85"
    KERNEL_REPO: "gfx-ci/linux"
-   PKG_REPO_REV: "95bf62c"
-
-   DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
+   PKG_REPO_REV: "0d2527f6"
+   FIRMWARE_TAG: "36f9bbfa"
+   FIRMWARE_REPO: "gfx-ci/firmware"
 
    ALPINE_X86_64_BUILD_TAG: "${CONTAINER_TAG}"
-   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
 
-   CONDITIONAL_BUILD_ANGLE_TAG: 384145a4023315dae658259bee07c43a
-   CONDITIONAL_BUILD_PIGLIT_TAG: a19e424b8a3f020dbf1b9dd29f220a4f
+   CONDITIONAL_BUILD_ANGLE_TAG: 2388089f6225e4b5542d395cdf23de2f
+   CONDITIONAL_BUILD_CROSVM_TAG: 4079babd375b09761d59eacb25a0598a
+   CONDITIONAL_BUILD_PIGLIT_TAG: 21ab2c66f54777163dd038dc4cfcfde6
+
+   CROSVM_TAG: ${CONDITIONAL_BUILD_CROSVM_TAG}
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index a295102c3468..405055aa9cc4 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -3,27 +3,18 @@
 # shellcheck disable=SC2086 # we want word splitting
 # shellcheck disable=SC1091 # paths only become valid at runtime
 
-# If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
-_check_artifact_path() {
-	_url="https://${1}/${2}"
-	if curl -s -o /dev/null -I -L -f --retry 4 --retry-delay 15 "${_url}"; then
-		echo -n "${_url}"
-	fi
-}
+# shellcheck disable=SC1090
+source "${FDO_CI_BASH_HELPERS}"
 
-get_path_to_artifact() {
-	_mainline_artifact="$(_check_artifact_path ${BASE_SYSTEM_MAINLINE_HOST_PATH} ${1})"
-	if [ -n "${_mainline_artifact}" ]; then
-		echo -n "${_mainline_artifact}"
-		return
-	fi
-	_fork_artifact="$(_check_artifact_path ${BASE_SYSTEM_FORK_HOST_PATH} ${1})"
-	if [ -n "${_fork_artifact}" ]; then
-		echo -n "${_fork_artifact}"
-		return
-	fi
+fdo_log_section_start_collapsed prepare_rootfs "Preparing root filesystem"
+
+set -ex
+
+# If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
+ROOTFS_URL="$(fdo_find_s3_path "$LAVA_ROOTFS_PATH")" ||
+{
 	set +x
-	error "Sorry, I couldn't find a viable built path for ${1} in either mainline or a fork." >&2
+	fdo_log_section_error "Sorry, I couldn't find a viable built path for ${LAVA_ROOTFS_PATH} in either mainline or a fork." >&2
 	echo "" >&2
 	echo "If you're working on CI, this probably means that you're missing a dependency:" >&2
 	echo "this job ran ahead of the job which was supposed to upload that artifact." >&2
@@ -35,38 +26,51 @@ get_path_to_artifact() {
 	exit 1
 }
 
-. "${SCRIPTS_DIR}/setup-test-env.sh"
-
-section_start prepare_rootfs "Preparing root filesystem"
-
-set -ex
-
-ROOTFS_URL="$(get_path_to_artifact lava-rootfs.tar.zst)"
-[ $? != 1 ] || exit 1
-
 rm -rf results
-mkdir -p results/job-rootfs-overlay/
+mkdir results
 
-artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
-    > results/job-rootfs-overlay/set-job-env-vars.sh
-cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
-cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
+fdo_filter_env_vars > dut-env-vars.sh
+# Set SCRIPTS_DIR to point to the Mesa install we download for the DUT
+echo "export SCRIPTS_DIR='$CI_PROJECT_DIR/install'" >> dut-env-vars.sh
 
-tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
+fdo_log_section_end prepare_rootfs
 
 # Prepare env vars for upload.
-section_switch variables "Environment variables passed through to device:"
-cat results/job-rootfs-overlay/set-job-env-vars.sh
+fdo_log_section_start_collapsed variables "Environment variables passed through to device:"
+cat dut-env-vars.sh
+fdo_log_section_end variables
 
-section_switch lava_submit "Submitting job for scheduling"
+fdo_log_section_start_collapsed lava_submit "Submitting job for scheduling"
 
 touch results/lava.log
 tail -f results/lava.log &
 # Ensure that we are printing the commands that are being executed,
 # making it easier to debug the job in case it fails.
 set -x
-PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
+
+# List of optional overlays
+LAVA_EXTRA_OVERLAYS=()
+if [ -n "${LAVA_FIRMWARE:-}" ]; then
+    for fw in $LAVA_FIRMWARE; do
+        LAVA_EXTRA_OVERLAYS+=(
+            - append-overlay
+              --name=linux-firmware
+              --url="https://${S3_BASE_PATH}/${FIRMWARE_REPO}/${fw}-${FIRMWARE_TAG}.tar"
+              --path="/"
+              --format=tar
+        )
+    done
+fi
+LAVA_EXTRA_OVERLAYS+=(
+    - append-overlay \
+      --name=kernel-build \
+      --url="${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
+      --compression=zstd \
+      --path="${CI_PROJECT_DIR}" \
+      --format=tar \
+)
+
+lava-job-submitter \
 	--farm "${FARM}" \
 	--device-type "${DEVICE_TYPE}" \
 	--boot-method "${BOOT_METHOD}" \
@@ -75,9 +79,8 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
 	--rootfs-url "${ROOTFS_URL}" \
 	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}" \
-	--kernel-external "${EXTERNAL_KERNEL_TAG}" \
-	--first-stage-init artifacts/ci-common/init-stage1.sh \
 	--dtb-filename "${DTB}" \
+	--env-file dut-env-vars.sh \
 	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
 	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
@@ -86,20 +89,10 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--mesa-job-name "$CI_JOB_NAME" \
 	--structured-log-file "results/lava_job_detail.json" \
 	--ssh-client-image "${LAVA_SSH_CLIENT_IMAGE}" \
+	--project-dir "${CI_PROJECT_DIR}" \
 	--project-name "${CI_PROJECT_NAME}" \
-	--starting-section "${CURRENT_SECTION}" \
+	--starting-section lava_submit \
 	--job-submitted-at "${CI_JOB_STARTED_AT}" \
-	- append-overlay \
-		--name=kernel-build \
-		--url="${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
-		--compression=zstd \
-		--path="${CI_PROJECT_DIR}" \
-		--format=tar \
-	- append-overlay \
-		--name=job-overlay \
-		--url="https://${JOB_ROOTFS_OVERLAY_PATH}" \
-		--compression=gz \
-		--path="/" \
-		--format=tar \
+	"${LAVA_EXTRA_OVERLAYS[@]}" \
 	- submit \
 	>> results/lava.log
diff --git a/drivers/gpu/drm/ci/static-checks.yml b/drivers/gpu/drm/ci/static-checks.yml
index 13ffa827b7fa..712d3efe99c6 100644
--- a/drivers/gpu/drm/ci/static-checks.yml
+++ b/drivers/gpu/drm/ci/static-checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  stage: static-checks
   extends:
     - .build
     - .use-debian/x86_64_build
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 81147e86bfd0..e56895626500 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -7,13 +7,16 @@
 
 .lava-test:
   extends:
-    - .container+build-rules
+    - .build-rules
     - .allow_failure_lockdep
   timeout: "1h30m"
   rules:
     - !reference [.scheduled_pipeline-rules, rules]
     - !reference [.collabora-farm-rules, rules]
     - when: on_success
+  before_script:
+    #  lava-submit.sh is a part of the archive, unlike Mesa CI
+    - eval "$S3_JWT_FILE_SCRIPT"
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
@@ -32,9 +35,7 @@
   dependencies:
     - testing:arm32
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/arm32_test-gl
-    - python-artifacts
     - testing:arm32
     - igt:arm32
 
@@ -48,9 +49,7 @@
   dependencies:
     - testing:arm64
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/arm64_test-gl
-    - python-artifacts
     - testing:arm64
     - igt:arm64
 
@@ -64,9 +63,7 @@
   dependencies:
     - testing:x86_64
   needs:
-    - alpine/x86_64_lava_ssh_client
     - debian/x86_64_test-gl
-    - python-artifacts
     - testing:x86_64
     - igt:x86_64
 
@@ -110,6 +107,7 @@
     - !reference [default, before_script]
     - rm -rf install
     - tar -xf artifacts/install.tar
+    - mkdir -p /kernel
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /kernel/bzImage
@@ -127,6 +125,7 @@
     DRIVER_NAME: msm
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sc7180-trogdor-lazor-limozeen:
   extends:
@@ -194,11 +193,13 @@ msm:sm8350-hdk:
     KERNEL_IMAGE_NAME: "Image.gz"
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-sm8350-hdk
+    LAVA_FIRMWARE: qcom-lava
 
 .rockchip-device:
   variables:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
+    LAVA_FIRMWARE: arm-lava
 
 .rockchip-display:
   stage: rockchip
@@ -255,6 +256,7 @@ panfrost:rk3399:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: i915
 
 i915:apl:
   extends:
@@ -337,6 +339,7 @@ i915:jsl:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: amdgpu-lava
 
 amdgpu:stoney:
   extends:
@@ -355,6 +358,7 @@ amdgpu:stoney:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: arm-lava
 
 .mediatek-display:
   stage: mediatek
-- 
2.51.0


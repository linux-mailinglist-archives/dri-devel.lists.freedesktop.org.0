Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C20B0A128
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CDA10E963;
	Fri, 18 Jul 2025 10:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="apuazs9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0910E95E;
 Fri, 18 Jul 2025 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752836074;
 bh=sLPbEjxv6Rqn3TT4xZSmzdKVWHgU/AEH1dEV/atOtT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=apuazs9hDUi0kdz8ZV7byqP6QuKu2v4olCQHg4VDzVJOwu6rNn26oTXU9Zr+Og038
 GN8g2/oImXmr7oDVPA0/+EL9aFiScjbWTkrwgNPqAA0gVP3/ht/s7XifbJTZmwZs0f
 LP15c/k0NHTQRnU4C7GV3uQYfeSran4xFY8raF9njmZJVJLFnGIpyNbSudyv40rBKG
 rhy318MYyCq6v8DZHiLl3hzywBx1g/X9bD/W4iZ9tlJn1+56Mla5kMbu2rtnPfMRmY
 Yp1Ma4SHYJ0qxo1FAlUYsM4NRAc2KT6hwDxcjzaiqk7Ct4f8hsdj7PcYmghzNsQdD/
 DHwEpRGF9tsdw==
Received: from debian.. (unknown [171.76.80.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 75DA517E1522;
 Fri, 18 Jul 2025 12:54:31 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] drm/ci: uprev mesa
Date: Fri, 18 Jul 2025 16:23:56 +0530
Message-ID: <20250718105407.32878-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
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
split container and build rules, use of the alpine container for LAVA
jobs, and various misc fixes.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.yml         | 23 +++----
 drivers/gpu/drm/ci/container.yml     | 12 ++--
 drivers/gpu/drm/ci/gitlab-ci.yml     | 92 +++++++++++++++++++++-----
 drivers/gpu/drm/ci/igt_runner.sh     |  4 +-
 drivers/gpu/drm/ci/image-tags.yml    | 14 ++--
 drivers/gpu/drm/ci/lava-submit.sh    | 99 +++++++++++++---------------
 drivers/gpu/drm/ci/static-checks.yml |  1 +
 drivers/gpu/drm/ci/test.yml          | 16 +++--
 8 files changed, 168 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index af27ff5de369..404c41eba1dd 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -1,6 +1,7 @@
 .build:
   extends:
-    - .container+build-rules
+    #- .container-rules
+    - .build-rules
   stage: build-only
   artifacts:
     paths:
@@ -133,6 +134,10 @@ debian-arm32-asan:
   rules:
     - when: never
 
+debian-x86_64-msan:
+  rules:
+    - when: never
+
 debian-arm64:
   rules:
     - when: never
@@ -153,7 +158,7 @@ debian-arm64-ubsan:
   rules:
     - when: never
 
-debian-build-testing:
+debian-build-x86_64:
   rules:
     - when: never
 
@@ -181,27 +186,23 @@ debian-s390x:
   rules:
     - when: never
 
-debian-testing:
-  rules:
-    - when: never
-
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
index 5f90508578a3..78556ebe3915 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -15,11 +15,11 @@ debian/arm64_build:
   variables:
     EXTRA_LOCAL_PACKAGES: "libcairo-dev libdw-dev libjson-c-dev libproc2-dev libkmod2 libkmod-dev libpciaccess-dev libudev-dev libunwind-dev python3-docutils libssl-dev crossbuild-essential-armhf libkmod-dev:armhf libproc2-dev:armhf libunwind-dev:armhf libdw-dev:armhf libpixman-1-dev:armhf libcairo-dev:armhf libudev-dev:armhf libjson-c-dev:armhf"
 
-.kernel+rootfs:
-  variables:
-    EXTRA_LOCAL_PACKAGES: "jq libasound2 libcairo2 libdw1 libglib2.0-0 libjson-c5"
-
 # Disable container jobs that we won't use
+alpine/x86_64_build:
+  rules:
+    - when: never
+
 debian/arm64_test-vk:
   rules:
     - when: never
@@ -28,6 +28,10 @@ debian/baremetal_arm32_test-gl:
   rules:
     - when: never
 
+debian/baremetal_arm64_test-gl:
+  rules:
+    - when: never
+
 debian/baremetal_arm64_test-vk:
   rules:
     - when: never
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d502d146b177..2787d096d4b0 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 02337aec715c25dae7ff2479d986f831c77fe536
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha d31cb824df23d374a275f2d89639f8aba5d51583
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
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
@@ -347,3 +389,19 @@ linkcheck-docs:
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
index 7acc2e2a8eaa..baecf1206a27 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,18 +1,24 @@
 variables:
-   CONTAINER_TAG: "20250502-mesa-uprev"
+   CONTAINER_TAG: "20250707-mesa-uprev"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
    DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
    # default kernel for rootfs before injecting the current kernel tree
-   KERNEL_TAG: "v6.14-mesa-0bdd"
+   KERNEL_TAG: "v6.14-mesa-4277"
    KERNEL_REPO: "gfx-ci/linux"
    PKG_REPO_REV: "95bf62c"
+   FIRMWARE_TAG: "36f9bbfa"
+   FIRMWARE_REPO: "gfx-ci/firmware"
 
    DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
 
    ALPINE_X86_64_BUILD_TAG: "${CONTAINER_TAG}"
    ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
+   ALPINE_X86_64_LAVA_TRIGGER_TAG: "${CONTAINER_TAG}"
 
-   CONDITIONAL_BUILD_ANGLE_TAG: 384145a4023315dae658259bee07c43a
-   CONDITIONAL_BUILD_PIGLIT_TAG: a19e424b8a3f020dbf1b9dd29f220a4f
+   CONDITIONAL_BUILD_ANGLE_TAG: f62910e55be46e37cc867d037e4a8121
+   CONDITIONAL_BUILD_CROSVM_TAG: 0f59350b1052bdbb28b65a832b494377
+   CONDITIONAL_BUILD_PIGLIT_TAG: 827b708ab7309721395ea28cec512968
+
+   CROSVM_TAG: ${CONDITIONAL_BUILD_CROSVM_TAG}
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index a295102c3468..447b40b75862 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -3,27 +3,22 @@
 # shellcheck disable=SC2086 # we want word splitting
 # shellcheck disable=SC1091 # paths only become valid at runtime
 
-# If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
-_check_artifact_path() {
-	_url="https://${1}/${2}"
-	if curl -s -o /dev/null -I -L -f --retry 4 --retry-delay 15 "${_url}"; then
-		echo -n "${_url}"
-	fi
-}
+# When changing this file, you need to bump the following
+# .gitlab-ci/image-tags.yml tags:
+# ALPINE_X86_64_LAVA_TRIGGER_TAG
+
+. "${SCRIPTS_DIR}/setup-test-env.sh"
+
+section_start prepare_rootfs "Preparing root filesystem"
+
+set -ex
 
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
+# If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
+ROOTFS_URL="$(find_s3_project_artifact "$LAVA_ROOTFS_PATH")" ||
+{
 	set +x
-	error "Sorry, I couldn't find a viable built path for ${1} in either mainline or a fork." >&2
+	error "Sorry, I couldn't find a viable built path for ${LAVA_ROOTFS_PATH} \
+		in either mainline or a fork." >&2
 	echo "" >&2
 	echo "If you're working on CI, this probably means that you're missing a dependency:" >&2
 	echo "this job ran ahead of the job which was supposed to upload that artifact." >&2
@@ -35,29 +30,16 @@ get_path_to_artifact() {
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
-
-artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
-    > results/job-rootfs-overlay/set-job-env-vars.sh
-cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
-cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
+mkdir results
 
-tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
+filter_env_vars > dut-env-vars.sh
+# Set SCRIPTS_DIR to point to the Mesa install we download for the DUT
+echo "export SCRIPTS_DIR='$CI_PROJECT_DIR/install'" >> dut-env-vars.sh
 
 # Prepare env vars for upload.
 section_switch variables "Environment variables passed through to device:"
-cat results/job-rootfs-overlay/set-job-env-vars.sh
+cat dut-env-vars.sh
 
 section_switch lava_submit "Submitting job for scheduling"
 
@@ -66,7 +48,30 @@ tail -f results/lava.log &
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
+PYTHONPATH=/ /lava/lava_job_submitter.py \
 	--farm "${FARM}" \
 	--device-type "${DEVICE_TYPE}" \
 	--boot-method "${BOOT_METHOD}" \
@@ -75,9 +80,9 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
 	--rootfs-url "${ROOTFS_URL}" \
 	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}" \
-	--kernel-external "${EXTERNAL_KERNEL_TAG}" \
-	--first-stage-init artifacts/ci-common/init-stage1.sh \
 	--dtb-filename "${DTB}" \
+	--first-stage-init /lava/init-stage1.sh \
+	--env-file dut-env-vars.sh \
 	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
 	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
@@ -86,20 +91,10 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--mesa-job-name "$CI_JOB_NAME" \
 	--structured-log-file "results/lava_job_detail.json" \
 	--ssh-client-image "${LAVA_SSH_CLIENT_IMAGE}" \
+	--project-dir "${CI_PROJECT_DIR}" \
 	--project-name "${CI_PROJECT_NAME}" \
 	--starting-section "${CURRENT_SECTION}" \
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
index a6539908a665..64b682f8ecd8 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -7,7 +7,8 @@
 
 .lava-test:
   extends:
-    - .container+build-rules
+    #- .container-rules
+    #- .build-rules
     - .allow_failure_lockdep
   timeout: "1h30m"
   rules:
@@ -33,8 +34,8 @@
     - testing:arm32
   needs:
     - alpine/x86_64_lava_ssh_client
+    - alpine/x86_64_lava-trigger
     - debian/arm32_test-gl
-    - python-artifacts
     - testing:arm32
     - igt:arm32
 
@@ -49,8 +50,8 @@
     - testing:arm64
   needs:
     - alpine/x86_64_lava_ssh_client
+    - alpine/x86_64_lava-trigger
     - debian/arm64_test-gl
-    - python-artifacts
     - testing:arm64
     - igt:arm64
 
@@ -65,8 +66,8 @@
     - testing:x86_64
   needs:
     - alpine/x86_64_lava_ssh_client
+    - alpine/x86_64_lava-trigger
     - debian/x86_64_test-gl
-    - python-artifacts
     - testing:x86_64
     - igt:x86_64
 
@@ -110,6 +111,7 @@
     - !reference [default, before_script]
     - rm -rf install
     - tar -xf artifacts/install.tar
+    - mkdir -p /kernel
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /kernel/bzImage
@@ -127,6 +129,7 @@
     DRIVER_NAME: msm
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: qcom-lava
 
 msm:sc7180-trogdor-lazor-limozeen:
   extends:
@@ -196,11 +199,13 @@ msm:sm8350-hdk:
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
@@ -257,6 +262,7 @@ panfrost:rk3399:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: i915
 
 i915:apl:
   extends:
@@ -339,6 +345,7 @@ i915:jsl:
     DTB: ""
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: amdgpu-lava
 
 amdgpu:stoney:
   extends:
@@ -357,6 +364,7 @@ amdgpu:stoney:
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
+    LAVA_FIRMWARE: arm-lava
 
 .mediatek-display:
   stage: mediatek
-- 
2.47.2


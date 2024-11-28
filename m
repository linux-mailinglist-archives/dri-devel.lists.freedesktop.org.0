Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E69DB218
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 05:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80410EC17;
	Thu, 28 Nov 2024 04:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b/lgV6MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB9210EC17
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 04:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732767683;
 bh=G6TXmTgpMtvHDeLlWiTUCjx7MVVOvVIaXSjRtF6rYMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b/lgV6MISkx67fFGUa646dkF1spyTd7e0PpY91myhBdQ9mdqNh+LGhtDPkrsffgoI
 M5ry1Ar2oV8/X/+Rr3xudihv1qgN4zH5i8ghXJxkOChU3qAVGaeD4B/j8QWkycxsGO
 qP+djUm2qrDXXgkCzZLep/tbXXyhJ02w4paRR+0b5gUc2NI7w6yHLC/uF+9tjQMtxc
 tBrU5pTOS2KTZj8EthT4eowYzKoi5DhxubOGT9ZLksmRbbxALwThfz94m8UYRpeybH
 yL288lWzze1ivV+WyJjyYiYu5dKnXxj6WTkWvB9O0N/8AQtwZgOSSbrw53SqqdU+7E
 7dZEqfZGCPPOA==
Received: from localhost.localdomain (unknown [171.76.86.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DFE6817E0FC8;
 Thu, 28 Nov 2024 05:21:20 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, jani.nikula@linux.intel.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] drm/ci: uprev mesa
Date: Thu, 28 Nov 2024 09:50:20 +0530
Message-ID: <20241128042025.611659-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241128042025.611659-1-vignesh.raman@collabora.com>
References: <20241128042025.611659-1-vignesh.raman@collabora.com>
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

Uprev mesa to adapt to the latest changes in mesa ci
which includes new container jobs and stages. Also update
lava-submit script to adapt to the recent changes in mesa
to use LAVA rootfs overlays.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh       |   2 +-
 drivers/gpu/drm/ci/build.yml      | 103 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/ci/container.yml  |  22 +++----
 drivers/gpu/drm/ci/gitlab-ci.yml  |  71 ++++++++++++++------
 drivers/gpu/drm/ci/image-tags.yml |  11 +++-
 drivers/gpu/drm/ci/lava-submit.sh |  99 ++++++++++++++++++++--------
 drivers/gpu/drm/ci/test.yml       |  13 ++--
 7 files changed, 255 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 139b81db6312..19fe01257ab9 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -132,7 +132,7 @@ fi
 # Pass needed files to the test stage
 mkdir -p install
 cp -rfv .gitlab-ci/* install/.
-cp -rfv ci/*  install/.
+cp -rfv bin/ci/*  install/.
 cp -rfv install/common install/ci-common
 cp -rfv drivers/gpu/drm/ci/* install/.
 
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 9c198239033d..771ecfc5008d 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -2,7 +2,7 @@
   extends:
     - .build-rules
     - .container+build-rules
-  stage: build
+  stage: build-only
   artifacts:
     paths:
       - artifacts
@@ -110,3 +110,104 @@ build-nodebugfs:arm64:
 
 build:x86_64:
   extends: .build:x86_64
+
+# Disable build jobs that we won't use
+alpine-build-testing:
+  rules:
+    - when: never
+
+debian-android:
+  rules:
+    - when: never
+
+debian-arm32:
+  rules:
+    - when: never
+
+debian-arm32-asan:
+  rules:
+    - when: never
+
+debian-arm64:
+  rules:
+    - when: never
+
+debian-arm64-asan:
+  rules:
+    - when: never
+
+debian-arm64-build-test:
+  rules:
+    - when: never
+
+debian-arm64-release:
+  rules:
+    - when: never
+
+debian-build-testing:
+  rules:
+    - when: never
+
+debian-clang:
+  rules:
+    - when: never
+
+debian-clang-release:
+  rules:
+    - when: never
+
+debian-no-libdrm:
+  rules:
+    - when: never
+
+debian-ppc64el:
+  rules:
+    - when: never
+
+debian-release:
+  rules:
+    - when: never
+
+debian-s390x:
+  rules:
+    - when: never
+
+debian-testing:
+  rules:
+    - when: never
+
+debian-testing-asan:
+  rules:
+    - when: never
+
+debian-testing-msan:
+  rules:
+    - when: never
+
+debian-vulkan:
+  rules:
+    - when: never
+
+debian-x86_32:
+  rules:
+    - when: never
+
+fedora-release:
+  rules:
+    - when: never
+
+rustfmt:
+  rules:
+    - when: never
+
+shader-db:
+  rules:
+    - when: never
+
+windows-msvc:
+  rules:
+    - when: never
+
+yaml-toml-shell-test:
+  rules:
+    - when: never
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 2a94f54ce4cf..07dc13ff865d 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -24,7 +24,7 @@ alpine/x86_64_build:
   rules:
     - when: never
 
-debian/x86_64_test-vk:
+debian/arm64_test-gl:
   rules:
     - when: never
 
@@ -32,7 +32,15 @@ debian/arm64_test-vk:
   rules:
     - when: never
 
-debian/arm64_test-gl:
+debian/ppc64el_build:
+  rules:
+    - when: never
+
+debian/s390x_build:
+  rules:
+    - when: never
+
+debian/x86_64_test-vk:
   rules:
     - when: never
 
@@ -56,14 +64,6 @@ windows_test_msvc:
   rules:
     - when: never
 
-.debian/x86_64_build-mingw:
-   rules:
-    - when: never
-
-rustfmt:
-   rules:
-    - when: never
-
 windows_msvc:
    rules:
-    - when: never
\ No newline at end of file
+    - when: never
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 90bde9f00cc3..86d8c5d8ce3b 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha c6a9a9c3bce90923f7700219354e0b6e5a3c9ba6
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e1a8fd80d411a5ff8fa19ffcf09516ac5099a25c
 
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
@@ -31,11 +31,7 @@ variables:
   PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/${S3_ARTIFACTS_BUCKET}/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
   # per-job artifact storage on MinIO
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
-  # default kernel for rootfs before injecting the current kernel tree
-  KERNEL_REPO: "gfx-ci/linux"
-  KERNEL_TAG: "v6.6.21-mesa-f8ea"
   KERNEL_IMAGE_BASE: https://${S3_HOST}/${S3_KERNEL_BUCKET}/${KERNEL_REPO}/${KERNEL_TAG}
-  PKG_REPO_REV: "3cc12a2a"
   LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
@@ -59,7 +55,7 @@ default:
     - cd $CI_PROJECT_DIR
     - curl --output - $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/mesa-$DRM_CI_COMMIT_SHA.tar.gz | tar -xz
     - mv mesa-$DRM_CI_COMMIT_SHA/.gitlab-ci* .
-    - mv mesa-$DRM_CI_COMMIT_SHA/bin/ci .
+    - mv mesa-$DRM_CI_COMMIT_SHA/bin .
     - rm -rf mesa-$DRM_CI_COMMIT_SHA/
     - echo -e "\e[0Ksection_end:$(date +%s):drm_ci_download_section\r\e[0K"
 
@@ -85,6 +81,7 @@ include:
   - project: *drm-ci-project-path
     ref: *drm-ci-commit-sha
     file:
+      - '/.gitlab-ci/build/gitlab-ci.yml'
       - '/.gitlab-ci/container/gitlab-ci.yml'
       - '/.gitlab-ci/farm-rules.yml'
       - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
@@ -115,9 +112,10 @@ include:
 stages:
   - sanity
   - container
-  - code-validation
   - git-archive
-  - build
+  - build-for-tests
+  - build-only
+  - code-validation
   - amdgpu
   - i915
   - mediatek
@@ -264,30 +262,63 @@ sanity:
   rules:
     - if: *is-pre-merge
       when: on_success
-    # Other cases default to never
+    - when: never
   variables:
     GIT_STRATEGY: none
   script:
     # ci-fairy check-commits --junit-xml=check-commits.xml
     - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
+    - |
+      set -eu
+      image_tags=(
+        ALPINE_X86_64_LAVA_SSH_TAG
+        CONTAINER_TAG
+        DEBIAN_BASE_TAG
+        DEBIAN_BUILD_TAG
+        DEBIAN_PYUTILS_TAG
+        DEBIAN_TEST_GL_TAG
+        KERNEL_ROOTFS_TAG
+        KERNEL_TAG
+        PKG_REPO_REV
+      )
+      for var in "${image_tags[@]}"
+      do
+        if [ "$(echo -n "${!var}" | wc -c)" -gt 20 ]
+        then
+          echo "$var is too long; please make sure it is at most 20 chars."
+          exit 1
+        fi
+      done
   artifacts:
     when: on_failure
     reports:
       junit: check-*.xml
+  tags:
+    - placeholder-job
 
-# Rules for tests that should not block merging, but should be available to
-# optionally run with the "play" button in the UI in pre-merge non-marge
-# pipelines.  This should appear in "extends:" after any includes of
-# test-source-dep.yml rules, so that these rules replace those.
-.test-manual-mr:
+
+mr-label-maker-test:
+  extends:
+    - .fdo.ci-fairy
+  stage: sanity
   rules:
-    - !reference [.no_scheduled_pipelines-rules, rules]
-    - if: *is-forked-branch-or-pre-merge-not-for-marge
-      when: manual
+    - !reference [.mr-label-maker-rules, rules]
   variables:
-    JOB_TIMEOUT: 80
-
+    GIT_STRATEGY: fetch
+  timeout: 10m
+  script:
+    - set -eu
+    - python3 -m venv .venv
+    - source .venv/bin/activate
+    - pip install git+https://gitlab.freedesktop.org/freedesktop/mr-label-maker
+    - mr-label-maker --dry-run --mr $CI_MERGE_REQUEST_IID
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
+  needs:
+    - job: clang-format
+      optional: true
+    - job: rustfmt
+      optional: true
+    - job: toml-lint
+      optional: true
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 8d8b9e71852e..528ef44285bb 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2024-09-09-uprevs"
+   CONTAINER_TAG: "20241127-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
@@ -7,9 +7,16 @@ variables:
    DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
 
    KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
+   # default kernel for rootfs before injecting the current kernel tree
+   KERNEL_TAG: "v6.6.21-mesa-f8ea"
+   KERNEL_REPO: "gfx-ci/linux"
+   PKG_REPO_REV: "bca9635d"
 
    DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
    DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
    DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"
 
-   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
\ No newline at end of file
+   DEBIAN_PYUTILS_IMAGE: "debian/x86_64_pyutils"
+   DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
+
+   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index 6add15083c78..a1404a2d8cee 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -1,58 +1,105 @@
-#!/bin/bash
+#!/usr/bin/env bash
 # SPDX-License-Identifier: MIT
+# shellcheck disable=SC2086 # we want word splitting
+# shellcheck disable=SC1091 # paths only become valid at runtime
 
-set -e
-set -x
+# If we run in the fork (not from mesa or Marge-bot), reuse mainline kernel and rootfs, if exist.
+_check_artifact_path() {
+	_url="https://${1}/${2}"
+	if curl -s -o /dev/null -I -L -f --retry 4 --retry-delay 15 "${_url}"; then
+		echo -n "${_url}"
+	fi
+}
 
-# Try to use the kernel and rootfs built in mainline first, so we're more
-# likely to hit cache
-if curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s "https://${BASE_SYSTEM_MAINLINE_HOST_PATH}/done"; then
-	BASE_SYSTEM_HOST_PATH="${BASE_SYSTEM_MAINLINE_HOST_PATH}"
-else
-	BASE_SYSTEM_HOST_PATH="${BASE_SYSTEM_FORK_HOST_PATH}"
-fi
+get_path_to_artifact() {
+	_mainline_artifact="$(_check_artifact_path ${BASE_SYSTEM_MAINLINE_HOST_PATH} ${1})"
+	if [ -n "${_mainline_artifact}" ]; then
+		echo -n "${_mainline_artifact}"
+		return
+	fi
+	_fork_artifact="$(_check_artifact_path ${BASE_SYSTEM_FORK_HOST_PATH} ${1})"
+	if [ -n "${_fork_artifact}" ]; then
+		echo -n "${_fork_artifact}"
+		return
+	fi
+	set +x
+	error "Sorry, I couldn't find a viable built path for ${1} in either mainline or a fork." >&2
+	echo "" >&2
+	echo "If you're working on CI, this probably means that you're missing a dependency:" >&2
+	echo "this job ran ahead of the job which was supposed to upload that artifact." >&2
+	echo "" >&2
+	echo "If you aren't working on CI, please ping @mesa/ci-helpers to see if we can help." >&2
+	echo "" >&2
+	echo "This job is going to fail, because I can't find the resources I need. Sorry." >&2
+	set -x
+	exit 1
+}
+
+. "${SCRIPTS_DIR}/setup-test-env.sh"
+
+section_start prepare_rootfs "Preparing root filesystem"
+
+set -ex
+
+section_switch rootfs "Assembling root filesystem"
+ROOTFS_URL="$(get_path_to_artifact lava-rootfs.tar.zst)"
+[ $? != 1 ] || exit 1
 
 rm -rf results
 mkdir -p results/job-rootfs-overlay/
 
+artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-job-env-vars.sh
 cp artifacts/ci-common/capture-devcoredump.sh results/job-rootfs-overlay/
 cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
 cp artifacts/ci-common/intel-gpu-freq.sh results/job-rootfs-overlay/
+cp artifacts/ci-common/kdl.sh results/job-rootfs-overlay/
 cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
 
-# Prepare env vars for upload.
-section_start variables "Variables passed through:"
-KERNEL_IMAGE_BASE="https://${BASE_SYSTEM_HOST_PATH}" \
-	artifacts/ci-common/generate-env.sh | tee results/job-rootfs-overlay/set-job-env-vars.sh
-section_end variables
-
 tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
 ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
 
+# Prepare env vars for upload.
+section_switch variables "Environment variables passed through to device:"
+cat results/job-rootfs-overlay/set-job-env-vars.sh
+
+section_switch lava_submit "Submitting job for scheduling"
+
 touch results/lava.log
 tail -f results/lava.log &
-
 PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
-	submit \
+	--farm "${FARM}" \
+	--device-type "${DEVICE_TYPE}" \
+	--boot-method "${BOOT_METHOD}" \
+	--job-timeout-min ${JOB_TIMEOUT:-30} \
 	--dump-yaml \
 	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
-	--rootfs-url-prefix "https://${BASE_SYSTEM_HOST_PATH}" \
+	--rootfs-url "${ROOTFS_URL}" \
 	--kernel-url-prefix "https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}" \
-	--build-url "${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
-	--job-rootfs-overlay-url "${FDO_HTTP_CACHE_URI:-}https://${JOB_ROOTFS_OVERLAY_PATH}" \
-	--job-timeout-min ${JOB_TIMEOUT:-80} \
+	--kernel-external "${EXTERNAL_KERNEL_TAG}" \
 	--first-stage-init artifacts/ci-common/init-stage1.sh \
-	--ci-project-dir "${CI_PROJECT_DIR}" \
-	--device-type "${DEVICE_TYPE}" \
-	--farm "${FARM}" \
 	--dtb-filename "${DTB}" \
 	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
 	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
-	--boot-method "${BOOT_METHOD}" \
 	--visibility-group "${VISIBILITY_GROUP}" \
 	--lava-tags "${LAVA_TAGS}" \
 	--mesa-job-name "$CI_JOB_NAME" \
 	--structured-log-file "results/lava_job_detail.json" \
 	--ssh-client-image "${LAVA_SSH_CLIENT_IMAGE}" \
+	--project-name "${CI_PROJECT_NAME}" \
+	--starting-section "${CURRENT_SECTION}" \
+	--job-submitted-at "${CI_JOB_STARTED_AT}" \
+	- append-overlay \
+		--name=kernel-build \
+		--url="${FDO_HTTP_CACHE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \
+		--compression=zstd \
+		--path="${CI_PROJECT_DIR}" \
+		--format=tar \
+	- append-overlay \
+		--name=job-overlay \
+		--url="https://${JOB_ROOTFS_OVERLAY_PATH}" \
+		--compression=gz \
+		--path="/" \
+		--format=tar \
+	- submit \
 	>> results/lava.log
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f0ef60c8f56d..42a8e7f93714 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -1,21 +1,21 @@
 .test-rules:
   rules:
-    - if: '$FD_FARM == "offline" && $RUNNER_TAG =~ /^google-freedreno-/'
-      when: never
-    - if: '$COLLABORA_FARM == "offline" && $RUNNER_TAG =~ /^mesa-ci-x86-64-lava-/'
-      when: never
     - !reference [.no_scheduled_pipelines-rules, rules]
+    - !reference [.collabora-farm-rules, rules]
+    - !reference [.google-freedreno-farm-rules, rules]
     - when: on_success
 
 .lava-test:
   extends:
     - .test-rules
+    - .build-rules
+    - .container+build-rules
   timeout: "1h30m"
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
     - tar -xf artifacts/install.tar
-    - mv install/* artifacts/.
+    - mv -n install/* artifacts/.
     # Override it with our lava-submit.sh script
     - ./artifacts/lava-submit.sh
 
@@ -32,6 +32,7 @@
     - alpine/x86_64_lava_ssh_client
     - kernel+rootfs_arm32
     - debian/x86_64_build
+    - python-test
     - testing:arm32
     - igt:arm32
 
@@ -48,6 +49,7 @@
     - alpine/x86_64_lava_ssh_client
     - kernel+rootfs_arm64
     - debian/x86_64_build
+    - python-test
     - testing:arm64
     - igt:arm64
 
@@ -64,6 +66,7 @@
     - alpine/x86_64_lava_ssh_client
     - kernel+rootfs_x86_64
     - debian/x86_64_build
+    - python-test
     - testing:x86_64
     - igt:x86_64
 
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F28C8340
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 11:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CBE10EE47;
	Fri, 17 May 2024 09:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="sQ5XcRz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0385E10EE40;
 Fri, 17 May 2024 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715937918;
 bh=MdYoRjtS0dvo0II0EV46gZ94pzZMmbG9YNokbbyJ1+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sQ5XcRz7sKKQ098eVXAmfjbXDZJZvatrov0QSfsi6SoAc3IyRxg+S7EmxwxpwxrVV
 Dvq+U1JirdXyjxIBQv6uI1o3LnLJ7fYzAhmAw/6jD3sVAMJsKS0OUuaG6iu0T7FGiE
 hPn8z05wD2asiGH/9DmmpSwgihxaPCM0yX32cj5iNH6zA0vTV5fbtdAHgYoQGJMhXw
 h9IaMZhyX9xRfrxst+D7hDv4S37DaPEJVHQz/pobDR4Sz7U4+z707PoStQGCGMYRD8
 V6MxUr5qSG8/AjT/JQfCZKE6kUaPQ3e/cIXz655SZZYMrQZF72cKAPT6p++Suc+FO0
 cdcXWLvb1EPPA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D63D337821BF;
 Fri, 17 May 2024 09:25:14 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] drm/ci: uprev mesa version
Date: Fri, 17 May 2024 14:54:57 +0530
Message-Id: <20240517092502.647420-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240517092502.647420-1-vignesh.raman@collabora.com>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
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

zlib.net is not allowing tarball download anymore and results
in below error in kernel+rootfs_arm32 container build,
urllib.error.HTTPError: HTTP Error 403: Forbidden
urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type

Uprev mesa to latest version which includes a fix for this issue.
https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e

Use id_tokens for JWT authentication. Since s3 bucket is migrated to
mesa-rootfs, update the variables accordingly. Also copy helper scripts
to install, so that the ci jobs can use these scripts for logging.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Uprev to recent version and use id_tokens for JWT authentication

---
 drivers/gpu/drm/ci/build-igt.sh   |  2 +-
 drivers/gpu/drm/ci/build.sh       |  6 +++--
 drivers/gpu/drm/ci/container.yml  | 12 +++------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
 drivers/gpu/drm/ci/image-tags.yml |  2 +-
 drivers/gpu/drm/ci/lava-submit.sh |  4 +--
 drivers/gpu/drm/ci/test.yml       |  2 ++
 7 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index 500fa4f5c30a..7859554756c4 100644
--- a/drivers/gpu/drm/ci/build-igt.sh
+++ b/drivers/gpu/drm/ci/build-igt.sh
@@ -32,4 +32,4 @@ tar -cf artifacts/igt.tar /igt
 # Pass needed files to the test stage
 S3_ARTIFACT_NAME="igt.tar.gz"
 gzip -c artifacts/igt.tar > ${S3_ARTIFACT_NAME}
-ci-fairy s3cp --token-file "${CI_JOB_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/${S3_ARTIFACT_NAME}
+ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${KERNEL_ARCH}/${S3_ARTIFACT_NAME}
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 106f2d40d222..a67871fdcd3f 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -128,6 +128,7 @@ fi
 # Pass needed files to the test stage
 mkdir -p install
 cp -rfv .gitlab-ci/* install/.
+cp -rfv ci/*  install/.
 cp -rfv install/common install/ci-common
 cp -rfv drivers/gpu/drm/ci/* install/.
 
@@ -141,14 +142,15 @@ if [[ "$UPLOAD_TO_MINIO" = "1" ]]; then
         FILES_TO_UPLOAD="$FILES_TO_UPLOAD $(basename -a $DEVICE_TREES)"
     fi
 
+    ls -l "${S3_JWT_FILE}"
     for f in $FILES_TO_UPLOAD; do
-        ci-fairy s3cp --token-file "${CI_JOB_JWT_FILE}" /lava-files/$f \
+        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /lava-files/$f \
                 https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
     done
 
     S3_ARTIFACT_NAME="kernel-files.tar.zst"
     tar --zstd -cf $S3_ARTIFACT_NAME install
-    ci-fairy s3cp --token-file "${CI_JOB_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/${S3_ARTIFACT_NAME}
+    ci-fairy s3cp --token-file "${S3_JWT_FILE}" ${S3_ARTIFACT_NAME} https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/${S3_ARTIFACT_NAME}
 
     echo "Download vmlinux.xz from https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/vmlinux.xz"
 fi
diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
index 9764e7921a4f..d6edf3635b23 100644
--- a/drivers/gpu/drm/ci/container.yml
+++ b/drivers/gpu/drm/ci/container.yml
@@ -36,15 +36,15 @@ debian/android_build:
   rules:
     - when: never
 
-debian/x86_64_test-android:
+.debian/x86_64_test-android:
   rules:
     - when: never
 
-windows_build_vs2019:
+windows_build_msvc:
   rules:
     - when: never
 
-windows_test_vs2019:
+windows_test_msvc:
   rules:
     - when: never
 
@@ -56,10 +56,6 @@ rustfmt:
    rules:
     - when: never
 
-windows_vs2019:
-   rules:
-    - when: never
-
-clang-format:
+windows_msvc:
    rules:
     - when: never
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 084e3ff8e3f4..8f32de63d92e 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 9d162de9a05155e1c4041857a5848842749164cf
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e2b9c5a9e3e4f9b532067af8022eaef8d6fc6c00
 
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
@@ -19,33 +19,47 @@ variables:
           bash download-git-cache.sh
           rm download-git-cache.sh
           set +o xtrace
+  S3_JWT_FILE: /s3_jwt
   S3_HOST: s3.freedesktop.org
+  # This bucket is used to fetch the kernel image
+  S3_KERNEL_BUCKET: mesa-rootfs
+  # Bucket for git cache
+  S3_GITCACHE_BUCKET: git-cache
+  # Bucket for the pipeline artifacts pushed to S3
+  S3_ARTIFACTS_BUCKET: artifacts
   # per-pipeline artifact storage on MinIO
-  PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
+  PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/${S3_ARTIFACTS_BUCKET}/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
   # per-job artifact storage on MinIO
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   # default kernel for rootfs before injecting the current kernel tree
   KERNEL_REPO: "gfx-ci/linux"
-  KERNEL_TAG: "v6.6.4-for-mesa-ci-e4f4c500f7fb"
-  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/${KERNEL_REPO}/${KERNEL_TAG}
+  KERNEL_TAG: "v6.6.21-mesa-f8ea"
+  KERNEL_IMAGE_BASE: https://${S3_HOST}/${S3_KERNEL_BUCKET}/${KERNEL_REPO}/${KERNEL_TAG}
+  PKG_REPO_REV: "3cc12a2a"
   LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
+  ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
+  # Python scripts for structured logger
+  PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
 
 default:
+  id_tokens:
+    S3_JWT:
+      aud: https://s3.freedesktop.org
   before_script:
     - export SCRIPTS_DIR=$(mktemp -d)
     - curl -L -s --retry 4 -f --retry-all-errors --retry-delay 60 -O --output-dir "${SCRIPTS_DIR}" "${DRM_CI_PROJECT_URL}/-/raw/${DRM_CI_COMMIT_SHA}/.gitlab-ci/setup-test-env.sh"
     - source ${SCRIPTS_DIR}/setup-test-env.sh
     - echo -e "\e[0Ksection_start:$(date +%s):unset_env_vars_section[collapsed=true]\r\e[0KUnsetting vulnerable environment variables"
-    - export CI_JOB_JWT_FILE="${CI_JOB_JWT_FILE:-$(mktemp)}"
-    - echo -n "${CI_JOB_JWT}" > "${CI_JOB_JWT_FILE}"
-    - unset CI_JOB_JWT
+    - echo -n "${S3_JWT}" > "${S3_JWT_FILE}"
+    - unset CI_JOB_JWT S3_JWT
     - echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
 
     - echo -e "\e[0Ksection_start:$(date +%s):drm_ci_download_section[collapsed=true]\r\e[0KDownloading mesa from $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/mesa-$DRM_CI_COMMIT_SHA.tar.gz"
     - cd $CI_PROJECT_DIR
     - curl --output - $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/mesa-$DRM_CI_COMMIT_SHA.tar.gz | tar -xz
     - mv mesa-$DRM_CI_COMMIT_SHA/.gitlab-ci* .
+    - mv mesa-$DRM_CI_COMMIT_SHA/bin/ci .
     - rm -rf mesa-$DRM_CI_COMMIT_SHA/
     - echo -e "\e[0Ksection_end:$(date +%s):drm_ci_download_section\r\e[0K"
 
@@ -53,9 +67,9 @@ default:
     - >
       set +x
 
-      test -e "${CI_JOB_JWT_FILE}" &&
-      export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
-      rm "${CI_JOB_JWT_FILE}"
+      test -e "${S3_JWT_FILE}" &&
+      export S3_JWT="$(<${S3_JWT_FILE})" &&
+      rm "${S3_JWT_FILE}"
 
 include:
   - project: 'freedesktop/ci-templates'
@@ -87,6 +101,7 @@ include:
       - '/src/intel/ci/gitlab-ci-inc.yml'
       - '/src/freedreno/ci/gitlab-ci-inc.yml'
       - '/src/amd/ci/gitlab-ci-inc.yml'
+      - '/src/virtio/ci/gitlab-ci-inc.yml'
   - drivers/gpu/drm/ci/image-tags.yml
   - drivers/gpu/drm/ci/container.yml
   - drivers/gpu/drm/ci/static-checks.yml
@@ -98,6 +113,7 @@ include:
 stages:
   - sanity
   - container
+  - code-validation
   - git-archive
   - build
   - amdgpu
@@ -107,7 +123,6 @@ stages:
   - msm
   - rockchip
   - virtio-gpu
-  - lint
 
 # YAML anchors for rule conditions
 # --------------------------------
@@ -218,14 +233,15 @@ make git archive:
   script:
     # Remove drm-ci files we just added
     - rm -rf .gitlab-ci.*
+    - rm -rf ci
 
     # Compactify the .git directory
     - git gc --aggressive
     # compress the current folder
     - tar -cvzf ../$CI_PROJECT_NAME.tar.gz .
 
-    # login with the JWT token file
-    - ci-fairy s3cp --token-file "${CI_JOB_JWT_FILE}" ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/git-cache/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/$CI_PROJECT_NAME.tar.gz
+    # Use id_tokens for JWT auth
+    - ci-fairy s3cp --token-file "${S3_JWT_FILE}" ../$CI_PROJECT_NAME.tar.gz https://$S3_HOST/${S3_GITCACHE_BUCKET}/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/$CI_PROJECT_NAME.tar.gz
 
 
 # Sanity checks of MR settings and commit logs
@@ -262,4 +278,4 @@ sanity:
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
\ No newline at end of file
+  needs: []
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7ab4f2514da8..60323ebc7304 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -1,5 +1,5 @@
 variables:
-   CONTAINER_TAG: "2023-10-11-mesa-uprev"
+   CONTAINER_TAG: "2024-05-09-mesa-uprev"
    DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
index 3d39b0c916a8..0707fa706a48 100755
--- a/drivers/gpu/drm/ci/lava-submit.sh
+++ b/drivers/gpu/drm/ci/lava-submit.sh
@@ -27,7 +27,7 @@ KERNEL_IMAGE_BASE="https://${BASE_SYSTEM_HOST_PATH}" \
 section_end variables
 
 tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
-ci-fairy s3cp --token-file "${CI_JOB_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
+ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "https://${JOB_ROOTFS_OVERLAY_PATH}"
 
 touch results/lava.log
 tail -f results/lava.log &
@@ -45,7 +45,7 @@ PYTHONPATH=artifacts/ artifacts/lava/lava_job_submitter.py \
 	--ci-project-dir "${CI_PROJECT_DIR}" \
 	--device-type "${DEVICE_TYPE}" \
 	--dtb-filename "${DTB}" \
-	--jwt-file "${CI_JOB_JWT_FILE}" \
+	--jwt-file "${S3_JWT_FILE}" \
 	--kernel-image-name "${KERNEL_IMAGE_NAME}" \
 	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
 	--boot-method "${BOOT_METHOD}" \
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8bc63912fddb..612c9ede3507 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -150,6 +150,8 @@ msm:sdm845:
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
     GPU_VERSION: sdm845
     RUNNER_TAG: google-freedreno-cheza
+    DEVICE_TYPE: sdm845-cheza-r3
+    FARM: google
   script:
     - ./install/bare-metal/cros-servo.sh
 
-- 
2.40.1


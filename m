Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3D81C38A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 04:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B443810E03C;
	Fri, 22 Dec 2023 03:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A5210E00A;
 Fri, 22 Dec 2023 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703216090;
 bh=kYml0Gc4mkk9AGwn9xZiP3xtZyxN1BrFoO4NDAvzy7M=;
 h=From:To:Cc:Subject:Date:From;
 b=C5/5DCLfh1RAXWeDcnqu/aZSxdB5pJ/kzz3a6epSwrhVHDEVQyK6YJiqY55KpAWAd
 fgnCixIt86jHLocC+6wPQi7nnWB3rimlS2L7S7yeQvDAj6rTsum+ZTn/J8frytzzuG
 qxwDC6IqNMQYsrIN3PSJe7xBn+f96WrwsKJeFFPSX1EMiSG9s2Kkd2L2ECM/aW4FQp
 RXjevOLKpCGyncC0IlYgnDUgPUlaAUi2gOtjhGperz1CLjTAx42v1V1Z7LJdNpjZq5
 i3bLfK+l+7V7OzRtvxqTlkKguizCmMKuwjmgAXG/EM7dkO5Yhyf6K8Q8TBMCD9G40Q
 OpnNv/1TdDXAg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AF4A137813DA;
 Fri, 22 Dec 2023 03:34:45 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/ci: uprev mesa version: fix kdl commit fetch
Date: Fri, 22 Dec 2023 09:04:34 +0530
Message-Id: <20231222033434.1537761-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: daniels@collabora.com, emma@anholt.net, freedreno@lists.freedesktop.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, david.heidelberg@collabora.com,
 helen.koike@collabora.com, dmitry.baryshkov@linaro.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

build-kdl.sh was doing a `clone --depth 1` of the default branch,
then checking out a commit that might not be the latest of that
branch, resulting in container build error.

https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
kdl commit fetch issue. Uprev mesa in drm-ci to fix this.

This commit updates the kernel tag and adds .never-post-merge-rules
due to the mesa uprev. It also fixes an issue where the virtio-gpu
pipeline was not getting created with the mesa uprev.

Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Fix an issue where the virtio-gpu pipeline was not getting created with the mesa uprev
    https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1062221

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 14 ++++++++++++--
 drivers/gpu/drm/ci/test.yml      |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index dac92cc2777c..084e3ff8e3f4 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -1,6 +1,6 @@
 variables:
   DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
-  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha edfbf74df1d4d6ce54ffe24566108be0e1a98c3d
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 9d162de9a05155e1c4041857a5848842749164cf
 
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
@@ -25,7 +25,9 @@ variables:
   # per-job artifact storage on MinIO
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   # default kernel for rootfs before injecting the current kernel tree
-  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/gfx-ci/linux/v6.4.12-for-mesa-ci-f6b4ad45f48d
+  KERNEL_REPO: "gfx-ci/linux"
+  KERNEL_TAG: "v6.6.4-for-mesa-ci-e4f4c500f7fb"
+  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/${KERNEL_REPO}/${KERNEL_TAG}
   LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
 
@@ -133,6 +135,11 @@ stages:
     - if: &is-pre-merge-for-marge '$GITLAB_USER_LOGIN == "marge-bot" && $CI_PIPELINE_SOURCE == "merge_request_event"'
       when: on_success
 
+.never-post-merge-rules:
+  rules:
+    - if: *is-post-merge
+      when: never
+
 # Rule to filter for only scheduled pipelines.
 .scheduled_pipeline-rules:
   rules:
@@ -150,6 +157,7 @@ stages:
 .build-rules:
   rules:
     - !reference [.no_scheduled_pipelines-rules, rules]
+    - !reference [.never-post-merge-rules, rules]
     # Run automatically once all dependency jobs have passed
     - when: on_success
 
@@ -157,6 +165,7 @@ stages:
 .container+build-rules:
   rules:
     - !reference [.no_scheduled_pipelines-rules, rules]
+    - !reference [.never-post-merge-rules, rules]
     - when: manual
 
 .ci-deqp-artifacts:
@@ -175,6 +184,7 @@ stages:
 .container-rules:
   rules:
     - !reference [.no_scheduled_pipelines-rules, rules]
+    - !reference [.never-post-merge-rules, rules]
     # Run pipeline by default in the main project if any CI pipeline
     # configuration files were changed, to ensure docker images are up to date
     - if: *is-post-merge
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 2c9a1838e728..1705f268547a 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -324,6 +324,7 @@ virtio_gpu:none:
     GPU_VERSION: none
   extends:
     - .test-gl
+    - .test-rules
   tags:
     - kvm
   script:
-- 
2.40.1


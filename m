Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE680F212
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 17:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B44910E629;
	Tue, 12 Dec 2023 16:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Tue, 12 Dec 2023 16:13:36 UTC
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BE010E629;
 Tue, 12 Dec 2023 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702397099;
 bh=/2FOHkCJ8Ki2qju6NW0aAz/iSZkx9bbOhEmMI/iFVMI=;
 h=From:To:Cc:Subject:Date:From;
 b=syPccCa5coUFY8UGzG9/lcjqqZMDN40JfB1AwIC7M7JqqqSkyvchAaUyn80GmaxvJ
 VDV/gFdRNnqS34Sz5PfmvxUkV/xDc3Wx7Whw0GUlyQI7bJeQuFXr+2mFXHWQvJjRzZ
 6FH8GfsxVaxxVdGDqcJ2IS+umueAnMZhb2gRh7ad3kfCKx2l9+XmUkEBBe9FYRdEyQ
 FQ+gH1zxWCe6Y95QFnpGELeVnwnGXKIxShq6VA1+V2WgfKgY+764Q4e5nkhy6iIjQu
 /C2QNjQ4D2NU+Y+62rBHhYhC0BHpeGdlP5ErKkaxe0n93Hs5pkpJ5Sg23a69El67pP
 nBi5XqFeRMqZA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65C6C3781462;
 Tue, 12 Dec 2023 16:04:56 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/ci: uprev mesa version: fix kdl commit fetch
Date: Tue, 12 Dec 2023 21:34:48 +0530
Message-Id: <20231212160448.883358-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

build-kdl.sh was doing a `clone --depth 1` of the default branch,
then checking out a commit that might not be the latest of that
branch, resulting in container build error.

https://gitlab.freedesktop.org/mesa/mesa/-/commit/5efa4d56 fixes
kdl commit fetch issue. Uprev mesa in drm-ci to fix this.

This commit also updates the kernel tag and adds .never-post-merge-rules
due to the mesa uprev.

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index aeb9bab1b069..b215d7b3d6ca 100644
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
-- 
2.40.1


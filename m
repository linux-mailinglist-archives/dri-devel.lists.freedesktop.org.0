Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D227A30FC5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 16:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17B710E6E8;
	Tue, 11 Feb 2025 15:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qvVjYOhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335E210E6E8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739287736;
 bh=FGxvbmvqcSbfYQGlzQKmPflKpORilopb70ajJozd624=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qvVjYOhdwxmntOcNPGX6Wx1mLflJvXB+PR/zLjEMVEMlu+sg7gEuPvZ4PQv2huJRD
 gNjTdiIIjj4y0WnVzVt2ufaakKRRETzTpiirTvrARLN/+dtvv2ln4/JrORLvlDJ3q8
 V0XcqWLrCj0mbwkvkB1rATMYPVkFKG+b0ITwwbOHCvSKAlhMmO5GgTIqVPKXJW0jKv
 ckByjQ7AP8N/Ll8nP3hqCemr341SBoVNbFRhiEYpFRbZRenlis4weopE9cnmgJlSVI
 p5sv0+OP68C5YUra4e2uQZ8h0gVtqipbFXApXteplxoe6JjD/vlzUb8P20sMmfTYKL
 fjwCTt8xsSRDQ==
Received: from localhost.localdomain (unknown [171.76.80.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BFD517E0CA2;
 Tue, 11 Feb 2025 16:28:51 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, boqun.feng@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/ci: refactor software-driver stage jobs
Date: Tue, 11 Feb 2025 20:58:04 +0530
Message-ID: <20250211152812.54018-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211152812.54018-1-vignesh.raman@collabora.com>
References: <20250211152812.54018-1-vignesh.raman@collabora.com>
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

Move common job configuration for software-driver
stage jobs to separate job.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - New patch in the series.

---
 drivers/gpu/drm/ci/test.yml | 59 +++++++++++++++----------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6a1e059858e5..0eab020a33b9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -89,6 +89,26 @@
   tags:
     - $RUNNER_TAG
 
+.software-driver:
+  stage: software-driver
+  timeout: "1h30m"
+  rules:
+    - !reference [.scheduled_pipeline-rules, rules]
+    - when: on_success
+  extends:
+    - .test-gl
+  tags:
+    - kvm
+  script:
+    - ln -sf $CI_PROJECT_DIR/install /install
+    - mv install/bzImage /lava-files/bzImage
+    - mkdir -p /lib/modules
+    - install/crosvm-runner.sh install/igt_runner.sh
+  needs:
+    - debian/x86_64_test-gl
+    - testing:x86_64
+    - igt:x86_64
+
 .msm-sc7180:
   extends:
     - .lava-igt:arm64
@@ -440,47 +460,16 @@ panfrost:g12b:
     - .panfrost-gpu
 
 virtio_gpu:none:
-  stage: software-driver
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - when: on_success
+  extends:
+    - .software-driver
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
     GPU_VERSION: none
-  extends:
-    - .test-gl
-  tags:
-    - kvm
-  script:
-    - ln -sf $CI_PROJECT_DIR/install /install
-    - mv install/bzImage /lava-files/bzImage
-    - install/crosvm-runner.sh install/igt_runner.sh
-  needs:
-    - debian/x86_64_test-gl
-    - testing:x86_64
-    - igt:x86_64
 
 vkms:none:
-  stage: software-driver
-  timeout: "1h30m"
-  rules:
-    - !reference [.scheduled_pipeline-rules, rules]
-    - when: on_success
+  extends:
+    - .software-driver
   variables:
     DRIVER_NAME: vkms
     GPU_VERSION: none
-  extends:
-    - .test-gl
-  tags:
-    - kvm
-  script:
-    - ln -sf $CI_PROJECT_DIR/install /install
-    - mv install/bzImage /lava-files/bzImage
-    - mkdir -p /lib/modules
-    - ./install/crosvm-runner.sh ./install/igt_runner.sh
-  needs:
-    - debian/x86_64_test-gl
-    - testing:x86_64
-    - igt:x86_64
-- 
2.43.0


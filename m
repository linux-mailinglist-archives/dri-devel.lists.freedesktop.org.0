Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFDA911D7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 05:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DA110EA16;
	Thu, 17 Apr 2025 03:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hm09aoo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3B910EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744859257;
 bh=+f6Lo1mVTj8/YK0MBPG7MoA3jPueXK/XZo8ZpqPytO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hm09aoo8OyTnAjkMIv9OC1dVJh5BZKKoIatUm7GW1jzRsj+xNtRCdBTPcGLKoK7sz
 mwic0F2A8m39eFyR/7uJnSLqeRvPwsNJGKNESBRqP+qmWd0srqD3sZkm1E3isTjrqG
 r3P7DoLXbi9nqfrMyF2IAqAXaaoe7MeVTAQrTqhZDO32NM8GxiFmrTmykOcXPRpHB5
 +Fy1K323t1gRfly3e9f/7wm3y0mONwYiFYx1WZi1FVY2F3V7DVE84IvM6skht3SkYT
 ScqhZ27HXyTAL43H49aXHUEx6OYUWlTkkayL+H4albrWb20eJIMr7rlRNdtKOvmT5F
 FCHYlZxZhsy5w==
Received: from debian.. (unknown [171.76.80.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 92B8E17E155F;
 Thu, 17 Apr 2025 05:07:33 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/ci: Add jobs to run KUnit tests
Date: Thu, 17 Apr 2025 08:34:35 +0530
Message-ID: <20250417030439.737924-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417030439.737924-1-vignesh.raman@collabora.com>
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
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

Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---

v3:
  - Add KUnit tests to the kunit stage.

v2:
  - Use LLVM/Clang instead of GCC to avoid architecture-specific
    toolchains for cross-compiling.

---
 drivers/gpu/drm/ci/gitlab-ci.yml |  2 ++
 drivers/gpu/drm/ci/kunit.sh      | 11 +++++++++++
 drivers/gpu/drm/ci/kunit.yml     | 33 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index ac2f498cfe5a..a9fc355c2ff5 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -109,6 +109,7 @@ include:
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
   - drivers/gpu/drm/ci/check-devicetrees.yml
+  - drivers/gpu/drm/ci/kunit.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
@@ -119,6 +120,7 @@ stages:
   - build-for-tests
   - build-only
   - static-checks
+  - kunit
   - code-validation
   - amdgpu
   - i915
diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
new file mode 100755
index 000000000000..90b8713ce7a2
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
+
+./tools/testing/kunit/kunit.py run \
+  --arch "${KERNEL_ARCH}" \
+  --make_option LLVM=1 \
+  --kunitconfig=drivers/gpu/drm/tests
diff --git a/drivers/gpu/drm/ci/kunit.yml b/drivers/gpu/drm/ci/kunit.yml
new file mode 100644
index 000000000000..37ab9cc2c9a8
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.yml
@@ -0,0 +1,33 @@
+.kunit-packages: &kunit-packages
+  - apt-get update -qq
+  - apt-get install -y --no-install-recommends clang lld llvm
+
+.kunit-base:
+  stage: kunit
+  timeout: "30m"
+  script:
+    - drivers/gpu/drm/ci/kunit.sh
+
+kunit:arm32:
+  extends:
+    - .build:arm32
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-arm
+
+kunit:arm64:
+  extends:
+    - .build:arm64
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-aarch64
+
+kunit:x86_64:
+  extends:
+    - .build:x86_64
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-x86
-- 
2.47.2


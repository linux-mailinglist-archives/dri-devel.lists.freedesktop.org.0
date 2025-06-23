Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE1BAE38F7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C510E1D6;
	Mon, 23 Jun 2025 08:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dnQvm03S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0463810E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750668674;
 bh=HXv3ywqM7Aj12ZBMV6/lmyFntJo5E+cB5OfRef713dA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnQvm03SmRwfQLzuXKDbQK294lOcDH2bypPfCvGuZTYqt5mMbYYqOygWs+zwtxZkL
 T+VM1x/JMqk16jJmJl53RGBWZ0oE3Ug1JEwoyN12uVNYJqORYlFqtQ7iGcAp+aKN2q
 InVzxbAXjb3uLIBw2f+l0wl/Gh5JAvNdrZ8vcJ8bqG/bEuFY2ewWAAsdvg7kZj6vz4
 RWWrSvEq+YKTAawymhMDvHvHN/uSV8rRojnwvjKlfc/UCuH1M+pNBQfTuzFlZ2Ci7H
 UxvDLL5TXsrjuQDbEofE/prHPeDdMace168S3wuYsTlKG7PrAJoOBifdtxI7fXmNTh
 pThLEFKtln54w==
Received: from debian.. (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E67F17E1560;
 Mon, 23 Jun 2025 10:51:11 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 robin.clark@oss.qualcomm.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/ci: Add jobs to run KUnit tests
Date: Mon, 23 Jun 2025 14:20:28 +0530
Message-ID: <20250623085033.39680-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623085033.39680-1-vignesh.raman@collabora.com>
References: <20250623085033.39680-1-vignesh.raman@collabora.com>
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
Acked-by: Helen Koike <helen.fornazier@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---

v4:
  - The minimum supported version of LLVM for building x86 kernels is 15.0.0
    (See https://lore.kernel.org/all/20250220-x86-bump-min-llvm-for-stackp-v1-1-ecb3c906e790@kernel.org/).
    Use the mesa-ci containers, where LLVM_VERSION is defined at the container
    level and is currently set to 19. Use this llvm version for compilation.
  
v3:
  - Add KUnit tests to the kunit stage.

v2:
  - Use LLVM/Clang instead of GCC to avoid architecture-specific
    toolchains for cross-compiling.

---
 drivers/gpu/drm/ci/gitlab-ci.yml |  2 ++
 drivers/gpu/drm/ci/kunit.sh      | 16 ++++++++++++++
 drivers/gpu/drm/ci/kunit.yml     | 37 ++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 1dddda3d24c8..6f9b7beddcb3 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -111,6 +111,7 @@ include:
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
   - drivers/gpu/drm/ci/check-devicetrees.yml
+  - drivers/gpu/drm/ci/kunit.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
@@ -122,6 +123,7 @@ stages:
   - build-for-tests
   - build-only
   - static-checks
+  - kunit
   - code-validation
   - amdgpu
   - i915
diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
new file mode 100755
index 000000000000..7a1052fd3f17
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
+: "${LLVM_VERSION:?ERROR: LLVM_VERSION must be set}"
+
+./drivers/gpu/drm/ci/setup-llvm-links.sh
+
+export PATH="/usr/bin:$PATH"
+
+./tools/testing/kunit/kunit.py run \
+  --arch "${KERNEL_ARCH}" \
+  --make_options LLVM=1 \
+  --kunitconfig=drivers/gpu/drm/tests
diff --git a/drivers/gpu/drm/ci/kunit.yml b/drivers/gpu/drm/ci/kunit.yml
new file mode 100644
index 000000000000..0d5b2c4433d2
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.yml
@@ -0,0 +1,37 @@
+.kunit-packages: &kunit-packages
+  - apt-get update -qq
+  # Minimum supported version of LLVM for building x86 kernels is 15.0.0.
+  # In mesa-ci containers, LLVM_VERSION is defined as a container-level property and is currently set to 19.
+  - apt-get install -y --no-install-recommends clang-${LLVM_VERSION} lld-${LLVM_VERSION} llvm-${LLVM_VERSION}
+
+.kunit-base:
+  stage: kunit
+  timeout: "30m"
+  variables:
+    GIT_DEPTH: 1
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


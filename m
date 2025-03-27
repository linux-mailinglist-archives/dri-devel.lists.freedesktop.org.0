Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F3A7363E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0F10E914;
	Thu, 27 Mar 2025 16:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OOlqPRdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A1810E914
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743091307;
 bh=/mBxGrc/MFqyFsw5vrdkK2fA4FHhzLiZpM0aqze1RGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OOlqPRdPoEHlEOPH2QYENlGwE4T8XM58u9KsOpjwu/+V92dJ1whp+xbvwy3dJXwWL
 RYvQhkFD0Vtz92v94u9J8h65vdIpr/SIHY7cy39rCEJDydD9R8agDC0g5p8mf/HdDO
 oW7QeIe6c/LuGEQ6tdcVMcMJvjDnOEowy7n1s6mFmslUfAM2h0flehHSN2puVNabbR
 6R1wSspMNHdXtrziH7X2KpIiBtMfScDZfHyhfEfqsRqWXZ8Tq2fWVj8qj8GPXafC1k
 xRNM5oF4aeSUxsOjkMEwGK4RIxx6Kani5BgmDg0eCjXsZo18mTxnqpczKt0g6mZpVg
 TCiXU256F+NUw==
Received: from debian.. (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 60BA217E091E;
 Thu, 27 Mar 2025 17:01:44 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
Date: Thu, 27 Mar 2025 21:31:12 +0530
Message-ID: <20250327160117.945165-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250327160117.945165-1-vignesh.raman@collabora.com>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
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
---
 drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
 drivers/gpu/drm/ci/kunit.sh      | 34 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ci/kunit.yml     | 19 ++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9e61b49e9960..90ae57ca86a1 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -109,6 +109,7 @@ include:
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
   - drivers/gpu/drm/ci/check-devicetrees.yml
+  - drivers/gpu/drm/ci/kunit.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
new file mode 100755
index 000000000000..197b19d05fba
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.sh
@@ -0,0 +1,34 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+case "${KERNEL_ARCH}" in
+    "arm")
+        QEMU_PKG="qemu-system-arm"
+        GCC_ARCH="arm-linux-gnueabihf"
+        ;;
+    "arm64")
+        QEMU_PKG="qemu-system-aarch64"
+        GCC_ARCH="aarch64-linux-gnu"
+        ;;
+    "x86_64")
+        QEMU_PKG="qemu-system-x86"
+        GCC_ARCH="x86_64-linux-gnu"
+        ;;
+    *)
+        echo "Unsupported architecture: ${KERNEL_ARCH}"
+        exit 1
+        ;;
+esac
+
+export ARCH="${KERNEL_ARCH}"
+export CROSS_COMPILE="${GCC_ARCH}-"
+
+apt-get update -qq && apt-get install -y --no-install-recommends "${QEMU_PKG}"
+
+. drivers/gpu/drm/ci/override-ld-with-bfd.sh
+
+./tools/testing/kunit/kunit.py run \
+  --arch "${ARCH}" \
+  --kunitconfig=drivers/gpu/drm/tests
diff --git a/drivers/gpu/drm/ci/kunit.yml b/drivers/gpu/drm/ci/kunit.yml
new file mode 100644
index 000000000000..95a893b9d641
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.yml
@@ -0,0 +1,19 @@
+.kunit-base:
+  timeout: "30m"
+  script:
+    - drivers/gpu/drm/ci/kunit.sh
+
+kunit:arm32:
+  extends:
+    - .build:arm32
+    - .kunit-base
+
+kunit:arm64:
+  extends:
+    - .build:arm64
+    - .kunit-base
+
+kunit:x86_64:
+  extends:
+    - .build:x86_64
+    - .kunit-base
-- 
2.47.2


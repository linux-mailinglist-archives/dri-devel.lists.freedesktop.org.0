Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12005842788
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14F21131B2;
	Tue, 30 Jan 2024 15:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8531131AD;
 Tue, 30 Jan 2024 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627121;
 bh=zvEHPqsSi2mmxgkeDkWSdLIXDtcP/2UPBIsgY7QDhVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7I63n76OUj2pQJtD1zFNyuejbbnbSQjLkRcqs1py3PAdTlydMWXOuLzFG/U0BrnZ
 UZvuWMaeg5fUJD3rSHYjv4Dv8vKhuun4Y7Dy4PFU1rUPBlU3H3TVFP/m/kRE/fr0CP
 G0bH++zt1joHs40Qm5t2dZv4x7KC5ckUJRBHe1MDD4KU91KdBPi9M/FHZNQjO/WfGD
 woiqQU78fHzMqoJFCPd1gnkSC6z7GIVH7Fik5fr7EI38640Guo22f1Vujc7Vk8b+ZK
 PEzBqpEP1rvy8JabfDq+FV+F2OyeUR1h0yOQp4D2qcrF49IAKeJY9I7+5FKriXJXQ1
 71AZ4qqHLF8Hg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0EAE3782089;
 Tue, 30 Jan 2024 15:05:16 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/ci: meson: Add job to test panfrost GPU driver
Date: Tue, 30 Jan 2024 20:33:36 +0530
Message-Id: <20240130150340.687871-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
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
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For amlogic meson SOC the GPU driver is panfrost. So add
support in drm-ci to test panfrost driver for amlogic meson
SOC and update xfails. Skip KMS tests for panfrost driver
since it is not a not a KMS driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for amlogic meson SOC with new xfails.

v3:
  - Skip KMS tests for panfrost driver since it is not a not a KMS
    driver and update xfails. Add the job name in GPU_VERSION and use
    it for xfail file names instead of using DRIVER_NAME.

---
 drivers/gpu/drm/ci/test.yml                        | 7 +++++++
 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index bf4c303a65f2..f4053bc0e365 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -358,6 +358,13 @@ mediatek:mt8183-display:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: meson-g12b-gpu
+    DRIVER_NAME: panfrost
+
 meson:g12b-display:
   extends:
     - .g12b
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B1842799
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585691131C4;
	Tue, 30 Jan 2024 15:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B071131BE;
 Tue, 30 Jan 2024 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627133;
 bh=URYtar/EYKdvk24yq8i2kmfS77H7Oa8ScrMzfoeJcCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RGNEnZ3Osl5NmwJb/YucgJH/VPBsfpuYGZdMIh9Osq3ocSSBTncfl7RqEHTlqcgwo
 HYXqnHLkMJG+GbK0On8O2Yu7/XWl++SPYClDzyQ1WmbMbDnTCMHDvm/jzd9je9oseH
 vA7cG0y64Bsjz/K9V9rRU4Pans333w4KAdqMIrjUU1o4qtVyzyxs6/BDeokiGUwDaA
 ZGY5x5iX8iv/dWywlQZwMXhJjxOBNhOZKT3M3BansHFy2pAsWoRPlO9xIJZh03969L
 kaX9yX7Qz39AGzd9b2f6WlFeThUe7sl9eCdY0NBrh0Pobfsyirwq2lLAnwsdIPqod6
 ueKJx+DDL1/pA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id EAE323782084;
 Tue, 30 Jan 2024 15:05:27 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/9] drm/ci: rockchip: Add job to test panfrost GPU driver
Date: Tue, 30 Jan 2024 20:33:38 +0530
Message-Id: <20240130150340.687871-8-vignesh.raman@collabora.com>
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

For rockchip rk3288 and rk3399, the GPU driver is panfrost.
So add support in drm-ci to test panfrost driver for rockchip
SOC and update xfails. Skip KMS tests for panfrost driver
since it is not a not a KMS driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for rockchip SOC with new xfails.

v3:
  - Skip KMS tests for panfrost driver since it is not a not
    a KMS driver and update xfails. Add the job name in GPU_VERSION
    and use it for xfail file names instead of using DRIVER_NAME.

---
 drivers/gpu/drm/ci/test.yml                        | 14 ++++++++++++++
 .../drm/ci/xfails/rockchip-rk3288-gpu-fails.txt    |  1 +
 .../drm/ci/xfails/rockchip-rk3288-gpu-skips.txt    |  2 ++
 .../drm/ci/xfails/rockchip-rk3399-gpu-fails.txt    |  1 +
 .../drm/ci/xfails/rockchip-rk3399-gpu-skips.txt    |  2 ++
 5 files changed, 20 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 1b8846c6bdbf..8ab8a8f56d6a 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -175,6 +175,13 @@ msm:sdm845:
     KERNEL_IMAGE_TYPE: ""
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288-gpu:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rockchip-rk3288-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3288-display:
   extends:
     - .rk3288
@@ -182,6 +189,13 @@ rockchip:rk3288-display:
     GPU_VERSION: rockchip-rk3288-display
     DRIVER_NAME: rockchip
 
+rockchip:rk3399-gpu:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rockchip-rk3399-gpu
+    DRIVER_NAME: panfrost
+
 rockchip:rk3399-display:
   extends:
     - .rk3399
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
new file mode 100644
index 000000000000..abd35a8ef6f4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


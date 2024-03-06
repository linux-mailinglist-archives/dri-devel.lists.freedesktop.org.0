Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706ED872D4B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3A8112E4B;
	Wed,  6 Mar 2024 03:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="yauTSKWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC72112E4B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 03:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709694508;
 bh=dZZpqBCxb8y7M5MKHNPlz5VMqXrw7cQklFnPCTea1T4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yauTSKWHuKheWOM/eQuJxn95LCKiN4XmruEWzB1kLYgBD3DaaeJbEbBcgE0Iezwe8
 TlZe5Hg6irmXaQRUGK/KqepVsQ+UIVVJUpfXqIV8Zh9ThqxNkueHTD8JaldbyMuBNu
 rpmngc8VvVwDyGA4ElFjd8lU1fH7Pjim4NpU3Gzy9PpBPcgC6lo6RKxUT+s1Zakdus
 5hIV+MJcAsRS8LyBQBqnt+MU2hbY1EMAPp8KsngpOzOniyfY/F3RTgOVenL/gSJOSp
 srsgjX3/vwax6TjcBCk10Rb5X2KYiZzwFmYrTv1bVViMf1pGabu0o9iVrgkxPmOTnL
 Pz0HJcQCYcFdw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2AA6537820CC;
 Wed,  6 Mar 2024 03:08:24 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/11] drm/ci: meson: Add job to test panfrost GPU driver
Date: Wed,  6 Mar 2024 08:36:46 +0530
Message-Id: <20240306030649.60269-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
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

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.

---
 drivers/gpu/drm/ci/test.yml                       | 8 ++++++++
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 2 ++
 3 files changed, 11 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 951a44bf9d19..6ae6398b3d88 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -370,6 +370,14 @@ meson:g12b:
     GPU_VERSION: g12b
     DRIVER_NAME: meson
 
+panfrost:g12b:
+  extends:
+    - .g12b
+  stage: panfrost
+  variables:
+    GPU_VERSION: g12b
+    DRIVER_NAME: panfrost
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


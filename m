Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8D89383A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 08:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E5B10EF00;
	Mon,  1 Apr 2024 06:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rpt+mpCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECD510EF00
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711952037;
 bh=E2aghGpQK92An1ZuPhL1vFyz1L4o8jK/Gv/KB0mTOfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rpt+mpCcvI4BrBXMmH0MmkLCykedyO2xVlGSExe8lfeRK0LYHIejnsMXD+IAIneFU
 1/gWi1q59vtqRtZb5OdlMtEeGKbp5CoKLn4V5beViSnCRyPYWh+M9/Ln7qgrRYBpdY
 8kwybmMANSO7y/3BbU9dnzTeGsG1+m49AIE6HK634o4Nf+jtgC3s01M6fUerrd48Hw
 QDZfzPfxR6oxouPiQlUnlG3Z+knh4P9WXJn2NbPEycuObWP88KaASPzIPJz6KAxpVu
 Dtl1IgJCxYIy1Sgl25OnBXnXYsWpvMdqtLUwKUMO4xN9Zz2WT0Pq2X3CooekROWD/T
 CGIhcdKLZek8w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E08603782121;
 Mon,  1 Apr 2024 06:13:53 +0000 (UTC)
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
Subject: [PATCH v5 07/10] drm/ci: meson: Add job to test panfrost GPU driver
Date: Mon,  1 Apr 2024 11:42:32 +0530
Message-Id: <20240401061235.192713-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
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
SOC and update xfails. Skip KMS tests for panfrost driver since
it is not a not a KMS driver and skip driver-specific tests.

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

v5:
  - Use panfrost-gpu job and skip driver-specific tests.

---
 drivers/gpu/drm/ci/test.yml                       | 5 +++++
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt | 1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 8 ++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 505733069995..d1d42ff7df2d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -381,6 +381,11 @@ meson:g12b:
     - .g12b
     - .meson-display
 
+panfrost:g12b:
+  extends:
+    - .g12b
+    - .panfrost-gpu
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
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
@@ -0,0 +1,8 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
-- 
2.40.1


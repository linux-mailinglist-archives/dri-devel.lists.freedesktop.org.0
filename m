Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9924872D48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E036C112E48;
	Wed,  6 Mar 2024 03:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hxSPIOO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBF6112E48
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 03:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709694499;
 bh=ZKVm2EEro0twvk7ZrKgD0JwVVO0iBbsdkqUjhD2/Zh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hxSPIOO4Fd61/uN3kLv120LrOR+6ogsGF9uad8VKQ+hNTxdFt0eQ1faTaLUqG7isZ
 mLu8f4WM3XGrGnjteHZI6TiYU+ffg/qJktIypRoXoSwRuV27S52qEzTxP++BsFgrHL
 SIrFFhY/ciUMtbyO6pOIGYUpYygxAUStJSi8o0/P7l/gthvr0FqPgKcm5KKwECHX+8
 Og8gl7KE7bv/LXVQs1BopXfCuqsbYTOliInFr6BWc5WB3xR3iy5UTEdBoMFugiUeBI
 YRVa6PfWnrGRoNbP8G5Q+8HAnUS6/+tNAMlpJIWw81ymJYhkx5RdWvTag5g7AGHdu3
 CQCbom4JVpy5g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 72C1037820DA;
 Wed,  6 Mar 2024 03:08:15 +0000 (UTC)
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
Subject: [PATCH v4 06/11] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Date: Wed,  6 Mar 2024 08:36:44 +0530
Message-Id: <20240306030649.60269-7-vignesh.raman@collabora.com>
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

For mediatek mt8173, the GPU driver is powervr and for mediatek
mt8183, the GPU driver is panfrost. So add support in drm-ci to
test panfrost and powervr GPU driver for mediatek SOCs and update
xfails. Powervr driver was merged in linux kernel, but there's no
mediatek support yet. So disable the mt8173-gpu job which uses
powervr driver.

Add panfrost specific tests to testlist and skip KMS tests for
panfrost driver since it is not a not a KMS driver. Also update
the MAINTAINERS file to include xfails for panfrost driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, add xfail
    entry to MAINTAINERS.

v3:
  - Add panfrost specific tests to testlist and skip KMS tests for
    panfrost driver since it is not a not a KMS driver and update xfails.
    Update the MAINTAINERS file to include xfails for panfrost driver.
    Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.
    Update the MAINTAINERS file to include xfails for panfrost driver.

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 ++
 drivers/gpu/drm/ci/test.yml                   | 20 +++++++++++++++++++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  2 ++
 5 files changed, 26 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 4da66ca92f1a..264b23108847 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1667,6 +1667,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/ci/testlist-panfrost.txt
 F:	drivers/gpu/drm/ci/testlist.txt
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index e2b021616a8e..9dae74465ce1 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -107,6 +107,8 @@ stages:
   - meson
   - msm
   - rockchip
+  - panfrost
+  - powervr
   - virtio-gpu
 
 # YAML anchors for rule conditions
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f8f48523ada3..99fd101ce2fe 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -309,6 +309,18 @@ mediatek:mt8173:
     GPU_VERSION: mt8173
     DRIVER_NAME: mediatek
 
+powervr:mt8173:
+  extends:
+    - .mt8173
+  stage: powervr
+  variables:
+    GPU_VERSION: mt8173
+    DRIVER_NAME: powervr
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
 mediatek:mt8183:
   extends:
     - .mt8183
@@ -316,6 +328,14 @@ mediatek:mt8183:
     GPU_VERSION: mt8183
     DRIVER_NAME: mediatek
 
+panfrost:mt8183:
+  extends:
+    - .mt8183
+  stage: panfrost
+  variables:
+    GPU_VERSION: mt8183
+    DRIVER_NAME: panfrost
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE146842791
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EA011319B;
	Tue, 30 Jan 2024 15:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC6311319B;
 Tue, 30 Jan 2024 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627111;
 bh=jWgH1wt2P+WmiafYOD6k4YLKcf4liwSXj2vQg8ErA1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ryF5aEf/x2Xps+n2j+YTnU7IF7HUIfbnr6ze5amLT43mqdhzZYE8MwPFrifkQ33/e
 9Imu3SdRH5rtUod6+Z+ktYsznMCIaEbR9GI7l0SxN4pe8LsVyEz1NiGtbbSbCPheHI
 OGcsGngxWSm8dcV6kSuyRvMMsdUgAogUqrvoOTtLzKgv4UqFbmFcH1IZawlziI3U7S
 Fw/CPOILix0aq6Eho7iOGLI06PYLntrful/9GU8KObaoo2rq51/e8tx9l5PKWg92T3
 Gxos2veMW5CbaoutP7RLL0W/xZJFvAwID3W7e64Hk30L2wlEecDUJqlJ7NdAYa2+4N
 aPasaoSR39M/Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A5553782079;
 Tue, 30 Jan 2024 15:05:06 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and powervr
 GPU driver
Date: Tue, 30 Jan 2024 20:33:34 +0530
Message-Id: <20240130150340.687871-4-vignesh.raman@collabora.com>
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

---
 MAINTAINERS                                    |  1 +
 drivers/gpu/drm/ci/test.yml                    | 18 ++++++++++++++++++
 drivers/gpu/drm/ci/testlist.txt                | 16 ++++++++++++++++
 .../ci/xfails/mediatek-mt8183-gpu-skips.txt    |  2 ++
 4 files changed, 37 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d959a6881f7..bcdc17d1aa26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1645,6 +1645,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 0cd44e6ea18b..e153c5a7ad80 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -299,6 +299,17 @@ amdgpu:stoney:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
 
+mediatek:mt8173-gpu:
+  extends:
+    - .mt8173
+  variables:
+    GPU_VERSION: mediatek-mt8173-gpu
+    DRIVER_NAME: powervr
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
 mediatek:mt8173-display:
   extends:
     - .mt8173
@@ -306,6 +317,13 @@ mediatek:mt8173-display:
     GPU_VERSION: mediatek-mt8173-display
     DRIVER_NAME: mediatek
 
+mediatek:mt8183-gpu:
+  extends:
+    - .mt8183
+  variables:
+    GPU_VERSION: mediatek-mt8183-gpu
+    DRIVER_NAME: panfrost
+
 mediatek:mt8183-display:
   extends:
     - .mt8183
diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
index eaeb751bb0ad..772fc025b1f8 100644
--- a/drivers/gpu/drm/ci/testlist.txt
+++ b/drivers/gpu/drm/ci/testlist.txt
@@ -2959,3 +2959,19 @@ msm_submit@invalid-duplicate-bo-submit
 msm_submit@invalid-cmd-idx-submit
 msm_submit@invalid-cmd-type-submit
 msm_submit@valid-submit
+panfrost_get_param@base-params
+panfrost_get_param@get-bad-param
+panfrost_get_param@get-bad-padding
+panfrost_gem_new@gem-new-4096
+panfrost_gem_new@gem-new-0
+panfrost_gem_new@gem-new-zeroed
+panfrost_prime@gem-prime-import
+panfrost_submit@pan-submit
+panfrost_submit@pan-submit-error-no-jc
+panfrost_submit@pan-submit-error-bad-in-syncs
+panfrost_submit@pan-submit-error-bad-bo-handles
+panfrost_submit@pan-submit-error-bad-requirements
+panfrost_submit@pan-submit-error-bad-out-sync
+panfrost_submit@pan-reset
+panfrost_submit@pan-submit-and-close
+panfrost_submit@pan-unhandled-pagefault
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
new file mode 100644
index 000000000000..2ea09d1648bc
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
@@ -0,0 +1,2 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB47D4435
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035D210E26F;
	Tue, 24 Oct 2023 00:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269C10E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:46:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C6CB266071D4;
 Tue, 24 Oct 2023 01:46:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108409;
 bh=ZHpdflXv9TB7uf4xbAF+b9G//xsAj+ykHLNYUOsAUcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G0PV9CK1IvRNcVh+vK2egq6cRgRjUHGRH2dpcxUAIN1fEV/zIYdOHi145o7hk6n//
 5Yu7wnM+kSstxJddqf84wt7OjWcJcTtA9Z9hEmktzl+fxLD11/3hKe2ovhlE4CVB+b
 S9/VignLNdPtnCJc6j+WSPUAn0GarqRYk0uQirKPlHNJrgyVqcX24gMmxkAt1zfyzb
 sveG0B0XjugfXM1PT+TKDpZDvaZ4kzZbsGZfifIMbboRQogzaCLYgRcPpsfxy9sJAj
 rCt9QPWaqh5gLAtY8EzIkqB3uXTKXrNyR1Co4YIceNaDkAysMoG7tAo2SpucMr4wvJ
 x0DGbm7MVKUCQ==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/10] drm/ci: add subset-1-gfx to LAVA_TAGS and adjust
 shards
Date: Mon, 23 Oct 2023 21:45:21 -0300
Message-Id: <20231024004525.169002-7-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Collabora Lava farm added a tag called `subset-1-gfx` to half of
devices the graphics community use.

Lets use this tag so we don't occupy all the resources.

This is particular important because Mesa3D shares the resources with
DRM-CI and use them to do pre-merge tests, so it can block developers
from getting their patches merged.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- add subset-1-gfx tag to LAVA_TAGS
- update commit message
v3: no changes
---
 drivers/gpu/drm/ci/gitlab-ci.yml |  2 +-
 drivers/gpu/drm/ci/test.yml      | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index c08ea6097b1d..cb41fa1b068b 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -26,7 +26,7 @@ variables:
   JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
   # default kernel for rootfs before injecting the current kernel tree
   KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/gfx-ci/linux/v6.4.12-for-mesa-ci-f6b4ad45f48d
-
+  LAVA_TAGS: subset-1-gfx
   LAVA_JOB_PRIORITY: 30
 
 default:
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 3479d2a0108d..19dc0862e710 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -86,7 +86,7 @@ msm:sc7180:
   extends:
     - .lava-igt:arm64
   stage: msm
-  parallel: 2
+  parallel: 4
   variables:
     DRIVER_NAME: msm
     DEVICE_TYPE: sc7180-trogdor-lazor-limozeen
@@ -155,7 +155,7 @@ rockchip:rk3399:
   extends:
     - .lava-igt:arm64
   stage: rockchip
-  parallel: 3
+  parallel: 2
   variables:
     DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
@@ -178,7 +178,7 @@ rockchip:rk3399:
 i915:apl:
   extends:
     - .i915
-  parallel: 12
+  parallel: 3
   variables:
     DEVICE_TYPE: asus-C523NA-A20057-coral
     GPU_VERSION: apl
@@ -187,7 +187,7 @@ i915:apl:
 i915:glk:
   extends:
     - .i915
-  parallel: 5
+  parallel: 2
   variables:
     DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
     GPU_VERSION: glk
@@ -196,7 +196,7 @@ i915:glk:
 i915:amly:
   extends:
     - .i915
-  parallel: 8
+  parallel: 2
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -205,7 +205,7 @@ i915:amly:
 i915:kbl:
   extends:
     - .i915
-  parallel: 5
+  parallel: 3
   variables:
     DEVICE_TYPE: hp-x360-14-G1-sona
     GPU_VERSION: kbl
@@ -214,7 +214,7 @@ i915:kbl:
 i915:whl:
   extends:
     - .i915
-  parallel: 8
+  parallel: 2
   variables:
     DEVICE_TYPE: dell-latitude-5400-8665U-sarien
     GPU_VERSION: whl
@@ -223,7 +223,7 @@ i915:whl:
 i915:cml:
   extends:
     - .i915
-  parallel: 6
+  parallel: 2
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
@@ -232,7 +232,7 @@ i915:cml:
 i915:tgl:
   extends:
     - .i915
-  parallel: 6
+  parallel: 8
   variables:
     DEVICE_TYPE: asus-cx9400-volteer
     GPU_VERSION: tgl
@@ -251,6 +251,7 @@ i915:tgl:
 amdgpu:stoney:
   extends:
     - .amdgpu
+  parallel: 2
   variables:
     DEVICE_TYPE: hp-11A-G6-EE-grunt
     GPU_VERSION: stoney
@@ -269,6 +270,7 @@ amdgpu:stoney:
 mediatek:mt8173:
   extends:
     - .mediatek
+  parallel: 4
   variables:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
@@ -280,6 +282,7 @@ mediatek:mt8173:
 mediatek:mt8183:
   extends:
     - .mediatek
+  parallel: 3
   variables:
     DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
     GPU_VERSION: mt8183
@@ -289,6 +292,7 @@ mediatek:mt8183:
 .mediatek:mt8192:
   extends:
     - .mediatek
+  parallel: 3
   variables:
     DEVICE_TYPE: mt8192-asurada-spherion-r0
     GPU_VERSION: mt8192
@@ -307,6 +311,7 @@ mediatek:mt8183:
 meson:g12b:
   extends:
     - .meson
+  parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     GPU_VERSION: g12b
-- 
2.39.2


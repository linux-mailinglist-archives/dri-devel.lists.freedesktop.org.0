Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D51819EB1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C0E10E564;
	Wed, 20 Dec 2023 12:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B6A10E564
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074308;
 bh=Oh463TEYwWlMnYER5Qs7j3iFZItrw8O/XAP1/5Xns2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M9b7xfe4SEa6MrlfHuJX3mN4lKOCgV2ixf1mwLt5VLRaN/BYK43jBqAH7+w8nmWLY
 2DvBlHHU4EdWR19FSey0+CxbzGWZ/bjIcbwpE7/0f0s7/a0GSaoci/WmyFzVX+wwo4
 FLnzKvpkB3tieXdBNd+Fg+K94ySxhgd/QOKCnygoUl0BpzH2lv6GZ3YX/ZiIQx3YSY
 iyhWLhAOQyJ6WOCvfbfMpi9q/plT21jiTNdX5ZPRCe2ETwe1QuEX5S2BWNXKHX3yTC
 iMudimtroNePbPIf8Ea7rD73tbDV6EMtjb14uV1HvsVRO3vJx3DulwmhnSL9nTL1MM
 6OYrucRAGuGbQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E938F3781FEF;
 Wed, 20 Dec 2023 12:11:42 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 3/8] drm/ci: rockchip: Test both GPU and display drivers
Date: Wed, 20 Dec 2023 17:41:05 +0530
Message-Id: <20231220121110.1441160-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-rockchip@lists.infradead.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david.heidelberg@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rockchip rk3288 and rk3399 SOCs have a separate display controller
and GPU, with different drivers for each. Add support in drm-ci
to test both these drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 50 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 1945c0a70e76..8081925303f5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -135,33 +135,59 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
-rockchip:rk3288:
-  extends:
-    - .lava-igt:arm32
+.rockchip:
   stage: rockchip
   variables:
-    DRIVER_NAME: rockchip
-    DEVICE_TYPE: rk3288-veyron-jaq
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: depthcharge
+
+.rk3288:
+  extends:
+    - .lava-igt:arm32
+    - .rockchip
+  variables:
+    DEVICE_TYPE: rk3288-veyron-jaq
     KERNEL_IMAGE_TYPE: "zimage"
-    GPU_VERSION: rk3288
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3288-veyron-jaq
 
-rockchip:rk3399:
+.rk3399:
   extends:
     - .lava-igt:arm64
-  stage: rockchip
+    - .rockchip
   parallel: 2
   variables:
-    DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
-    DTB: ${DEVICE_TYPE}
-    BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
-    GPU_VERSION: rk3399
     RUNNER_TAG: mesa-ci-x86-64-lava-rk3399-gru-kevin
 
+rockchip:rk3288-gpu:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rk3288-gpu
+    DRIVER_NAME: panfrost
+
+rockchip:rk3288-display:
+  extends:
+    - .rk3288
+  variables:
+    GPU_VERSION: rk3288-display
+    DRIVER_NAME: rockchip
+
+rockchip:rk3399-gpu:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rk3399-gpu
+    DRIVER_NAME: panfrost
+
+rockchip:rk3399-display:
+  extends:
+    - .rk3399
+  variables:
+    GPU_VERSION: rk3399-display
+    DRIVER_NAME: rockchip
+
 .i915:
   extends:
     - .lava-igt:x86_64
-- 
2.40.1


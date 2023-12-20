Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C520819EB3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93B10E57B;
	Wed, 20 Dec 2023 12:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90F810E57E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074313;
 bh=cpGbNlIDrcIqhAFCyy26RbpIG22BYa4C8X4/107Zjy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H826zMsu4Ly2DqEn2dK54lHrjWC37YcV8O1ySVSqZjIhNZXFth9HFiQ5cPYSiXQs4
 6nYwDCj0JViAuWFV+f2RmXtHzu1QaOLmelK0NqTPsoZwUr6rER4/dpQvsJwp4UfR4h
 T5r+ROQkeRrl6Gb7/JGzUTn8fx/WsJYq6j5YaG/Sokk41Jflnud+mcgW9V+7b5xqy+
 408M2U9Ku6TMpEMXtqYZvvMWID2JWK4qhFTFWJgXyQKG8sfW0oL8nI5Pb8kZQ3uvla
 5+yKUYIGfXMiI9Ts7GbiIgGkZbEPGsDsPGW8oS5Tx+hlolGyM6o0bjMVdJ21a9cRRQ
 T6D5oDR733+Ug==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9DEB73781FD5;
 Wed, 20 Dec 2023 12:11:48 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 4/8] drm/ci: meson: Test both GPU and display drivers
Date: Wed, 20 Dec 2023 17:41:06 +0530
Message-Id: <20231220121110.1441160-5-vignesh.raman@collabora.com>
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

Meson SOC have a separate display controller and GPU,
with different drivers for each. Add support in drm-ci
to test both these drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8081925303f5..159eb7ba3588 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -357,20 +357,32 @@ mediatek:mt8183-display:
     - .lava-igt:arm64
   stage: meson
   variables:
-    DRIVER_NAME: meson
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: u-boot
     KERNEL_IMAGE_TYPE: "image"
 
-meson:g12b:
+.g12b:
   extends:
     - .meson
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
-    GPU_VERSION: g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-gpu
+    DRIVER_NAME: panfrost
+
+meson:g12b-display:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-display
+    DRIVER_NAME: meson
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
-- 
2.40.1


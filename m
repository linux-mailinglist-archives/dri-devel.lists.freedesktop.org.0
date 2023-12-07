Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42680841B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F17E10E829;
	Thu,  7 Dec 2023 09:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45110E829
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:18:52 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78EBC6607391;
 Thu,  7 Dec 2023 09:18:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701940731;
 bh=s65wG8Xa27lvuBcW1EDiDAe4V6jKOd53wZ8KvwoHfkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsPc7Kxq3aAUGD/hvopThSPKYvQYNQjAzDOZ5KwNnt+Zdv8yIKsaBwVZnIGWKGD9p
 Z3ajnMB6ZINiGzBt5trnRBXbQocOJR8rdfXO7MvlVUT9sk2Co8kP0wb9cvD8YnPknh
 L/8ilLPkWxZY3WYqdwgK8h5mTep8Vgjg37srAW+MYn2FVoQrKEgZOIEaUs/Bb4u2rn
 FhIL91KPVWte23fv/Fn0DpTiu2xJkWlmq0Sdk+Ze/R03VJ+aLbJrJzryKtXs6nYCL4
 I6zVpCnWOtvlomnYszcrMOt+B5yGyH+JJgDBWjFMb5jwKDnPx6SNNxtXUwREuogkPM
 6j7JS94bDrK8w==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v7 02/10] drm: ci: Force db410c to host mode
Date: Thu,  7 Dec 2023 14:48:23 +0530
Message-Id: <20231207091831.660054-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629

Use apq8016-sbc-usb-host.dtb which allows the USB controllers
to work in host mode.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources

v3:
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support

v4:
  - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
    This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

v5:
  - No changes

v6:
  - No changes

v7:
  - Fix checkpatch style problems in commit message

---
 drivers/gpu/drm/ci/build.sh | 2 +-
 drivers/gpu/drm/ci/test.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e5c5dcedd108..e2260b4a1c67 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -19,7 +19,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb"
-    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8016-sbc.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/apq8096-db820c.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index f285ed67eb3d..4af10f0ff82d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -102,7 +102,7 @@ msm:apq8016:
   stage: msm
   variables:
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
     GPU_VERSION: apq8016
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
     RUNNER_TAG: google-freedreno-db410c
-- 
2.40.1


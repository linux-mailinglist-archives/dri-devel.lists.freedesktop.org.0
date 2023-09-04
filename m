Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99E791B41
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC2810E39C;
	Mon,  4 Sep 2023 16:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DC110E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:16:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A3C0B660727F;
 Mon,  4 Sep 2023 17:16:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693844173;
 bh=PqnUcFY/q0lgjJw6DSUb9APr8xzTKq/rx+fSVIiGKME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FVMwR8E4oAKKzCINPOhr4QwIjSWZ8tYTACb7k+ABut6UyuFzhoTWsDJs97OB4Nhpt
 3OWu9BILyy91S8DSMbar9kDvosLWcgYsPdkfuguBtI+LYr4So/VODZwKXQw2dGBDhb
 NbR7JzRVJeu4HFgWw50XQOj2sQ8ajwoBb49xCN8q7S/yKTZyCQbvhFEZaY1hJ1IgpA
 z3jo4/fhPr3IBImxZTH6vTJApbOAV4UPsuci+Gj/YMkCl1PHaNa5sISHrLb4o7er2V
 iCs9x6ZbTouwUp+JpacW8rpRuIkL1P8Gmv13zzvkyZjVZpZHessUZLAtoyLBF+BbT0
 T9IOljabH7TJg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Date: Mon,  4 Sep 2023 21:45:11 +0530
Message-Id: <20230904161516.66751-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
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
Cc: mripard@kernel.org, robdclark@google.com, daniels@collabora.com,
 emma@anholt.net, gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robclark@freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8

Use fdtoverlay command to merge base device tree with an overlay
which contains the fix for USB controllers to work in host mode.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  
---
 drivers/gpu/drm/ci/build.sh                         |  5 +++++
 .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..92ffd98cd09e 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -92,6 +92,11 @@ done
 
 if [[ -n ${DEVICE_TREES} ]]; then
     make dtbs
+    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
+        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
+        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
+        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
+    fi
     cp ${DEVICE_TREES} /lava-files/.
 fi
 
diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
new file mode 100644
index 000000000000..57b7604f1c23
--- /dev/null
+++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
@@ -0,0 +1,13 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+    fragment@0 {
+        target-path = "/soc@0";
+        __overlay__ {
+            usb@78d9000 {
+                dr_mode = "host";
+            };
+        };
+    };
+};
-- 
2.40.1


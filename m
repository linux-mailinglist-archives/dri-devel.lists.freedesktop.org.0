Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE17989D1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5283610E907;
	Fri,  8 Sep 2023 15:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA1A10E8FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:23:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DE52766072E2;
 Fri,  8 Sep 2023 16:23:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694186599;
 bh=WAVH3aE6YH73IbakKHhLz1OxqV6EfdN7Z6LYf6+NDJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UcjB6R8jwmybsou4rFMPv9acOAA6HzKPS/vVOGD8KXnqUXT6g0gy7FBu9jA4wS073
 MQyr50q5xlN02pWwznfoPImf0w7/x8KMWupqET/vWBps2Z15hh+3MinqjDcftckaMY
 Q+rpXO+WEtoCUE0QRDt4sNX9PYUKotKNEW+XJFlcP8Jx88OVaZDBxzPK1QqzddFTHj
 wWOda0UB873m1gxtCgMWvi+2bUYeDDBbUtzhxZMI5qXJ+mIWc8t+T5stCx0Jr1PD3k
 n9DVKtiv0sxiGcvFjqHdHcaqCZJueLcotU853Hh4fJI65qtlomoSXhheaTWX7QAyTi
 Rj3e9V6F7fY/w==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm: ci: Force db410c to host mode
Date: Fri,  8 Sep 2023 20:52:19 +0530
Message-Id: <20230908152225.432139-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8

Compile the base device tree with overlay support and use fdtoverlay
command to merge base device tree with an overlay which contains the
fix for USB controllers to work in host mode. [suggested by Maxime Ripard]

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources

v3:
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support

---
 drivers/gpu/drm/ci/build.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..092c195af242 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -91,7 +91,12 @@ for image in ${KERNEL_IMAGE_NAME}; do
 done
 
 if [[ -n ${DEVICE_TREES} ]]; then
-    make dtbs
+    make DTC_FLAGS=-@ dtbs
+    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
+        dtc -@ -I dts -O dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
+        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo
+        mv arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
+    fi
     cp ${DEVICE_TREES} /lava-files/.
 fi
 
-- 
2.40.1


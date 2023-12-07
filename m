Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFB80842A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFF710E830;
	Thu,  7 Dec 2023 09:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AF410E830
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CAC7A660739B;
 Thu,  7 Dec 2023 09:19:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701940745;
 bh=FI7vvMbXu6jw/8V7yXWu5M1HVFfmnKGFMWLn6Tl2uAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bc4qjA9TxkLS3NJOdvzQjV+8p6+K/mNbdEUkQRGrDgCxj+vR1BTD9G8EIC1Dr0y7F
 NRa3+ZxR/e1uR7rThkSZ6SLCKrzUeAuCp85mz2kg3lNhyKl3kz7EDNf3jH1vyVTi2I
 H7ByDIJ/kzpIc8xZFEzwNUQqyoRAeyTLttFHVElO34ZVjbo0wsGuMfLr/jQTIiNq0G
 IowVm/oItYDlR0ZVJp2qrxRtNHxugUc8j45jRMsuHO81TfgBRxvuxhAJGkLr4h1XQH
 7h05n7Bu3PSMdDs7p2yrOeKuFOVPcaR3dY+i2ZkOycSr8Ga34LLYDP+XBKtQ5jAsB7
 2CEUg+1OYLf4g==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v7 06/10] drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to
 panfrost
Date: Thu,  7 Dec 2023 14:48:27 +0530
Message-Id: <20231207091831.660054-7-vignesh.raman@collabora.com>
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

Mediatek 8173 and 8183 SOCs have a separate display controller
and GPU with different drivers for each. For mt8173, the GPU
driver is powervr and the display driver is mediatek. In the
case of mt8183, the GPU driver is panfrost and the display
driver is mediatek. Setting IGT_FORCE_DRIVER to panfrost for
mt8173 is not the expected driver. So set mediatek for mt8173.

Support to test both GPU and display drivers for these ARM SOCs
will be added in the next patch series to increase test coverage.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173

v6:
  - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173

v7:
  - Rework the fix and reword commit message

---
 drivers/gpu/drm/ci/igt_runner.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index c6cf963592c5..f1a08b9b146f 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,9 +20,16 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|mediatek|meson)
+    rockchip|meson)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
+    mediatek)
+        if [ "$GPU_VERSION" = "mt8173" ]; then
+            export IGT_FORCE_DRIVER=${DRIVER_NAME}
+        elif [ "$GPU_VERSION" = "mt8183" ]; then
+            export IGT_FORCE_DRIVER="panfrost"
+        fi
+        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89A82EC51
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FDA10E362;
	Tue, 16 Jan 2024 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48ED10E362
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705398958;
 bh=py8W8Asz6iLe+zesCfN7lkNBclqdDY+sNYRWL+acWNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q33qlN5C3QOawEnjwhIwxeamlUwIULyZc5ROCjgkxM0xbGvHo4F9GT6rf0NB/a+Sh
 JWyQyGCVhATE5xVNBEOv9EUpKOpJQYCJQI9T84EpyKGuL75dfbv/A1njeSVYSXHinv
 T1hzjOVvJtsP3w1H79FEsRoULr3BW4Gf6VOkwNqnPPlTNIPCYgOqdsO0qbWJFwhXw7
 V6TTwh06oUo9jmasF7aVHZ/xBBE/EsjjdvaLcd567TiGwZg53oDwgNpvPZ10mzPHpI
 AL6ajO5Q+k+voViAKDduLlWAhBNluGe2E0bjjp4Cg1Pb/YbChlp7pQicSQRUW+fCaB
 2ATW/vDWY539w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 67ED03782067;
 Tue, 16 Jan 2024 09:55:54 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/ci: meson: Add job to test panfrost GPU driver
Date: Tue, 16 Jan 2024 15:24:37 +0530
Message-Id: <20240116095439.107324-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116095439.107324-1-vignesh.raman@collabora.com>
References: <20240116095439.107324-1-vignesh.raman@collabora.com>
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
 daniel@fooishbar.org, david.heidelberg@collabora.com,
 helen.koike@collabora.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For amlogic meson SOC the GPU driver is panfrost. So add
support in drm-ci to test panfrost driver for amlogic meson
SOC and update xfails.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for amlogic meson SOC with new xfails.

---
 drivers/gpu/drm/ci/test.yml                      |  7 +++++++
 .../drm/ci/xfails/panfrost-g12b-gpu-fails.txt    | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8a04f7daafed..1493da288ab2 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -358,6 +358,13 @@ mediatek:mt8183-display:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-gpu
+    DRIVER_NAME: panfrost
+
 meson:g12b-display:
   extends:
     - .g12b
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
new file mode 100644
index 000000000000..56a2ae7047b4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
@@ -0,0 +1,16 @@
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_plane_cursor@overlay,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
-- 
2.40.1


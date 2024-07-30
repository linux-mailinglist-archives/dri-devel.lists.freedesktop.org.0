Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0294045A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 04:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383810E3AD;
	Tue, 30 Jul 2024 02:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QmwZ6vTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F24310E38A;
 Tue, 30 Jul 2024 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722305807;
 bh=aPC4lqVpqndGrwQFtOuzXyLxaYVgQ+nFEt7rSHAt3Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QmwZ6vTgwhXQZc/u3sa8xfIn9umbm0qSCaTBk12dWGsNA5kRRTGmE5imibjwdrGNF
 PGTts8Zs+VI8X9TWQzb5efXy48xUrr/Yc8Z1iYGfZ7NqzGVYULBX32t6+rIL8PxI6O
 xEkBvtsLO8c2nYT7rqNEFXAjKIkR5m3A1AMgnd4CVXNxRs+uLxrG6kfZ4cD5x7hfsW
 ZD7ioI5fbsNMZVTpESCY9j4dGKKZl5IsZXlBxf29fpOJtpDycMG8fA+amFTkPpYFpi
 JhPIGkLod8zk4DDqP/eh3ej4sgzaEZ0pAISRSqxlR/YEEZgA4XwsY5Q+u+Eh4znuld
 qphAc2CPPqcVQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEE3F3782190;
 Tue, 30 Jul 2024 02:16:42 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com, melissa.srw@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] drm/ci: skip tools_test on non-intel platforms
Date: Tue, 30 Jul 2024 07:45:37 +0530
Message-ID: <20240730021545.912271-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
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

tools_test is a wrapper for running tools/intel_reg
and tools/intel_l3_parity. So skip these tests on
non-intel platforms and update expectaion files.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v9:
  - New patch in the series to skip tools_test on non-intel platforms

---
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt                | 1 -
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt                | 1 +
 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt              | 1 -
 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt              | 1 +
 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt              | 1 -
 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt              | 1 +
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt                   | 1 -
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt                   | 1 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt                  | 1 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt                  | 1 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt                  | 1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt                  | 1 +
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 -
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 1 +
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 -
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 1 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt                   | 1 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt                   | 1 +
 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt              | 1 -
 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt              | 1 +
 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt              | 1 -
 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt              | 1 +
 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt              | 1 -
 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt              | 1 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt                    | 1 -
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt                    | 1 +
 26 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index 2f74880671ca..8e2fed6d76a3 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -38,4 +38,3 @@ kms_plane@pixel-format,Fail
 kms_plane_cursor@primary,Fail
 kms_rotation_crc@primary-rotation-180,Fail
 perf@i915-ref-count,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index 931d6d1d0165..f41b3e112976 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -13,6 +13,7 @@ nouveau_.*
 gem_.*
 i915_.*
 xe_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 95aadef2fa2d..a14349a1967f 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -34,4 +34,3 @@ kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@plane-properties-atomic,Fail
 kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
index 562662eff802..8198e06344a3 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -10,6 +10,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 5b7d623f404b..70053ea74b5d 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -5,4 +5,3 @@ dumb_buffer@map-invalid-size,Fail
 dumb_buffer@map-uaf,Fail
 dumb_buffer@map-valid,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index 03eefa518afa..aeec535107c1 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -9,6 +9,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 5b7d623f404b..70053ea74b5d 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -5,4 +5,3 @@ dumb_buffer@map-invalid-size,Fail
 dumb_buffer@map-uaf,Fail
 dumb_buffer@map-valid,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
index 03eefa518afa..aeec535107c1 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -9,6 +9,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index b57884650306..4ac46168eff3 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -9,4 +9,3 @@ kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
 msm/msm_mapping@ring,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
index ef7697190fff..1674c8e214d6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
@@ -9,6 +9,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 46ca69ce2ffe..bd0653caf7a0 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -5,4 +5,3 @@ device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_lease@lease-uevent,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index 244324d38964..5550be5486ed 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -12,6 +12,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 8e02392a24cb..d42004cd6977 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -43,4 +43,3 @@ kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_plane_lowres@tiling-none,Fail
 kms_rmfb@close-fd,Fail
 kms_vblank@ts-continuation-dpms-rpm,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index bd5a975a1b2f..c2833eee1c4b 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -12,6 +12,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 8e02392a24cb..d42004cd6977 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -43,4 +43,3 @@ kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_plane_lowres@tiling-none,Fail
 kms_rmfb@close-fd,Fail
 kms_vblank@ts-continuation-dpms-rpm,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index d06c3621300d..7c69c1f1d55b 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -12,6 +12,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index 8f010c8a9c4f..770a1c685fde 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -33,4 +33,3 @@ kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_plane_cursor@overlay,Fail
 kms_plane_cursor@viewport,Fail
 kms_rmfb@close-fd,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index 041a9637cc3e..90651048ab61 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -17,6 +17,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 10689906da3a..99928a24e636 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -5,4 +5,3 @@ dumb_buffer@map-invalid-size,Crash
 dumb_buffer@map-uaf,Crash
 dumb_buffer@map-valid,Crash
 panfrost/panfrost_prime@gem-prime-import,Crash
-tools_test@tools_test,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index b8cb31842323..e86ff00dc58a 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -62,6 +62,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 5b7d623f404b..70053ea74b5d 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -5,4 +5,3 @@ dumb_buffer@map-invalid-size,Fail
 dumb_buffer@map-uaf,Fail
 dumb_buffer@map-valid,Fail
 panfrost/panfrost_prime@gem-prime-import,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 743f3eeb2f80..8f22ff6d8cb7 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -15,6 +15,7 @@ nouveau_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+tools_test.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 248943c2a738..c72fee70e739 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -187,4 +187,3 @@ kms_vblank@wait-forked,Fail
 kms_vblank@wait-forked-busy,Fail
 kms_vblank@wait-idle,Fail
 perf@i915-ref-count,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 8198905c5fd4..9c9e048725f8 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -18,6 +18,7 @@ nouveau_.*
 gem_.*
 i915_.*
 xe_.*
+tools_test.*
 
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 8385b26073ed..5408110f4c60 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -50,4 +50,3 @@ kms_writeback@writeback-fb-id-XRGB2101010,Fail
 kms_writeback@writeback-invalid-parameters,Fail
 kms_writeback@writeback-pixel-formats,Fail
 perf@i915-ref-count,Fail
-tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
index 6c1f2b2b6e53..5ccc771fbb36 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -218,3 +218,4 @@ nouveau_.*
 gem_.*
 i915_.*
 xe_.*
+tools_test.*
-- 
2.43.0


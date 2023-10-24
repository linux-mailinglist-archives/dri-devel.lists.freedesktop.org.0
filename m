Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19D7D4433
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34DD10E25E;
	Tue, 24 Oct 2023 00:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644B10E25A;
 Tue, 24 Oct 2023 00:46:45 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D88B660576C;
 Tue, 24 Oct 2023 01:46:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108403;
 bh=L9lPvjtjoqQeS9ATr3/LME6E1fBL+WAdAssl0iz8GmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fLtmdNwfjrD04FZg0MIwgYCatU/tg77wGpixqm/eShdVcbXn4NDIEHdeEbvTN+A6c
 C7NvPqq1yZRyT0UJl+w8GvO1pRA2IybPZnnJiIq0r35VQU/has8Pe0Apj1Sd24FllP
 Mqusp5WPzplVrFZpeSwFuTGEVIPVdcw504PPIRYNSUAC5nk9yGi3aH1eaXT0Ie4/FV
 rKkCKxckUi/W5Dc3aoiK+5V7MiqYVfeZhAFYlOO+gGlEdAnK5VHAeWupoTgAaOoXB7
 MDzXPUq7JRhH0Q6heY+XIs4yrZiGDoUMT4AQbrc/vE4NcEeTmC/YLr8O1vE56DDjDx
 q6dBvy1LcyTWQ==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v3 05/10] drm/ci: clean up xfails (specially flakes list)
Date: Mon, 23 Oct 2023 21:45:20 -0300
Message-Id: <20231024004525.169002-6-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com,
 linux-rockchip@lists.infradead.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, david.heidelberg@collabora.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the script that collected the list of the expectation files was
bogus and placing test to the flakes list incorrectly, restart the
expectation files with the correct script.

This reduces a lot the number of tests in the flakes list.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- fix typo in the commit message
- re-add kms_cursor_legacy@flip-vs-cursor-toggle back to msm-sdm845-flakes.txt
- removed kms_async_flips@crc,Fail from i915-cml-fails.txt

v3:
- add kms_rmfb@close-fd,Fail to amdgpu-stoney-fails.txt
- add kms_async_flips@crc to i915-kbl-flakes.txt

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 12 +++++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    | 20 ---------
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  9 ++++
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    | 32 ---------------
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  | 11 -----
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  1 -
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 14 ++++++-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt | 38 -----------------
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  | 17 ++++++++
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt | 41 -------------------
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |  7 ++++
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt | 25 -----------
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  1 -
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |  5 ---
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |  1 -
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  0
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  5 ++-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  | 14 -------
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 14 ++++---
 .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |  4 --
 .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  4 --
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |  4 --
 .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    | 15 ++++---
 .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   | 24 +++++++----
 .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    | 18 +-------
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  9 +---
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 19 +++++----
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  6 +++
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  9 ----
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 40 +++++++++++++++++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  | 28 +++----------
 .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |  0
 33 files changed, 162 insertions(+), 287 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt

diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index bd9392536e7c..ea87dc46bc2b 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,8 +1,14 @@
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
+kms_addfb_basic@too-high,Fail
+kms_async_flips@async-flip-with-page-flip-events,Fail
+kms_async_flips@crc,Fail
 kms_async_flips@invalid-async-flip,Fail
-kms_atomic@plane-immutable-zpos,Fail
+kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
+kms_atomic_transition@plane-all-transition,Fail
+kms_atomic_transition@plane-all-transition-nonblocking,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
+kms_atomic_transition@plane-use-after-nonblocking-unbind,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
@@ -11,9 +17,11 @@ kms_color@degamma,Fail
 kms_cursor_crc@cursor-size-change,Fail
 kms_cursor_crc@pipe-A-cursor-size-change,Fail
 kms_cursor_crc@pipe-B-cursor-size-change,Fail
-kms_cursor_legacy@forked-move,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
 kms_hdr@bpc-switch,Fail
 kms_hdr@bpc-switch-dpms,Fail
+kms_plane@pixel-format,Fail
 kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
 kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index f8defa0f9e67..6faf75e667d3 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1,21 +1 @@
-kms_addfb_basic@too-high
-kms_async_flips@alternate-sync-async-flip
 kms_async_flips@async-flip-with-page-flip-events
-kms_async_flips@crc
-kms_async_flips@test-cursor
-kms_async_flips@test-time-stamp
-kms_atomic_transition@plane-all-modeset-transition-internal-panels
-kms_atomic_transition@plane-all-transition
-kms_atomic_transition@plane-use-after-nonblocking-unbind
-kms_bw@linear-tiling-1-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-3840x2160p
-kms_cursor_crc@pipe-A-cursor-alpha-opaque
-kms_cursor_crc@pipe-B-cursor-alpha-opaque
-kms_plane@pixel-format
-kms_plane_multiple@atomic-pipe-B-tiling-none
-kms_plane_scaling@downscale-with-rotation-factor-0-5
-kms_universal_plane@disable-primary-vs-flip-pipe-A
-kms_universal_plane@disable-primary-vs-flip-pipe-B
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 5f513c638beb..59438e4df86e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -2,6 +2,10 @@ kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -10,7 +14,12 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
deleted file mode 100644
index d5000515a315..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-2560x1440p
-kms_bw@linear-tiling-2-displays-3840x2160p
-kms_bw@linear-tiling-3-displays-1920x1080p
-kms_bw@linear-tiling-3-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-3840x2160p
-kms_bw@linear-tiling-4-displays-1920x1080p
-kms_bw@linear-tiling-4-displays-2560x1440p
-kms_bw@linear-tiling-4-displays-3840x2160p
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
-kms_plane_alpha_blend@pipe-A-alpha-basic
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-A-constant-alpha-max
-kms_plane_alpha_blend@pipe-B-alpha-basic
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-B-constant-alpha-max
-kms_plane_alpha_blend@pipe-C-alpha-basic
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-C-constant-alpha-max
-kms_sysfs_edid_timing
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 46397ce38d5a..2e3b7c5dac3c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -8,13 +8,6 @@ kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_bw@linear-tiling-4-displays-1920x1080p,Fail
 kms_bw@linear-tiling-4-displays-2560x1440p,Fail
 kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_color@ctm-0-25,Fail
-kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
-kms_color@ctm-max,Fail
-kms_color@ctm-negative,Fail
-kms_color@ctm-red-to-blue,Fail
-kms_color@ctm-signed,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -38,8 +31,6 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_hdmi_inject@inject-4k,Timeout
-kms_plane@plane-position-hole,Timeout
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
@@ -53,6 +44,4 @@ kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
 kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
 kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
 kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
-kms_plane_multiple@tiling-y,Timeout
-kms_pwrite_crc,Timeout
 kms_sysfs_edid_timing,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
deleted file mode 100644
index 331c5841bb41..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
+++ /dev/null
@@ -1 +0,0 @@
-kms_frontbuffer_tracking@fbc-tiling-linear
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 6139b410e767..240ef8467c26 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,8 +1,11 @@
-kms_color@ctm-0-25,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -11,8 +14,17 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_plane_alpha_blend@constant-alpha-min,Fail
+kms_psr2_su@page_flip-NV12,Fail
+kms_psr2_su@page_flip-P010,Fail
+kms_setmode@basic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
deleted file mode 100644
index 0514a7b3fdb0..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-2560x1440p
-kms_bw@linear-tiling-2-displays-3840x2160p
-kms_bw@linear-tiling-3-displays-1920x1080p
-kms_bw@linear-tiling-3-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-3840x2160p
-kms_bw@linear-tiling-4-displays-1920x1080p
-kms_bw@linear-tiling-4-displays-2560x1440p
-kms_bw@linear-tiling-4-displays-3840x2160p
-kms_draw_crc@draw-method-xrgb8888-render-xtiled
-kms_flip@flip-vs-suspend
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
-kms_hdr@bpc-switch-suspend
-kms_plane_alpha_blend@constant-alpha-min
-kms_plane_alpha_blend@pipe-A-alpha-basic
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-A-constant-alpha-max
-kms_plane_alpha_blend@pipe-B-alpha-basic
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-B-constant-alpha-max
-kms_plane_alpha_blend@pipe-C-alpha-basic
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-C-constant-alpha-max
-kms_psr2_su@page_flip-NV12
-kms_psr2_su@page_flip-P010
-kms_setmode@basic
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 5bd432e78129..4596055d7e5e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,8 +1,15 @@
 kms_fbcon_fbt@fbc,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -11,9 +18,19 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_rotation_crc@multiplane-rotation,Fail
+kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
+kms_rotation_crc@multiplane-rotation-cropping-top,Fail
+kms_setmode@basic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
deleted file mode 100644
index fc41d13a2d56..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-kms_bw@linear-tiling-1-displays-3840x2160p
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-2560x1440p
-kms_bw@linear-tiling-2-displays-3840x2160p
-kms_bw@linear-tiling-3-displays-1920x1080p
-kms_bw@linear-tiling-3-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-3840x2160p
-kms_bw@linear-tiling-4-displays-1920x1080p
-kms_bw@linear-tiling-4-displays-2560x1440p
-kms_bw@linear-tiling-4-displays-3840x2160p
-kms_flip@blocking-wf_vblank
-kms_flip@wf_vblank-ts-check
-kms_flip@wf_vblank-ts-check-interruptible
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
-kms_frontbuffer_tracking@fbc-tiling-linear
-kms_plane_alpha_blend@pipe-A-alpha-basic
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-A-constant-alpha-max
-kms_plane_alpha_blend@pipe-B-alpha-basic
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-B-constant-alpha-max
-kms_plane_alpha_blend@pipe-C-alpha-basic
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-C-constant-alpha-max
-kms_prop_blob@invalid-set-prop-any
-kms_rotation_crc@multiplane-rotation
-kms_rotation_crc@multiplane-rotation-cropping-bottom
-kms_rotation_crc@multiplane-rotation-cropping-top
-kms_setmode@basic
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index 56ec021a7679..dab202716909 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -4,7 +4,10 @@ kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
@@ -13,8 +16,12 @@ kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
index f3ba1c4c5d46..a12f888530dd 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
@@ -1,26 +1 @@
 kms_async_flips@crc
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_bw@linear-tiling-2-displays-3840x2160p
-kms_bw@linear-tiling-3-displays-1920x1080p
-kms_bw@linear-tiling-3-displays-2560x1440p
-kms_bw@linear-tiling-3-displays-3840x2160p
-kms_bw@linear-tiling-4-displays-1920x1080p
-kms_bw@linear-tiling-4-displays-3840x2160p
-kms_color@ctm-0-25
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
-kms_plane_alpha_blend@pipe-A-alpha-basic
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-B-alpha-basic
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb
-kms_plane_alpha_blend@pipe-B-constant-alpha-max
-kms_plane_alpha_blend@pipe-C-alpha-basic
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb
-kms_sysfs_edid_timing
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index a6da5544e198..27bfca1c6f2c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -8,7 +8,6 @@ kms_bw@linear-tiling-4-displays-3840x2160p,Fail
 kms_bw@linear-tiling-5-displays-1920x1080p,Fail
 kms_bw@linear-tiling-5-displays-2560x1440p,Fail
 kms_bw@linear-tiling-5-displays-3840x2160p,Fail
-kms_color@ctm-0-25,Fail
 kms_flip@flip-vs-panning-vs-hang,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
deleted file mode 100644
index 1cd910ee06df..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-kms_draw_crc@.*
-kms_flip@blocking-absolute-wf_vblank
-kms_flip@bo-too-big-interruptible
-kms_flip@busy-flip
-kms_flip@flip-vs-rmfb-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
deleted file mode 100644
index c33202e7e2a1..000000000000
--- a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
+++ /dev/null
@@ -1 +0,0 @@
-kms_flip@flip-vs-suspend
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
deleted file mode 100644
index e69de29bb2d1..000000000000
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 6ff81d00e84e..67d690fc4037 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -6,5 +6,8 @@ kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
+kms_plane_cursor@overlay,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
 kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_rmfb@close-fd,Fail
\ No newline at end of file
+kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
deleted file mode 100644
index 208890b79eb0..000000000000
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-core_setmaster_vs_auth
-kms_bw@linear-tiling-1-displays-1920x1080p
-kms_bw@linear-tiling-1-displays-3840x2160p
-kms_bw@linear-tiling-3-displays-1920x1080p
-kms_cursor_legacy@cursor-vs-flip-atomic
-kms_plane_scaling@invalid-num-scalers
-kms_plane_scaling@planes-upscale-20x20
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
-kms_plane_scaling@upscale-with-modifier-20x20
-kms_plane_scaling@upscale-with-pixel-format-20x20
-kms_prop_blob@invalid-set-prop-any
-kms_properties@get_properties-sanity-atomic
-kms_properties@plane-properties-atomic
-kms_properties@plane-properties-legacy
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 860e702091e2..56a2ae7047b4 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,12 +1,16 @@
 kms_3d,Fail
-kms_properties@connector-properties-atomic,Fail
-kms_properties@get_properties-sanity-atomic,Fail
-kms_properties@get_properties-sanity-non-atomic,Fail
-kms_properties@connector-properties-legacy,Fail
 kms_cursor_legacy@forked-bo,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@single-move,Fail
 kms_cursor_legacy@torture-bo,Fail
 kms_cursor_legacy@torture-move,Fail
-kms_hdmi_inject@inject-4k,Fail
\ No newline at end of file
+kms_force_connector_basic@force-edid,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_plane_cursor@overlay,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
deleted file mode 100644
index b63329d06767..000000000000
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-kms_force_connector_basic@force-connector-state
-kms_force_connector_basic@force-edid
-kms_force_connector_basic@force-load-detect
-kms_force_connector_basic@prune-stale-modes
\ No newline at end of file
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
deleted file mode 100644
index 0e3b60d3fade..000000000000
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-kms_force_connector_basic@force-connector-state
-kms_force_connector_basic@force-edid
-kms_force_connector_basic@force-load-detect
-kms_force_connector_basic@prune-stale-modes
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 88a1fc0a3b0d..2cd49e8ee47f 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,4 @@
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_hdmi_inject@inject-4k,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
deleted file mode 100644
index 0e3b60d3fade..000000000000
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-kms_force_connector_basic@force-connector-state
-kms_force_connector_basic@force-edid
-kms_force_connector_basic@force-load-detect
-kms_force_connector_basic@prune-stale-modes
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
index 14adeba3b62d..f71166a57731 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
@@ -1,12 +1,17 @@
+kms_color@ctm-0-25,Fail
+kms_color@ctm-0-50,Fail
+kms_color@ctm-0-75,Fail
+kms_color@ctm-blue-to-red,Fail
+kms_color@ctm-green-to-red,Fail
+kms_color@ctm-negative,Fail
+kms_color@ctm-red-to-blue,Fail
+kms_color@ctm-signed,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions,Crash
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
-kms_plane@plane-position-covered,Fail
-kms_plane@plane-position-hole,Fail
-kms_plane@plane-position-hole-dpms,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
index 636563d3e59a..04730044ed12 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
@@ -1,7 +1,17 @@
-
-# Test ends up reading CRC from frame before cursor update
-# bug
-# sometimes.. tbd if this is a kernel CRC bug or a test
-kms_cursor_crc@.*
-kms_plane_multiple@atomic-pipe-A-tiling-none
-kms_atomic_transition@modeset-transition-nonblocking-fencing,Fail
\ No newline at end of file
+kms_color@ctm-0-25
+kms_color@ctm-0-50
+kms_color@ctm-0-75
+kms_color@ctm-blue-to-red
+kms_color@ctm-green-to-red
+kms_color@ctm-negative
+kms_color@ctm-red-to-blue
+kms_color@ctm-signed
+kms_flip@flip-vs-modeset-vs-hang
+kms_flip@flip-vs-panning-vs-hang
+kms_plane@pixel-format
+kms_plane@pixel-format-source-clamping
+kms_plane@plane-position-covered
+kms_plane@plane-position-hole
+kms_plane@plane-position-hole-dpms
+kms_writeback@writeback-fb-id
+kms_writeback@writeback-invalid-parameters
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
index 410e0eeb3161..e59a2fddfde0 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
@@ -4,20 +4,4 @@
 # Test incorrectly assumes that CTM support implies gamma/degamma
 # LUT support.  None of the subtests handle the case of only having
 # CTM support
-kms_color.*
-
-# 4k@60 is not supported on this hw, but driver doesn't handle it
-# too gracefully.. https://gitlab.freedesktop.org/drm/msm/-/issues/15
-kms_bw@linear-tiling-.*-displays-3840x2160p
-
-# Until igt fix lands: https://patchwork.freedesktop.org/patch/493175/
-kms_bw@linear-tiling-2.*
-kms_bw@linear-tiling-3.*
-kms_bw@linear-tiling-4.*
-kms_bw@linear-tiling-5.*
-kms_bw@linear-tiling-6.*
-
-# igt fix posted: https://patchwork.freedesktop.org/patch/499926/
-# failure mode is flakey due to randomization but fails frequently
-# enough to be detected as a Crash or occasionally UnexpectedPass.
-kms_plane_multiple@atomic-pipe-A-tiling-none
+#kms_color.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index 09c0c623cd75..c55baa2d18c1 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -15,19 +15,16 @@ kms_color@pipe-A-ctm-max,Fail
 kms_color@pipe-A-ctm-negative,Fail
 kms_color@pipe-A-ctm-red-to-blue,Fail
 kms_color@pipe-A-legacy-gamma,Fail
-kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-after-cursor-legacy,Fail
 kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
-kms_cursor_legacy@basic-flip-before-cursor-varying-size,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
-kms_cursor_legacy@cursorA-vs-flipA-toggle,Fail
 kms_cursor_legacy@flip-vs-cursor-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
 kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
@@ -35,11 +32,9 @@ kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@short-flip-after-cursor-atomic-transitions,Fail
 kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size,Fail
 kms_cursor_legacy@short-flip-after-cursor-toggle,Fail
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Fail
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
index 5b3aaab7ac3f..16d205c04cbb 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
@@ -1,11 +1,12 @@
-
-
-# Test ends up reading CRC from frame before cursor update
-# bug
-# sometimes.. tbd if this is a kernel CRC bug or a test
-kms_cursor_crc@.*
+kms_cursor_legacy@basic-flip-after-cursor-atomic
+kms_cursor_legacy@basic-flip-before-cursor-varying-size
+kms_cursor_legacy@cursorA-vs-flipA-toggle
+kms_cursor_legacy@flip-vs-cursor-atomic-transitions
 kms_cursor_legacy@flip-vs-cursor-toggle
-kms_cursor_legacy@pipe-A-forked-bo
-kms_cursor_legacy@pipe-A-forked-move
+kms_cursor_legacy@flip-vs-cursor-varying-size
+kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
 kms_cursor_legacy@short-flip-before-cursor-toggle
-kms_flip@dpms-vs-vblank-race-interruptible
+kms_flip@flip-vs-modeset-vs-hang
+kms_flip@flip-vs-panning-vs-hang
+kms_plane@pixel-format
+kms_plane@pixel-format-source-clamping
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 2a1baa948e12..90c63f519e9e 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -5,8 +5,13 @@ kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
+kms_flip@flip-vs-modeset-vs-hang,Crash
+kms_flip@flip-vs-panning-vs-hang,Crash
 kms_force_connector_basic@force-load-detect,Fail
 kms_invalid_mode@int-max-clock,Crash
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
+kms_pipe_crc_basic@read-crc-frame-sequence,Crash
 kms_plane@pixel-format,Crash
 kms_plane@pixel-format-source-clamping,Crash
 kms_plane@plane-position-hole,Crash
@@ -45,4 +50,5 @@ kms_properties@connector-properties-atomic,Crash
 kms_properties@connector-properties-legacy,Crash
 kms_properties@get_properties-sanity-atomic,Crash
 kms_properties@get_properties-sanity-non-atomic,Crash
+kms_rmfb@close-fd,Crash
 kms_setmode@invalid-clone-single-crtc,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
deleted file mode 100644
index 45c54c75c899..000000000000
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-kms_addfb_basic@addfb25-bad-modifier
-kms_cursor_crc@.*
-kms_flip@basic-flip-vs-wf_vblank
-kms_invalid_mode@int-max-clock,Crash
-kms_pipe_crc_basic@.*
-kms_properties@connector-properties-atomic,Crash
-kms_properties@get_properties-sanity-atomic,Crash
-kms_properties@get_properties-sanity-non-atomic,Crash
-kms_rmfb@close-fd
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 6db08ba6b008..d516d9c1d546 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,15 +1,40 @@
+kms_color@gamma,Fail
 kms_color@legacy-gamma,Fail
 kms_color@pipe-A-legacy-gamma,Fail
 kms_color@pipe-B-legacy-gamma,Fail
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
 kms_flip@dpms-vs-vblank-race,Fail
 kms_flip@flip-vs-absolute-wf_vblank,Fail
 kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
 kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
-kms_flip@flip-vs-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@modeset-vs-vblank-race,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
@@ -17,11 +42,21 @@ kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@disable-crc-after-crtc,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
 kms_plane@pixel-format,Fail
 kms_plane@pixel-format-source-clamping,Fail
 kms_plane@plane-panning-bottom-right,Fail
 kms_plane@plane-panning-top-left,Fail
 kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
+kms_plane_cursor@overlay,Fail
 kms_plane_cursor@pipe-B-overlay-size-128,Fail
 kms_plane_cursor@pipe-B-overlay-size-256,Fail
 kms_plane_cursor@pipe-B-overlay-size-64,Fail
@@ -31,7 +66,10 @@ kms_plane_cursor@pipe-B-primary-size-64,Fail
 kms_plane_cursor@pipe-B-viewport-size-128,Fail
 kms_plane_cursor@pipe-B-viewport-size-256,Fail
 kms_plane_cursor@pipe-B-viewport-size-64,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
 kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
 kms_plane_multiple@tiling-none,Fail
 kms_prime@basic-crc,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-pipe-B-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index 4c0539b4beaf..c9fdc623ab91 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -1,23 +1,7 @@
-
-kms_cursor_crc@.*
+kms_bw@linear-tiling-2-displays-1920x1080p
+kms_cursor_crc@cursor-offscreen-64x21
 kms_flip@dpms-vs-vblank-race-interruptible
-kms_flip@flip-vs-expired-vblank
-kms_flip@modeset-vs-vblank-race-interruptible
-kms_pipe_crc_basic@.*
-kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-A
-kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-B
-kms_plane@plane-position-hole
-kms_plane_multiple@atomic-pipe-A-tiling-none
-kms_plane_multiple@atomic-pipe-B-tiling-none
-kms_sequence@get-forked
-kms_sequence@get-forked-busy
-kms_setmode@basic
-kms_universal_plane@universal-plane-pipe-B-functional,UnexpectedPass
-kms_vblank@pipe-A-accuracy-idle
-kms_vblank@pipe-A-query-busy
-kms_vblank@pipe-A-query-forked-busy
-kms_vblank@pipe-A-wait-idle
-kms_vblank@pipe-B-accuracy-idle
-kms_vblank@pipe-B-query-busy
-kms_vblank@pipe-B-query-forked-busy
-kms_vblank@pipe-B-wait-idle
+kms_flip@flip-vs-wf_vblank-interruptible
+kms_plane_cursor@overlay
+kms_plane_cursor@primary
+kms_plane_cursor@viewport
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.39.2


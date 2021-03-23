Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6A3463AF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5C6EBD0;
	Tue, 23 Mar 2021 15:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960F6EBB5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:44 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u9so27930148ejj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjqZBUBZgIpVWVu9TObFdgUHN0Qr0dzrZ1VicN5V84s=;
 b=ohfMW5dlbfZwwZAoJXHJjJgmHZW79y4rCcTEkoHu+nYUv04GujFrDcpAaG0n3w9iTh
 DHXrSHKEssKncHBcztUpowwYjuzkcRP7cnaKh2rNoIPCvzHqXEZ6hWPRdvB984/n+Ex+
 2QU+FUzRhaYLAhf+nCCPUKReQcSxueh1w8WY+QkFpXt53YfTn/+AkdjXoCVXU73xfZdp
 TOFBCuMu4vFxQ2v5isg5uX1eWsIBmlZwqrc7uOOWtmX1TYa6CmEzXHJsDmT8RkTAl6L1
 VVRgwXAR1eLDOB+RNjp2njQAfyVjUITiNyf6a1aI0GQLBMVBziLOYeIMTrNcHPI8ijZK
 VB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjqZBUBZgIpVWVu9TObFdgUHN0Qr0dzrZ1VicN5V84s=;
 b=aSLeUZgPM1FjOTr/gpefBWGPUd904y2BNeHqyuDHDOhTigU+N+5TxLBvdi0k7JFNtf
 gtt1n/5zuHQ+IRis6pP3T8ZbQCABH9rqjQxWZZ7iNAPKkNgrr7s1iWgNnlS2QxPEyFgX
 cvGHk6kD29rFyhUl8jnrRo6yt5j+E8sbOO7yj5gNYGHFhamu9lzdNrUVtLfvtJ+TkpA3
 ZG/Uf7RA3BRr2zlR7iN2SAyhgHu5h5a9GXZGiw2gWV5DOnJ0prDtggszflmGpwQ2byjY
 uUAyRRmAQV7E4qi2kiQbgD2VD3EWKynR7N2M4abpFuotE/b0hsc2eeIYRA1fdD+mHshO
 yi6A==
X-Gm-Message-State: AOAM532AiVRf4dw2P6EHaP9vWumgELFlVbp+f8tle9wIoSoxIn86FW/n
 0h1IwS3dZrXdNmGvHIEgnP0=
X-Google-Smtp-Source: ABdhPJyRnzttmqkT/H/wVCyuX3ibNR9HLG6dbP5surBFhEaVKSpbgL17I0hjIQG3LaKejmyv/ZzwlQ==
X-Received: by 2002:a17:906:2504:: with SMTP id
 i4mr5644433ejb.115.1616514883658; 
 Tue, 23 Mar 2021 08:54:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id cb17sm13299695edb.10.2021.03.23.08.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:42 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 9/9] drm/tegra: Support sector layout on Tegra194
Date: Tue, 23 Mar 2021 16:54:37 +0100
Message-Id: <20210323155437.513497-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Tegra194 has a special physical address bit that enables some memory
swizzling logic to support different sector layouts. Support the bit
that selects the sector layout which is passed in the framebuffer
modifier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c    |  7 +++++++
 drivers/gpu/drm/tegra/dc.h    |  1 +
 drivers/gpu/drm/tegra/drm.h   |  3 +++
 drivers/gpu/drm/tegra/fb.c    |  9 +++++++++
 drivers/gpu/drm/tegra/gem.h   |  6 ++++++
 drivers/gpu/drm/tegra/hub.c   | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c | 24 ++++++++++++++++++++++++
 7 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 927e6f5a2c24..742608b30527 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2326,6 +2326,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2345,6 +2346,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 8,
 	.has_powergate = false,
@@ -2364,6 +2366,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.supports_interlacing = false,
 	.supports_cursor = false,
 	.supports_block_linear = false,
+	.supports_sector_layout = false,
 	.has_legacy_blending = true,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2383,6 +2386,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2402,6 +2406,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = true,
@@ -2455,6 +2460,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = false,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
@@ -2503,6 +2509,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.supports_interlacing = true,
 	.supports_cursor = true,
 	.supports_block_linear = true,
+	.supports_sector_layout = true,
 	.has_legacy_blending = false,
 	.pitch_align = 64,
 	.has_powergate = false,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 21074cd2ce5e..29f19c3c6149 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -52,6 +52,7 @@ struct tegra_dc_soc_info {
 	bool supports_interlacing;
 	bool supports_cursor;
 	bool supports_block_linear;
+	bool supports_sector_layout;
 	bool has_legacy_blending;
 	unsigned int pitch_align;
 	bool has_powergate;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 9a089b93da24..fe1a37e95bfa 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -24,6 +24,9 @@
 #include "hub.h"
 #include "trace.h"
 
+/* XXX move to include/uapi/drm/drm_fourcc.h? */
+#define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT(22)
+
 struct reset_control;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 350f33206076..c04dda8353fd 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,6 +44,15 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if ((modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) == 0)
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
+		else
+			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_GPU;
+
+		modifier &= ~DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT;
+	}
+
 	switch (modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
 		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index fafb5724499b..c15fd99d6cb2 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -21,9 +21,15 @@ enum tegra_bo_tiling_mode {
 	TEGRA_BO_TILING_MODE_BLOCK,
 };
 
+enum tegra_bo_sector_layout {
+	TEGRA_BO_SECTOR_LAYOUT_TEGRA,
+	TEGRA_BO_SECTOR_LAYOUT_GPU,
+};
+
 struct tegra_bo_tiling {
 	enum tegra_bo_tiling_mode mode;
 	unsigned long value;
+	enum tegra_bo_sector_layout sector_layout;
 };
 
 struct tegra_bo {
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 500c9d37e654..79bff8b48271 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -55,6 +55,18 @@ static const u64 tegra_shared_plane_modifiers[] = {
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
 	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
+	/*
+	 * The GPU sector layout is only supported on Tegra194, but these will
+	 * be filtered out later on by ->format_mod_supported() on SoCs where
+	 * it isn't supported.
+	 */
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5) | DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT,
+	/* sentinel */
 	DRM_FORMAT_MOD_INVALID
 };
 
@@ -366,6 +378,12 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (tiling->sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU &&
+	    !dc->soc->supports_sector_layout) {
+		DRM_ERROR("hardware doesn't support GPU sector layout\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -485,6 +503,16 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 
 	base = tegra_plane_state->iova[0] + fb->offsets[0];
 
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	/*
+	 * Physical address bit 39 in Tegra194 is used as a switch for special
+	 * logic that swizzles the memory using either the legacy Tegra or the
+	 * dGPU sector layout.
+	 */
+	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
+		base |= BIT(39);
+#endif
+
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 793da5d675d2..1e0eae8b4342 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -83,6 +83,22 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 
+static bool tegra_plane_supports_sector_layout(struct drm_plane *plane)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, plane->dev) {
+		if (plane->possible_crtcs & drm_crtc_mask(crtc)) {
+			struct tegra_dc *dc = to_tegra_dc(crtc);
+
+			if (!dc->soc->supports_sector_layout)
+				return false;
+		}
+	}
+
+	return true;
+}
+
 static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 					     uint32_t format,
 					     uint64_t modifier)
@@ -92,6 +108,14 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
+	/* check for the sector layout bit */
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
+		if (modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) {
+			if (!tegra_plane_supports_sector_layout(plane))
+				return false;
+		}
+	}
+
 	if (info->num_planes == 1)
 		return true;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

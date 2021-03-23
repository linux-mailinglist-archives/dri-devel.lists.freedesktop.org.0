Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0F3463A8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149DD6EB3A;
	Tue, 23 Mar 2021 15:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD06EB9F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l4so27912123ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70K9kjsbo/1i6Slzcj1yYSLIt8mASpZL8dGDcRzh0Ik=;
 b=nJLarwD4oPtgCbyP0lSZN5xDM8JkJ+kRCf+V635taW9CJW9xyMzFnREUvxmxVuasmV
 e2PRRJAMINKWlotnxFDMtSU4pCpqXgi0NS/v5w6+ZJSpf0lMsE3FmR7eHGZkbZUB5Dts
 JEjw0z2DIyoezuBTvzVa3UvOpvl8x1kPIN8okiP3tf7aGZkGguOInP+RGWjM5fxs7175
 snlocXPLqo9d9p+FSPUln2z/iPHFbVkY8rMkxZ8GjN5+kPnMkg77TBAyMqKGDqGEgbzf
 aA2kIN2AAfftM3/jThdN3gMzQaUfVOIglV1XE+J+1Q3DqkxheSDR4kjv77IONcWRelPD
 CkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70K9kjsbo/1i6Slzcj1yYSLIt8mASpZL8dGDcRzh0Ik=;
 b=m78eg+Lbkr3VnguKBUe5pL6nbe2C1RX15p+OSsLF//GlsfMt3kXorFG/HrsnJNZH5s
 gZ53Vfq1lcu7z30OCpy4dJYEKBMypqeKr/yIB303r6Wjsjbug/obkpy6plhZAbV72Aa1
 0jSa9r0Q02ocE1NMjVpFqzgBjBDrVaF4ReQfHojhfMkKzlme2LBVt/06qHUcKaQSyE8/
 JTNo59bFYuzzRpKBkJrrZE/yDwpAhwXy+J+GTd0XROhtoUDvyfPD/3tEoQNVDIRLvhTi
 h0YlO7hHH8MS4n/V5PoF3fA2a2QBWRhtmLPp9FpeZY/cril3AkJ2OPl0fszzIyh7D3IO
 YgCQ==
X-Gm-Message-State: AOAM530/ida9Kte/S9zPeMQfdnz6r46J93ZqDrTYmaaDr5X2lRkmjhjM
 7+N1D9PcCZKGiS3qund3zH4=
X-Google-Smtp-Source: ABdhPJzTKukWTcEzkZ2Q6Rl27C/DLbej184vQL4L32XCIgYd71WZQjEyH4m/FBuqUnVrxhjdxcCqog==
X-Received: by 2002:a17:906:b2d6:: with SMTP id
 cf22mr5515453ejb.321.1616514871587; 
 Tue, 23 Mar 2021 08:54:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u13sm11560894ejn.59.2021.03.23.08.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/9] drm/tegra: dc: Implement hardware cursor on Tegra186 and
 later
Date: Tue, 23 Mar 2021 16:54:32 +0100
Message-Id: <20210323155437.513497-5-thierry.reding@gmail.com>
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

The hardware cursor on Tegra186 differs slightly from the implementation
on older SoC generations. In particular the new implementation relies on
software for clipping the cursor against the screen. Fortunately, atomic
KMS already computes clipped coordinates for (cursor) planes, so this is
trivial to implement.

The format supported by the hardware cursor is also slightly different.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 62 +++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/dc.h |  5 +++
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 1886ef1fcda7..4262fd9b9a15 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -832,10 +832,14 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	return &plane->base;
 }
 
-static const u32 tegra_cursor_plane_formats[] = {
+static const u32 tegra_legacy_cursor_plane_formats[] = {
 	DRM_FORMAT_RGBA8888,
 };
 
+static const u32 tegra_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
 static int tegra_cursor_atomic_check(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
@@ -875,12 +879,22 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
-	u32 value = CURSOR_CLIP_DISPLAY;
+	struct tegra_drm *tegra = plane->dev->dev_private;
+	u64 dma_mask = *dc->dev->dma_mask;
+	unsigned int x, y;
+	u32 value = 0;
 
 	/* rien ne va plus */
 	if (!new_state->crtc || !new_state->fb)
 		return;
 
+	/*
+	 * Legacy display supports hardware clipping of the cursor, but
+	 * nvdisplay relies on software to clip the cursor to the screen.
+	 */
+	if (!dc->soc->has_nvdisplay)
+		value |= CURSOR_CLIP_DISPLAY;
+
 	switch (new_state->crtc_w) {
 	case 32:
 		value |= CURSOR_SIZE_32x32;
@@ -908,7 +922,7 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
 
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	value = (tegra_plane_state->iova[0] >> 32) & 0x3;
+	value = (tegra_plane_state->iova[0] >> 32) & (dma_mask >> 32);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
 #endif
 
@@ -920,15 +934,42 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	value = tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
 	value &= ~CURSOR_DST_BLEND_MASK;
 	value &= ~CURSOR_SRC_BLEND_MASK;
-	value |= CURSOR_MODE_NORMAL;
+
+	if (dc->soc->has_nvdisplay)
+		value &= ~CURSOR_COMPOSITION_MODE_XOR;
+	else
+		value |= CURSOR_MODE_NORMAL;
+
 	value |= CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
 	value |= CURSOR_SRC_BLEND_K1_TIMES_SRC;
 	value |= CURSOR_ALPHA;
 	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
 
+	/* nvdisplay relies on software for clipping */
+	if (dc->soc->has_nvdisplay) {
+		unsigned int i, j, w, h;
+
+		x = new_state->dst.x1;
+		y = new_state->dst.y1;
+
+		i = new_state->src.x1 >> 16;
+		j = new_state->src.y1 >> 16;
+
+		value = ((j & tegra->vmask) << 16) | (i & tegra->hmask);
+		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR);
+
+		w = (new_state->src.x2 - new_state->src.x1) >> 16;
+		h = (new_state->src.y2 - new_state->src.y1) >> 16;
+
+		value = ((h & tegra->vmask) << 16) | (w & tegra->hmask);
+		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR);
+	} else {
+		x = new_state->crtc_x;
+		y = new_state->crtc_y;
+	}
+
 	/* position the cursor */
-	value = (new_state->crtc_y & 0x3fff) << 16 |
-		(new_state->crtc_x & 0x3fff);
+	value = ((y & tegra->vmask) << 16) | (x & tegra->hmask);
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
@@ -982,8 +1023,13 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	plane->index = 6;
 	plane->dc = dc;
 
-	num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
-	formats = tegra_cursor_plane_formats;
+	if (!dc->soc->has_nvdisplay) {
+		num_formats = ARRAY_SIZE(tegra_legacy_cursor_plane_formats);
+		formats = tegra_legacy_cursor_plane_formats;
+	} else {
+		num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
+		formats = tegra_cursor_plane_formats;
+	}
 
 	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
 				       &tegra_plane_funcs, formats,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 051d03dcb9b0..21074cd2ce5e 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -511,6 +511,8 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
 #define DC_DISP_CURSOR_START_ADDR_HI		0x4ec
 #define DC_DISP_BLEND_CURSOR_CONTROL		0x4f1
+#define CURSOR_COMPOSITION_MODE_BLEND		(0 << 25)
+#define CURSOR_COMPOSITION_MODE_XOR		(1 << 25)
 #define CURSOR_MODE_LEGACY			(0 << 24)
 #define CURSOR_MODE_NORMAL			(1 << 24)
 #define CURSOR_DST_BLEND_ZERO			(0 << 16)
@@ -705,6 +707,9 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define PROTOCOL_MASK (0xf << 8)
 #define PROTOCOL_SINGLE_TMDS_A (0x1 << 8)
 
+#define DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR	0x442
+#define DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR	0x446
+
 #define DC_WIN_CORE_WINDOWGROUP_SET_CONTROL	0x702
 #define OWNER_MASK (0xf << 0)
 #define OWNER(x) (((x) & 0xf) << 0)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

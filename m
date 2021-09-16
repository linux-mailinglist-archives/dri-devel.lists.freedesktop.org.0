Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78CF40D687
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC7A6EB38;
	Thu, 16 Sep 2021 09:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F376EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so6913983wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVKdrbzIrE9dLJQ15eCGOL8LxPqi/Q9epUelIQZtiEk=;
 b=bUyApd5wx9fiXju/Xi8m/UUXPT9XRV7Dax/KTtTwyE7LywZxZsymSvW8o0/j5dKBGE
 6dMGXlYSYKcv7Q8Xm1Q9Qh8kytyCsxrofLMNYnpGkWYAYGSHl7UDfu8lF/9Nn9A0egL3
 qK8oWO1RPF2w/pHDA97soEwmhSMxDMJfrEFhw0fkwoRRAIhaM3rirG+fPZGxr/Tmb3XY
 fH+P4eR0jZET3rzBshoSArXBvh7jQWEq2swESJGE/PZimufR6ebKcNyqjE/8kHXR3Hln
 TJe8xvdZnD0HDXcnbJSmdSP3yGN/9EI4r8ebYKFo3kT1QDpeBiuf2pnzi/G9I/0xijYj
 zfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AVKdrbzIrE9dLJQ15eCGOL8LxPqi/Q9epUelIQZtiEk=;
 b=jVp4u59bHwjB7fsPOF6q8tkxrZJPYuH7gDgmAtPo7dYPcrXFAmssRM76butGw11V+R
 yNHW2s4DUgS44cUTYdakRArlqQivemNRuybrg0tFX0yZBNhMmdhnpYGrQq4513Z4cbAz
 Imko9GuMLJYup26Le549yaZ1i4gjpiL3D2FRm+yKAfWFDcO5lwEwpxLZ4CREvjhiZ3H+
 G6Qt26xjMJquiqVeph04gVeCrb8Y6PLdfYisDgKXiRj5pqfDCCyR1//emQYPBfeJemCh
 +ScQobURuv/Dl610lgnP/vJ+sY8nVnW/0BYKKl8NtCsWiplxkAsKI1YcFsd6U+sNteUH
 GlSw==
X-Gm-Message-State: AOAM53279TU0LzfJ0O2JsUYCHSlFmd4GV5IhR0oXvg2XNNQ7fZXjvELu
 1xIRtqLeLHc/JtXiIm3fWb4=
X-Google-Smtp-Source: ABdhPJwhoWAvoQQbyfkZKZMTCo/cPZfKxgTq9NvwRZ9XGaSNx+O1S4yJaI5k8NExfpJzdZhUJ0ZHtg==
X-Received: by 2002:a1c:488:: with SMTP id 130mr4082699wme.156.1631785459308; 
 Thu, 16 Sep 2021 02:44:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id m1sm2535410wmq.10.2021.09.16.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 6/6] drm/tegra: Support asynchronous commits for cursor
Date: Thu, 16 Sep 2021 11:44:04 +0200
Message-Id: <20210916094404.888267-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

This adds support for asynchronously updating the cursor plane, which
enables support for the legacy cursor IOCTLs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 80 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2025b18d2f63..d9a8df51e3e2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -890,11 +890,9 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void tegra_cursor_atomic_update(struct drm_plane *plane,
-				       struct drm_atomic_state *state)
+static void __tegra_cursor_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	struct tegra_drm *tegra = plane->dev->dev_private;
@@ -990,6 +988,14 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
+static void tegra_cursor_atomic_update(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+
+	__tegra_cursor_atomic_update(plane, new_state);
+}
+
 static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 					struct drm_atomic_state *state)
 {
@@ -1009,12 +1015,78 @@ static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 }
 
+static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	int min_scale, max_scale;
+	int err;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	if (!crtc_state->active)
+		return -EINVAL;
+
+	if (plane->state->crtc != new_state->crtc ||
+	    plane->state->src_w != new_state->src_w ||
+	    plane->state->src_h != new_state->src_h ||
+	    plane->state->crtc_w != new_state->crtc_w ||
+	    plane->state->crtc_h != new_state->crtc_h ||
+	    plane->state->fb != new_state->fb ||
+	    plane->state->fb == NULL)
+		return -EINVAL;
+
+	min_scale = (1 << 16) / 8;
+	max_scale = (8 << 16) / 1;
+
+	err = drm_atomic_helper_check_plane_state(new_state, crtc_state, min_scale, max_scale,
+						  true, true);
+	if (err < 0)
+		return err;
+
+	if (new_state->visible != plane->state->visible)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void tegra_cursor_atomic_async_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
+
+	plane->state->src_x = new_state->src_x;
+	plane->state->src_y = new_state->src_y;
+	plane->state->crtc_x = new_state->crtc_x;
+	plane->state->crtc_y = new_state->crtc_y;
+
+	if (new_state->visible) {
+		struct tegra_plane *p = to_tegra_plane(plane);
+		u32 value;
+
+		__tegra_cursor_atomic_update(plane, new_state);
+
+		value = (WIN_A_ACT_REQ << p->index) << 8 | GENERAL_UPDATE;
+		tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+		(void)tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
+
+		value = (WIN_A_ACT_REQ << p->index) | GENERAL_ACT_REQ;
+		tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+		(void)tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
+	}
+}
+
 static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
 	.prepare_fb = tegra_plane_prepare_fb,
 	.cleanup_fb = tegra_plane_cleanup_fb,
 	.atomic_check = tegra_cursor_atomic_check,
 	.atomic_update = tegra_cursor_atomic_update,
 	.atomic_disable = tegra_cursor_atomic_disable,
+	.atomic_async_check = tegra_cursor_atomic_async_check,
+	.atomic_async_update = tegra_cursor_atomic_async_update,
 };
 
 static const uint64_t linear_modifiers[] = {
-- 
2.33.0


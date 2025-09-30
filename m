Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0BBAC9E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300CC10E58B;
	Tue, 30 Sep 2025 11:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jUxp354J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E80310E589
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5362540C26;
 Tue, 30 Sep 2025 11:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA311C4CEF0;
 Tue, 30 Sep 2025 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230112;
 bh=BVOB8VKSo6jURPigyFDw0woNSHOVXFNYNQ4yWXRlrRY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jUxp354JrICggUM5Lj/tBqSGcEBIbhqTLCNNJwFxzpycOy0jcGJKp4iWjzW2BY/DV
 lI369DomLITLldaBc/Za6isiRAWug55DhcyTeVm3eMGgbYKqC80L2dUUMzU0j0/JRw
 cFV+BTVY/EKMd9Ra16XGKB4o/yExKp82XWWlATnyJ8aJROKEBZBlHNSYgrE3ekuXQd
 KIfTtFM1Pe3A9cF5r1c/sq54dsr87cb9IRu4rGeZtFoZbIEGxVAkMu/6e1WIR/eMrY
 RV5gi4+Uzac0KyUkOlWuJkHI5txLgxEuYI0ZHiTnlJMXBxW6lz6ZKX2NncO+UFkgSo
 CZQJjQq/PC7Dw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:52 +0200
Subject: [PATCH v5 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-37-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3296; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BVOB8VKSo6jURPigyFDw0woNSHOVXFNYNQ4yWXRlrRY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+hf/t35ynBNtI38/cd18+vkWH4fZdl9kP9Nn59zd
 dur17luHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAil50Y6/NfVQl/iFRfvv3Y
 kuuiokuXP7Nw8Jt86ofWxaDtC53FrbgPBK8qli07POfVOdNqBabzSowNd1Ml23LmvV0nmXLQ87P
 +hkWx88WeTqvvFBItnKU+9ZRMsXIxb5ddqe709ekcNjMX8O4DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The ingenic CRTC atomic_enable() implementation will indirectly call
drm_atomic_get_private_obj_state() through ingenic_drm_get_priv_state().

drm_atomic_get_private_obj_state() will either return the new state for
the object in the global state if it exists, or will allocate a new one
and add it to the global state.

atomic_enable() however isn't allowed to modify the global state. So
what the implementation should use is the
drm_atomic_get_new_private_obj_state() helper to get the new state for
the CRTC, without performing an extra allocation.

We still need to make sure the private state will be part of the global
state by the time atomic_enable runs, so we still need to call
ingenic_drm_get_priv_state() in atomic_check. We can then call
ingenic_drm_get_new_priv_state() in atomic_enable, which is a wrapper
around drm_atomic_get_new_private_obj_state().

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 05faed933e5619c796f2a4fa1906e0eaa029ac68..d3213fbf22be14b177fc1b7100c5b721d5f17924 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -245,12 +245,12 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct ingenic_drm_private_state *priv_state;
 	unsigned int next_id;
 
-	priv_state = ingenic_drm_get_priv_state(priv, state);
-	if (WARN_ON(IS_ERR(priv_state)))
+	priv_state = ingenic_drm_get_new_priv_state(priv, state);
+	if (WARN_ON(!priv_state))
 		return;
 
 	/* Set addresses of our DMA descriptor chains */
 	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
 	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
@@ -338,17 +338,23 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
+	struct ingenic_drm_private_state *priv_state;
 
 	if (crtc_state->gamma_lut &&
 	    drm_color_lut_size(crtc_state->gamma_lut) != ARRAY_SIZE(priv->dma_hwdescs->palette)) {
 		dev_dbg(priv->dev, "Invalid palette size\n");
 		return -EINVAL;
 	}
 
+	/* We will need the state in atomic_enable, so let's make sure it's part of the state */
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
 	if (drm_atomic_crtc_needs_modeset(crtc_state) && priv->soc_info->has_osd) {
 		f1_state = drm_atomic_get_plane_state(crtc_state->state,
 						      &priv->f1);
 		if (IS_ERR(f1_state))
 			return PTR_ERR(f1_state);

-- 
2.51.0


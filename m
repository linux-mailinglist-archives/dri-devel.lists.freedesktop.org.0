Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB93FE189
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 19:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C552F6E233;
	Wed,  1 Sep 2021 17:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE286E233
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 17:55:15 +0000 (UTC)
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 4/5] drm/rockchip: Use common drm_fixed_16_16 helper
Date: Wed,  1 Sep 2021 13:54:30 -0400
Message-Id: <20210901175431.14060-4-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901175431.14060-1-alyssa@rosenzweig.io>
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
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

Replace our open-coded FRAC_16_16 with the common drm_fixed_16_16
helper to reduce code duplication between drivers.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 9 +++++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 -
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba9e14da41b4..9428fcba400f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -29,6 +29,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_fixed.h>
 
 #ifdef CONFIG_DRM_ANALOGIX_DP
 #include <drm/bridge/analogix_dp.h>
@@ -789,9 +790,9 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
 	int ret;
-	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
+	int min_scale = win->phy->scl ? drm_fixed_16_16(1, 8) :
 					DRM_PLANE_HELPER_NO_SCALING;
-	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
+	int max_scale = win->phy->scl ? drm_fixed_16_16(8, 1) :
 					DRM_PLANE_HELPER_NO_SCALING;
 
 	if (!crtc || WARN_ON(!fb))
@@ -1037,9 +1038,9 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 										 plane);
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
-	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
+	int min_scale = win->phy->scl ? drm_fixed_16_16(1, 8) :
 					DRM_PLANE_HELPER_NO_SCALING;
-	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
+	int max_scale = win->phy->scl ? drm_fixed_16_16(8, 1) :
 					DRM_PLANE_HELPER_NO_SCALING;
 	struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 857d97cdc67c..cada12e653cc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -335,7 +335,6 @@ enum vop_pol {
 	DEN_NEGATIVE   = 2
 };
 
-#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 #define SCL_FT_DEFAULT_FIXPOINT_SHIFT	12
 #define SCL_MAX_VSKIPLINES		4
 #define MIN_SCL_FT_AFTER_VSKIP		1
-- 
2.30.2


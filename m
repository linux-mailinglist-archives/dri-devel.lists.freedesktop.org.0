Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176CA2CB17
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D908510EB96;
	Fri,  7 Feb 2025 18:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C01B10E12E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:22:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tgT05-0006i4-Ft; Fri, 07 Feb 2025 19:22:49 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1tgT03-00418A-2y;
 Fri, 07 Feb 2025 19:22:47 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 2/2] drm/rockchip: analogix_dp: move PSR entry wait to VOP
 CRTC handling
Date: Fri,  7 Feb 2025 19:22:47 +0100
Message-Id: <20250207182247.215537-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207182247.215537-1-l.stach@pengutronix.de>
References: <20250207182247.215537-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Instead of calling from the Analogix DP encoder into the VOP crtc
handling, move the wait for PSR entry to vop_crtc_atomic_disable().

This untangles the Analogix DP code from the VOP, so it can safely
be used with VOP2.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
Note: I don't have any Rockchip system with a panel capable of PSR,
so while I am pretty sure that this doesn't change the flow of
operations at all, it should be tested by someone who has the
necessary hardware before applying.
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  26 -----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 102 +++++++++---------
 3 files changed, 53 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0844175c37c5..6fec687d7db1 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -39,8 +39,6 @@
 
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
-#define PSR_WAIT_LINE_FLAG_TIMEOUT_MS	100
-
 /**
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
  * @lcdsel_grf_reg: grf register offset of lcdc select
@@ -216,29 +214,6 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	clk_disable_unprepare(dp->grfclk);
 }
 
-static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
-					    struct drm_atomic_state *state)
-{
-	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-	int ret;
-
-	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
-	/* No crtc means we're doing a full shutdown */
-	if (!crtc)
-		return;
-
-	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-	/* If we're not entering self-refresh, no need to wait for vact */
-	if (!new_crtc_state || !new_crtc_state->self_refresh_active)
-		return;
-
-	ret = rockchip_drm_wait_vact_end(crtc, PSR_WAIT_LINE_FLAG_TIMEOUT_MS);
-	if (ret)
-		DRM_DEV_ERROR(dp->dev, "line flag irq timed out\n");
-}
-
 static int
 rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
@@ -266,7 +241,6 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
 	.mode_fixup = rockchip_dp_drm_encoder_mode_fixup,
 	.mode_set = rockchip_dp_drm_encoder_mode_set,
 	.atomic_enable = rockchip_dp_drm_encoder_enable,
-	.atomic_disable = rockchip_dp_drm_encoder_disable,
 	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index c183e82a42a5..d1333f432b4e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -82,7 +82,6 @@ void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
 				    struct device *dev);
 void rockchip_drm_dma_init_device(struct drm_device *drm_dev,
 				  struct device *dev);
-int rockchip_drm_wait_vact_end(struct drm_crtc *crtc, unsigned int mstimeout);
 int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rencoder,
 					      struct device_node *np, int port, int reg);
 int rockchip_drm_endpoint_is_subdriver(struct device_node *ep);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 7f5fbea34951..77778df3c225 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -726,14 +726,67 @@ static void rockchip_drm_set_win_enabled(struct drm_crtc *crtc, bool enabled)
         spin_unlock(&vop->reg_lock);
 }
 
+/**
+ * rockchip_drm_wait_vact_end
+ * @crtc: CRTC to enable line flag
+ * @mstimeout: millisecond for timeout
+ *
+ * Wait for vact_end line flag irq or timeout.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+static int
+rockchip_drm_wait_vact_end(struct drm_crtc *crtc, unsigned int mstimeout)
+{
+	struct vop *vop = to_vop(crtc);
+	unsigned long jiffies_left;
+	int ret = 0;
+
+	if (!crtc || !vop->is_enabled)
+		return -ENODEV;
+
+	mutex_lock(&vop->vop_lock);
+	if (mstimeout <= 0) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (vop_line_flag_irq_is_enabled(vop)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	reinit_completion(&vop->line_flag_completion);
+	vop_line_flag_irq_enable(vop);
+
+	jiffies_left = wait_for_completion_timeout(&vop->line_flag_completion,
+						   msecs_to_jiffies(mstimeout));
+	vop_line_flag_irq_disable(vop);
+
+	if (jiffies_left == 0) {
+		DRM_DEV_ERROR(vop->dev, "Timeout waiting for IRQ\n");
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+out:
+	mutex_unlock(&vop->vop_lock);
+	return ret;
+}
+
 static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
 	struct vop *vop = to_vop(crtc);
+	int ret;
 
 	WARN_ON(vop->event);
 
 	if (crtc->state->self_refresh_active) {
+		ret = rockchip_drm_wait_vact_end(crtc, 100);
+		if (ret)
+			DRM_DEV_ERROR(vop->dev, "line flag irq timed out\n");
 		rockchip_drm_set_win_enabled(crtc, false);
 		goto out;
 	}
@@ -2131,55 +2184,6 @@ static void vop_win_init(struct vop *vop)
 	}
 }
 
-/**
- * rockchip_drm_wait_vact_end
- * @crtc: CRTC to enable line flag
- * @mstimeout: millisecond for timeout
- *
- * Wait for vact_end line flag irq or timeout.
- *
- * Returns:
- * Zero on success, negative errno on failure.
- */
-int rockchip_drm_wait_vact_end(struct drm_crtc *crtc, unsigned int mstimeout)
-{
-	struct vop *vop = to_vop(crtc);
-	unsigned long jiffies_left;
-	int ret = 0;
-
-	if (!crtc || !vop->is_enabled)
-		return -ENODEV;
-
-	mutex_lock(&vop->vop_lock);
-	if (mstimeout <= 0) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (vop_line_flag_irq_is_enabled(vop)) {
-		ret = -EBUSY;
-		goto out;
-	}
-
-	reinit_completion(&vop->line_flag_completion);
-	vop_line_flag_irq_enable(vop);
-
-	jiffies_left = wait_for_completion_timeout(&vop->line_flag_completion,
-						   msecs_to_jiffies(mstimeout));
-	vop_line_flag_irq_disable(vop);
-
-	if (jiffies_left == 0) {
-		DRM_DEV_ERROR(vop->dev, "Timeout waiting for IRQ\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
-
-out:
-	mutex_unlock(&vop->vop_lock);
-	return ret;
-}
-EXPORT_SYMBOL(rockchip_drm_wait_vact_end);
-
 static int vop_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9400669911B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903E10ED08;
	Thu, 16 Feb 2023 10:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FF10ED20
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:25:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRd-0001Qj-OW; Thu, 16 Feb 2023 11:24:53 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRY-005Kiu-9A; Thu, 16 Feb 2023 11:24:49 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pSbRY-002Sfe-P9; Thu, 16 Feb 2023 11:24:48 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/4] drm/rockchip: vop: limit maximium resolution to
 hardware capabilities
Date: Thu, 16 Feb 2023 11:24:44 +0100
Message-Id: <20230216102447.582905-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216102447.582905-1-s.hauer@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The different VOP variants support different maximum resolutions. Reject
resolutions that are not supported by a specific variant.

This hasn't been a problem in the upstream driver so far as 1920x1080
has been the maximum resolution supported by the HDMI driver and that
resolution is supported by all VOP variants. Now with higher resolutions
supported in the HDMI driver we have to limit the resolutions to the
ones supported by the VOP.

The actual maximum resolutions are taken from the Rockchip downstream
Kernel.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v5:
    - fix wrong check height vs. width
    
    Changes since v4:
    - Use struct vop_rect for storing resolution
    
    Changes since v3:
    - new patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 -----
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 ++++++++++++++++++
 4 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fa1f4ee6d1950..40c688529d44e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1174,6 +1174,20 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&vop->irq_lock, flags);
 }
 
+static enum drm_mode_status vop_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct vop *vop = to_vop(crtc);
+
+	if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.width)
+		return MODE_BAD_HVALUE;
+
+	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
+		return MODE_BAD_VVALUE;
+
+	return MODE_OK;
+}
+
 static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -1585,6 +1599,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
+	.mode_valid = vop_crtc_mode_valid,
 	.mode_fixup = vop_crtc_mode_fixup,
 	.atomic_check = vop_crtc_atomic_check,
 	.atomic_begin = vop_crtc_atomic_begin,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 8502849833d93..5f56e0597df84 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -42,6 +42,11 @@ enum vop_data_format {
 	VOP_FMT_YUV444SP,
 };
 
+struct vop_rect {
+	int width;
+	int height;
+};
+
 struct vop_reg {
 	uint32_t mask;
 	uint16_t offset;
@@ -225,6 +230,7 @@ struct vop_data {
 	const struct vop_win_data *win;
 	unsigned int win_size;
 	unsigned int lut_size;
+	struct vop_rect max_output;
 
 #define VOP_FEATURE_OUTPUT_RGB10	BIT(0)
 #define VOP_FEATURE_INTERNAL_RGB	BIT(1)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index c727093a06d68..f1234a151130f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -27,11 +27,6 @@ enum win_dly_mode {
 	VOP2_DLY_MODE_MAX,
 };
 
-struct vop_rect {
-	int width;
-	int height;
-};
-
 enum vop2_scale_up_mode {
 	VOP2_SCALE_UP_NRST_NBOR,
 	VOP2_SCALE_UP_BIL,
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 014f99e8928e3..20ac7811c5eb7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -181,6 +181,7 @@ static const struct vop_data rk3036_vop = {
 	.output = &rk3036_output,
 	.win = rk3036_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3036_vop_win_data),
+	.max_output = { 1920, 1080 },
 };
 
 static const struct vop_win_phy rk3126_win1_data = {
@@ -213,6 +214,7 @@ static const struct vop_data rk3126_vop = {
 	.output = &rk3036_output,
 	.win = rk3126_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3126_vop_win_data),
+	.max_output = { 1920, 1080 },
 };
 
 static const int px30_vop_intrs[] = {
@@ -340,6 +342,7 @@ static const struct vop_data px30_vop_big = {
 	.output = &px30_output,
 	.win = px30_vop_big_win_data,
 	.win_size = ARRAY_SIZE(px30_vop_big_win_data),
+	.max_output = { 1920, 1080 },
 };
 
 static const struct vop_win_data px30_vop_lit_win_data[] = {
@@ -356,6 +359,7 @@ static const struct vop_data px30_vop_lit = {
 	.output = &px30_output,
 	.win = px30_vop_lit_win_data,
 	.win_size = ARRAY_SIZE(px30_vop_lit_win_data),
+	.max_output = { 1920, 1080 },
 };
 
 static const struct vop_scl_regs rk3066_win_scl = {
@@ -479,6 +483,7 @@ static const struct vop_data rk3066_vop = {
 	.output = &rk3066_output,
 	.win = rk3066_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3066_vop_win_data),
+	.max_output = { 1920, 1080 },
 };
 
 static const struct vop_scl_regs rk3188_win_scl = {
@@ -585,6 +590,7 @@ static const struct vop_data rk3188_vop = {
 	.win = rk3188_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3188_vop_win_data),
 	.feature = VOP_FEATURE_INTERNAL_RGB,
+	.max_output = { 2048, 1536 },
 };
 
 static const struct vop_scl_extension rk3288_win_full_scl_ext = {
@@ -732,6 +738,12 @@ static const struct vop_data rk3288_vop = {
 	.win = rk3288_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
 	.lut_size = 1024,
+	/*
+	 * This is the maximum resolution for the VOPB, the VOPL can only do
+	 * 2560x1600, but we can't distinguish them as they have the same
+	 * compatible.
+	 */
+	.max_output = { 3840, 2160 },
 };
 
 static const int rk3368_vop_intrs[] = {
@@ -833,6 +845,7 @@ static const struct vop_data rk3368_vop = {
 	.misc = &rk3368_misc,
 	.win = rk3368_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3368_vop_win_data),
+	.max_output = { 4096, 2160 },
 };
 
 static const struct vop_intr rk3366_vop_intr = {
@@ -854,6 +867,7 @@ static const struct vop_data rk3366_vop = {
 	.misc = &rk3368_misc,
 	.win = rk3368_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3368_vop_win_data),
+	.max_output = { 4096, 2160 },
 };
 
 static const struct vop_output rk3399_output = {
@@ -984,6 +998,7 @@ static const struct vop_data rk3399_vop_big = {
 	.win_size = ARRAY_SIZE(rk3399_vop_win_data),
 	.win_yuv2yuv = rk3399_vop_big_win_yuv2yuv_data,
 	.lut_size = 1024,
+	.max_output = { 4096, 2160 },
 };
 
 static const struct vop_win_data rk3399_vop_lit_win_data[] = {
@@ -1010,6 +1025,7 @@ static const struct vop_data rk3399_vop_lit = {
 	.win_size = ARRAY_SIZE(rk3399_vop_lit_win_data),
 	.win_yuv2yuv = rk3399_vop_lit_win_yuv2yuv_data,
 	.lut_size = 256,
+	.max_output = { 2560, 1600 },
 };
 
 static const struct vop_win_data rk3228_vop_win_data[] = {
@@ -1029,6 +1045,7 @@ static const struct vop_data rk3228_vop = {
 	.misc = &rk3368_misc,
 	.win = rk3228_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3228_vop_win_data),
+	.max_output = { 4096, 2160 },
 };
 
 static const struct vop_modeset rk3328_modeset = {
@@ -1100,6 +1117,7 @@ static const struct vop_data rk3328_vop = {
 	.misc = &rk3328_misc,
 	.win = rk3328_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3328_vop_win_data),
+	.max_output = { 4096, 2160 },
 };
 
 static const struct of_device_id vop_driver_dt_match[] = {
-- 
2.30.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF1CD7186
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 21:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE8810E1B1;
	Mon, 22 Dec 2025 20:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kFp1/7DO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAB510E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 20:38:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3935C60161;
 Mon, 22 Dec 2025 20:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143A9C16AAE;
 Mon, 22 Dec 2025 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766435893;
 bh=1IXZ+H+zi4+7gL1UEXrjiL6Xxnj2TN3J3C7Zb5cyVCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFp1/7DOWn/vOlDyIqXj2JEKwoKMcC3Q7hLGDU1unvJq2t5QsTfTgWPO0aC2lPpVP
 Ca8tXnZcvI4fGDuAYUDmdZwfHZyFFDDljahn6rnZxJQL1fUHmK5b6aTDZrxokd5vSE
 tRWKxtv3xcL5TwsQK6HudsmzKzegRGJ/TIggvTGNfnLk/wkV94P+V0WJGI19TQAnau
 iULuf+IlF2GX5yDg1GToxk1URd9ThZ20Zll4+dKX8kQy+a5FGOnOfxoLynDTCe3ojH
 e+zE6ZJ8noRgN7sA4heogMVuu2m9C+0al/egfaYRpYNOtfaR9MVMXDvHD+MEnvJHFv
 6Y3Ok0aFDvAfQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 03/23] drm: Discard pm_runtime_put() return value
Date: Mon, 22 Dec 2025 20:57:35 +0100
Message-ID: <3045480.e9J7NaK4W3@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
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

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Multiple DRM drivers use the pm_runtime_put() return value for printing
debug or even error messages and all of those messages are at least
somewhat misleading.

Returning an error code from pm_runtime_put() merely means that it has
not queued up a work item to check whether or not the device can be
suspended and there are many perfectly valid situations in which that
can happen, like after writing "on" to the devices' runtime PM "control"
attribute in sysfs for one example.  It also happens when the kernel
has been configured with CONFIG_PM unset.

For this reason, modify all of those drivers to simply discard the
pm_runtime_put() return value which is what they should be doing.

This will facilitate a planned change of the pm_runtime_put() return
type to void in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

This patch is part of a series, but it doesn't depend on anything else
in that series.  The last patch in the series depends on it.

It can be applied by itself and if you decide to do so, please let me
know.

Otherwise, an ACK or equivalent will be appreciated, but also the lack
of specific criticism will be eventually regarded as consent.

---
 drivers/gpu/drm/arm/malidp_crtc.c                   |    6 +-----
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |    4 +---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |    4 +---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |    5 +----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |    5 +----
 drivers/gpu/drm/imx/dc/dc-crtc.c                    |   12 +++---------
 drivers/gpu/drm/vc4/vc4_hdmi.c                      |    5 +----
 drivers/gpu/drm/vc4/vc4_vec.c                       |   12 ++----------
 8 files changed, 11 insertions(+), 42 deletions(-)

--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -77,7 +77,6 @@ static void malidp_crtc_atomic_disable(s
 									 crtc);
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
-	int err;
 
 	/* always disable planes on the CRTC that is being turned off */
 	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
@@ -87,10 +86,7 @@ static void malidp_crtc_atomic_disable(s
 
 	clk_disable_unprepare(hwdev->pxlclk);
 
-	err = pm_runtime_put(crtc->dev->dev);
-	if (err < 0) {
-		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
-	}
+	pm_runtime_put(crtc->dev->dev);
 }
 
 static const struct gamma_curve_segment {
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -280,9 +280,7 @@ static void imx8qm_ldb_bridge_atomic_dis
 	clk_disable_unprepare(imx8qm_ldb->clk_bypass);
 	clk_disable_unprepare(imx8qm_ldb->clk_pixel);
 
-	ret = pm_runtime_put(dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+	pm_runtime_put(dev);
 }
 
 static const u32 imx8qm_ldb_bus_output_fmts[] = {
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -282,9 +282,7 @@ static void imx8qxp_ldb_bridge_atomic_di
 	if (is_split && companion)
 		companion->funcs->atomic_disable(companion, state);
 
-	ret = pm_runtime_put(dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
+	pm_runtime_put(dev);
 }
 
 static const u32 imx8qxp_ldb_bus_output_fmts[] = {
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -181,11 +181,8 @@ static void imx8qxp_pc_bridge_atomic_dis
 {
 	struct imx8qxp_pc_channel *ch = bridge->driver_private;
 	struct imx8qxp_pc *pc = ch->pc;
-	int ret;
 
-	ret = pm_runtime_put(pc->dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
+	pm_runtime_put(pc->dev);
 }
 
 static const u32 imx8qxp_pc_bus_output_fmts[] = {
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -127,11 +127,8 @@ static void imx8qxp_pxl2dpi_bridge_atomi
 						  struct drm_atomic_state *state)
 {
 	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
-	int ret;
 
-	ret = pm_runtime_put(p2d->dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
+	pm_runtime_put(p2d->dev);
 
 	if (p2d->companion)
 		p2d->companion->funcs->atomic_disable(p2d->companion, state);
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -300,7 +300,7 @@ dc_crtc_atomic_disable(struct drm_crtc *
 				drm_atomic_get_new_crtc_state(state, crtc);
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
-	int idx, ret;
+	int idx;
 
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
@@ -313,16 +313,10 @@ dc_crtc_atomic_disable(struct drm_crtc *
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
-	ret = pm_runtime_put(dc_drm->pe->dev);
-	if (ret)
-		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
-			    ret);
+	pm_runtime_put(dc_drm->pe->dev);
 
 	/* request display engine power-off when CRTC is disabled */
-	ret = pm_runtime_put(dc_crtc->de->dev);
-	if (ret < 0)
-		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
-			    ret);
+	pm_runtime_put(dc_crtc->de->dev);
 
 	drm_dev_exit(idx);
 
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -848,7 +848,6 @@ static void vc4_hdmi_encoder_post_crtc_p
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
-	int ret;
 	int idx;
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -867,9 +866,7 @@ static void vc4_hdmi_encoder_post_crtc_p
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
-	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
-	if (ret < 0)
-		drm_err(drm, "Failed to release power domain: %d\n", ret);
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	drm_dev_exit(idx);
 
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -542,7 +542,7 @@ static void vc4_vec_encoder_disable(stru
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
-	int idx, ret;
+	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
@@ -556,17 +556,9 @@ static void vc4_vec_encoder_disable(stru
 
 	clk_disable_unprepare(vec->clock);
 
-	ret = pm_runtime_put(&vec->pdev->dev);
-	if (ret < 0) {
-		drm_err(drm, "Failed to release power domain: %d\n", ret);
-		goto err_dev_exit;
-	}
+	pm_runtime_put(&vec->pdev->dev);
 
 	drm_dev_exit(idx);
-	return;
-
-err_dev_exit:
-	drm_dev_exit(idx);
 }
 
 static void vc4_vec_encoder_enable(struct drm_encoder *encoder,




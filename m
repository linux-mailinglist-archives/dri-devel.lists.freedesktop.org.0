Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0047B3F898
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7E110E5FB;
	Tue,  2 Sep 2025 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bkU68Fes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE7C10E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9594143C9C;
 Tue,  2 Sep 2025 08:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26417C4CEF7;
 Tue,  2 Sep 2025 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802061;
 bh=PYnVTOPYjHAB+rr1Ybb2vBoDMtO6tDXn5T1miNMp3sU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bkU68FesY4AURN/Z1sZ96P6sYCcunBj5g7onNnWkhKwQN+x+7TGXbYhg5et75YzFq
 UWBLlyz0QNiHURlfHyNoZ37Ttvs+qkjXR5nEzWdV7USkqgtysm4ovqqbHdVFnywAah
 jUDON8KWs+WS1NQuG4TPTimvC4jDw9SmIlBeoOrRGyBvsOplBoK8lVnH5qABRBCidz
 TENbs04fkgKuc7BhrnNTcgwpxBp+RTmid3Nf0pvjgtaSSLCKDN+aNVo8GBnrVNwFzT
 /y95DYDXZ8g7IhYXyGqT32Stdo7Imtngi5q5ckP2FRm3bC0nyyHPn88WIAymXJaDf2
 MerRqF2Klu4Ag==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:55 +0200
Subject: [PATCH 27/29] drm/tidss: Implement readout support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-27-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19395; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PYnVTOPYjHAB+rr1Ybb2vBoDMtO6tDXn5T1miNMp3sU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVh/YXrhLvWnai5wJin2JUtsvpjLOspl231tv+umHT
 sy7f9137JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATeXWcseF48Yk7nlkLezJX
 rXCyMPeVMtL4KKi0IHZB3OmnbtxZzvdLf7wx5PivUrFh95fTpl7X7zI2XAp6Ysgr/FJI9EBAitK
 Nlk9zn/Aov1u81nr+eyE1uf9NalN5W64Hr39RLn4zom73AdV2AA==
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

With the hardware readout infrastructure now in place in the KMS
framework, we can provide it for the tidss driver.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 218 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/tidss/tidss_dispc.c |  48 --------
 drivers/gpu/drm/tidss/tidss_kms.c   |   3 +-
 drivers/gpu/drm/tidss/tidss_plane.c | 194 +++++++++++++++++++++++++++++++-
 4 files changed, 409 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 8fcc6a2f94770ae825eeb2a3b09856a2bf2d6a1e..454c4db92942c6c781440aff78c755e386b2edf3 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -2,18 +2,22 @@
 /*
  * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
+#include <linux/clk.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
+#include "tidss_dispc_regs.h"
 #include "tidss_drv.h"
 #include "tidss_irq.h"
 #include "tidss_plane.h"
 
 /* Page flip and frame done IRQs */
@@ -350,24 +354,229 @@ static void tidss_crtc_destroy_state(struct drm_crtc *crtc,
 
 	__drm_atomic_helper_crtc_destroy_state(&tstate->base);
 	kfree(tstate);
 }
 
-static void tidss_crtc_reset(struct drm_crtc *crtc)
+static unsigned long calc_pixel_clock_hz(unsigned int htotal,
+					 unsigned int vtotal,
+					 unsigned int refresh,
+					 unsigned int freq_div)
 {
+	unsigned long rate = (unsigned long)htotal * vtotal * refresh;
+
+	return (rate * 1000) / freq_div;
+}
+
+static const unsigned int refresh_tries[] = {30, 50, 60};
+static const unsigned int refresh_factors_tries[] = {1000, 1001};
+
+static unsigned int tidss_find_closest_refresh_rate_from_clk(struct drm_device *dev,
+							     struct clk *clk,
+							     unsigned int htotal,
+							     unsigned int vtotal,
+							     unsigned long *pixel_clock_hz)
+{
+	unsigned long actual_clk_rate = clk_get_rate(clk);
+	unsigned long best_clk_rate = 0;
+	unsigned long best_rate_diff = ULONG_MAX;
+	unsigned int best_refresh = 0;
+	unsigned int i, j;
+
+	drm_dbg(dev, "Actual clock rate is %lu\n", actual_clk_rate);
+
+	for (i = 0; i < ARRAY_SIZE(refresh_tries); i++) {
+		for (j = 0; j < ARRAY_SIZE(refresh_factors_tries); j++) {
+			unsigned int try_refresh = refresh_tries[i];
+			unsigned int try_factor = refresh_factors_tries[j];
+			unsigned long try_clk_rate = calc_pixel_clock_hz(htotal,
+									 vtotal,
+									 try_refresh,
+									 try_factor);
+			unsigned long diff;
+
+			drm_dbg(dev, "Evaluating refresh %u, factor %u, rate %lu\n",
+				try_refresh, try_factor, try_clk_rate);
+
+			if (try_clk_rate == actual_clk_rate) {
+				drm_dbg(dev, "Found exact match. Stopping.\n");
+				best_refresh = try_refresh;
+				best_clk_rate = try_clk_rate;
+				goto out;
+			}
+
+
+			diff = abs_diff(actual_clk_rate, try_clk_rate);
+			if (diff < best_rate_diff) {
+				drm_dbg(dev, "Found new candidate. Difference is %lu\n", diff);
+				best_refresh = try_refresh;
+				best_clk_rate = try_clk_rate;
+				best_rate_diff = diff;
+			}
+		}
+	}
+
+out:
+	drm_dbg(dev, "Best candidate is %u Hz, pixel clock rate %lu Hz", best_refresh, best_clk_rate);
+
+	if (pixel_clock_hz)
+		*pixel_clock_hz = best_clk_rate;
+
+	return best_refresh;
+}
+
+static int tidss_crtc_readout_mode(struct dispc_device *dispc,
+				   struct tidss_crtc *tcrtc,
+				   struct drm_display_mode *mode)
+{
+	struct tidss_device *tidss = dispc->tidss;
+	struct drm_device *dev = &tidss->ddev;
+	unsigned long pixel_clock;
+	unsigned int refresh;
+	u16 hdisplay, hfp, hsw, hbp;
+	u16 vdisplay, vfp, vsw, vbp;
+	u32 vp = tcrtc->hw_videoport;
+	u32 val;
+
+	val = dispc_vp_read(dispc, vp, DISPC_VP_SIZE_SCREEN);
+	hdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_HDISPLAY_MASK, val) + 1;
+	vdisplay = FIELD_GET(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK, val) + 1;
+
+	mode->hdisplay = hdisplay;
+	mode->vdisplay = vdisplay;
+
+	val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_H);
+	hsw = FIELD_GET(DISPC_VP_TIMING_H_SYNC_PULSE_MASK, val) + 1;
+	hfp = FIELD_GET(DISPC_VP_TIMING_H_FRONT_PORCH_MASK, val) + 1;
+	hbp = FIELD_GET(DISPC_VP_TIMING_H_BACK_PORCH_MASK, val) + 1;
+
+	mode->hsync_start = hdisplay + hfp;
+	mode->hsync_end = hdisplay + hfp + hsw;
+	mode->htotal = hdisplay + hfp + hsw + hbp;
+
+	val = dispc_vp_read(dispc, vp, DISPC_VP_TIMING_V);
+	vsw = FIELD_GET(DISPC_VP_TIMING_V_SYNC_PULSE_MASK, val) + 1;
+	vfp = FIELD_GET(DISPC_VP_TIMING_V_FRONT_PORCH_MASK, val);
+	vbp = FIELD_GET(DISPC_VP_TIMING_V_BACK_PORCH_MASK, val);
+
+	mode->vsync_start = vdisplay + vfp;
+	mode->vsync_end = vdisplay + vfp + vsw;
+	mode->vtotal = vdisplay + vfp + vsw + vbp;
+
+	refresh = tidss_find_closest_refresh_rate_from_clk(dev,
+							   dispc->vp_clk[vp],
+							   mode->htotal,
+							   mode->vtotal,
+							   &pixel_clock);
+	if (!refresh)
+		return -EINVAL;
+
+	mode->clock = pixel_clock / 1000;
+
+	val = dispc_vp_read(dispc, vp, DISPC_VP_POL_FREQ);
+	if (FIELD_GET(DISPC_VP_POL_FREQ_IVS_MASK, val))
+		mode->flags |= DRM_MODE_FLAG_NVSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	if (FIELD_GET(DISPC_VP_POL_FREQ_IHS_MASK, val))
+		mode->flags |= DRM_MODE_FLAG_NHSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_PHSYNC;
+
+	mode->type |= DRM_MODE_TYPE_DRIVER;
+	drm_mode_set_name(mode);
+	drm_mode_set_crtcinfo(mode, 0);
+
+	return 0;
+}
+
+static struct drm_crtc_state *
+tidss_crtc_readout_state(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = to_tidss(ddev);
+	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc_state *tstate;
+	struct tidss_crtc *tcrtc =
+		to_tidss_crtc(crtc);
+	struct drm_display_mode mode;
+	u32 val;
+	int ret;
 
 	if (crtc->state)
 		tidss_crtc_destroy_state(crtc, crtc->state);
 
 	tstate = kzalloc(sizeof(*tstate), GFP_KERNEL);
 	if (!tstate) {
-		crtc->state = NULL;
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	__drm_atomic_helper_crtc_reset(crtc, &tstate->base);
+
+	tidss_runtime_get(tidss);
+
+	val = dispc_vp_read(dispc, tcrtc->hw_videoport, DISPC_VP_CONTROL);
+	if (!FIELD_GET(DISPC_VP_CONTROL_ENABLE_MASK, val))
+		goto out;
+
+	/*
+	 * The display is active, we need to enable our clock to have
+	 * proper reference count.
+	 */
+	WARN_ON(dispc_vp_enable_clk(tidss->dispc, tcrtc->hw_videoport));
+
+	tstate->base.active = 1;
+	tstate->base.enable = 1;
+
+	ret = tidss_crtc_readout_mode(dispc, tcrtc, &mode);
+	if (ret)
+		goto err_runtime_put;
+
+	ret = drm_atomic_set_mode_for_crtc(&tstate->base, &mode);
+	if (WARN_ON(ret))
+		goto err_runtime_put;
+
+	drm_mode_copy(&tstate->base.adjusted_mode, &mode);
+
+	val = dispc_vp_read(dispc, tcrtc->hw_videoport, DISPC_VP_POL_FREQ);
+	if (FIELD_GET(DISPC_VP_POL_FREQ_IPC_MASK, val))
+		tstate->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
+
+	if (FIELD_GET(DISPC_VP_POL_FREQ_IEO_MASK, val))
+		tstate->bus_flags |= DRM_BUS_FLAG_DE_LOW;
+
+	if (FIELD_GET(DISPC_VP_POL_FREQ_RF_MASK, val))
+		tstate->bus_flags |= DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
+
+	/*
+	 * The active connectors and planes will be filled by their
+	 * respective readout callbacks.
+	 */
+
+out:
+	tidss_runtime_put(tidss);
+	return &tstate->base;
+
+err_runtime_put:
+	tidss_runtime_put(tidss);
+	kfree(tstate);
+	return ERR_PTR(ret);
+}
+
+static bool tidss_crtc_compare_state(struct drm_crtc *crtc,
+				     struct drm_printer *p,
+				     struct drm_crtc_state *expected,
+				     struct drm_crtc_state *actual)
+{
+	struct tidss_crtc_state *t_expected = to_tidss_crtc_state(expected);
+	struct tidss_crtc_state *t_actual = to_tidss_crtc_state(actual);
+	int ret = drm_atomic_helper_crtc_compare_state(crtc, p, expected, actual);
+
+	STATE_CHECK_U32_X(ret, p, crtc->name, t_expected, t_actual, bus_format);
+	STATE_CHECK_U32_X(ret, p, crtc->name, t_expected, t_actual, bus_flags);
+
+	return ret;
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *state, *current_state;
@@ -398,14 +607,15 @@ static void tidss_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 	kfree(tcrtc);
 }
 
 static const struct drm_crtc_funcs tidss_crtc_funcs = {
-	.reset = tidss_crtc_reset,
 	.destroy = tidss_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_readout_state = tidss_crtc_readout_state,
+	.atomic_compare_state = tidss_crtc_compare_state,
 	.atomic_duplicate_state = tidss_crtc_duplicate_state,
 	.atomic_destroy_state = tidss_crtc_destroy_state,
 	.enable_vblank = tidss_crtc_enable_vblank,
 	.disable_vblank = tidss_crtc_disable_vblank,
 };
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 18b6beddfe51f9b5c164481ee2ef0fa289e63318..e7f6f047574f5b520b00195c2b14d98224db6f19 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2916,51 +2916,10 @@ static void dispc_init_errata(struct dispc_device *dispc)
 		dispc->errata.i2000 = true;
 		dev_info(dispc->dev, "WA for erratum i2000: YUV formats disabled\n");
 	}
 }
 
-/*
- * K2G display controller does not support soft reset, so we do a basic manual
- * reset here: make sure the IRQs are masked and VPs are disabled.
- */
-static void dispc_softreset_k2g(struct dispc_device *dispc)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&dispc->tidss->irq_lock, flags);
-	dispc_set_irqenable(dispc, 0);
-	dispc_read_and_clear_irqstatus(dispc);
-	spin_unlock_irqrestore(&dispc->tidss->irq_lock, flags);
-
-	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
-		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0,
-			       DISPC_VP_CONTROL_ENABLE_MASK);
-}
-
-static int dispc_softreset(struct dispc_device *dispc)
-{
-	u32 val;
-	int ret;
-
-	if (dispc->feat->subrev == DISPC_K2G) {
-		dispc_softreset_k2g(dispc);
-		return 0;
-	}
-
-	/* Soft reset */
-	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, DSS_SYSCONFIG_SOFTRESET_MASK);
-	/* Wait for reset to complete */
-	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
-				 val, val & 1, 100, 5000);
-	if (ret) {
-		dev_err(dispc->dev, "failed to reset dispc\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int dispc_init_hw(struct dispc_device *dispc)
 {
 	struct device *dev = dispc->dev;
 	int ret;
 
@@ -2974,26 +2933,19 @@ static int dispc_init_hw(struct dispc_device *dispc)
 	if (ret) {
 		dev_err(dev, "Failed to enable DSS fclk\n");
 		goto err_runtime_suspend;
 	}
 
-	ret = dispc_softreset(dispc);
-	if (ret)
-		goto err_clk_disable;
-
 	clk_disable_unprepare(dispc->fclk);
 	ret = pm_runtime_set_suspended(dev);
 	if (ret) {
 		dev_err(dev, "Failed to set DSS PM to suspended\n");
 		return ret;
 	}
 
 	return 0;
 
-err_clk_disable:
-	clk_disable_unprepare(dispc->fclk);
-
 err_runtime_suspend:
 	ret = pm_runtime_set_suspended(dev);
 	if (ret) {
 		dev_err(dev, "Failed to set DSS PM to suspended\n");
 		return ret;
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 86eb5d97410bedced57129c2bbcd35f1719424c2..38c90027c158a392f96012f88824ead091332fb7 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -37,11 +37,12 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	tidss_runtime_put(tidss);
 }
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
-	.atomic_commit_tail = tidss_atomic_commit_tail,
+	.atomic_commit_tail	= tidss_atomic_commit_tail,
+	.atomic_reset		= drm_atomic_helper_readout_state,
 };
 
 static int tidss_atomic_check(struct drm_device *ddev,
 			      struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index bd10bc1b9961571e6c6dee26698149fc9dd135b0..037c21354dd170511868baca24960ff9295dbea5 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -10,13 +10,15 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
+#include "tidss_dispc_regs.h"
 #include "tidss_drv.h"
 #include "tidss_plane.h"
 
 void tidss_plane_error_irq(struct drm_plane *plane, u64 irqstatus)
 {
@@ -173,17 +175,207 @@ static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
 	.atomic_enable = tidss_plane_atomic_enable,
 	.atomic_disable = tidss_plane_atomic_disable,
 	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
 };
 
+static const struct drm_framebuffer_funcs tidss_plane_readout_fb_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+};
+
+static struct drm_framebuffer *tidss_plane_readout_fb(struct drm_plane *plane)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = to_tidss(ddev);
+	struct dispc_device *dispc = tidss->dispc;
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+	const struct drm_format_info *info;
+	struct drm_framebuffer *fb;
+	u32 fourcc, val;
+	int ret;
+
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	fb->dev = plane->dev;
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ATTRIBUTES);
+	fourcc =
+		dispc_plane_find_fourcc_by_dss_code(FIELD_GET(DISPC_VID_ATTRIBUTES_FORMAT_MASK,
+							      val));
+	if (!fourcc) {
+		ret = -EINVAL;
+		goto err_free_fb;
+	}
+
+	info = drm_format_info(fourcc);
+	if (!info) {
+		ret = -EINVAL;
+		goto err_free_fb;
+	}
+
+	// TODO: Figure out YUV and multiplanar formats
+	if (info->is_yuv) {
+		ret = -EINVAL;
+		goto err_free_fb;
+	}
+
+	fb->format = info;
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_PICTURE_SIZE);
+	fb->width = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEX_MASK, val) + 1;
+	fb->height = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEY_MASK, val) + 1;
+
+	// TODO: Figure that out.
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ROW_INC);
+	if (val != 1) {
+		ret = -EINVAL;
+		goto err_free_fb;
+	}
+
+	fb->pitches[0] = fb->width * (drm_format_info_bpp(info, 0) / 8);
+
+	// TODO: Figure out the offsets
+	fb->offsets[0] = 0;
+
+	ret = drm_framebuffer_init(plane->dev, fb, &tidss_plane_readout_fb_funcs);
+	if (ret) {
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	return fb;
+
+err_free_fb:
+	kfree(fb);
+	return ERR_PTR(ret);
+}
+
+static struct drm_crtc *tidss_plane_readout_crtc(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+
+	if (dev->num_crtcs != 1)
+		return ERR_PTR(-EINVAL);
+
+	return list_first_entry(&dev->mode_config.crtc_list, struct drm_crtc, head);
+}
+
+static struct drm_plane_state *tidss_plane_atomic_readout_state(struct drm_plane *plane,
+								struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = to_tidss(ddev);
+	struct dispc_device *dispc = tidss->dispc;
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+	struct drm_plane_state *plane_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_framebuffer *fb;
+	struct drm_crtc *crtc;
+	bool lite = dispc->feat->vid_info[tplane->hw_plane_id].is_lite;
+	u16 in_w, in_h;
+	u32 val;
+	int ret;
+
+	if (plane->state)
+		drm_atomic_helper_plane_destroy_state(plane, plane->state);
+
+	plane_state = kzalloc(sizeof(*plane_state), GFP_KERNEL);
+	if (!plane_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_reset(plane_state, plane);
+
+	tidss_runtime_get(tidss);
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ATTRIBUTES);
+	if (!FIELD_GET(DISPC_VID_ATTRIBUTES_ENABLE_MASK, val)) {
+		goto out;
+	}
+
+	fb = tidss_plane_readout_fb(plane);
+	if (IS_ERR(fb)) {
+		ret = PTR_ERR(fb);
+		goto err_runtime_pm;
+	}
+
+	crtc = tidss_plane_readout_crtc(plane);
+	if (IS_ERR(crtc)) {
+		ret = PTR_ERR(crtc);
+		goto err_runtime_pm;
+	}
+
+	plane_state->fb = fb;
+	plane_state->crtc = crtc;
+	plane_state->visible = true;
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_PICTURE_SIZE);
+	in_w = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEX_MASK, val) + 1;
+	in_h = FIELD_GET(DISPC_VID_PICTURE_SIZE_MEMSIZEY_MASK, val) + 1;
+	plane_state->src_w = in_w << 16;
+	plane_state->src_h = in_h << 16;
+
+	if (!lite) {
+		val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_SIZE);
+		plane_state->crtc_w = FIELD_GET(DISPC_VID_SIZE_SIZEX_MASK, val) + 1;
+		plane_state->crtc_h = FIELD_GET(DISPC_VID_SIZE_SIZEY_MASK, val) + 1;
+	} else {
+		plane_state->crtc_w = in_w;
+		plane_state->crtc_h = in_h;
+	}
+
+	// TODO: Handle crtc_x/crtc_x/src_x/src_y
+	// crtc_x/crtc_y are handled by DISPC_OVR_ATTRIBUTES / OVR1_DSS_ATTRIBUTES
+
+	// TODO: Handle zpos, see DISPC_OVR_ATTRIBUTES / OVR1_DSS_ATTRIBUTES
+
+	plane_state->src.x1 = 0;
+	plane_state->src.x2 = plane_state->src_w;
+	plane_state->src.y1 = 0;
+	plane_state->src.y2 = plane_state->src_h;
+	plane_state->dst.x1 = 0;
+	plane_state->dst.x2 = plane_state->crtc_w;
+	plane_state->dst.y1 = 0;
+	plane_state->dst.y2 = plane_state->crtc_h;
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_GLOBAL_ALPHA);
+	plane_state->alpha = FIELD_GET(DISPC_VID_GLOBAL_ALPHA_GLOBALALPHA_MASK, val) << 16;
+
+	val = dispc_vid_read(dispc, tplane->hw_plane_id, DISPC_VID_ATTRIBUTES);
+	if (FIELD_GET(DISPC_VID_ATTRIBUTES_PREMULTIPLYALPHA_MASK, val))
+		plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+	else
+		plane_state->pixel_blend_mode = DRM_MODE_BLEND_COVERAGE;
+
+	// TODO: If YUV, handle color encoding and range
+
+	crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	if (!crtc_state) {
+		ret = -ENODEV;
+		goto err_runtime_pm;
+	}
+
+	crtc_state->plane_mask |= drm_plane_mask(plane);
+
+out:
+	tidss_runtime_put(tidss);
+	return plane_state;
+
+err_runtime_pm:
+	tidss_runtime_put(tidss);
+	kfree(plane_state);
+	return ERR_PTR(ret);
+}
+
 static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = drm_atomic_helper_plane_reset,
 	.destroy = drm_plane_destroy,
+	.atomic_compare_state = drm_atomic_helper_plane_compare_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	.atomic_readout_state = tidss_plane_atomic_readout_state,
 };
 
 struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 				       u32 hw_plane_id, u32 plane_type,
 				       u32 crtc_mask, const u32 *formats,

-- 
2.50.1


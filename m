Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A6B48807
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9E310E11F;
	Mon,  8 Sep 2025 09:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XuEL+w1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337510E11F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:14:02 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B06A596;
 Mon,  8 Sep 2025 11:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757322768;
 bh=wKm2il+Rl2qoLalc4t5SfaAIDZ8ce3WPmOfenl1XCFQ=;
 h=From:Date:Subject:To:Cc:From;
 b=XuEL+w1hBbTIv9l8xN53WLydkmzmDm7mC4vrMioawJkACZj18okd4wAwjwf5FlgXn
 Uw3NjtC61Tm1w++rXb6gxaOo7DVR7H3Vidc3MVVsQiCL81jKY54RPUqVu40u0D2gIp
 N1SlLJ8HXBjXfok8w3P4MUZovkb7xZWbGE/nnHPU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 08 Sep 2025 12:13:34 +0300
Subject: [PATCH v2] drm/tidss: Add some support for splash-screen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAD2evmgC/3XMQQ6CMBCF4auQWVvTFqjIynsYFi2dyiRKSYcQD
 endrexd/i953w6MiZChr3ZIuBFTnEvoUwXjZOcHCvKlQUvdykYZsZJnFrw8LU+i9l2odecuykg
 olyVhoPfB3YfSE/Ea0+fQN/Vb/0CbElI0IdRXg66VsruRR8txdtEmfx7jC4ac8xfysqQerwAAA
 A==
X-Change-ID: 20250416-tidss-splash-3d8f328b7160
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11144;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=wKm2il+Rl2qoLalc4t5SfaAIDZ8ce3WPmOfenl1XCFQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBovp5TVtgVtyYk+y3bCcWr/c0UTG4hJ0HSn3Bs+
 SRkYBe4ay2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaL6eUwAKCRD6PaqMvJYe
 9TA9D/9ChherAn5l6V+hktY7k9V6f/I8Ul18Mq+YiuHrFVktTqXPA0E/wk4vJDq610hOucyainm
 z7t0hrcGDEpdcCjmghp67KBcoX6Ed0Ald9FmejO3s+FtfGzkWmAQIleptzOoFHZnqentF9vy7DZ
 G2cuV/PkTCYbiW93cpqroyzVB6Vj8QTaig3Ydn0EpftDxtsCHSrrkrrjDM29//3cxexRwgm47Rn
 itqwDdHS5VsJd1+HrWDPcRpYd3dlwo7TP7MqFYNQbnZ/0va5aMy+NgumcPqWZUhmskFXbiha1hD
 K6YGvQqZXWiNrsZPcH1h3AUbjWO07xA/ZUwi1QEmRAGa5hUOUvmRPZyRxMmCEiEY0gBftJF6wAU
 edlZSateXkz3+mma31+xyrU1edNfjPp68lkbZyfd6M9qWjlK7eQgRc2P4bB/wTlSQGCSzCRf/9C
 m83paCrjqB4BvzYGSA7uF/opsGjDmsYHFCdfxFCKVIDBMEJLK//wVL1kfnCvhrCkVrtAuIx81iX
 me2cp8x5s0O8c6TaY+B+79PH8pyw58FunLgUxaWZFzQGc/jx3tgtH1AUqrvxRobLvrQbax0WTsp
 +28thKF8x0gm3HOUZ1kIZ8fVh2jvoowK2MvMZFVTNEdtohnZSd0mB0usjrBrN8lhbeW4sZr3qRT
 +3K2e7iSQ+B+GmA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Currently when the driver's probe is called, we do a full DSS reset. If
the bootloader has set up a splash-screen, the reset will disable the
video output, and after that it may still take time until the display is
usable (all the kernel modules have been loaded) and even more time
until the userspace is able to use the display.

If fbdev is enabled, in a perfect case tidss would take over the fb
memory set up by the bootloader, and use that memory for tidss's fbdev,
thus retaining the splash-screen. However, we're not there yet.

As a partial solution, this patch changes the driver so that the driver
will not reset (or change) the DSS registers until tidss_runtime_get()
is called when the display is being set up (because of fbdev modesetting
or modesetting from the userspace).

This is achieved in two parts:

1. Probe

At probe time, in dispc_init_hw(), we check if the DSS is idle
(videoports disabled). If yes, do a reset and continue as before. If
not, we know that there's a splash-screen, and we set the
'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.

We then enable the corresponding VP clocks (to ensure they stay on), set
the IRQENABLE to 0 to make sure we won't get any interrupts, and then
exit leaving the fclk and VP clocks enabled, and the runtime PM status
active.

2. Runtime get

Later, when the tidss_runtime_get() is called the first time, we check
the 'boot_enabled_vp_mask'. If set, we know that we have the
splash-screen showing on the screen, and thus the clocks are enabled and
runtime PM status is active. This indicates that
pm_runtime_resume_and_get() call just before in tidss_runtime_get() did
not cause a runtime_resume callback to get called, so we need to do that
manually.

We call dispc_splash_fini() which essentially returns the DSS into the
state where it would be in a non-splash-screen case: dispc_splash_fini()
will do a DSS reset, manually call the runtime_resume callback, and then
call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
actions at probe time.

Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
longer in the "splash-screen mode".

A note about fbdev emulation:

If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
This will cause a modeset, and the blank framebuffer from tidss's fbdev
will be shown instead of the splash-screen.

I see two improvements to this: either we should memcpy the pixel data
from the bootloader's splash-screen to the new fbdev buffer, or the
fbdev could use the splash-screen directly as its buffer. I have done
some hacks for the former, but I'm not sure how to implement either of
these properly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Rebased to latest drm-misc-next, and fixed the issues with the new
  register access macros
- Clarified the patch description a bit
- Dropped the second patch "drm/tidss: Remove early fb", as it's already
  in upstream
- Link to v1: https://lore.kernel.org/r/20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 127 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.h |   5 ++
 drivers/gpu/drm/tidss/tidss_drv.c   |  29 +++++++-
 drivers/gpu/drm/tidss/tidss_drv.h   |   2 +
 4 files changed, 148 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 7c8c15a5c39b..1bf208cb227b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2800,6 +2800,11 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
 	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
 }
 
+static bool dispc_is_idle(struct dispc_device *dispc)
+{
+	return REG_GET(dispc, DSS_SYSSTATUS, DSS_SYSSTATUS_DISPC_IDLE_STATUS);
+}
+
 int dispc_runtime_suspend(struct dispc_device *dispc)
 {
 	dev_dbg(dispc->dev, "suspend\n");
@@ -2940,7 +2945,7 @@ static int dispc_softreset(struct dispc_device *dispc)
 	return 0;
 }
 
-static int dispc_init_hw(struct dispc_device *dispc)
+int dispc_init_hw(struct dispc_device *dispc)
 {
 	struct device *dev = dispc->dev;
 	int ret;
@@ -2957,15 +2962,70 @@ static int dispc_init_hw(struct dispc_device *dispc)
 		goto err_runtime_suspend;
 	}
 
-	ret = dispc_softreset(dispc);
-	if (ret)
-		goto err_clk_disable;
+	dispc->tidss->boot_enabled_vp_mask = 0;
 
-	clk_disable_unprepare(dispc->fclk);
-	ret = pm_runtime_set_suspended(dev);
-	if (ret) {
-		dev_err(dev, "Failed to set DSS PM to suspended\n");
-		return ret;
+	if (dispc_is_idle(dispc)) {
+		ret = dispc_softreset(dispc);
+		if (ret)
+			goto err_clk_disable;
+	} else {
+		for (u32 vp_idx = 0; vp_idx < dispc->feat->num_vps; vp_idx++) {
+			bool enabled = VP_REG_GET(dispc, vp_idx,
+						  DISPC_VP_CONTROL,
+						  DISPC_VP_CONTROL_ENABLE_MASK);
+
+			if (!enabled)
+				continue;
+
+			dispc->tidss->boot_enabled_vp_mask |= BIT(vp_idx);
+
+			/* Keep the VP clk enabled */
+			ret = clk_prepare_enable(dispc->vp_clk[vp_idx]);
+			if (ret) {
+				while (vp_idx--) {
+					if (!(dispc->tidss->boot_enabled_vp_mask &
+					      BIT(vp_idx)))
+						continue;
+
+					clk_disable_unprepare(dispc->vp_clk[vp_idx]);
+				}
+
+				goto err_clk_disable;
+			}
+		}
+
+		if (!dispc->tidss->boot_enabled_vp_mask) {
+			dev_warn(dev,
+				 "Bad HW state: DSS not idle but no VPs are enabled. Resetting.\n");
+			ret = dispc_softreset(dispc);
+			if (ret)
+				goto err_clk_disable;
+		} else {
+			/*
+			 * Do basic HW init here, which won't interrupt the
+			 * splash-screen.
+			 */
+
+			/* Ensure we won't get interrupts */
+			dispc_set_irqenable(dispc, 0);
+			dispc_read_and_clear_irqstatus(dispc);
+		}
+	}
+
+	if (dispc->tidss->boot_enabled_vp_mask) {
+		dev_dbg(dev,
+			"Bootloader splash-screen detected, leaving DSS active.\n");
+		pm_runtime_get_noresume(dev);
+	} else {
+		/*
+		 * No splash-screen. Disable the clock and set DSS back to suspended.
+		 */
+		clk_disable_unprepare(dispc->fclk);
+		ret = pm_runtime_set_suspended(dev);
+		if (ret) {
+			dev_err(dev, "Failed to set DSS PM to suspended\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -2983,6 +3043,28 @@ static int dispc_init_hw(struct dispc_device *dispc)
 	return ret;
 }
 
+void dispc_init_hw_cleanup(struct dispc_device *dispc)
+{
+	if (!dispc->tidss->boot_enabled_vp_mask)
+		return;
+
+	/*
+	 * Call clk_disable_unprepare() to counter the clk_prepare_enable() we
+	 * did in the dispc_init_hw().
+	 */
+	clk_disable_unprepare(dispc->fclk);
+
+	for (u32 vp_idx = 0; vp_idx < dispc->feat->num_vps; vp_idx++) {
+		if (dispc->tidss->boot_enabled_vp_mask & BIT(vp_idx))
+			clk_disable_unprepare(dispc->vp_clk[vp_idx]);
+	}
+
+	/* counter the pm_runtime_get_noresume() */
+	pm_runtime_put_noidle(dispc->dev);
+
+	dispc->tidss->boot_enabled_vp_mask = 0;
+}
+
 int dispc_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
@@ -3092,11 +3174,30 @@ int dispc_init(struct tidss_device *tidss)
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
-	r = dispc_init_hw(dispc);
-	if (r)
-		return r;
-
 	tidss->dispc = dispc;
 
 	return 0;
 }
+
+void dispc_splash_fini(struct dispc_device *dispc)
+{
+	if (WARN_ON(!dispc->tidss->boot_enabled_vp_mask))
+		return;
+
+	/*
+	 * Do a reset now, to clean up the bootloader setup, as we're about to
+	 * do a modeset.
+	 */
+	dispc_softreset(dispc);
+
+	/*
+	 * Call resume manually. This will clk_prepare_enable() the fclk, and do
+	 * the common basic HW configuration.
+	 */
+	dispc_runtime_resume(dispc);
+
+	/*
+	 * Revert the enables and gets we did in dispc_init_hw() at probe time.
+	 */
+	dispc_init_hw_cleanup(dispc);
+}
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 60c1b400eb89..647ed013e080 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -152,4 +152,9 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
 int dispc_init(struct tidss_device *tidss);
 void dispc_remove(struct tidss_device *tidss);
 
+int dispc_init_hw(struct dispc_device *dispc);
+void dispc_init_hw_cleanup(struct dispc_device *dispc);
+
+void dispc_splash_fini(struct dispc_device *dispc);
+
 #endif
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 27d9a8fd541f..eb6a57b8f682 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -36,8 +36,22 @@ int tidss_runtime_get(struct tidss_device *tidss)
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
 	r = pm_runtime_resume_and_get(tidss->dev);
-	WARN_ON(r < 0);
-	return r;
+	if (WARN_ON(r < 0))
+		return r;
+
+	if (tidss->boot_enabled_vp_mask) {
+		/*
+		 * If 'boot_enabled_vp_mask' is set, it means that the DSS is
+		 * enabled and bootloader splash-screen is still on the screen,
+		 * using bootloader's DSS HW config.
+		 *
+		 * This is the first time the driver is about to use the HW, and
+		 * we need to do some cleanup and initial setup.
+		 */
+		dispc_splash_fini(tidss->dispc);
+	}
+
+	return 0;
 }
 
 void tidss_runtime_put(struct tidss_device *tidss)
@@ -149,6 +163,12 @@ static int tidss_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = dispc_init_hw(tidss->dispc);
+	if (ret) {
+		dev_err(dev, "failed to initialize dispc HW: %d\n", ret);
+		return ret;
+	}
+
 	ret = tidss_oldi_init(tidss);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init OLDI\n");
@@ -211,6 +231,7 @@ static int tidss_probe(struct platform_device *pdev)
 	tidss_irq_uninstall(ddev);
 
 err_runtime_suspend:
+
 #ifndef CONFIG_PM
 	dispc_runtime_suspend(tidss->dispc);
 #endif
@@ -219,6 +240,8 @@ static int tidss_probe(struct platform_device *pdev)
 
 	tidss_oldi_deinit(tidss);
 
+	dispc_init_hw_cleanup(tidss->dispc);
+
 	return ret;
 }
 
@@ -245,6 +268,8 @@ static void tidss_remove(struct platform_device *pdev)
 
 	tidss_oldi_deinit(tidss);
 
+	dispc_init_hw_cleanup(tidss->dispc);
+
 	/* devm allocated dispc goes away with the dev so mark it NULL */
 	dispc_remove(tidss);
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 84454a4855d1..c23091be2b60 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -39,6 +39,8 @@ struct tidss_device {
 	/* protects the irq masks field and irqenable/irqstatus registers */
 	spinlock_t irq_lock;
 	dispc_irq_t irq_mask;	/* enabled irqs */
+
+	u32 boot_enabled_vp_mask;
 };
 
 #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)

---
base-commit: 685e8dae19df73d5400734ee5ad9e96470f9c0b4
change-id: 20250416-tidss-splash-3d8f328b7160

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


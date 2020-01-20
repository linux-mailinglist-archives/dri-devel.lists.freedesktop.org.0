Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5D143330
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 22:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8B6EB37;
	Mon, 20 Jan 2020 21:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8756EB37
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 21:02:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2di3098640;
 Mon, 20 Jan 2020 15:02:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579554159;
 bh=03DaRge3TSbuCRHZobIT3x4mqBgK2y+zNvIgX8ZOM10=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uBC//8BtSZzSOoSGNdeiPeCs3Uw5ZsSlttNrWiwrg2fGYzN1LUQnHrPZoqIKmAdQT
 M82RsYZXVRv4A14/BPmdhAMM0QSZhOgBj5L9f0sXULs8gZkrUGqr+DI+yX6KZO0D+d
 0e31pVk3HnloQugtUnosNE/3QD87P6qabSG6B3pg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KL2doZ068416
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jan 2020 15:02:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 15:02:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 15:02:38 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2PYb079658;
 Mon, 20 Jan 2020 15:02:35 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v8 4/5] drm/tidss: New driver for TI Keystone platform Display
 SubSystem
Date: Mon, 20 Jan 2020 23:02:23 +0200
Message-ID: <96c8aa362a426a64086da92cb3b486c6cdce3e7f.1579553817.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579553817.git.jsarha@ti.com>
References: <cover.1579553817.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com, jsarha@ti.com,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a new DRM driver for Texas Instruments DSS IPs used on
Texas Instruments Keystone K2G, AM65x, and J721e SoCs. The new DSS IP is
a major change to the older DSS IP versions, which are supported by
the omapdrm driver. While on higher level the Keystone DSS resembles
the older DSS versions, the registers are completely different and the
internal pipelines differ a lot.

DSS IP found on K2G is an "ultra-light" version, and has only a single
plane and a single output. The K3 DSS IPs are found on AM65x and J721E
SoCs. AM65x DSS has two video ports, one full video plane, and another
"lite" plane without scaling support. J721E has 4 video ports, 2 video
planes and 2 lite planes. AM65x DSS has also an integrated OLDI (LVDS)
output.

Version history:

v2: - rebased on top of drm-next-2019-11-27
    - sort all include lines in all files
    - remove all include <drm/drmP.h>
    - remove select "select VIDEOMODE_HELPERS"
    - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
      to call it in new modeset case as it is also called in vp_enable())
    - change probe sequence and drm_device allocation (follow example in
      drm_drv.c)
    - use __maybe_unused instead of #ifdef for pm functions
    - remove "struct drm_fbdev_cma *fbdev;" from driver data
    - check panel connector type before connecting it

v3: no change

v4: no change

v5: - remove fifo underflow irq handling, it is not an error and
      it should be used for debug purposes only
    - memory tuning, prefetch plane fifo up to high-threshold value to
      minimize possibility of underflows.

v6: - Check CTM and gamma support from dispc_features when creating crtc
    - Implement CTM support for k2g and fix k3 CTM implementation
    - Remove gamma property persistence and always write color properties
      in a new modeset

v7: - Fix checkpatch.pl --strict issues
    - Rebase on top of drm-misc-next-2020-01-10

v8: - Remove idle debug prints from dispc_init()
    - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>

Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/gpu/drm/Kconfig                   |    2 +
 drivers/gpu/drm/Makefile                  |    1 +
 drivers/gpu/drm/tidss/Kconfig             |   14 +
 drivers/gpu/drm/tidss/Makefile            |   12 +
 drivers/gpu/drm/tidss/tidss_crtc.c        |  377 +++
 drivers/gpu/drm/tidss/tidss_crtc.h        |   46 +
 drivers/gpu/drm/tidss/tidss_dispc.c       | 2768 +++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h       |  132 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h  |  243 ++
 drivers/gpu/drm/tidss/tidss_drv.c         |  285 +++
 drivers/gpu/drm/tidss/tidss_drv.h         |   39 +
 drivers/gpu/drm/tidss/tidss_encoder.c     |   88 +
 drivers/gpu/drm/tidss/tidss_encoder.h     |   17 +
 drivers/gpu/drm/tidss/tidss_irq.c         |  146 ++
 drivers/gpu/drm/tidss/tidss_irq.h         |   77 +
 drivers/gpu/drm/tidss/tidss_kms.c         |  249 ++
 drivers/gpu/drm/tidss/tidss_kms.h         |   15 +
 drivers/gpu/drm/tidss/tidss_plane.c       |  217 ++
 drivers/gpu/drm/tidss/tidss_plane.h       |   25 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.c |  202 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h |   22 +
 21 files changed, 4977 insertions(+)
 create mode 100644 drivers/gpu/drm/tidss/Kconfig
 create mode 100644 drivers/gpu/drm/tidss/Makefile
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d0aa6cff2e02..4bffa08f610a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -389,6 +389,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
 
+source "drivers/gpu/drm/tidss/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6493088a0fdd..ca0ca775d37f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
+obj-$(CONFIG_DRM_TIDSS) += tidss/
diff --git a/drivers/gpu/drm/tidss/Kconfig b/drivers/gpu/drm/tidss/Kconfig
new file mode 100644
index 000000000000..f790a5215302
--- /dev/null
+++ b/drivers/gpu/drm/tidss/Kconfig
@@ -0,0 +1,14 @@
+config DRM_TIDSS
+	tristate "DRM Support for TI Keystone"
+	depends on DRM && OF
+	depends on ARM || ARM64 || COMPILE_TEST
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	help
+	  The TI Keystone family SoCs introduced a new generation of
+	  Display SubSystem. There is currently three Keystone family
+	  SoCs released with DSS. Each with somewhat different version
+	  of it. The SoCs are 66AK2Gx, AM65x, and J721E. Set this to Y
+	  or M to add display support for TI Keystone family
+	  platforms.
diff --git a/drivers/gpu/drm/tidss/Makefile b/drivers/gpu/drm/tidss/Makefile
new file mode 100644
index 000000000000..312645271014
--- /dev/null
+++ b/drivers/gpu/drm/tidss/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+
+tidss-y := tidss_crtc.o \
+	tidss_drv.o \
+	tidss_encoder.o \
+	tidss_kms.o \
+	tidss_irq.o \
+	tidss_plane.o \
+	tidss_scale_coefs.o \
+	tidss_dispc.o
+
+obj-$(CONFIG_DRM_TIDSS) += tidss.o
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
new file mode 100644
index 000000000000..032c31ee2820
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "tidss_crtc.h"
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_irq.h"
+
+/* Page flip and frame done IRQs */
+
+static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
+{
+	struct drm_device *ddev = tcrtc->crtc.dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct drm_pending_vblank_event *event;
+	unsigned long flags;
+	bool busy;
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+
+	/*
+	 * New settings are taken into use at VFP, and GO bit is cleared at
+	 * the same time. This happens before the vertical blank interrupt.
+	 * So there is a small change that the driver sets GO bit after VFP, but
+	 * before vblank, and we have to check for that case here.
+	 */
+	busy = dispc_vp_go_busy(tidss->dispc, tcrtc->hw_videoport);
+	if (busy) {
+		spin_unlock_irqrestore(&ddev->event_lock, flags);
+		return;
+	}
+
+	event = tcrtc->event;
+	tcrtc->event = NULL;
+
+	if (!event) {
+		spin_unlock_irqrestore(&ddev->event_lock, flags);
+		return;
+	}
+
+	drm_crtc_send_vblank_event(&tcrtc->crtc, event);
+
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+
+	drm_crtc_vblank_put(&tcrtc->crtc);
+}
+
+void tidss_crtc_vblank_irq(struct drm_crtc *crtc)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+
+	drm_crtc_handle_vblank(crtc);
+
+	tidss_crtc_finish_page_flip(tcrtc);
+}
+
+void tidss_crtc_framedone_irq(struct drm_crtc *crtc)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+
+	complete(&tcrtc->framedone_completion);
+}
+
+void tidss_crtc_error_irq(struct drm_crtc *crtc, u64 irqstatus)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+
+	dev_err_ratelimited(crtc->dev->dev, "CRTC%u SYNC LOST: (irq %llx)\n",
+			    tcrtc->hw_videoport, irqstatus);
+}
+
+/* drm_crtc_helper_funcs */
+
+static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct dispc_device *dispc = tidss->dispc;
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	u32 hw_videoport = tcrtc->hw_videoport;
+	const struct drm_display_mode *mode;
+	enum drm_mode_status ok;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	if (!state->enable)
+		return 0;
+
+	mode = &state->adjusted_mode;
+
+	ok = dispc_vp_mode_valid(dispc, hw_videoport, mode);
+	if (ok != MODE_OK) {
+		dev_dbg(ddev->dev, "%s: bad mode: %ux%u pclk %u kHz\n",
+			__func__, mode->hdisplay, mode->vdisplay, mode->clock);
+		return -EINVAL;
+	}
+
+	return dispc_vp_bus_check(dispc, hw_videoport, state);
+}
+
+static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_crtc_state)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	unsigned long flags;
+
+	dev_dbg(ddev->dev,
+		"%s: %s enabled %d, needs modeset %d, event %p\n", __func__,
+		crtc->name, drm_atomic_crtc_needs_modeset(crtc->state),
+		crtc->state->enable, crtc->state->event);
+
+	/* There is nothing to do if CRTC is not going to be enabled. */
+	if (!crtc->state->enable)
+		return;
+
+	/*
+	 * Flush CRTC changes with go bit only if new modeset is not
+	 * coming, so CRTC is enabled trough out the commit.
+	 */
+	if (drm_atomic_crtc_needs_modeset(crtc->state))
+		return;
+
+	/* If the GO bit is stuck we better quit here. */
+	if (WARN_ON(dispc_vp_go_busy(tidss->dispc, tcrtc->hw_videoport)))
+		return;
+
+	/* We should have event if CRTC is enabled through out this commit. */
+	if (WARN_ON(!crtc->state->event))
+		return;
+
+	/* Write vp properties to HW if needed. */
+	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, false);
+
+	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+	dispc_vp_go(tidss->dispc, tcrtc->hw_videoport);
+
+	WARN_ON(tcrtc->event);
+
+	tcrtc->event = crtc->state->event;
+	crtc->state->event = NULL;
+
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+}
+
+static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_state)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	unsigned long flags;
+	int r;
+
+	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
+
+	tidss_runtime_get(tidss);
+
+	r = dispc_vp_set_clk_rate(tidss->dispc, tcrtc->hw_videoport,
+				  mode->clock * 1000);
+	if (r != 0)
+		return;
+
+	r = dispc_vp_enable_clk(tidss->dispc, tcrtc->hw_videoport);
+	if (r != 0)
+		return;
+
+	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, true);
+
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(crtc);
+
+	dispc_vp_prepare(tidss->dispc, tcrtc->hw_videoport, crtc->state);
+
+	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport, crtc->state);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+}
+
+static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
+				      struct drm_crtc_state *old_state)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	unsigned long flags;
+
+	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
+
+	reinit_completion(&tcrtc->framedone_completion);
+
+	dispc_vp_disable(tidss->dispc, tcrtc->hw_videoport);
+
+	if (!wait_for_completion_timeout(&tcrtc->framedone_completion,
+					 msecs_to_jiffies(500)))
+		dev_err(tidss->dev, "Timeout waiting for framedone on crtc %d",
+			tcrtc->hw_videoport);
+
+	dispc_vp_unprepare(tidss->dispc, tcrtc->hw_videoport);
+
+	spin_lock_irqsave(&ddev->event_lock, flags);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irqrestore(&ddev->event_lock, flags);
+
+	drm_crtc_vblank_off(crtc);
+
+	dispc_vp_disable_clk(tidss->dispc, tcrtc->hw_videoport);
+
+	tidss_runtime_put(tidss);
+}
+
+static
+enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
+					   const struct drm_display_mode *mode)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+
+	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
+}
+
+static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
+	.atomic_check = tidss_crtc_atomic_check,
+	.atomic_flush = tidss_crtc_atomic_flush,
+	.atomic_enable = tidss_crtc_atomic_enable,
+	.atomic_disable = tidss_crtc_atomic_disable,
+
+	.mode_valid = tidss_crtc_mode_valid,
+};
+
+/* drm_crtc_funcs */
+
+static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	tidss_runtime_get(tidss);
+
+	tidss_irq_enable_vblank(crtc);
+
+	return 0;
+}
+
+static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	tidss_irq_disable_vblank(crtc);
+
+	tidss_runtime_put(tidss);
+}
+
+static void tidss_crtc_reset(struct drm_crtc *crtc)
+{
+	struct tidss_crtc_state *tcrtc;
+
+	if (crtc->state)
+		__drm_atomic_helper_crtc_destroy_state(crtc->state);
+
+	kfree(crtc->state);
+
+	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
+	if (!tcrtc) {
+		crtc->state = NULL;
+		return;
+	}
+
+	crtc->state = &tcrtc->base;
+	crtc->state->crtc = crtc;
+}
+
+static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
+{
+	struct tidss_crtc_state *state, *current_state;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	current_state = to_tidss_crtc_state(crtc->state);
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+
+	state->bus_format = current_state->bus_format;
+	state->bus_flags = current_state->bus_flags;
+
+	return &state->base;
+}
+
+static const struct drm_crtc_funcs tidss_crtc_funcs = {
+	.reset = tidss_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = tidss_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank = tidss_crtc_enable_vblank,
+	.disable_vblank = tidss_crtc_disable_vblank,
+};
+
+struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
+				     u32 hw_videoport,
+				     struct drm_plane *primary)
+{
+	struct tidss_crtc *tcrtc;
+	struct drm_crtc *crtc;
+	unsigned int gamma_lut_size = 0;
+	bool has_ctm = tidss->feat->vp_feat.color.has_ctm;
+	int ret;
+
+	tcrtc = devm_kzalloc(tidss->dev, sizeof(*tcrtc), GFP_KERNEL);
+	if (!tcrtc)
+		return ERR_PTR(-ENOMEM);
+
+	tcrtc->hw_videoport = hw_videoport;
+	init_completion(&tcrtc->framedone_completion);
+
+	crtc =  &tcrtc->crtc;
+
+	ret = drm_crtc_init_with_planes(&tidss->ddev, crtc, primary,
+					NULL, &tidss_crtc_funcs, NULL);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
+
+	/*
+	 * The dispc gamma functions adapt to what ever size we ask
+	 * from it no matter what HW supports. X-server assumes 256
+	 * element gamma tables so lets use that.
+	 */
+	if (tidss->feat->vp_feat.color.gamma_size)
+		gamma_lut_size = 256;
+
+	drm_crtc_enable_color_mgmt(crtc, 0, has_ctm, gamma_lut_size);
+	if (gamma_lut_size)
+		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
+
+	return tcrtc;
+}
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.h b/drivers/gpu/drm/tidss/tidss_crtc.h
new file mode 100644
index 000000000000..df9d90b1ad2d
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_crtc.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_CRTC_H__
+#define __TIDSS_CRTC_H__
+
+#include <linux/completion.h>
+#include <linux/wait.h>
+
+#include <drm/drm_crtc.h>
+
+#define to_tidss_crtc(c) container_of((c), struct tidss_crtc, crtc)
+
+struct tidss_device;
+
+struct tidss_crtc {
+	struct drm_crtc crtc;
+
+	u32 hw_videoport;
+
+	struct drm_pending_vblank_event *event;
+
+	struct completion framedone_completion;
+};
+
+#define to_tidss_crtc_state(x) container_of(x, struct tidss_crtc_state, base)
+
+struct tidss_crtc_state {
+	/* Must be first. */
+	struct drm_crtc_state base;
+
+	u32 bus_format;
+	u32 bus_flags;
+};
+
+void tidss_crtc_vblank_irq(struct drm_crtc *crtc);
+void tidss_crtc_framedone_irq(struct drm_crtc *crtc);
+void tidss_crtc_error_irq(struct drm_crtc *crtc, u64 irqstatus);
+
+struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
+				     u32 hw_videoport,
+				     struct drm_plane *primary);
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
new file mode 100644
index 000000000000..4dff375877fb
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -0,0 +1,2768 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_panel.h>
+
+#include "tidss_crtc.h"
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_irq.h"
+#include "tidss_plane.h"
+
+#include "tidss_dispc_regs.h"
+#include "tidss_scale_coefs.h"
+
+static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DSS_REVISION_OFF] =                    0x00,
+	[DSS_SYSCONFIG_OFF] =                   0x04,
+	[DSS_SYSSTATUS_OFF] =                   0x08,
+	[DISPC_IRQ_EOI_OFF] =                   0x20,
+	[DISPC_IRQSTATUS_RAW_OFF] =             0x24,
+	[DISPC_IRQSTATUS_OFF] =                 0x28,
+	[DISPC_IRQENABLE_SET_OFF] =             0x2c,
+	[DISPC_IRQENABLE_CLR_OFF] =             0x30,
+
+	[DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF] =    0x40,
+	[DISPC_GLOBAL_BUFFER_OFF] =             0x44,
+
+	[DISPC_DBG_CONTROL_OFF] =               0x4c,
+	[DISPC_DBG_STATUS_OFF] =                0x50,
+
+	[DISPC_CLKGATING_DISABLE_OFF] =         0x54,
+};
+
+const struct dispc_features dispc_k2g_feats = {
+	.min_pclk_khz = 4375,
+
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 150000,
+	},
+
+	/*
+	 * XXX According TRM the RGB input buffer width up to 2560 should
+	 *     work on 3 taps, but in practice it only works up to 1280.
+	 */
+	.scaling = {
+		.in_width_max_5tap_rgb = 1280,
+		.in_width_max_3tap_rgb = 1280,
+		.in_width_max_5tap_yuv = 2560,
+		.in_width_max_3tap_yuv = 2560,
+		.upscale_limit = 16,
+		.downscale_limit_5tap = 4,
+		.downscale_limit_3tap = 2,
+		/*
+		 * The max supported pixel inc value is 255. The value
+		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
+		 * The maximum bpp of all formats supported by the HW
+		 * is 8. So the maximum supported xinc value is 32,
+		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
+		 */
+		.xinc_max = 32,
+	},
+
+	.subrev = DISPC_K2G,
+
+	.common = "common",
+
+	.common_regs = tidss_k2g_common_regs,
+
+	.num_vps = 1,
+	.vp_name = { "vp1" },
+	.ovr_name = { "ovr1" },
+	.vpclk_name =  { "vp1" },
+	.vp_bus_type = { DISPC_VP_DPI },
+
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 256,
+			.gamma_type = TIDSS_GAMMA_8BIT,
+		},
+	},
+
+	.num_planes = 1,
+	.vid_name = { "vid1" },
+	.vid_lite = { false },
+	.vid_order = { 0 },
+};
+
+static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DSS_REVISION_OFF] =			0x4,
+	[DSS_SYSCONFIG_OFF] =			0x8,
+	[DSS_SYSSTATUS_OFF] =			0x20,
+	[DISPC_IRQ_EOI_OFF] =			0x24,
+	[DISPC_IRQSTATUS_RAW_OFF] =		0x28,
+	[DISPC_IRQSTATUS_OFF] =			0x2c,
+	[DISPC_IRQENABLE_SET_OFF] =		0x30,
+	[DISPC_IRQENABLE_CLR_OFF] =		0x40,
+	[DISPC_VID_IRQENABLE_OFF] =		0x44,
+	[DISPC_VID_IRQSTATUS_OFF] =		0x58,
+	[DISPC_VP_IRQENABLE_OFF] =		0x70,
+	[DISPC_VP_IRQSTATUS_OFF] =		0x7c,
+
+	[WB_IRQENABLE_OFF] =			0x88,
+	[WB_IRQSTATUS_OFF] =			0x8c,
+
+	[DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF] =	0x90,
+	[DISPC_GLOBAL_OUTPUT_ENABLE_OFF] =	0x94,
+	[DISPC_GLOBAL_BUFFER_OFF] =		0x98,
+	[DSS_CBA_CFG_OFF] =			0x9c,
+	[DISPC_DBG_CONTROL_OFF] =		0xa0,
+	[DISPC_DBG_STATUS_OFF] =		0xa4,
+	[DISPC_CLKGATING_DISABLE_OFF] =		0xa8,
+	[DISPC_SECURE_DISABLE_OFF] =		0xac,
+};
+
+const struct dispc_features dispc_am65x_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 165000,
+		[DISPC_VP_OLDI] = 165000,
+	},
+
+	.scaling = {
+		.in_width_max_5tap_rgb = 1280,
+		.in_width_max_3tap_rgb = 2560,
+		.in_width_max_5tap_yuv = 2560,
+		.in_width_max_3tap_yuv = 4096,
+		.upscale_limit = 16,
+		.downscale_limit_5tap = 4,
+		.downscale_limit_3tap = 2,
+		/*
+		 * The max supported pixel inc value is 255. The value
+		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
+		 * The maximum bpp of all formats supported by the HW
+		 * is 8. So the maximum supported xinc value is 32,
+		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
+		 */
+		.xinc_max = 32,
+	},
+
+	.subrev = DISPC_AM65X,
+
+	.common = "common",
+	.common_regs = tidss_am65x_common_regs,
+
+	.num_vps = 2,
+	.vp_name = { "vp1", "vp2" },
+	.ovr_name = { "ovr1", "ovr2" },
+	.vpclk_name =  { "vp1", "vp2" },
+	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
+
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 256,
+			.gamma_type = TIDSS_GAMMA_8BIT,
+		},
+	},
+
+	.num_planes = 2,
+	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
+	.vid_name = { "vid", "vidl1" },
+	.vid_lite = { false, true, },
+	.vid_order = { 1, 0 },
+
+	.errata = {
+		.i2000 = true,
+	},
+};
+
+static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
+	[DSS_REVISION_OFF] =			0x4,
+	[DSS_SYSCONFIG_OFF] =			0x8,
+	[DSS_SYSSTATUS_OFF] =			0x20,
+	[DISPC_IRQ_EOI_OFF] =			0x80,
+	[DISPC_IRQSTATUS_RAW_OFF] =		0x28,
+	[DISPC_IRQSTATUS_OFF] =			0x2c,
+	[DISPC_IRQENABLE_SET_OFF] =		0x30,
+	[DISPC_IRQENABLE_CLR_OFF] =		0x34,
+	[DISPC_VID_IRQENABLE_OFF] =		0x38,
+	[DISPC_VID_IRQSTATUS_OFF] =		0x48,
+	[DISPC_VP_IRQENABLE_OFF] =		0x58,
+	[DISPC_VP_IRQSTATUS_OFF] =		0x68,
+
+	[WB_IRQENABLE_OFF] =			0x78,
+	[WB_IRQSTATUS_OFF] =			0x7c,
+
+	[DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF] =	0x98,
+	[DISPC_GLOBAL_OUTPUT_ENABLE_OFF] =	0x9c,
+	[DISPC_GLOBAL_BUFFER_OFF] =		0xa0,
+	[DSS_CBA_CFG_OFF] =			0xa4,
+	[DISPC_DBG_CONTROL_OFF] =		0xa8,
+	[DISPC_DBG_STATUS_OFF] =		0xac,
+	[DISPC_CLKGATING_DISABLE_OFF] =		0xb0,
+	[DISPC_SECURE_DISABLE_OFF] =		0x90,
+
+	[FBDC_REVISION_1_OFF] =			0xb8,
+	[FBDC_REVISION_2_OFF] =			0xbc,
+	[FBDC_REVISION_3_OFF] =			0xc0,
+	[FBDC_REVISION_4_OFF] =			0xc4,
+	[FBDC_REVISION_5_OFF] =			0xc8,
+	[FBDC_REVISION_6_OFF] =			0xcc,
+	[FBDC_COMMON_CONTROL_OFF] =		0xd0,
+	[FBDC_CONSTANT_COLOR_0_OFF] =		0xd4,
+	[FBDC_CONSTANT_COLOR_1_OFF] =		0xd8,
+	[DISPC_CONNECTIONS_OFF] =		0xe4,
+	[DISPC_MSS_VP1_OFF] =			0xe8,
+	[DISPC_MSS_VP3_OFF] =			0xec,
+};
+
+const struct dispc_features dispc_j721e_feats = {
+	.max_pclk_khz = {
+		[DISPC_VP_DPI] = 170000,
+		[DISPC_VP_INTERNAL] = 600000,
+	},
+
+	.scaling = {
+		.in_width_max_5tap_rgb = 2048,
+		.in_width_max_3tap_rgb = 4096,
+		.in_width_max_5tap_yuv = 4096,
+		.in_width_max_3tap_yuv = 4096,
+		.upscale_limit = 16,
+		.downscale_limit_5tap = 4,
+		.downscale_limit_3tap = 2,
+		/*
+		 * The max supported pixel inc value is 255. The value
+		 * of pixel inc is calculated like this: 1+(xinc-1)*bpp.
+		 * The maximum bpp of all formats supported by the HW
+		 * is 8. So the maximum supported xinc value is 32,
+		 * because 1+(32-1)*8 < 255 < 1+(33-1)*4.
+		 */
+		.xinc_max = 32,
+	},
+
+	.subrev = DISPC_J721E,
+
+	.common = "common_m",
+	.common_regs = tidss_j721e_common_regs,
+
+	.num_vps = 4,
+	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
+	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
+	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
+	/* Currently hard coded VP routing (see dispc_initial_config()) */
+	.vp_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
+			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
+	.vp_feat = { .color = {
+			.has_ctm = true,
+			.gamma_size = 1024,
+			.gamma_type = TIDSS_GAMMA_10BIT,
+		},
+	},
+	.num_planes = 4,
+	.vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
+	.vid_lite = { 0, 1, 0, 1, },
+	.vid_order = { 1, 3, 0, 2 },
+};
+
+static const u16 *dispc_common_regmap;
+
+struct dss_vp_data {
+	u32 *gamma_table;
+};
+
+struct dss_plane_data {
+	u32 zorder;
+	u32 hw_videoport;
+};
+
+struct dispc_device {
+	struct tidss_device *tidss;
+	struct device *dev;
+
+	void __iomem *base_common;
+	void __iomem *base_vid[TIDSS_MAX_PLANES];
+	void __iomem *base_ovr[TIDSS_MAX_PORTS];
+	void __iomem *base_vp[TIDSS_MAX_PORTS];
+
+	struct regmap *oldi_io_ctrl;
+
+	struct clk *vp_clk[TIDSS_MAX_PORTS];
+
+	const struct dispc_features *feat;
+
+	struct clk *fclk;
+
+	bool is_enabled;
+
+	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
+
+	struct dss_plane_data plane_data[TIDSS_MAX_PLANES];
+
+	u32 *fourccs;
+	u32 num_fourccs;
+
+	u32 memory_bandwidth_limit;
+};
+
+static void dispc_write(struct dispc_device *dispc, u16 reg, u32 val)
+{
+	iowrite32(val, dispc->base_common + reg);
+}
+
+static u32 dispc_read(struct dispc_device *dispc, u16 reg)
+{
+	return ioread32(dispc->base_common + reg);
+}
+
+static
+void dispc_vid_write(struct dispc_device *dispc, u32 hw_plane, u16 reg, u32 val)
+{
+	void __iomem *base = dispc->base_vid[hw_plane];
+
+	iowrite32(val, base + reg);
+}
+
+static u32 dispc_vid_read(struct dispc_device *dispc, u32 hw_plane, u16 reg)
+{
+	void __iomem *base = dispc->base_vid[hw_plane];
+
+	return ioread32(base + reg);
+}
+
+static void dispc_ovr_write(struct dispc_device *dispc, u32 hw_videoport,
+			    u16 reg, u32 val)
+{
+	void __iomem *base = dispc->base_ovr[hw_videoport];
+
+	iowrite32(val, base + reg);
+}
+
+static u32 dispc_ovr_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
+{
+	void __iomem *base = dispc->base_ovr[hw_videoport];
+
+	return ioread32(base + reg);
+}
+
+static void dispc_vp_write(struct dispc_device *dispc, u32 hw_videoport,
+			   u16 reg, u32 val)
+{
+	void __iomem *base = dispc->base_vp[hw_videoport];
+
+	iowrite32(val, base + reg);
+}
+
+static u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
+{
+	void __iomem *base = dispc->base_vp[hw_videoport];
+
+	return ioread32(base + reg);
+}
+
+/*
+ * TRM gives bitfields as start:end, where start is the higher bit
+ * number. For example 7:0
+ */
+
+static u32 FLD_MASK(u32 start, u32 end)
+{
+	return ((1 << (start - end + 1)) - 1) << end;
+}
+
+static u32 FLD_VAL(u32 val, u32 start, u32 end)
+{
+	return (val << end) & FLD_MASK(start, end);
+}
+
+static u32 FLD_GET(u32 val, u32 start, u32 end)
+{
+	return (val & FLD_MASK(start, end)) >> end;
+}
+
+static u32 FLD_MOD(u32 orig, u32 val, u32 start, u32 end)
+{
+	return (orig & ~FLD_MASK(start, end)) | FLD_VAL(val, start, end);
+}
+
+static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
+{
+	return FLD_GET(dispc_read(dispc, idx), start, end);
+}
+
+static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val,
+			u32 start, u32 end)
+{
+	dispc_write(dispc, idx, FLD_MOD(dispc_read(dispc, idx), val,
+					start, end));
+}
+
+static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
+		       u32 start, u32 end)
+{
+	return FLD_GET(dispc_vid_read(dispc, hw_plane, idx), start, end);
+}
+
+static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
+			    u32 val, u32 start, u32 end)
+{
+	dispc_vid_write(dispc, hw_plane, idx,
+			FLD_MOD(dispc_vid_read(dispc, hw_plane, idx),
+				val, start, end));
+}
+
+static u32 VP_REG_GET(struct dispc_device *dispc, u32 vp, u32 idx,
+		      u32 start, u32 end)
+{
+	return FLD_GET(dispc_vp_read(dispc, vp, idx), start, end);
+}
+
+static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
+			   u32 start, u32 end)
+{
+	dispc_vp_write(dispc, vp, idx, FLD_MOD(dispc_vp_read(dispc, vp, idx),
+					       val, start, end));
+}
+
+__maybe_unused
+static u32 OVR_REG_GET(struct dispc_device *dispc, u32 ovr, u32 idx,
+		       u32 start, u32 end)
+{
+	return FLD_GET(dispc_ovr_read(dispc, ovr, idx), start, end);
+}
+
+static void OVR_REG_FLD_MOD(struct dispc_device *dispc, u32 ovr, u32 idx,
+			    u32 val, u32 start, u32 end)
+{
+	dispc_ovr_write(dispc, ovr, idx,
+			FLD_MOD(dispc_ovr_read(dispc, ovr, idx),
+				val, start, end));
+}
+
+static dispc_irq_t dispc_vp_irq_from_raw(u32 stat, u32 hw_videoport)
+{
+	dispc_irq_t vp_stat = 0;
+
+	if (stat & BIT(0))
+		vp_stat |= DSS_IRQ_VP_FRAME_DONE(hw_videoport);
+	if (stat & BIT(1))
+		vp_stat |= DSS_IRQ_VP_VSYNC_EVEN(hw_videoport);
+	if (stat & BIT(2))
+		vp_stat |= DSS_IRQ_VP_VSYNC_ODD(hw_videoport);
+	if (stat & BIT(4))
+		vp_stat |= DSS_IRQ_VP_SYNC_LOST(hw_videoport);
+
+	return vp_stat;
+}
+
+static u32 dispc_vp_irq_to_raw(dispc_irq_t vpstat, u32 hw_videoport)
+{
+	u32 stat = 0;
+
+	if (vpstat & DSS_IRQ_VP_FRAME_DONE(hw_videoport))
+		stat |= BIT(0);
+	if (vpstat & DSS_IRQ_VP_VSYNC_EVEN(hw_videoport))
+		stat |= BIT(1);
+	if (vpstat & DSS_IRQ_VP_VSYNC_ODD(hw_videoport))
+		stat |= BIT(2);
+	if (vpstat & DSS_IRQ_VP_SYNC_LOST(hw_videoport))
+		stat |= BIT(4);
+
+	return stat;
+}
+
+static dispc_irq_t dispc_vid_irq_from_raw(u32 stat, u32 hw_plane)
+{
+	dispc_irq_t vid_stat = 0;
+
+	if (stat & BIT(0))
+		vid_stat |= DSS_IRQ_PLANE_FIFO_UNDERFLOW(hw_plane);
+
+	return vid_stat;
+}
+
+static u32 dispc_vid_irq_to_raw(dispc_irq_t vidstat, u32 hw_plane)
+{
+	u32 stat = 0;
+
+	if (vidstat & DSS_IRQ_PLANE_FIFO_UNDERFLOW(hw_plane))
+		stat |= BIT(0);
+
+	return stat;
+}
+
+static dispc_irq_t dispc_k2g_vp_read_irqstatus(struct dispc_device *dispc,
+					       u32 hw_videoport)
+{
+	u32 stat = dispc_vp_read(dispc, hw_videoport, DISPC_VP_K2G_IRQSTATUS);
+
+	return dispc_vp_irq_from_raw(stat, hw_videoport);
+}
+
+static void dispc_k2g_vp_write_irqstatus(struct dispc_device *dispc,
+					 u32 hw_videoport, dispc_irq_t vpstat)
+{
+	u32 stat = dispc_vp_irq_to_raw(vpstat, hw_videoport);
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_K2G_IRQSTATUS, stat);
+}
+
+static dispc_irq_t dispc_k2g_vid_read_irqstatus(struct dispc_device *dispc,
+						u32 hw_plane)
+{
+	u32 stat = dispc_vid_read(dispc, hw_plane, DISPC_VID_K2G_IRQSTATUS);
+
+	return dispc_vid_irq_from_raw(stat, hw_plane);
+}
+
+static void dispc_k2g_vid_write_irqstatus(struct dispc_device *dispc,
+					  u32 hw_plane, dispc_irq_t vidstat)
+{
+	u32 stat = dispc_vid_irq_to_raw(vidstat, hw_plane);
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_K2G_IRQSTATUS, stat);
+}
+
+static dispc_irq_t dispc_k2g_vp_read_irqenable(struct dispc_device *dispc,
+					       u32 hw_videoport)
+{
+	u32 stat = dispc_vp_read(dispc, hw_videoport, DISPC_VP_K2G_IRQENABLE);
+
+	return dispc_vp_irq_from_raw(stat, hw_videoport);
+}
+
+static void dispc_k2g_vp_write_irqenable(struct dispc_device *dispc,
+					 u32 hw_videoport, dispc_irq_t vpstat)
+{
+	u32 stat = dispc_vp_irq_to_raw(vpstat, hw_videoport);
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_K2G_IRQENABLE, stat);
+}
+
+static dispc_irq_t dispc_k2g_vid_read_irqenable(struct dispc_device *dispc,
+						u32 hw_plane)
+{
+	u32 stat = dispc_vid_read(dispc, hw_plane, DISPC_VID_K2G_IRQENABLE);
+
+	return dispc_vid_irq_from_raw(stat, hw_plane);
+}
+
+static void dispc_k2g_vid_write_irqenable(struct dispc_device *dispc,
+					  u32 hw_plane, dispc_irq_t vidstat)
+{
+	u32 stat = dispc_vid_irq_to_raw(vidstat, hw_plane);
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_K2G_IRQENABLE, stat);
+}
+
+static void dispc_k2g_clear_irqstatus(struct dispc_device *dispc,
+				      dispc_irq_t mask)
+{
+	dispc_k2g_vp_write_irqstatus(dispc, 0, mask);
+	dispc_k2g_vid_write_irqstatus(dispc, 0, mask);
+}
+
+static
+dispc_irq_t dispc_k2g_read_and_clear_irqstatus(struct dispc_device *dispc)
+{
+	dispc_irq_t stat = 0;
+
+	/* always clear the top level irqstatus */
+	dispc_write(dispc, DISPC_IRQSTATUS,
+		    dispc_read(dispc, DISPC_IRQSTATUS));
+
+	stat |= dispc_k2g_vp_read_irqstatus(dispc, 0);
+	stat |= dispc_k2g_vid_read_irqstatus(dispc, 0);
+
+	dispc_k2g_clear_irqstatus(dispc, stat);
+
+	return stat;
+}
+
+static dispc_irq_t dispc_k2g_read_irqenable(struct dispc_device *dispc)
+{
+	dispc_irq_t stat = 0;
+
+	stat |= dispc_k2g_vp_read_irqenable(dispc, 0);
+	stat |= dispc_k2g_vid_read_irqenable(dispc, 0);
+
+	return stat;
+}
+
+static
+void dispc_k2g_write_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
+{
+	dispc_irq_t old_mask = dispc_k2g_read_irqenable(dispc);
+
+	/* clear the irqstatus for newly enabled irqs */
+	dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & mask);
+
+	dispc_k2g_vp_write_irqenable(dispc, 0, mask);
+	dispc_k2g_vid_write_irqenable(dispc, 0, mask);
+
+	dispc_write(dispc, DISPC_IRQENABLE_SET, (1 << 0) | (1 << 7));
+
+	/* flush posted write */
+	dispc_k2g_read_irqenable(dispc);
+}
+
+static dispc_irq_t dispc_k3_vp_read_irqstatus(struct dispc_device *dispc,
+					      u32 hw_videoport)
+{
+	u32 stat = dispc_read(dispc, DISPC_VP_IRQSTATUS(hw_videoport));
+
+	return dispc_vp_irq_from_raw(stat, hw_videoport);
+}
+
+static void dispc_k3_vp_write_irqstatus(struct dispc_device *dispc,
+					u32 hw_videoport, dispc_irq_t vpstat)
+{
+	u32 stat = dispc_vp_irq_to_raw(vpstat, hw_videoport);
+
+	dispc_write(dispc, DISPC_VP_IRQSTATUS(hw_videoport), stat);
+}
+
+static dispc_irq_t dispc_k3_vid_read_irqstatus(struct dispc_device *dispc,
+					       u32 hw_plane)
+{
+	u32 stat = dispc_read(dispc, DISPC_VID_IRQSTATUS(hw_plane));
+
+	return dispc_vid_irq_from_raw(stat, hw_plane);
+}
+
+static void dispc_k3_vid_write_irqstatus(struct dispc_device *dispc,
+					 u32 hw_plane, dispc_irq_t vidstat)
+{
+	u32 stat = dispc_vid_irq_to_raw(vidstat, hw_plane);
+
+	dispc_write(dispc, DISPC_VID_IRQSTATUS(hw_plane), stat);
+}
+
+static dispc_irq_t dispc_k3_vp_read_irqenable(struct dispc_device *dispc,
+					      u32 hw_videoport)
+{
+	u32 stat = dispc_read(dispc, DISPC_VP_IRQENABLE(hw_videoport));
+
+	return dispc_vp_irq_from_raw(stat, hw_videoport);
+}
+
+static void dispc_k3_vp_write_irqenable(struct dispc_device *dispc,
+					u32 hw_videoport, dispc_irq_t vpstat)
+{
+	u32 stat = dispc_vp_irq_to_raw(vpstat, hw_videoport);
+
+	dispc_write(dispc, DISPC_VP_IRQENABLE(hw_videoport), stat);
+}
+
+static dispc_irq_t dispc_k3_vid_read_irqenable(struct dispc_device *dispc,
+					       u32 hw_plane)
+{
+	u32 stat = dispc_read(dispc, DISPC_VID_IRQENABLE(hw_plane));
+
+	return dispc_vid_irq_from_raw(stat, hw_plane);
+}
+
+static void dispc_k3_vid_write_irqenable(struct dispc_device *dispc,
+					 u32 hw_plane, dispc_irq_t vidstat)
+{
+	u32 stat = dispc_vid_irq_to_raw(vidstat, hw_plane);
+
+	dispc_write(dispc, DISPC_VID_IRQENABLE(hw_plane), stat);
+}
+
+static
+void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
+{
+	unsigned int i;
+	u32 top_clear = 0;
+
+	for (i = 0; i < dispc->feat->num_vps; ++i) {
+		if (clearmask & DSS_IRQ_VP_MASK(i)) {
+			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
+			top_clear |= BIT(i);
+		}
+	}
+	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
+			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
+			top_clear |= BIT(4 + i);
+		}
+	}
+	if (dispc->feat->subrev == DISPC_K2G)
+		return;
+
+	dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
+
+	/* Flush posted writes */
+	dispc_read(dispc, DISPC_IRQSTATUS);
+}
+
+static
+dispc_irq_t dispc_k3_read_and_clear_irqstatus(struct dispc_device *dispc)
+{
+	dispc_irq_t status = 0;
+	unsigned int i;
+
+	for (i = 0; i < dispc->feat->num_vps; ++i)
+		status |= dispc_k3_vp_read_irqstatus(dispc, i);
+
+	for (i = 0; i < dispc->feat->num_planes; ++i)
+		status |= dispc_k3_vid_read_irqstatus(dispc, i);
+
+	dispc_k3_clear_irqstatus(dispc, status);
+
+	return status;
+}
+
+static dispc_irq_t dispc_k3_read_irqenable(struct dispc_device *dispc)
+{
+	dispc_irq_t enable = 0;
+	unsigned int i;
+
+	for (i = 0; i < dispc->feat->num_vps; ++i)
+		enable |= dispc_k3_vp_read_irqenable(dispc, i);
+
+	for (i = 0; i < dispc->feat->num_planes; ++i)
+		enable |= dispc_k3_vid_read_irqenable(dispc, i);
+
+	return enable;
+}
+
+static void dispc_k3_write_irqenable(struct dispc_device *dispc,
+				     dispc_irq_t mask)
+{
+	unsigned int i;
+	u32 main_enable = 0, main_disable = 0;
+	dispc_irq_t old_mask;
+
+	old_mask = dispc_k3_read_irqenable(dispc);
+
+	/* clear the irqstatus for newly enabled irqs */
+	dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & mask);
+
+	for (i = 0; i < dispc->feat->num_vps; ++i) {
+		dispc_k3_vp_write_irqenable(dispc, i, mask);
+		if (mask & DSS_IRQ_VP_MASK(i))
+			main_enable |= BIT(i);		/* VP IRQ */
+		else
+			main_disable |= BIT(i);		/* VP IRQ */
+	}
+
+	for (i = 0; i < dispc->feat->num_planes; ++i) {
+		dispc_k3_vid_write_irqenable(dispc, i, mask);
+		if (mask & DSS_IRQ_PLANE_MASK(i))
+			main_enable |= BIT(i + 4);	/* VID IRQ */
+		else
+			main_disable |= BIT(i + 4);	/* VID IRQ */
+	}
+
+	if (main_enable)
+		dispc_write(dispc, DISPC_IRQENABLE_SET, main_enable);
+
+	if (main_disable)
+		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
+
+	/* Flush posted writes */
+	dispc_read(dispc, DISPC_IRQENABLE_SET);
+}
+
+dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc)
+{
+	switch (dispc->feat->subrev) {
+	case DISPC_K2G:
+		return dispc_k2g_read_and_clear_irqstatus(dispc);
+	case DISPC_AM65X:
+	case DISPC_J721E:
+		return dispc_k3_read_and_clear_irqstatus(dispc);
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+}
+
+void dispc_write_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
+{
+	switch (dispc->feat->subrev) {
+	case DISPC_K2G:
+		dispc_k2g_write_irqenable(dispc, mask);
+		break;
+	case DISPC_AM65X:
+	case DISPC_J721E:
+		dispc_k3_write_irqenable(dispc, mask);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+enum dispc_oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 2 };
+
+struct dispc_bus_format {
+	u32 bus_fmt;
+	u32 data_width;
+	bool is_oldi_fmt;
+	enum dispc_oldi_mode_reg_val oldi_mode_reg_val;
+};
+
+static const struct dispc_bus_format dispc_bus_formats[] = {
+	{ MEDIA_BUS_FMT_RGB444_1X12,		12, false, 0 },
+	{ MEDIA_BUS_FMT_RGB565_1X16,		16, false, 0 },
+	{ MEDIA_BUS_FMT_RGB666_1X18,		18, false, 0 },
+	{ MEDIA_BUS_FMT_RGB888_1X24,		24, false, 0 },
+	{ MEDIA_BUS_FMT_RGB101010_1X30,		30, false, 0 },
+	{ MEDIA_BUS_FMT_RGB121212_1X36,		36, false, 0 },
+	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,	18, true, SPWG_18 },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,	24, true, SPWG_24 },
+	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,	24, true, JEIDA_24 },
+};
+
+static const
+struct dispc_bus_format *dispc_vp_find_bus_fmt(struct dispc_device *dispc,
+					       u32 hw_videoport,
+					       u32 bus_fmt, u32 bus_flags)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dispc_bus_formats); ++i) {
+		if (dispc_bus_formats[i].bus_fmt == bus_fmt)
+			return &dispc_bus_formats[i];
+	}
+
+	return NULL;
+}
+
+int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
+		       const struct drm_crtc_state *state)
+{
+	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
+	const struct dispc_bus_format *fmt;
+
+	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
+				    tstate->bus_flags);
+	if (!fmt) {
+		dev_dbg(dispc->dev, "%s: Unsupported bus format: %u\n",
+			__func__, tstate->bus_format);
+		return -EINVAL;
+	}
+
+	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI &&
+	    fmt->is_oldi_fmt) {
+		dev_dbg(dispc->dev, "%s: %s is not OLDI-port\n",
+			__func__, dispc->feat->vp_name[hw_videoport]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void dispc_oldi_tx_power(struct dispc_device *dispc, bool power)
+{
+	u32 val = power ? 0 : OLDI_PWRDN_TX;
+
+	if (WARN_ON(!dispc->oldi_io_ctrl))
+		return;
+
+	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
+			   OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
+			   OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
+			   OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
+			   OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
+			   OLDI_PWRDN_TX, val);
+}
+
+static void dispc_set_num_datalines(struct dispc_device *dispc,
+				    u32 hw_videoport, int num_lines)
+{
+	int v;
+
+	switch (num_lines) {
+	case 12:
+		v = 0; break;
+	case 16:
+		v = 1; break;
+	case 18:
+		v = 2; break;
+	case 24:
+		v = 3; break;
+	case 30:
+		v = 4; break;
+	case 36:
+		v = 5; break;
+	default:
+		WARN_ON(1);
+		v = 3;
+	}
+
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v, 10, 8);
+}
+
+static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
+			      const struct dispc_bus_format *fmt)
+{
+	u32 oldi_cfg = 0;
+	u32 oldi_reset_bit = BIT(5 + hw_videoport);
+	int count = 0;
+
+	/*
+	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
+	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
+	 */
+
+	if (fmt->data_width == 24)
+		oldi_cfg |= BIT(8); /* MSB */
+	else if (fmt->data_width != 18)
+		dev_warn(dispc->dev, "%s: %d port width not supported\n",
+			 __func__, fmt->data_width);
+
+	oldi_cfg |= BIT(7); /* DEPOL */
+
+	oldi_cfg = FLD_MOD(oldi_cfg, fmt->oldi_mode_reg_val, 3, 1);
+
+	oldi_cfg |= BIT(12); /* SOFTRST */
+
+	oldi_cfg |= BIT(0); /* ENABLE */
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
+
+	while (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)) &&
+	       count < 10000)
+		count++;
+
+	if (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)))
+		dev_warn(dispc->dev, "%s: timeout waiting OLDI reset done\n",
+			 __func__);
+}
+
+void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
+		      const struct drm_crtc_state *state)
+{
+	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
+	const struct dispc_bus_format *fmt;
+
+	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
+				    tstate->bus_flags);
+
+	if (WARN_ON(!fmt))
+		return;
+
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
+		dispc_oldi_tx_power(dispc, true);
+
+		dispc_enable_oldi(dispc, hw_videoport, fmt);
+	}
+}
+
+void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
+		     const struct drm_crtc_state *state)
+{
+	const struct drm_display_mode *mode = &state->adjusted_mode;
+	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
+	bool align, onoff, rf, ieo, ipc, ihs, ivs;
+	const struct dispc_bus_format *fmt;
+	u32 hsw, hfp, hbp, vsw, vfp, vbp;
+
+	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
+				    tstate->bus_flags);
+
+	if (WARN_ON(!fmt))
+		return;
+
+	dispc_set_num_datalines(dispc, hw_videoport, fmt->data_width);
+
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsw = mode->hsync_end - mode->hsync_start;
+	hbp = mode->htotal - mode->hsync_end;
+
+	vfp = mode->vsync_start - mode->vdisplay;
+	vsw = mode->vsync_end - mode->vsync_start;
+	vbp = mode->vtotal - mode->vsync_end;
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_H,
+		       FLD_VAL(hsw - 1, 7, 0) |
+		       FLD_VAL(hfp - 1, 19, 8) |
+		       FLD_VAL(hbp - 1, 31, 20));
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_TIMING_V,
+		       FLD_VAL(vsw - 1, 7, 0) |
+		       FLD_VAL(vfp, 19, 8) |
+		       FLD_VAL(vbp, 31, 20));
+
+	ivs = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
+
+	ihs = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
+
+	ieo = !!(tstate->bus_flags & DRM_BUS_FLAG_DE_LOW);
+
+	ipc = !!(tstate->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE);
+
+	/* always use the 'rf' setting */
+	onoff = true;
+
+	rf = !!(tstate->bus_flags & DRM_BUS_FLAG_SYNC_POSEDGE);
+
+	/* always use aligned syncs */
+	align = true;
+
+	/* always use DE_HIGH for OLDI */
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI)
+		ieo = false;
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
+		       FLD_VAL(align, 18, 18) |
+		       FLD_VAL(onoff, 17, 17) |
+		       FLD_VAL(rf, 16, 16) |
+		       FLD_VAL(ieo, 15, 15) |
+		       FLD_VAL(ipc, 14, 14) |
+		       FLD_VAL(ihs, 13, 13) |
+		       FLD_VAL(ivs, 12, 12));
+
+	dispc_vp_write(dispc, hw_videoport, DISPC_VP_SIZE_SCREEN,
+		       FLD_VAL(mode->hdisplay - 1, 11, 0) |
+		       FLD_VAL(mode->vdisplay - 1, 27, 16));
+
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 0, 0);
+}
+
+void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
+{
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0, 0, 0);
+}
+
+void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
+{
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
+		dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 0);
+
+		dispc_oldi_tx_power(dispc, false);
+	}
+}
+
+bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport)
+{
+	return VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, 5, 5);
+}
+
+void dispc_vp_go(struct dispc_device *dispc, u32 hw_videoport)
+{
+	WARN_ON(VP_REG_GET(dispc, hw_videoport, DISPC_VP_CONTROL, 5, 5));
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1, 5, 5);
+}
+
+enum c8_to_c12_mode { C8_TO_C12_REPLICATE, C8_TO_C12_MAX, C8_TO_C12_MIN };
+
+static u16 c8_to_c12(u8 c8, enum c8_to_c12_mode mode)
+{
+	u16 c12;
+
+	c12 = c8 << 4;
+
+	switch (mode) {
+	case C8_TO_C12_REPLICATE:
+		/* Copy c8 4 MSB to 4 LSB for full scale c12 */
+		c12 |= c8 >> 4;
+		break;
+	case C8_TO_C12_MAX:
+		c12 |= 0xF;
+		break;
+	default:
+	case C8_TO_C12_MIN:
+		break;
+	}
+
+	return c12;
+}
+
+static u64 argb8888_to_argb12121212(u32 argb8888, enum c8_to_c12_mode m)
+{
+	u8 a, r, g, b;
+	u64 v;
+
+	a = (argb8888 >> 24) & 0xff;
+	r = (argb8888 >> 16) & 0xff;
+	g = (argb8888 >> 8) & 0xff;
+	b = (argb8888 >> 0) & 0xff;
+
+	v = ((u64)c8_to_c12(a, m) << 36) | ((u64)c8_to_c12(r, m) << 24) |
+		((u64)c8_to_c12(g, m) << 12) | (u64)c8_to_c12(b, m);
+
+	return v;
+}
+
+static void dispc_vp_set_default_color(struct dispc_device *dispc,
+				       u32 hw_videoport, u32 default_color)
+{
+	u64 v;
+
+	v = argb8888_to_argb12121212(default_color, C8_TO_C12_REPLICATE);
+
+	dispc_ovr_write(dispc, hw_videoport,
+			DISPC_OVR_DEFAULT_COLOR, v & 0xffffffff);
+	dispc_ovr_write(dispc, hw_videoport,
+			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
+}
+
+enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
+					 u32 hw_videoport,
+					 const struct drm_display_mode *mode)
+{
+	u32 hsw, hfp, hbp, vsw, vfp, vbp;
+	enum dispc_vp_bus_type bus_type;
+	int max_pclk;
+
+	bus_type = dispc->feat->vp_bus_type[hw_videoport];
+
+	max_pclk = dispc->feat->max_pclk_khz[bus_type];
+
+	if (WARN_ON(max_pclk == 0))
+		return MODE_BAD;
+
+	if (mode->clock < dispc->feat->min_pclk_khz)
+		return MODE_CLOCK_LOW;
+
+	if (mode->clock > max_pclk)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 4096)
+		return MODE_BAD;
+
+	if (mode->vdisplay > 4096)
+		return MODE_BAD;
+
+	/* TODO: add interlace support */
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_NO_INTERLACE;
+
+	/*
+	 * Enforce the output width is divisible by 2. Actually this
+	 * is only needed in following cases:
+	 * - YUV output selected (BT656, BT1120)
+	 * - Dithering enabled
+	 * - TDM with TDMCycleFormat == 3
+	 * But for simplicity we enforce that always.
+	 */
+	if ((mode->hdisplay % 2) != 0)
+		return MODE_BAD_HVALUE;
+
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsw = mode->hsync_end - mode->hsync_start;
+	hbp = mode->htotal - mode->hsync_end;
+
+	vfp = mode->vsync_start - mode->vdisplay;
+	vsw = mode->vsync_end - mode->vsync_start;
+	vbp = mode->vtotal - mode->vsync_end;
+
+	if (hsw < 1 || hsw > 256 ||
+	    hfp < 1 || hfp > 4096 ||
+	    hbp < 1 || hbp > 4096)
+		return MODE_BAD_HVALUE;
+
+	if (vsw < 1 || vsw > 256 ||
+	    vfp > 4095 || vbp > 4095)
+		return MODE_BAD_VVALUE;
+
+	if (dispc->memory_bandwidth_limit) {
+		const unsigned int bpp = 4;
+		u64 bandwidth;
+
+		bandwidth = 1000 * mode->clock;
+		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
+		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
+
+		if (dispc->memory_bandwidth_limit < bandwidth)
+			return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
+int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport)
+{
+	int ret = clk_prepare_enable(dispc->vp_clk[hw_videoport]);
+
+	if (ret)
+		dev_err(dispc->dev, "%s: enabling clk failed: %d\n", __func__,
+			ret);
+
+	return ret;
+}
+
+void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
+{
+	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
+}
+
+/*
+ * Calculate the percentage difference between the requested pixel clock rate
+ * and the effective rate resulting from calculating the clock divider value.
+ */
+static
+unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
+{
+	int r = rate / 100, rr = real_rate / 100;
+
+	return (unsigned int)(abs(((rr - r) * 100) / r));
+}
+
+int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
+			  unsigned long rate)
+{
+	int r;
+	unsigned long new_rate;
+
+	r = clk_set_rate(dispc->vp_clk[hw_videoport], rate);
+	if (r) {
+		dev_err(dispc->dev, "vp%d: failed to set clk rate to %lu\n",
+			hw_videoport, rate);
+		return r;
+	}
+
+	new_rate = clk_get_rate(dispc->vp_clk[hw_videoport]);
+
+	if (dispc_pclk_diff(rate, new_rate) > 5)
+		dev_warn(dispc->dev,
+			 "vp%d: Clock rate %lu differs over 5%% from requsted %lu\n",
+			 hw_videoport, new_rate, rate);
+
+	dev_dbg(dispc->dev, "vp%d: new rate %lu Hz (requested %lu Hz)\n",
+		hw_videoport, clk_get_rate(dispc->vp_clk[hw_videoport]), rate);
+
+	return 0;
+}
+
+/* OVR */
+static void dispc_k2g_ovr_set_plane(struct dispc_device *dispc,
+				    u32 hw_plane, u32 hw_videoport,
+				    u32 x, u32 y, u32 zpos)
+{
+	/* On k2g there is only one plane and no need for ovr */
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_K2G_POSITION,
+			x | (y << 16));
+}
+
+static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
+				      u32 hw_plane, u32 hw_videoport,
+				      u32 x, u32 y, u32 zpos)
+{
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+			hw_plane, 4, 1);
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+			x, 17, 6);
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+			y, 30, 19);
+}
+
+static void dispc_j721e_ovr_set_plane(struct dispc_device *dispc,
+				      u32 hw_plane, u32 hw_videoport,
+				      u32 x, u32 y, u32 zpos)
+{
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+			hw_plane, 4, 1);
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(zpos),
+			x, 13, 0);
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(zpos),
+			y, 29, 16);
+}
+
+static void dispc_ovr_set_plane(struct dispc_device *dispc,
+				u32 hw_plane, u32 hw_videoport,
+				u32 x, u32 y, u32 zpos)
+{
+	switch (dispc->feat->subrev) {
+	case DISPC_K2G:
+		dispc_k2g_ovr_set_plane(dispc, hw_plane, hw_videoport,
+					x, y, zpos);
+		break;
+	case DISPC_AM65X:
+		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
+					  x, y, zpos);
+		break;
+	case DISPC_J721E:
+		dispc_j721e_ovr_set_plane(dispc, hw_plane, hw_videoport,
+					  x, y, zpos);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+static void dispc_ovr_enable_plane(struct dispc_device *dispc,
+				   u32 hw_videoport, u32 zpos, bool enable)
+{
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+			!!enable, 0, 0);
+}
+
+/* CSC */
+enum csc_ctm {
+	CSC_RR, CSC_RG, CSC_RB,
+	CSC_GR, CSC_GG, CSC_GB,
+	CSC_BR, CSC_BG, CSC_BB,
+};
+
+enum csc_yuv2rgb {
+	CSC_RY, CSC_RCB, CSC_RCR,
+	CSC_GY, CSC_GCB, CSC_GCR,
+	CSC_BY, CSC_BCB, CSC_BCR,
+};
+
+enum csc_rgb2yuv {
+	CSC_YR,  CSC_YG,  CSC_YB,
+	CSC_CBR, CSC_CBG, CSC_CBB,
+	CSC_CRR, CSC_CRG, CSC_CRB,
+};
+
+struct dispc_csc_coef {
+	void (*to_regval)(const struct dispc_csc_coef *csc, u32 *regval);
+	int m[9];
+	int preoffset[3];
+	int postoffset[3];
+	enum { CLIP_LIMITED_RANGE = 0, CLIP_FULL_RANGE = 1, } cliping;
+	const char *name;
+};
+
+#define DISPC_CSC_REGVAL_LEN 8
+
+static
+void dispc_csc_offset_regval(const struct dispc_csc_coef *csc, u32 *regval)
+{
+#define OVAL(x, y) (FLD_VAL(x, 15, 3) | FLD_VAL(y, 31, 19))
+	regval[5] = OVAL(csc->preoffset[0], csc->preoffset[1]);
+	regval[6] = OVAL(csc->preoffset[2], csc->postoffset[0]);
+	regval[7] = OVAL(csc->postoffset[1], csc->postoffset[2]);
+#undef OVAL
+}
+
+#define CVAL(x, y) (FLD_VAL(x, 10, 0) | FLD_VAL(y, 26, 16))
+static
+void dispc_csc_yuv2rgb_regval(const struct dispc_csc_coef *csc, u32 *regval)
+{
+	regval[0] = CVAL(csc->m[CSC_RY], csc->m[CSC_RCR]);
+	regval[1] = CVAL(csc->m[CSC_RCB], csc->m[CSC_GY]);
+	regval[2] = CVAL(csc->m[CSC_GCR], csc->m[CSC_GCB]);
+	regval[3] = CVAL(csc->m[CSC_BY], csc->m[CSC_BCR]);
+	regval[4] = CVAL(csc->m[CSC_BCB], 0);
+
+	dispc_csc_offset_regval(csc, regval);
+}
+
+__maybe_unused static
+void dispc_csc_rgb2yuv_regval(const struct dispc_csc_coef *csc, u32 *regval)
+{
+	regval[0] = CVAL(csc->m[CSC_YR], csc->m[CSC_YG]);
+	regval[1] = CVAL(csc->m[CSC_YB], csc->m[CSC_CRR]);
+	regval[2] = CVAL(csc->m[CSC_CRG], csc->m[CSC_CRB]);
+	regval[3] = CVAL(csc->m[CSC_CBR], csc->m[CSC_CBG]);
+	regval[4] = CVAL(csc->m[CSC_CBB], 0);
+
+	dispc_csc_offset_regval(csc, regval);
+}
+
+static void dispc_csc_cpr_regval(const struct dispc_csc_coef *csc,
+				 u32 *regval)
+{
+	regval[0] = CVAL(csc->m[CSC_RR], csc->m[CSC_RG]);
+	regval[1] = CVAL(csc->m[CSC_RB], csc->m[CSC_GR]);
+	regval[2] = CVAL(csc->m[CSC_GG], csc->m[CSC_GB]);
+	regval[3] = CVAL(csc->m[CSC_BR], csc->m[CSC_BG]);
+	regval[4] = CVAL(csc->m[CSC_BB], 0);
+
+	dispc_csc_offset_regval(csc, regval);
+}
+
+#undef CVAL
+
+static void dispc_k2g_vid_write_csc(struct dispc_device *dispc, u32 hw_plane,
+				    const struct dispc_csc_coef *csc)
+{
+	static const u16 dispc_vid_csc_coef_reg[] = {
+		DISPC_VID_CSC_COEF(0), DISPC_VID_CSC_COEF(1),
+		DISPC_VID_CSC_COEF(2), DISPC_VID_CSC_COEF(3),
+		DISPC_VID_CSC_COEF(4), DISPC_VID_CSC_COEF(5),
+		DISPC_VID_CSC_COEF(6), /* K2G has no post offset support */
+	};
+	u32 regval[DISPC_CSC_REGVAL_LEN];
+	unsigned int i;
+
+	csc->to_regval(csc, regval);
+
+	if (regval[7] != 0)
+		dev_warn(dispc->dev, "%s: No post offset support for %s\n",
+			 __func__, csc->name);
+
+	for (i = 0; i < ARRAY_SIZE(dispc_vid_csc_coef_reg); i++)
+		dispc_vid_write(dispc, hw_plane, dispc_vid_csc_coef_reg[i],
+				regval[i]);
+}
+
+static void dispc_k3_vid_write_csc(struct dispc_device *dispc, u32 hw_plane,
+				   const struct dispc_csc_coef *csc)
+{
+	static const u16 dispc_vid_csc_coef_reg[DISPC_CSC_REGVAL_LEN] = {
+		DISPC_VID_CSC_COEF(0), DISPC_VID_CSC_COEF(1),
+		DISPC_VID_CSC_COEF(2), DISPC_VID_CSC_COEF(3),
+		DISPC_VID_CSC_COEF(4), DISPC_VID_CSC_COEF(5),
+		DISPC_VID_CSC_COEF(6), DISPC_VID_CSC_COEF7,
+	};
+	u32 regval[DISPC_CSC_REGVAL_LEN];
+	unsigned int i;
+
+	csc->to_regval(csc, regval);
+
+	for (i = 0; i < ARRAY_SIZE(dispc_vid_csc_coef_reg); i++)
+		dispc_vid_write(dispc, hw_plane, dispc_vid_csc_coef_reg[i],
+				regval[i]);
+}
+
+/* YUV -> RGB, ITU-R BT.601, full range */
+static const struct dispc_csc_coef csc_yuv2rgb_bt601_full = {
+	dispc_csc_yuv2rgb_regval,
+	{ 256,   0,  358,	/* ry, rcb, rcr |1.000  0.000  1.402|*/
+	  256, -88, -182,	/* gy, gcb, gcr |1.000 -0.344 -0.714|*/
+	  256, 452,    0, },	/* by, bcb, bcr |1.000  1.772  0.000|*/
+	{    0, -2048, -2048, },	/* full range */
+	{    0,     0,     0, },
+	CLIP_FULL_RANGE,
+	"BT.601 Full",
+};
+
+/* YUV -> RGB, ITU-R BT.601, limited range */
+static const struct dispc_csc_coef csc_yuv2rgb_bt601_lim = {
+	dispc_csc_yuv2rgb_regval,
+	{ 298,    0,  409,	/* ry, rcb, rcr |1.164  0.000  1.596|*/
+	  298, -100, -208,	/* gy, gcb, gcr |1.164 -0.392 -0.813|*/
+	  298,  516,    0, },	/* by, bcb, bcr |1.164  2.017  0.000|*/
+	{ -256, -2048, -2048, },	/* limited range */
+	{    0,     0,     0, },
+	CLIP_FULL_RANGE,
+	"BT.601 Limited",
+};
+
+/* YUV -> RGB, ITU-R BT.709, full range */
+static const struct dispc_csc_coef csc_yuv2rgb_bt709_full = {
+	dispc_csc_yuv2rgb_regval,
+	{ 256,	  0,  402,	/* ry, rcb, rcr |1.000	0.000  1.570|*/
+	  256,  -48, -120,	/* gy, gcb, gcr |1.000 -0.187 -0.467|*/
+	  256,  475,    0, },	/* by, bcb, bcr |1.000	1.856  0.000|*/
+	{    0, -2048, -2048, },	/* full range */
+	{    0,     0,     0, },
+	CLIP_FULL_RANGE,
+	"BT.709 Full",
+};
+
+/* YUV -> RGB, ITU-R BT.709, limited range */
+static const struct dispc_csc_coef csc_yuv2rgb_bt709_lim = {
+	dispc_csc_yuv2rgb_regval,
+	{ 298,    0,  459,	/* ry, rcb, rcr |1.164  0.000  1.793|*/
+	  298,  -55, -136,	/* gy, gcb, gcr |1.164 -0.213 -0.533|*/
+	  298,  541,    0, },	/* by, bcb, bcr |1.164  2.112  0.000|*/
+	{ -256, -2048, -2048, },	/* limited range */
+	{    0,     0,     0, },
+	CLIP_FULL_RANGE,
+	"BT.709 Limited",
+};
+
+static const struct {
+	enum drm_color_encoding encoding;
+	enum drm_color_range range;
+	const struct dispc_csc_coef *csc;
+} dispc_csc_table[] = {
+	{ DRM_COLOR_YCBCR_BT601, DRM_COLOR_YCBCR_FULL_RANGE,
+	  &csc_yuv2rgb_bt601_full, },
+	{ DRM_COLOR_YCBCR_BT601, DRM_COLOR_YCBCR_LIMITED_RANGE,
+	  &csc_yuv2rgb_bt601_lim, },
+	{ DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_FULL_RANGE,
+	  &csc_yuv2rgb_bt709_full, },
+	{ DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE,
+	  &csc_yuv2rgb_bt709_lim, },
+};
+
+static const
+struct dispc_csc_coef *dispc_find_csc(enum drm_color_encoding encoding,
+				      enum drm_color_range range)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dispc_csc_table); i++) {
+		if (dispc_csc_table[i].encoding == encoding &&
+		    dispc_csc_table[i].range == range) {
+			return dispc_csc_table[i].csc;
+		}
+	}
+	return NULL;
+}
+
+static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
+				const struct drm_plane_state *state)
+{
+	static const struct dispc_csc_coef *coef;
+
+	coef = dispc_find_csc(state->color_encoding, state->color_range);
+	if (!coef) {
+		dev_err(dispc->dev, "%s: CSC (%u,%u) not found\n",
+			__func__, state->color_encoding, state->color_range);
+		return;
+	}
+
+	if (dispc->feat->subrev == DISPC_K2G)
+		dispc_k2g_vid_write_csc(dispc, hw_plane, coef);
+	else
+		dispc_k3_vid_write_csc(dispc, hw_plane, coef);
+}
+
+static void dispc_vid_csc_enable(struct dispc_device *dispc, u32 hw_plane,
+				 bool enable)
+{
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 9, 9);
+}
+
+/* SCALER */
+
+static u32 dispc_calc_fir_inc(u32 in, u32 out)
+{
+	return (u32)div_u64(0x200000ull * in, out);
+}
+
+enum dispc_vid_fir_coef_set {
+	DISPC_VID_FIR_COEF_HORIZ,
+	DISPC_VID_FIR_COEF_HORIZ_UV,
+	DISPC_VID_FIR_COEF_VERT,
+	DISPC_VID_FIR_COEF_VERT_UV,
+};
+
+static void dispc_vid_write_fir_coefs(struct dispc_device *dispc,
+				      u32 hw_plane,
+				      enum dispc_vid_fir_coef_set coef_set,
+				      const struct tidss_scale_coefs *coefs)
+{
+	static const u16 c0_regs[] = {
+		[DISPC_VID_FIR_COEF_HORIZ] = DISPC_VID_FIR_COEFS_H0,
+		[DISPC_VID_FIR_COEF_HORIZ_UV] = DISPC_VID_FIR_COEFS_H0_C,
+		[DISPC_VID_FIR_COEF_VERT] = DISPC_VID_FIR_COEFS_V0,
+		[DISPC_VID_FIR_COEF_VERT_UV] = DISPC_VID_FIR_COEFS_V0_C,
+	};
+
+	static const u16 c12_regs[] = {
+		[DISPC_VID_FIR_COEF_HORIZ] = DISPC_VID_FIR_COEFS_H12,
+		[DISPC_VID_FIR_COEF_HORIZ_UV] = DISPC_VID_FIR_COEFS_H12_C,
+		[DISPC_VID_FIR_COEF_VERT] = DISPC_VID_FIR_COEFS_V12,
+		[DISPC_VID_FIR_COEF_VERT_UV] = DISPC_VID_FIR_COEFS_V12_C,
+	};
+
+	const u16 c0_base = c0_regs[coef_set];
+	const u16 c12_base = c12_regs[coef_set];
+	int phase;
+
+	if (!coefs) {
+		dev_err(dispc->dev, "%s: No coefficients given.\n", __func__);
+		return;
+	}
+
+	for (phase = 0; phase <= 8; ++phase) {
+		u16 reg = c0_base + phase * 4;
+		u16 c0 = coefs->c0[phase];
+
+		dispc_vid_write(dispc, hw_plane, reg, c0);
+	}
+
+	for (phase = 0; phase <= 15; ++phase) {
+		u16 reg = c12_base + phase * 4;
+		s16 c1, c2;
+		u32 c12;
+
+		c1 = coefs->c1[phase];
+		c2 = coefs->c2[phase];
+		c12 = FLD_VAL(c1, 19, 10) | FLD_VAL(c2, 29, 20);
+
+		dispc_vid_write(dispc, hw_plane, reg, c12);
+	}
+}
+
+static bool dispc_fourcc_is_yuv(u32 fourcc)
+{
+	switch (fourcc) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_NV12:
+		return true;
+	default:
+		return false;
+	}
+}
+
+struct dispc_scaling_params {
+	int xinc, yinc;
+	u32 in_w, in_h, in_w_uv, in_h_uv;
+	u32 fir_xinc, fir_yinc, fir_xinc_uv, fir_yinc_uv;
+	bool scale_x, scale_y;
+	const struct tidss_scale_coefs *xcoef, *ycoef, *xcoef_uv, *ycoef_uv;
+	bool five_taps;
+};
+
+static int dispc_vid_calc_scaling(struct dispc_device *dispc,
+				  const struct drm_plane_state *state,
+				  struct dispc_scaling_params *sp,
+				  bool lite_plane)
+{
+	const struct dispc_features_scaling *f = &dispc->feat->scaling;
+	u32 fourcc = state->fb->format->format;
+	u32 in_width_max_5tap = f->in_width_max_5tap_rgb;
+	u32 in_width_max_3tap = f->in_width_max_3tap_rgb;
+	u32 downscale_limit;
+	u32 in_width_max;
+
+	memset(sp, 0, sizeof(*sp));
+	sp->xinc = 1;
+	sp->yinc = 1;
+	sp->in_w = state->src_w >> 16;
+	sp->in_w_uv = sp->in_w;
+	sp->in_h = state->src_h >> 16;
+	sp->in_h_uv = sp->in_h;
+
+	sp->scale_x = sp->in_w != state->crtc_w;
+	sp->scale_y = sp->in_h != state->crtc_h;
+
+	if (dispc_fourcc_is_yuv(fourcc)) {
+		in_width_max_5tap = f->in_width_max_5tap_yuv;
+		in_width_max_3tap = f->in_width_max_3tap_yuv;
+
+		sp->in_w_uv >>= 1;
+		sp->scale_x = true;
+
+		if (fourcc == DRM_FORMAT_NV12) {
+			sp->in_h_uv >>= 1;
+			sp->scale_y = true;
+		}
+	}
+
+	/* Skip the rest if no scaling is used */
+	if ((!sp->scale_x && !sp->scale_y) || lite_plane)
+		return 0;
+
+	if (sp->in_w > in_width_max_5tap) {
+		sp->five_taps = false;
+		in_width_max = in_width_max_3tap;
+		downscale_limit = f->downscale_limit_3tap;
+	} else {
+		sp->five_taps = true;
+		in_width_max = in_width_max_5tap;
+		downscale_limit = f->downscale_limit_5tap;
+	}
+
+	if (sp->scale_x) {
+		sp->fir_xinc = dispc_calc_fir_inc(sp->in_w, state->crtc_w);
+
+		if (sp->fir_xinc < dispc_calc_fir_inc(1, f->upscale_limit)) {
+			dev_dbg(dispc->dev,
+				"%s: X-scaling factor %u/%u > %u\n",
+				__func__, state->crtc_w, state->src_w >> 16,
+				f->upscale_limit);
+			return -EINVAL;
+		}
+
+		if (sp->fir_xinc >= dispc_calc_fir_inc(downscale_limit, 1)) {
+			sp->xinc = DIV_ROUND_UP(DIV_ROUND_UP(sp->in_w,
+							     state->crtc_w),
+						downscale_limit);
+
+			if (sp->xinc > f->xinc_max) {
+				dev_dbg(dispc->dev,
+					"%s: X-scaling factor %u/%u < 1/%u\n",
+					__func__, state->crtc_w,
+					state->src_w >> 16,
+					downscale_limit * f->xinc_max);
+				return -EINVAL;
+			}
+
+			sp->in_w = (state->src_w >> 16) / sp->xinc;
+		}
+
+		while (sp->in_w > in_width_max) {
+			sp->xinc++;
+			sp->in_w = (state->src_w >> 16) / sp->xinc;
+		}
+
+		if (sp->xinc > f->xinc_max) {
+			dev_dbg(dispc->dev,
+				"%s: Too wide input bufer %u > %u\n", __func__,
+				state->src_w >> 16, in_width_max * f->xinc_max);
+			return -EINVAL;
+		}
+
+		/*
+		 * We need even line length for YUV formats. Decimation
+		 * can lead to odd length, so we need to make it even
+		 * again.
+		 */
+		if (dispc_fourcc_is_yuv(fourcc))
+			sp->in_w &= ~1;
+
+		sp->fir_xinc = dispc_calc_fir_inc(sp->in_w, state->crtc_w);
+	}
+
+	if (sp->scale_y) {
+		sp->fir_yinc = dispc_calc_fir_inc(sp->in_h, state->crtc_h);
+
+		if (sp->fir_yinc < dispc_calc_fir_inc(1, f->upscale_limit)) {
+			dev_dbg(dispc->dev,
+				"%s: Y-scaling factor %u/%u > %u\n",
+				__func__, state->crtc_h, state->src_h >> 16,
+				f->upscale_limit);
+			return -EINVAL;
+		}
+
+		if (sp->fir_yinc >= dispc_calc_fir_inc(downscale_limit, 1)) {
+			sp->yinc = DIV_ROUND_UP(DIV_ROUND_UP(sp->in_h,
+							     state->crtc_h),
+						downscale_limit);
+
+			sp->in_h /= sp->yinc;
+			sp->fir_yinc = dispc_calc_fir_inc(sp->in_h,
+							  state->crtc_h);
+		}
+	}
+
+	dev_dbg(dispc->dev,
+		"%s: %ux%u decim %ux%u -> %ux%u firinc %u.%03ux%u.%03u taps %u -> %ux%u\n",
+		__func__, state->src_w >> 16, state->src_h >> 16,
+		sp->xinc, sp->yinc, sp->in_w, sp->in_h,
+		sp->fir_xinc / 0x200000u,
+		((sp->fir_xinc & 0x1FFFFFu) * 999u) / 0x1FFFFFu,
+		sp->fir_yinc / 0x200000u,
+		((sp->fir_yinc & 0x1FFFFFu) * 999u) / 0x1FFFFFu,
+		sp->five_taps ? 5 : 3,
+		state->crtc_w, state->crtc_h);
+
+	if (dispc_fourcc_is_yuv(fourcc)) {
+		if (sp->scale_x) {
+			sp->in_w_uv /= sp->xinc;
+			sp->fir_xinc_uv = dispc_calc_fir_inc(sp->in_w_uv,
+							     state->crtc_w);
+			sp->xcoef_uv = tidss_get_scale_coefs(dispc->dev,
+							     sp->fir_xinc_uv,
+							     true);
+		}
+		if (sp->scale_y) {
+			sp->in_h_uv /= sp->yinc;
+			sp->fir_yinc_uv = dispc_calc_fir_inc(sp->in_h_uv,
+							     state->crtc_h);
+			sp->ycoef_uv = tidss_get_scale_coefs(dispc->dev,
+							     sp->fir_yinc_uv,
+							     sp->five_taps);
+		}
+	}
+
+	if (sp->scale_x)
+		sp->xcoef = tidss_get_scale_coefs(dispc->dev, sp->fir_xinc,
+						  true);
+
+	if (sp->scale_y)
+		sp->ycoef = tidss_get_scale_coefs(dispc->dev, sp->fir_yinc,
+						  sp->five_taps);
+
+	return 0;
+}
+
+static void dispc_vid_set_scaling(struct dispc_device *dispc,
+				  u32 hw_plane,
+				  struct dispc_scaling_params *sp,
+				  u32 fourcc)
+{
+	/* HORIZONTAL RESIZE ENABLE */
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
+			sp->scale_x, 7, 7);
+
+	/* VERTICAL RESIZE ENABLE */
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
+			sp->scale_y, 8, 8);
+
+	/* Skip the rest if no scaling is used */
+	if (!sp->scale_x && !sp->scale_y)
+		return;
+
+	/* VERTICAL 5-TAPS  */
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
+			sp->five_taps, 21, 21);
+
+	if (dispc_fourcc_is_yuv(fourcc)) {
+		if (sp->scale_x) {
+			dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRH2,
+					sp->fir_xinc_uv);
+			dispc_vid_write_fir_coefs(dispc, hw_plane,
+						  DISPC_VID_FIR_COEF_HORIZ_UV,
+						  sp->xcoef_uv);
+		}
+		if (sp->scale_y) {
+			dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRV2,
+					sp->fir_yinc_uv);
+			dispc_vid_write_fir_coefs(dispc, hw_plane,
+						  DISPC_VID_FIR_COEF_VERT_UV,
+						  sp->ycoef_uv);
+		}
+	}
+
+	if (sp->scale_x) {
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRH, sp->fir_xinc);
+		dispc_vid_write_fir_coefs(dispc, hw_plane,
+					  DISPC_VID_FIR_COEF_HORIZ,
+					  sp->xcoef);
+	}
+
+	if (sp->scale_y) {
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_FIRV, sp->fir_yinc);
+		dispc_vid_write_fir_coefs(dispc, hw_plane,
+					  DISPC_VID_FIR_COEF_VERT, sp->ycoef);
+	}
+}
+
+/* OTHER */
+
+static const struct {
+	u32 fourcc;
+	u8 dss_code;
+} dispc_color_formats[] = {
+	{ DRM_FORMAT_ARGB4444, 0x0, },
+	{ DRM_FORMAT_ABGR4444, 0x1, },
+	{ DRM_FORMAT_RGBA4444, 0x2, },
+
+	{ DRM_FORMAT_RGB565, 0x3, },
+	{ DRM_FORMAT_BGR565, 0x4, },
+
+	{ DRM_FORMAT_ARGB1555, 0x5, },
+	{ DRM_FORMAT_ABGR1555, 0x6, },
+
+	{ DRM_FORMAT_ARGB8888, 0x7, },
+	{ DRM_FORMAT_ABGR8888, 0x8, },
+	{ DRM_FORMAT_RGBA8888, 0x9, },
+	{ DRM_FORMAT_BGRA8888, 0xa, },
+
+	{ DRM_FORMAT_RGB888, 0xb, },
+	{ DRM_FORMAT_BGR888, 0xc, },
+
+	{ DRM_FORMAT_ARGB2101010, 0xe, },
+	{ DRM_FORMAT_ABGR2101010, 0xf, },
+
+	{ DRM_FORMAT_XRGB4444, 0x20, },
+	{ DRM_FORMAT_XBGR4444, 0x21, },
+	{ DRM_FORMAT_RGBX4444, 0x22, },
+
+	{ DRM_FORMAT_ARGB1555, 0x25, },
+	{ DRM_FORMAT_ABGR1555, 0x26, },
+
+	{ DRM_FORMAT_XRGB8888, 0x27, },
+	{ DRM_FORMAT_XBGR8888, 0x28, },
+	{ DRM_FORMAT_RGBX8888, 0x29, },
+	{ DRM_FORMAT_BGRX8888, 0x2a, },
+
+	{ DRM_FORMAT_XRGB2101010, 0x2e, },
+	{ DRM_FORMAT_XBGR2101010, 0x2f, },
+
+	{ DRM_FORMAT_YUYV, 0x3e, },
+	{ DRM_FORMAT_UYVY, 0x3f, },
+
+	{ DRM_FORMAT_NV12, 0x3d, },
+};
+
+static void dispc_plane_set_pixel_format(struct dispc_device *dispc,
+					 u32 hw_plane, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
+		if (dispc_color_formats[i].fourcc == fourcc) {
+			VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES,
+					dispc_color_formats[i].dss_code,
+					6, 1);
+			return;
+		}
+	}
+
+	WARN_ON(1);
+}
+
+const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len)
+{
+	WARN_ON(!dispc->fourccs);
+
+	*len = dispc->num_fourccs;
+
+	return dispc->fourccs;
+}
+
+static s32 pixinc(int pixels, u8 ps)
+{
+	if (pixels == 1)
+		return 1;
+	else if (pixels > 1)
+		return 1 + (pixels - 1) * ps;
+	else if (pixels < 0)
+		return 1 - (-pixels + 1) * ps;
+
+	WARN_ON(1);
+	return 0;
+}
+
+int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
+		      const struct drm_plane_state *state,
+		      u32 hw_videoport)
+{
+	bool lite = dispc->feat->vid_lite[hw_plane];
+	u32 fourcc = state->fb->format->format;
+	bool need_scaling = state->src_w >> 16 != state->crtc_w ||
+		state->src_h >> 16 != state->crtc_h;
+	struct dispc_scaling_params scaling;
+	int ret;
+
+	if (dispc_fourcc_is_yuv(fourcc)) {
+		if (!dispc_find_csc(state->color_encoding,
+				    state->color_range)) {
+			dev_dbg(dispc->dev,
+				"%s: Unsupported CSC (%u,%u) for HW plane %u\n",
+				__func__, state->color_encoding,
+				state->color_range, hw_plane);
+			return -EINVAL;
+		}
+	}
+
+	if (need_scaling) {
+		if (lite) {
+			dev_dbg(dispc->dev,
+				"%s: Lite plane %u can't scale %ux%u!=%ux%u\n",
+				__func__, hw_plane,
+				state->src_w >> 16, state->src_h >> 16,
+				state->crtc_w, state->crtc_h);
+			return -EINVAL;
+		}
+		ret = dispc_vid_calc_scaling(dispc, state, &scaling, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static
+dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_cma_object *gem;
+	u32 x = state->src_x >> 16;
+	u32 y = state->src_y >> 16;
+
+	gem = drm_fb_cma_get_gem_obj(state->fb, 0);
+
+	return gem->paddr + fb->offsets[0] + x * fb->format->cpp[0] +
+		y * fb->pitches[0];
+}
+
+static
+dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_cma_object *gem;
+	u32 x = state->src_x >> 16;
+	u32 y = state->src_y >> 16;
+
+	if (WARN_ON(state->fb->format->num_planes != 2))
+		return 0;
+
+	gem = drm_fb_cma_get_gem_obj(fb, 1);
+
+	return gem->paddr + fb->offsets[1] +
+		(x * fb->format->cpp[1] / fb->format->hsub) +
+		(y * fb->pitches[1] / fb->format->vsub);
+}
+
+int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
+		      const struct drm_plane_state *state,
+		      u32 hw_videoport)
+{
+	bool lite = dispc->feat->vid_lite[hw_plane];
+	u32 fourcc = state->fb->format->format;
+	u16 cpp = state->fb->format->cpp[0];
+	u32 fb_width = state->fb->pitches[0] / cpp;
+	dma_addr_t paddr = dispc_plane_state_paddr(state);
+	struct dispc_scaling_params scale;
+
+	dispc_vid_calc_scaling(dispc, state, &scale, lite);
+
+	dispc_plane_set_pixel_format(dispc, hw_plane, fourcc);
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_0, paddr & 0xffffffff);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_0, (u64)paddr >> 32);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_1, paddr & 0xffffffff);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_1, (u64)paddr >> 32);
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_PICTURE_SIZE,
+			(scale.in_w - 1) | ((scale.in_h - 1) << 16));
+
+	/* For YUV422 format we use the macropixel size for pixel inc */
+	if (fourcc == DRM_FORMAT_YUYV || fourcc == DRM_FORMAT_UYVY)
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_PIXEL_INC,
+				pixinc(scale.xinc, cpp * 2));
+	else
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_PIXEL_INC,
+				pixinc(scale.xinc, cpp));
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_ROW_INC,
+			pixinc(1 + (scale.yinc * fb_width -
+				    scale.xinc * scale.in_w),
+			       cpp));
+
+	if (state->fb->format->num_planes == 2) {
+		u16 cpp_uv = state->fb->format->cpp[1];
+		u32 fb_width_uv = state->fb->pitches[1] / cpp_uv;
+		dma_addr_t p_uv_addr = dispc_plane_state_p_uv_addr(state);
+
+		dispc_vid_write(dispc, hw_plane,
+				DISPC_VID_BA_UV_0, p_uv_addr & 0xffffffff);
+		dispc_vid_write(dispc, hw_plane,
+				DISPC_VID_BA_UV_EXT_0, (u64)p_uv_addr >> 32);
+		dispc_vid_write(dispc, hw_plane,
+				DISPC_VID_BA_UV_1, p_uv_addr & 0xffffffff);
+		dispc_vid_write(dispc, hw_plane,
+				DISPC_VID_BA_UV_EXT_1, (u64)p_uv_addr >> 32);
+
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_ROW_INC_UV,
+				pixinc(1 + (scale.yinc * fb_width_uv -
+					    scale.xinc * scale.in_w_uv),
+				       cpp_uv));
+	}
+
+	if (!lite) {
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_SIZE,
+				(state->crtc_w - 1) |
+				((state->crtc_h - 1) << 16));
+
+		dispc_vid_set_scaling(dispc, hw_plane, &scale, fourcc);
+	}
+
+	/* enable YUV->RGB color conversion */
+	if (dispc_fourcc_is_yuv(fourcc)) {
+		dispc_vid_csc_setup(dispc, hw_plane, state);
+		dispc_vid_csc_enable(dispc, hw_plane, true);
+	} else {
+		dispc_vid_csc_enable(dispc, hw_plane, false);
+	}
+
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_GLOBAL_ALPHA,
+			0xFF & (state->alpha >> 8));
+
+	if (state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
+		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
+				28, 28);
+	else
+		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
+				28, 28);
+
+	dispc_ovr_set_plane(dispc, hw_plane, hw_videoport,
+			    state->crtc_x, state->crtc_y,
+			    state->normalized_zpos);
+
+	dispc->plane_data[hw_plane].zorder = state->normalized_zpos;
+	dispc->plane_data[hw_plane].hw_videoport = hw_videoport;
+
+	return 0;
+}
+
+int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
+{
+	dispc_ovr_enable_plane(dispc, dispc->plane_data[hw_plane].hw_videoport,
+			       dispc->plane_data[hw_plane].zorder, enable);
+
+	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
+
+	return 0;
+}
+
+static u32 dispc_vid_get_fifo_size(struct dispc_device *dispc, u32 hw_plane)
+{
+	return VID_REG_GET(dispc, hw_plane, DISPC_VID_BUF_SIZE_STATUS, 15, 0);
+}
+
+static void dispc_vid_set_mflag_threshold(struct dispc_device *dispc,
+					  u32 hw_plane, u32 low, u32 high)
+{
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_MFLAG_THRESHOLD,
+			FLD_VAL(high, 31, 16) | FLD_VAL(low, 15, 0));
+}
+
+static void dispc_vid_set_buf_threshold(struct dispc_device *dispc,
+					u32 hw_plane, u32 low, u32 high)
+{
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BUF_THRESHOLD,
+			FLD_VAL(high, 31, 16) | FLD_VAL(low, 15, 0));
+}
+
+static void dispc_k2g_plane_init(struct dispc_device *dispc)
+{
+	unsigned int hw_plane;
+
+	dev_dbg(dispc->dev, "%s()\n", __func__);
+
+	/* MFLAG_CTRL = ENABLED */
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, 1, 0);
+	/* MFLAG_START = MFLAGNORMALSTARTMODE */
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
+
+	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
+		u32 thr_low, thr_high;
+		u32 mflag_low, mflag_high;
+		u32 preload;
+
+		thr_high = size - 1;
+		thr_low = size / 2;
+
+		mflag_high = size * 2 / 3;
+		mflag_low = size / 3;
+
+		preload = thr_low;
+
+		dev_dbg(dispc->dev,
+			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
+			dispc->feat->vid_name[hw_plane],
+			size,
+			thr_high, thr_low,
+			mflag_high, mflag_low,
+			preload);
+
+		dispc_vid_set_buf_threshold(dispc, hw_plane,
+					    thr_low, thr_high);
+		dispc_vid_set_mflag_threshold(dispc, hw_plane,
+					      mflag_low, mflag_high);
+
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_PRELOAD, preload);
+
+		/*
+		 * Prefetch up to fifo high-threshold value to minimize the
+		 * possibility of underflows. Note that this means the PRELOAD
+		 * register is ignored.
+		 */
+		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 1,
+				19, 19);
+	}
+}
+
+static void dispc_k3_plane_init(struct dispc_device *dispc)
+{
+	unsigned int hw_plane;
+	u32 cba_lo_pri = 1;
+	u32 cba_hi_pri = 0;
+
+	dev_dbg(dispc->dev, "%s()\n", __func__);
+
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_lo_pri, 2, 0);
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_hi_pri, 5, 3);
+
+	/* MFLAG_CTRL = ENABLED */
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, 1, 0);
+	/* MFLAG_START = MFLAGNORMALSTARTMODE */
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
+
+	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
+		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
+		u32 thr_low, thr_high;
+		u32 mflag_low, mflag_high;
+		u32 preload;
+
+		thr_high = size - 1;
+		thr_low = size / 2;
+
+		mflag_high = size * 2 / 3;
+		mflag_low = size / 3;
+
+		preload = thr_low;
+
+		dev_dbg(dispc->dev,
+			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
+			dispc->feat->vid_name[hw_plane],
+			size,
+			thr_high, thr_low,
+			mflag_high, mflag_low,
+			preload);
+
+		dispc_vid_set_buf_threshold(dispc, hw_plane,
+					    thr_low, thr_high);
+		dispc_vid_set_mflag_threshold(dispc, hw_plane,
+					      mflag_low, mflag_high);
+
+		dispc_vid_write(dispc, hw_plane, DISPC_VID_PRELOAD, preload);
+
+		/* Prefech up to PRELOAD value */
+		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
+				19, 19);
+	}
+}
+
+static void dispc_plane_init(struct dispc_device *dispc)
+{
+	switch (dispc->feat->subrev) {
+	case DISPC_K2G:
+		dispc_k2g_plane_init(dispc);
+		break;
+	case DISPC_AM65X:
+	case DISPC_J721E:
+		dispc_k3_plane_init(dispc);
+		break;
+	default:
+		WARN_ON(1);
+	}
+}
+
+static void dispc_vp_init(struct dispc_device *dispc)
+{
+	unsigned int i;
+
+	dev_dbg(dispc->dev, "%s()\n", __func__);
+
+	/* Enable the gamma Shadow bit-field for all VPs*/
+	for (i = 0; i < dispc->feat->num_vps; i++)
+		VP_REG_FLD_MOD(dispc, i, DISPC_VP_CONFIG, 1, 2, 2);
+}
+
+static void dispc_initial_config(struct dispc_device *dispc)
+{
+	dispc_plane_init(dispc);
+	dispc_vp_init(dispc);
+
+	/* Note: Hardcoded DPI routing on J721E for now */
+	if (dispc->feat->subrev == DISPC_J721E) {
+		dispc_write(dispc, DISPC_CONNECTIONS,
+			    FLD_VAL(2, 3, 0) |		/* VP1 to DPI0 */
+			    FLD_VAL(8, 7, 4)		/* VP3 to DPI1 */
+			);
+	}
+}
+
+static void dispc_k2g_vp_write_gamma_table(struct dispc_device *dispc,
+					   u32 hw_videoport)
+{
+	u32 *table = dispc->vp_data[hw_videoport].gamma_table;
+	u32 hwlen = dispc->feat->vp_feat.color.gamma_size;
+	unsigned int i;
+
+	dev_dbg(dispc->dev, "%s: hw_videoport %d\n", __func__, hw_videoport);
+
+	if (WARN_ON(dispc->feat->vp_feat.color.gamma_type != TIDSS_GAMMA_8BIT))
+		return;
+
+	for (i = 0; i < hwlen; ++i) {
+		u32 v = table[i];
+
+		v |= i << 24;
+
+		dispc_vp_write(dispc, hw_videoport, DISPC_VP_K2G_GAMMA_TABLE,
+			       v);
+	}
+}
+
+static void dispc_am65x_vp_write_gamma_table(struct dispc_device *dispc,
+					     u32 hw_videoport)
+{
+	u32 *table = dispc->vp_data[hw_videoport].gamma_table;
+	u32 hwlen = dispc->feat->vp_feat.color.gamma_size;
+	unsigned int i;
+
+	dev_dbg(dispc->dev, "%s: hw_videoport %d\n", __func__, hw_videoport);
+
+	if (WARN_ON(dispc->feat->vp_feat.color.gamma_type != TIDSS_GAMMA_8BIT))
+		return;
+
+	for (i = 0; i < hwlen; ++i) {
+		u32 v = table[i];
+
+		v |= i << 24;
+
+		dispc_vp_write(dispc, hw_videoport, DISPC_VP_GAMMA_TABLE, v);
+	}
+}
+
+static void dispc_j721e_vp_write_gamma_table(struct dispc_device *dispc,
+					     u32 hw_videoport)
+{
+	u32 *table = dispc->vp_data[hw_videoport].gamma_table;
+	u32 hwlen = dispc->feat->vp_feat.color.gamma_size;
+	unsigned int i;
+
+	dev_dbg(dispc->dev, "%s: hw_videoport %d\n", __func__, hw_videoport);
+
+	if (WARN_ON(dispc->feat->vp_feat.color.gamma_type != TIDSS_GAMMA_10BIT))
+		return;
+
+	for (i = 0; i < hwlen; ++i) {
+		u32 v = table[i];
+
+		if (i == 0)
+			v |= 1 << 31;
+
+		dispc_vp_write(dispc, hw_videoport, DISPC_VP_GAMMA_TABLE, v);
+	}
+}
+
+static void dispc_vp_write_gamma_table(struct dispc_device *dispc,
+				       u32 hw_videoport)
+{
+	switch (dispc->feat->subrev) {
+	case DISPC_K2G:
+		dispc_k2g_vp_write_gamma_table(dispc, hw_videoport);
+		break;
+	case DISPC_AM65X:
+		dispc_am65x_vp_write_gamma_table(dispc, hw_videoport);
+		break;
+	case DISPC_J721E:
+		dispc_j721e_vp_write_gamma_table(dispc, hw_videoport);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+static const struct drm_color_lut dispc_vp_gamma_default_lut[] = {
+	{ .red = 0, .green = 0, .blue = 0, },
+	{ .red = U16_MAX, .green = U16_MAX, .blue = U16_MAX, },
+};
+
+static void dispc_vp_set_gamma(struct dispc_device *dispc,
+			       u32 hw_videoport,
+			       const struct drm_color_lut *lut,
+			       unsigned int length)
+{
+	u32 *table = dispc->vp_data[hw_videoport].gamma_table;
+	u32 hwlen = dispc->feat->vp_feat.color.gamma_size;
+	u32 hwbits;
+	unsigned int i;
+
+	dev_dbg(dispc->dev, "%s: hw_videoport %d, lut len %u, hw len %u\n",
+		__func__, hw_videoport, length, hwlen);
+
+	if (dispc->feat->vp_feat.color.gamma_type == TIDSS_GAMMA_10BIT)
+		hwbits = 10;
+	else
+		hwbits = 8;
+
+	if (!lut || length < 2) {
+		lut = dispc_vp_gamma_default_lut;
+		length = ARRAY_SIZE(dispc_vp_gamma_default_lut);
+	}
+
+	for (i = 0; i < length - 1; ++i) {
+		unsigned int first = i * (hwlen - 1) / (length - 1);
+		unsigned int last = (i + 1) * (hwlen - 1) / (length - 1);
+		unsigned int w = last - first;
+		u16 r, g, b;
+		unsigned int j;
+
+		if (w == 0)
+			continue;
+
+		for (j = 0; j <= w; j++) {
+			r = (lut[i].red * (w - j) + lut[i + 1].red * j) / w;
+			g = (lut[i].green * (w - j) + lut[i + 1].green * j) / w;
+			b = (lut[i].blue * (w - j) + lut[i + 1].blue * j) / w;
+
+			r >>= 16 - hwbits;
+			g >>= 16 - hwbits;
+			b >>= 16 - hwbits;
+
+			table[first + j] = (r << (hwbits * 2)) |
+				(g << hwbits) | b;
+		}
+	}
+
+	dispc_vp_write_gamma_table(dispc, hw_videoport);
+}
+
+static s16 dispc_S31_32_to_s2_8(s64 coef)
+{
+	u64 sign_bit = 1ULL << 63;
+	u64 cbits = (u64)coef;
+	s16 ret;
+
+	if (cbits & sign_bit)
+		ret = -clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x200);
+	else
+		ret = clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x1FF);
+
+	return ret;
+}
+
+static void dispc_k2g_cpr_from_ctm(const struct drm_color_ctm *ctm,
+				   struct dispc_csc_coef *cpr)
+{
+	memset(cpr, 0, sizeof(*cpr));
+
+	cpr->to_regval = dispc_csc_cpr_regval;
+	cpr->m[CSC_RR] = dispc_S31_32_to_s2_8(ctm->matrix[0]);
+	cpr->m[CSC_RG] = dispc_S31_32_to_s2_8(ctm->matrix[1]);
+	cpr->m[CSC_RB] = dispc_S31_32_to_s2_8(ctm->matrix[2]);
+	cpr->m[CSC_GR] = dispc_S31_32_to_s2_8(ctm->matrix[3]);
+	cpr->m[CSC_GG] = dispc_S31_32_to_s2_8(ctm->matrix[4]);
+	cpr->m[CSC_GB] = dispc_S31_32_to_s2_8(ctm->matrix[5]);
+	cpr->m[CSC_BR] = dispc_S31_32_to_s2_8(ctm->matrix[6]);
+	cpr->m[CSC_BG] = dispc_S31_32_to_s2_8(ctm->matrix[7]);
+	cpr->m[CSC_BB] = dispc_S31_32_to_s2_8(ctm->matrix[8]);
+}
+
+#define CVAL(xR, xG, xB) (FLD_VAL(xR, 9, 0) | FLD_VAL(xG, 20, 11) |	\
+			  FLD_VAL(xB, 31, 22))
+
+static void dispc_k2g_vp_csc_cpr_regval(const struct dispc_csc_coef *csc,
+					u32 *regval)
+{
+	regval[0] = CVAL(csc->m[CSC_BB], csc->m[CSC_BG], csc->m[CSC_BR]);
+	regval[1] = CVAL(csc->m[CSC_GB], csc->m[CSC_GG], csc->m[CSC_GR]);
+	regval[2] = CVAL(csc->m[CSC_RB], csc->m[CSC_RG], csc->m[CSC_RR]);
+}
+
+#undef CVAL
+
+static void dispc_k2g_vp_write_csc(struct dispc_device *dispc, u32 hw_videoport,
+				   const struct dispc_csc_coef *csc)
+{
+	static const u16 dispc_vp_cpr_coef_reg[] = {
+		DISPC_VP_CSC_COEF0, DISPC_VP_CSC_COEF1, DISPC_VP_CSC_COEF2,
+		/* K2G CPR is packed to three registers. */
+	};
+	u32 regval[DISPC_CSC_REGVAL_LEN];
+	unsigned int i;
+
+	dispc_k2g_vp_csc_cpr_regval(csc, regval);
+
+	for (i = 0; i < ARRAY_SIZE(dispc_vp_cpr_coef_reg); i++)
+		dispc_vp_write(dispc, hw_videoport, dispc_vp_cpr_coef_reg[i],
+			       regval[i]);
+}
+
+static void dispc_k2g_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
+				 struct drm_color_ctm *ctm)
+{
+	u32 cprenable = 0;
+
+	if (ctm) {
+		struct dispc_csc_coef cpr;
+
+		dispc_k2g_cpr_from_ctm(ctm, &cpr);
+		dispc_k2g_vp_write_csc(dispc, hw_videoport, &cpr);
+		cprenable = 1;
+	}
+
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG,
+		       cprenable, 15, 15);
+}
+
+static s16 dispc_S31_32_to_s3_8(s64 coef)
+{
+	u64 sign_bit = 1ULL << 63;
+	u64 cbits = (u64)coef;
+	s16 ret;
+
+	if (cbits & sign_bit)
+		ret = -clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x400);
+	else
+		ret = clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x3FF);
+
+	return ret;
+}
+
+static void dispc_csc_from_ctm(const struct drm_color_ctm *ctm,
+			       struct dispc_csc_coef *cpr)
+{
+	memset(cpr, 0, sizeof(*cpr));
+
+	cpr->to_regval = dispc_csc_cpr_regval;
+	cpr->m[CSC_RR] = dispc_S31_32_to_s3_8(ctm->matrix[0]);
+	cpr->m[CSC_RG] = dispc_S31_32_to_s3_8(ctm->matrix[1]);
+	cpr->m[CSC_RB] = dispc_S31_32_to_s3_8(ctm->matrix[2]);
+	cpr->m[CSC_GR] = dispc_S31_32_to_s3_8(ctm->matrix[3]);
+	cpr->m[CSC_GG] = dispc_S31_32_to_s3_8(ctm->matrix[4]);
+	cpr->m[CSC_GB] = dispc_S31_32_to_s3_8(ctm->matrix[5]);
+	cpr->m[CSC_BR] = dispc_S31_32_to_s3_8(ctm->matrix[6]);
+	cpr->m[CSC_BG] = dispc_S31_32_to_s3_8(ctm->matrix[7]);
+	cpr->m[CSC_BB] = dispc_S31_32_to_s3_8(ctm->matrix[8]);
+}
+
+static void dispc_k3_vp_write_csc(struct dispc_device *dispc, u32 hw_videoport,
+				  const struct dispc_csc_coef *csc)
+{
+	static const u16 dispc_vp_csc_coef_reg[DISPC_CSC_REGVAL_LEN] = {
+		DISPC_VP_CSC_COEF0, DISPC_VP_CSC_COEF1, DISPC_VP_CSC_COEF2,
+		DISPC_VP_CSC_COEF3, DISPC_VP_CSC_COEF4, DISPC_VP_CSC_COEF5,
+		DISPC_VP_CSC_COEF6, DISPC_VP_CSC_COEF7,
+	};
+	u32 regval[DISPC_CSC_REGVAL_LEN];
+	unsigned int i;
+
+	csc->to_regval(csc, regval);
+
+	for (i = 0; i < ARRAY_SIZE(regval); i++)
+		dispc_vp_write(dispc, hw_videoport, dispc_vp_csc_coef_reg[i],
+			       regval[i]);
+}
+
+static void dispc_k3_vp_set_ctm(struct dispc_device *dispc, u32 hw_videoport,
+				struct drm_color_ctm *ctm)
+{
+	u32 colorconvenable = 0;
+
+	if (ctm) {
+		struct dispc_csc_coef csc;
+
+		dispc_csc_from_ctm(ctm, &csc);
+		dispc_k3_vp_write_csc(dispc, hw_videoport, &csc);
+		colorconvenable = 1;
+	}
+
+	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONFIG,
+		       colorconvenable, 24, 24);
+}
+
+static void dispc_vp_set_color_mgmt(struct dispc_device *dispc,
+				    u32 hw_videoport,
+				    const struct drm_crtc_state *state,
+				    bool newmodeset)
+{
+	struct drm_color_lut *lut = NULL;
+	struct drm_color_ctm *ctm = NULL;
+	unsigned int length = 0;
+
+	if (!(state->color_mgmt_changed || newmodeset))
+		return;
+
+	if (state->gamma_lut) {
+		lut = (struct drm_color_lut *)state->gamma_lut->data;
+		length = state->gamma_lut->length / sizeof(*lut);
+	}
+
+	dispc_vp_set_gamma(dispc, hw_videoport, lut, length);
+
+	if (state->ctm)
+		ctm = (struct drm_color_ctm *)state->ctm->data;
+
+	if (dispc->feat->subrev == DISPC_K2G)
+		dispc_k2g_vp_set_ctm(dispc, hw_videoport, ctm);
+	else
+		dispc_k3_vp_set_ctm(dispc, hw_videoport, ctm);
+}
+
+void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
+		    const struct drm_crtc_state *state, bool newmodeset)
+{
+	dispc_vp_set_default_color(dispc, hw_videoport, 0);
+	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
+}
+
+int dispc_runtime_suspend(struct dispc_device *dispc)
+{
+	dev_dbg(dispc->dev, "suspend\n");
+
+	dispc->is_enabled = false;
+
+	clk_disable_unprepare(dispc->fclk);
+
+	return 0;
+}
+
+int dispc_runtime_resume(struct dispc_device *dispc)
+{
+	dev_dbg(dispc->dev, "resume\n");
+
+	clk_prepare_enable(dispc->fclk);
+
+	if (REG_GET(dispc, DSS_SYSSTATUS, 0, 0) == 0)
+		dev_warn(dispc->dev, "DSS FUNC RESET not done!\n");
+
+	dev_dbg(dispc->dev, "OMAP DSS7 rev 0x%x\n",
+		dispc_read(dispc, DSS_REVISION));
+
+	dev_dbg(dispc->dev, "VP RESETDONE %d,%d,%d\n",
+		REG_GET(dispc, DSS_SYSSTATUS, 1, 1),
+		REG_GET(dispc, DSS_SYSSTATUS, 2, 2),
+		REG_GET(dispc, DSS_SYSSTATUS, 3, 3));
+
+	if (dispc->feat->subrev == DISPC_AM65X)
+		dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
+			REG_GET(dispc, DSS_SYSSTATUS, 5, 5),
+			REG_GET(dispc, DSS_SYSSTATUS, 6, 6),
+			REG_GET(dispc, DSS_SYSSTATUS, 7, 7));
+
+	dev_dbg(dispc->dev, "DISPC IDLE %d\n",
+		REG_GET(dispc, DSS_SYSSTATUS, 9, 9));
+
+	dispc_initial_config(dispc);
+
+	dispc->is_enabled = true;
+
+	tidss_irq_resume(dispc->tidss);
+
+	return 0;
+}
+
+void dispc_remove(struct tidss_device *tidss)
+{
+	dev_dbg(tidss->dev, "%s\n", __func__);
+
+	tidss->dispc = NULL;
+}
+
+static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
+				void __iomem **base)
+{
+	struct resource *res;
+	void __iomem *b;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		dev_err(&pdev->dev, "cannot get mem resource '%s'\n", name);
+		return -EINVAL;
+	}
+
+	b = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(b)) {
+		dev_err(&pdev->dev, "cannot ioremap resource '%s'\n", name);
+		return PTR_ERR(b);
+	}
+
+	*base = b;
+
+	return 0;
+}
+
+static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
+					 struct dispc_device *dispc)
+{
+	dispc->oldi_io_ctrl =
+		syscon_regmap_lookup_by_phandle(dev->of_node,
+						"ti,am65x-oldi-io-ctrl");
+	if (PTR_ERR(dispc->oldi_io_ctrl) == -ENODEV) {
+		dispc->oldi_io_ctrl = NULL;
+	} else if (IS_ERR(dispc->oldi_io_ctrl)) {
+		dev_err(dev, "%s: syscon_regmap_lookup_by_phandle failed %ld\n",
+			__func__, PTR_ERR(dispc->oldi_io_ctrl));
+		return PTR_ERR(dispc->oldi_io_ctrl);
+	}
+	return 0;
+}
+
+int dispc_init(struct tidss_device *tidss)
+{
+	struct device *dev = tidss->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dispc_device *dispc;
+	const struct dispc_features *feat;
+	unsigned int i, num_fourccs;
+	int r = 0;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	feat = tidss->feat;
+
+	if (feat->subrev != DISPC_K2G) {
+		r = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
+		if (r)
+			dev_warn(dev, "cannot set DMA masks to 48-bit\n");
+	}
+
+	dispc = devm_kzalloc(dev, sizeof(*dispc), GFP_KERNEL);
+	if (!dispc)
+		return -ENOMEM;
+
+	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
+				      sizeof(*dispc->fourccs), GFP_KERNEL);
+	if (!dispc->fourccs)
+		return -ENOMEM;
+
+	num_fourccs = 0;
+	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
+		if (feat->errata.i2000 &&
+		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc))
+			continue;
+		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
+	}
+	dispc->num_fourccs = num_fourccs;
+	dispc->tidss = tidss;
+	dispc->dev = dev;
+	dispc->feat = feat;
+
+	dispc_common_regmap = dispc->feat->common_regs;
+
+	r = dispc_iomap_resource(pdev, dispc->feat->common,
+				 &dispc->base_common);
+	if (r)
+		return r;
+
+	for (i = 0; i < dispc->feat->num_planes; i++) {
+		r = dispc_iomap_resource(pdev, dispc->feat->vid_name[i],
+					 &dispc->base_vid[i]);
+		if (r)
+			return r;
+	}
+
+	for (i = 0; i < dispc->feat->num_vps; i++) {
+		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
+		u32 *gamma_table;
+		struct clk *clk;
+
+		r = dispc_iomap_resource(pdev, dispc->feat->ovr_name[i],
+					 &dispc->base_ovr[i]);
+		if (r)
+			return r;
+
+		r = dispc_iomap_resource(pdev, dispc->feat->vp_name[i],
+					 &dispc->base_vp[i]);
+		if (r)
+			return r;
+
+		clk = devm_clk_get(dev, dispc->feat->vpclk_name[i]);
+		if (IS_ERR(clk)) {
+			dev_err(dev, "%s: Failed to get clk %s:%ld\n", __func__,
+				dispc->feat->vpclk_name[i], PTR_ERR(clk));
+			return PTR_ERR(clk);
+		}
+		dispc->vp_clk[i] = clk;
+
+		gamma_table = devm_kmalloc_array(dev, gamma_size,
+						 sizeof(*gamma_table),
+						 GFP_KERNEL);
+		if (!gamma_table)
+			return -ENOMEM;
+		dispc->vp_data[i].gamma_table = gamma_table;
+	}
+
+	if (feat->subrev == DISPC_AM65X) {
+		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
+		if (r)
+			return r;
+	}
+
+	dispc->fclk = devm_clk_get(dev, "fck");
+	if (IS_ERR(dispc->fclk)) {
+		dev_err(dev, "%s: Failed to get fclk: %ld\n",
+			__func__, PTR_ERR(dispc->fclk));
+		return PTR_ERR(dispc->fclk);
+	}
+	dev_dbg(dev, "DSS fclk %lu Hz\n", clk_get_rate(dispc->fclk));
+
+	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
+			     &dispc->memory_bandwidth_limit);
+
+	tidss->dispc = dispc;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
new file mode 100644
index 000000000000..284bafa54212
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_DISPC_H__
+#define __TIDSS_DISPC_H__
+
+#include "tidss_drv.h"
+
+struct dispc_device;
+
+struct drm_crtc_state;
+
+enum tidss_gamma_type { TIDSS_GAMMA_8BIT, TIDSS_GAMMA_10BIT };
+
+struct tidss_vp_feat {
+	struct tidss_vp_color_feat {
+		u32 gamma_size;
+		enum tidss_gamma_type gamma_type;
+		bool has_ctm;
+	} color;
+};
+
+struct tidss_plane_feat {
+	struct tidss_plane_color_feat {
+		u32 encodings;
+		u32 ranges;
+		enum drm_color_encoding default_encoding;
+		enum drm_color_range default_range;
+	} color;
+	struct tidss_plane_blend_feat {
+		bool global_alpha;
+	} blend;
+};
+
+struct dispc_features_scaling {
+	u32 in_width_max_5tap_rgb;
+	u32 in_width_max_3tap_rgb;
+	u32 in_width_max_5tap_yuv;
+	u32 in_width_max_3tap_yuv;
+	u32 upscale_limit;
+	u32 downscale_limit_5tap;
+	u32 downscale_limit_3tap;
+	u32 xinc_max;
+};
+
+struct dispc_errata {
+	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
+};
+
+enum dispc_vp_bus_type {
+	DISPC_VP_DPI,		/* DPI output */
+	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
+	DISPC_VP_INTERNAL,	/* SoC internal routing */
+	DISPC_VP_MAX_BUS_TYPE,
+};
+
+enum dispc_dss_subrevision {
+	DISPC_K2G,
+	DISPC_AM65X,
+	DISPC_J721E,
+};
+
+struct dispc_features {
+	int min_pclk_khz;
+	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
+
+	struct dispc_features_scaling scaling;
+
+	enum dispc_dss_subrevision subrev;
+
+	const char *common;
+	const u16 *common_regs;
+	u32 num_vps;
+	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
+	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
+	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
+	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
+	struct tidss_vp_feat vp_feat;
+	u32 num_planes;
+	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
+	bool vid_lite[TIDSS_MAX_PLANES];
+	u32 vid_order[TIDSS_MAX_PLANES];
+
+	struct dispc_errata errata;
+};
+
+extern const struct dispc_features dispc_k2g_feats;
+extern const struct dispc_features dispc_am65x_feats;
+extern const struct dispc_features dispc_j721e_feats;
+
+void dispc_write_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
+dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
+
+void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
+		      const struct drm_crtc_state *state);
+void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
+		     const struct drm_crtc_state *state);
+void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport);
+void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport);
+bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport);
+void dispc_vp_go(struct dispc_device *dispc, u32 hw_videoport);
+int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
+		       const struct drm_crtc_state *state);
+enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
+					 u32 hw_videoport,
+					 const struct drm_display_mode *mode);
+int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport);
+void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport);
+int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
+			  unsigned long rate);
+void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
+		    const struct drm_crtc_state *state, bool newmodeset);
+
+int dispc_runtime_suspend(struct dispc_device *dispc);
+int dispc_runtime_resume(struct dispc_device *dispc);
+
+int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
+		      const struct drm_plane_state *state,
+		      u32 hw_videoport);
+int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
+		      const struct drm_plane_state *state,
+		      u32 hw_videoport);
+int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
+const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
+
+int dispc_init(struct tidss_device *tidss);
+void dispc_remove(struct tidss_device *tidss);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
new file mode 100644
index 000000000000..88a83a41b6e3
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -0,0 +1,243 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#ifndef __TIDSS_DISPC_REGS_H
+#define __TIDSS_DISPC_REGS_H
+
+enum dispc_common_regs {
+	NOT_APPLICABLE_OFF = 0,
+	DSS_REVISION_OFF,
+	DSS_SYSCONFIG_OFF,
+	DSS_SYSSTATUS_OFF,
+	DISPC_IRQ_EOI_OFF,
+	DISPC_IRQSTATUS_RAW_OFF,
+	DISPC_IRQSTATUS_OFF,
+	DISPC_IRQENABLE_SET_OFF,
+	DISPC_IRQENABLE_CLR_OFF,
+	DISPC_VID_IRQENABLE_OFF,
+	DISPC_VID_IRQSTATUS_OFF,
+	DISPC_VP_IRQENABLE_OFF,
+	DISPC_VP_IRQSTATUS_OFF,
+	WB_IRQENABLE_OFF,
+	WB_IRQSTATUS_OFF,
+	DISPC_GLOBAL_MFLAG_ATTRIBUTE_OFF,
+	DISPC_GLOBAL_OUTPUT_ENABLE_OFF,
+	DISPC_GLOBAL_BUFFER_OFF,
+	DSS_CBA_CFG_OFF,
+	DISPC_DBG_CONTROL_OFF,
+	DISPC_DBG_STATUS_OFF,
+	DISPC_CLKGATING_DISABLE_OFF,
+	DISPC_SECURE_DISABLE_OFF,
+	FBDC_REVISION_1_OFF,
+	FBDC_REVISION_2_OFF,
+	FBDC_REVISION_3_OFF,
+	FBDC_REVISION_4_OFF,
+	FBDC_REVISION_5_OFF,
+	FBDC_REVISION_6_OFF,
+	FBDC_COMMON_CONTROL_OFF,
+	FBDC_CONSTANT_COLOR_0_OFF,
+	FBDC_CONSTANT_COLOR_1_OFF,
+	DISPC_CONNECTIONS_OFF,
+	DISPC_MSS_VP1_OFF,
+	DISPC_MSS_VP3_OFF,
+	DISPC_COMMON_REG_TABLE_LEN,
+};
+
+/*
+ * dispc_common_regmap should be defined as const u16 * and pointing
+ * to a valid dss common register map for the platform, before the
+ * macros bellow can be used.
+ */
+
+#define REG(r) (dispc_common_regmap[r ## _OFF])
+
+#define DSS_REVISION			REG(DSS_REVISION)
+#define DSS_SYSCONFIG			REG(DSS_SYSCONFIG)
+#define DSS_SYSSTATUS			REG(DSS_SYSSTATUS)
+#define DISPC_IRQ_EOI			REG(DISPC_IRQ_EOI)
+#define DISPC_IRQSTATUS_RAW		REG(DISPC_IRQSTATUS_RAW)
+#define DISPC_IRQSTATUS			REG(DISPC_IRQSTATUS)
+#define DISPC_IRQENABLE_SET		REG(DISPC_IRQENABLE_SET)
+#define DISPC_IRQENABLE_CLR		REG(DISPC_IRQENABLE_CLR)
+#define DISPC_VID_IRQENABLE(n)		(REG(DISPC_VID_IRQENABLE) + (n) * 4)
+#define DISPC_VID_IRQSTATUS(n)		(REG(DISPC_VID_IRQSTATUS) + (n) * 4)
+#define DISPC_VP_IRQENABLE(n)		(REG(DISPC_VP_IRQENABLE) + (n) * 4)
+#define DISPC_VP_IRQSTATUS(n)		(REG(DISPC_VP_IRQSTATUS) + (n) * 4)
+#define WB_IRQENABLE			REG(WB_IRQENABLE)
+#define WB_IRQSTATUS			REG(WB_IRQSTATUS)
+
+#define DISPC_GLOBAL_MFLAG_ATTRIBUTE	REG(DISPC_GLOBAL_MFLAG_ATTRIBUTE)
+#define DISPC_GLOBAL_OUTPUT_ENABLE	REG(DISPC_GLOBAL_OUTPUT_ENABLE)
+#define DISPC_GLOBAL_BUFFER		REG(DISPC_GLOBAL_BUFFER)
+#define DSS_CBA_CFG			REG(DSS_CBA_CFG)
+#define DISPC_DBG_CONTROL		REG(DISPC_DBG_CONTROL)
+#define DISPC_DBG_STATUS		REG(DISPC_DBG_STATUS)
+#define DISPC_CLKGATING_DISABLE		REG(DISPC_CLKGATING_DISABLE)
+#define DISPC_SECURE_DISABLE		REG(DISPC_SECURE_DISABLE)
+
+#define FBDC_REVISION_1			REG(FBDC_REVISION_1)
+#define FBDC_REVISION_2			REG(FBDC_REVISION_2)
+#define FBDC_REVISION_3			REG(FBDC_REVISION_3)
+#define FBDC_REVISION_4			REG(FBDC_REVISION_4)
+#define FBDC_REVISION_5			REG(FBDC_REVISION_5)
+#define FBDC_REVISION_6			REG(FBDC_REVISION_6)
+#define FBDC_COMMON_CONTROL		REG(FBDC_COMMON_CONTROL)
+#define FBDC_CONSTANT_COLOR_0		REG(FBDC_CONSTANT_COLOR_0)
+#define FBDC_CONSTANT_COLOR_1		REG(FBDC_CONSTANT_COLOR_1)
+#define DISPC_CONNECTIONS		REG(DISPC_CONNECTIONS)
+#define DISPC_MSS_VP1			REG(DISPC_MSS_VP1)
+#define DISPC_MSS_VP3			REG(DISPC_MSS_VP3)
+
+/* VID */
+
+#define DISPC_VID_ACCUH_0		0x0
+#define DISPC_VID_ACCUH_1		0x4
+#define DISPC_VID_ACCUH2_0		0x8
+#define DISPC_VID_ACCUH2_1		0xc
+#define DISPC_VID_ACCUV_0		0x10
+#define DISPC_VID_ACCUV_1		0x14
+#define DISPC_VID_ACCUV2_0		0x18
+#define DISPC_VID_ACCUV2_1		0x1c
+#define DISPC_VID_ATTRIBUTES		0x20
+#define DISPC_VID_ATTRIBUTES2		0x24
+#define DISPC_VID_BA_0			0x28
+#define DISPC_VID_BA_1			0x2c
+#define DISPC_VID_BA_UV_0		0x30
+#define DISPC_VID_BA_UV_1		0x34
+#define DISPC_VID_BUF_SIZE_STATUS	0x38
+#define DISPC_VID_BUF_THRESHOLD		0x3c
+#define DISPC_VID_CSC_COEF(n)		(0x40 + (n) * 4)
+
+#define DISPC_VID_FIRH			0x5c
+#define DISPC_VID_FIRH2			0x60
+#define DISPC_VID_FIRV			0x64
+#define DISPC_VID_FIRV2			0x68
+
+#define DISPC_VID_FIR_COEFS_H0		0x6c
+#define DISPC_VID_FIR_COEF_H0(phase)	(0x6c + (phase) * 4)
+#define DISPC_VID_FIR_COEFS_H0_C	0x90
+#define DISPC_VID_FIR_COEF_H0_C(phase)	(0x90 + (phase) * 4)
+
+#define DISPC_VID_FIR_COEFS_H12		0xb4
+#define DISPC_VID_FIR_COEF_H12(phase)	(0xb4 + (phase) * 4)
+#define DISPC_VID_FIR_COEFS_H12_C	0xf4
+#define DISPC_VID_FIR_COEF_H12_C(phase)	(0xf4 + (phase) * 4)
+
+#define DISPC_VID_FIR_COEFS_V0		0x134
+#define DISPC_VID_FIR_COEF_V0(phase)	(0x134 + (phase) * 4)
+#define DISPC_VID_FIR_COEFS_V0_C	0x158
+#define DISPC_VID_FIR_COEF_V0_C(phase)	(0x158 + (phase) * 4)
+
+#define DISPC_VID_FIR_COEFS_V12		0x17c
+#define DISPC_VID_FIR_COEF_V12(phase)	(0x17c + (phase) * 4)
+#define DISPC_VID_FIR_COEFS_V12_C	0x1bc
+#define DISPC_VID_FIR_COEF_V12_C(phase)	(0x1bc + (phase) * 4)
+
+#define DISPC_VID_GLOBAL_ALPHA		0x1fc
+#define DISPC_VID_K2G_IRQENABLE		0x200 /* K2G */
+#define DISPC_VID_K2G_IRQSTATUS		0x204 /* K2G */
+#define DISPC_VID_MFLAG_THRESHOLD	0x208
+#define DISPC_VID_PICTURE_SIZE		0x20c
+#define DISPC_VID_PIXEL_INC		0x210
+#define DISPC_VID_K2G_POSITION		0x214 /* K2G */
+#define DISPC_VID_PRELOAD		0x218
+#define DISPC_VID_ROW_INC		0x21c
+#define DISPC_VID_SIZE			0x220
+#define DISPC_VID_BA_EXT_0		0x22c
+#define DISPC_VID_BA_EXT_1		0x230
+#define DISPC_VID_BA_UV_EXT_0		0x234
+#define DISPC_VID_BA_UV_EXT_1		0x238
+#define DISPC_VID_CSC_COEF7		0x23c
+#define DISPC_VID_ROW_INC_UV		0x248
+#define DISPC_VID_CLUT			0x260
+#define DISPC_VID_SAFETY_ATTRIBUTES	0x2a0
+#define DISPC_VID_SAFETY_CAPT_SIGNATURE	0x2a4
+#define DISPC_VID_SAFETY_POSITION	0x2a8
+#define DISPC_VID_SAFETY_REF_SIGNATURE	0x2ac
+#define DISPC_VID_SAFETY_SIZE		0x2b0
+#define DISPC_VID_SAFETY_LFSR_SEED	0x2b4
+#define DISPC_VID_LUMAKEY		0x2b8
+#define DISPC_VID_DMA_BUFSIZE		0x2bc /* J721E */
+
+/* OVR */
+
+#define DISPC_OVR_CONFIG		0x0
+#define DISPC_OVR_VIRTVP		0x4 /* J721E */
+#define DISPC_OVR_DEFAULT_COLOR		0x8
+#define DISPC_OVR_DEFAULT_COLOR2	0xc
+#define DISPC_OVR_TRANS_COLOR_MAX	0x10
+#define DISPC_OVR_TRANS_COLOR_MAX2	0x14
+#define DISPC_OVR_TRANS_COLOR_MIN	0x18
+#define DISPC_OVR_TRANS_COLOR_MIN2	0x1c
+#define DISPC_OVR_ATTRIBUTES(n)		(0x20 + (n) * 4)
+#define DISPC_OVR_ATTRIBUTES2(n)	(0x34 + (n) * 4) /* J721E */
+/* VP */
+
+#define DISPC_VP_CONFIG				0x0
+#define DISPC_VP_CONTROL			0x4
+#define DISPC_VP_CSC_COEF0			0x8
+#define DISPC_VP_CSC_COEF1			0xc
+#define DISPC_VP_CSC_COEF2			0x10
+#define DISPC_VP_DATA_CYCLE_0			0x14
+#define DISPC_VP_DATA_CYCLE_1			0x18
+#define DISPC_VP_K2G_GAMMA_TABLE		0x20 /* K2G */
+#define DISPC_VP_K2G_IRQENABLE			0x3c /* K2G */
+#define DISPC_VP_K2G_IRQSTATUS			0x40 /* K2G */
+#define DISPC_VP_DATA_CYCLE_2			0x1c
+#define DISPC_VP_LINE_NUMBER			0x44
+#define DISPC_VP_POL_FREQ			0x4c
+#define DISPC_VP_SIZE_SCREEN			0x50
+#define DISPC_VP_TIMING_H			0x54
+#define DISPC_VP_TIMING_V			0x58
+#define DISPC_VP_CSC_COEF3			0x5c
+#define DISPC_VP_CSC_COEF4			0x60
+#define DISPC_VP_CSC_COEF5			0x64
+#define DISPC_VP_CSC_COEF6			0x68
+#define DISPC_VP_CSC_COEF7			0x6c
+#define DISPC_VP_SAFETY_ATTRIBUTES_0		0x70
+#define DISPC_VP_SAFETY_ATTRIBUTES_1		0x74
+#define DISPC_VP_SAFETY_ATTRIBUTES_2		0x78
+#define DISPC_VP_SAFETY_ATTRIBUTES_3		0x7c
+#define DISPC_VP_SAFETY_CAPT_SIGNATURE_0	0x90
+#define DISPC_VP_SAFETY_CAPT_SIGNATURE_1	0x94
+#define DISPC_VP_SAFETY_CAPT_SIGNATURE_2	0x98
+#define DISPC_VP_SAFETY_CAPT_SIGNATURE_3	0x9c
+#define DISPC_VP_SAFETY_POSITION_0		0xb0
+#define DISPC_VP_SAFETY_POSITION_1		0xb4
+#define DISPC_VP_SAFETY_POSITION_2		0xb8
+#define DISPC_VP_SAFETY_POSITION_3		0xbc
+#define DISPC_VP_SAFETY_REF_SIGNATURE_0		0xd0
+#define DISPC_VP_SAFETY_REF_SIGNATURE_1		0xd4
+#define DISPC_VP_SAFETY_REF_SIGNATURE_2		0xd8
+#define DISPC_VP_SAFETY_REF_SIGNATURE_3		0xdc
+#define DISPC_VP_SAFETY_SIZE_0			0xf0
+#define DISPC_VP_SAFETY_SIZE_1			0xf4
+#define DISPC_VP_SAFETY_SIZE_2			0xf8
+#define DISPC_VP_SAFETY_SIZE_3			0xfc
+#define DISPC_VP_SAFETY_LFSR_SEED		0x110
+#define DISPC_VP_GAMMA_TABLE			0x120
+#define DISPC_VP_DSS_OLDI_CFG			0x160
+#define DISPC_VP_DSS_OLDI_STATUS		0x164
+#define DISPC_VP_DSS_OLDI_LB			0x168
+#define DISPC_VP_DSS_MERGE_SPLIT		0x16c /* J721E */
+#define DISPC_VP_DSS_DMA_THREADSIZE		0x170 /* J721E */
+#define DISPC_VP_DSS_DMA_THREADSIZE_STATUS	0x174 /* J721E */
+
+/*
+ * OLDI IO_CTRL register offsets. On AM654 the registers are found
+ * from CTRL_MMR0, there the syscon regmap should map 0x14 bytes from
+ * CTRLMMR0P1_OLDI_DAT0_IO_CTRL to CTRLMMR0P1_OLDI_CLK_IO_CTRL
+ * register range.
+ */
+#define OLDI_DAT0_IO_CTRL			0x00
+#define OLDI_DAT1_IO_CTRL			0x04
+#define OLDI_DAT2_IO_CTRL			0x08
+#define OLDI_DAT3_IO_CTRL			0x0C
+#define OLDI_CLK_IO_CTRL			0x10
+
+#define OLDI_PWRDN_TX				BIT(8)
+
+#endif /* __TIDSS_DISPC_REGS_H */
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
new file mode 100644
index 000000000000..d95e4be2c7b9
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <linux/console.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_irq.h>
+#include <drm/drm_probe_helper.h>
+
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_kms.h"
+#include "tidss_irq.h"
+
+/* Power management */
+
+int tidss_runtime_get(struct tidss_device *tidss)
+{
+	int r;
+
+	dev_dbg(tidss->dev, "%s\n", __func__);
+
+	r = pm_runtime_get_sync(tidss->dev);
+	WARN_ON(r < 0);
+	return r < 0 ? r : 0;
+}
+
+void tidss_runtime_put(struct tidss_device *tidss)
+{
+	int r;
+
+	dev_dbg(tidss->dev, "%s\n", __func__);
+
+	r = pm_runtime_put_sync(tidss->dev);
+	WARN_ON(r < 0);
+}
+
+static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)
+{
+	struct tidss_device *tidss = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	return dispc_runtime_suspend(tidss->dispc);
+}
+
+static int __maybe_unused tidss_pm_runtime_resume(struct device *dev)
+{
+	struct tidss_device *tidss = dev_get_drvdata(dev);
+	int r;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	r = dispc_runtime_resume(tidss->dispc);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static int __maybe_unused tidss_suspend(struct device *dev)
+{
+	struct tidss_device *tidss = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	return drm_mode_config_helper_suspend(&tidss->ddev);
+}
+
+static int __maybe_unused tidss_resume(struct device *dev)
+{
+	struct tidss_device *tidss = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	return drm_mode_config_helper_resume(&tidss->ddev);
+}
+
+#ifdef CONFIG_PM
+
+static const struct dev_pm_ops tidss_pm_ops = {
+	.runtime_suspend = tidss_pm_runtime_suspend,
+	.runtime_resume = tidss_pm_runtime_resume,
+	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
+};
+
+#endif /* CONFIG_PM */
+
+/* DRM device Information */
+
+static void tidss_release(struct drm_device *ddev)
+{
+	struct tidss_device *tidss = ddev->dev_private;
+
+	drm_kms_helper_poll_fini(ddev);
+
+	tidss_modeset_cleanup(tidss);
+
+	drm_dev_fini(ddev);
+
+	kfree(tidss);
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(tidss_fops);
+
+static struct drm_driver tidss_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &tidss_fops,
+	.release		= tidss_release,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	.name			= "tidss",
+	.desc			= "TI Keystone DSS",
+	.date			= "20180215",
+	.major			= 1,
+	.minor			= 0,
+
+	.irq_preinstall		= tidss_irq_preinstall,
+	.irq_postinstall	= tidss_irq_postinstall,
+	.irq_handler		= tidss_irq_handler,
+	.irq_uninstall		= tidss_irq_uninstall,
+};
+
+static int tidss_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tidss_device *tidss;
+	struct drm_device *ddev;
+	int ret;
+	int irq;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	/* Can't use devm_* since drm_device's lifetime may exceed dev's */
+	tidss = kzalloc(sizeof(*tidss), GFP_KERNEL);
+	if (!tidss)
+		return -ENOMEM;
+
+	ddev = &tidss->ddev;
+
+	ret = devm_drm_dev_init(&pdev->dev, ddev, &tidss_driver);
+	if (ret) {
+		kfree(ddev);
+		return ret;
+	}
+
+	tidss->dev = dev;
+	tidss->feat = of_device_get_match_data(dev);
+
+	platform_set_drvdata(pdev, tidss);
+
+	ddev->dev_private = tidss;
+
+	ret = dispc_init(tidss);
+	if (ret) {
+		dev_err(dev, "failed to initialize dispc: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+#ifndef CONFIG_PM
+	/* If we don't have PM, we need to call resume manually */
+	dispc_runtime_resume(tidss->dispc);
+#endif
+
+	ret = tidss_modeset_init(tidss);
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to init DRM/KMS (%d)\n", ret);
+		goto err_runtime_suspend;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto err_runtime_suspend;
+	}
+
+	ret = drm_irq_install(ddev, irq);
+	if (ret) {
+		dev_err(dev, "drm_irq_install failed: %d\n", ret);
+		goto err_runtime_suspend;
+	}
+
+	drm_kms_helper_poll_init(ddev);
+
+	drm_mode_config_reset(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret) {
+		dev_err(dev, "failed to register DRM device\n");
+		goto err_irq_uninstall;
+	}
+
+	drm_fbdev_generic_setup(ddev, 32);
+
+	dev_dbg(dev, "%s done\n", __func__);
+
+	return 0;
+
+err_irq_uninstall:
+	drm_irq_uninstall(ddev);
+
+err_runtime_suspend:
+#ifndef CONFIG_PM
+	dispc_runtime_suspend(tidss->dispc);
+#endif
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int tidss_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tidss_device *tidss = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &tidss->ddev;
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	drm_dev_unregister(ddev);
+
+	drm_atomic_helper_shutdown(ddev);
+
+	drm_irq_uninstall(ddev);
+
+#ifndef CONFIG_PM
+	/* If we don't have PM, we need to call suspend manually */
+	dispc_runtime_suspend(tidss->dispc);
+#endif
+	pm_runtime_disable(dev);
+
+	/* devm allocated dispc goes away with the dev so mark it NULL */
+	dispc_remove(tidss);
+
+	dev_dbg(dev, "%s done\n", __func__);
+
+	return 0;
+}
+
+static void tidss_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
+static const struct of_device_id tidss_of_table[] = {
+	{ .compatible = "ti,k2g-dss", .data = &dispc_k2g_feats, },
+	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
+	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, tidss_of_table);
+
+static struct platform_driver tidss_platform_driver = {
+	.probe		= tidss_probe,
+	.remove		= tidss_remove,
+	.shutdown	= tidss_shutdown,
+	.driver		= {
+		.name	= "tidss",
+#ifdef CONFIG_PM
+		.pm	= &tidss_pm_ops,
+#endif
+		.of_match_table = tidss_of_table,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(tidss_platform_driver);
+
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
+MODULE_DESCRIPTION("TI Keystone DSS Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
new file mode 100644
index 000000000000..e2aa6436ad18
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_DRV_H__
+#define __TIDSS_DRV_H__
+
+#include <linux/spinlock.h>
+
+#define TIDSS_MAX_PORTS 4
+#define TIDSS_MAX_PLANES 4
+
+typedef u32 dispc_irq_t;
+
+struct tidss_device {
+	struct drm_device ddev;		/* DRM device for DSS */
+	struct device *dev;		/* Underlying DSS device */
+
+	const struct dispc_features *feat;
+	struct dispc_device *dispc;
+
+	unsigned int num_crtcs;
+	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
+
+	unsigned int num_planes;
+	struct drm_plane *planes[TIDSS_MAX_PLANES];
+
+	spinlock_t wait_lock;	/* protects the irq masks */
+	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
+
+	struct drm_atomic_state *saved_state;
+};
+
+int tidss_runtime_get(struct tidss_device *tidss);
+void tidss_runtime_put(struct tidss_device *tidss);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
new file mode 100644
index 000000000000..f7fe3a43ead0
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <linux/export.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_of.h>
+
+#include "tidss_crtc.h"
+#include "tidss_drv.h"
+#include "tidss_encoder.h"
+
+static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
+	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_bridge *bridge;
+	bool bus_flags_set = false;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	/*
+	 * Take the bus_flags from the first bridge that defines
+	 * bridge timings, or from the connector's display_info if no
+	 * bridge defines the timings.
+	 */
+	list_for_each_entry(bridge, &encoder->bridge_chain, chain_node) {
+		if (!bridge->timings)
+			continue;
+
+		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
+		bus_flags_set = true;
+		break;
+	}
+
+	if (!di->bus_formats || di->num_bus_formats == 0)  {
+		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	// XXX any cleaner way to set bus format and flags?
+	tcrtc_state->bus_format = di->bus_formats[0];
+	if (!bus_flags_set)
+		tcrtc_state->bus_flags = di->bus_flags;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
+	.atomic_check = tidss_encoder_atomic_check,
+};
+
+static const struct drm_encoder_funcs encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
+					 u32 encoder_type, u32 possible_crtcs)
+{
+	struct drm_encoder *enc;
+	int ret;
+
+	enc = devm_kzalloc(tidss->dev, sizeof(*enc), GFP_KERNEL);
+	if (!enc)
+		return ERR_PTR(-ENOMEM);
+
+	enc->possible_crtcs = possible_crtcs;
+
+	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
+			       encoder_type, NULL);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	drm_encoder_helper_add(enc, &encoder_helper_funcs);
+
+	dev_dbg(tidss->dev, "Encoder create done\n");
+
+	return enc;
+}
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
new file mode 100644
index 000000000000..06854d66e7e6
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_encoder.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_ENCODER_H__
+#define __TIDSS_ENCODER_H__
+
+#include <drm/drm_encoder.h>
+
+struct tidss_device;
+
+struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
+					 u32 encoder_type, u32 possible_crtcs);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
new file mode 100644
index 000000000000..ad7a887d89d4
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <drm/drm_print.h>
+
+#include "tidss_crtc.h"
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_irq.h"
+#include "tidss_plane.h"
+
+/* call with wait_lock and dispc runtime held */
+static void tidss_irq_update(struct tidss_device *tidss)
+{
+	assert_spin_locked(&tidss->wait_lock);
+
+	dispc_write_irqenable(tidss->dispc, tidss->irq_mask);
+}
+
+void tidss_irq_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	u32 hw_videoport = tcrtc->hw_videoport;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tidss->wait_lock, flags);
+	tidss->irq_mask |= DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
+			   DSS_IRQ_VP_VSYNC_ODD(hw_videoport);
+	tidss_irq_update(tidss);
+	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+}
+
+void tidss_irq_disable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	u32 hw_videoport = tcrtc->hw_videoport;
+	unsigned long flags;
+
+	spin_lock_irqsave(&tidss->wait_lock, flags);
+	tidss->irq_mask &= ~(DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
+			     DSS_IRQ_VP_VSYNC_ODD(hw_videoport));
+	tidss_irq_update(tidss);
+	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+}
+
+irqreturn_t tidss_irq_handler(int irq, void *arg)
+{
+	struct drm_device *ddev = (struct drm_device *)arg;
+	struct tidss_device *tidss = ddev->dev_private;
+	unsigned int id;
+	dispc_irq_t irqstatus;
+
+	if (WARN_ON(!ddev->irq_enabled))
+		return IRQ_NONE;
+
+	irqstatus = dispc_read_and_clear_irqstatus(tidss->dispc);
+
+	for (id = 0; id < tidss->num_crtcs; id++) {
+		struct drm_crtc *crtc = tidss->crtcs[id];
+		struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+		u32 hw_videoport = tcrtc->hw_videoport;
+
+		if (irqstatus & (DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
+				 DSS_IRQ_VP_VSYNC_ODD(hw_videoport)))
+			tidss_crtc_vblank_irq(crtc);
+
+		if (irqstatus & (DSS_IRQ_VP_FRAME_DONE(hw_videoport)))
+			tidss_crtc_framedone_irq(crtc);
+
+		if (irqstatus & DSS_IRQ_VP_SYNC_LOST(hw_videoport))
+			tidss_crtc_error_irq(crtc, irqstatus);
+	}
+
+	if (irqstatus & DSS_IRQ_DEVICE_OCP_ERR)
+		dev_err_ratelimited(tidss->dev, "OCP error\n");
+
+	return IRQ_HANDLED;
+}
+
+void tidss_irq_resume(struct tidss_device *tidss)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&tidss->wait_lock, flags);
+	tidss_irq_update(tidss);
+	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+}
+
+void tidss_irq_preinstall(struct drm_device *ddev)
+{
+	struct tidss_device *tidss = ddev->dev_private;
+
+	spin_lock_init(&tidss->wait_lock);
+
+	tidss_runtime_get(tidss);
+
+	dispc_write_irqenable(tidss->dispc, 0);
+	dispc_read_and_clear_irqstatus(tidss->dispc);
+
+	tidss_runtime_put(tidss);
+}
+
+int tidss_irq_postinstall(struct drm_device *ddev)
+{
+	struct tidss_device *tidss = ddev->dev_private;
+	unsigned long flags;
+	unsigned int i;
+
+	tidss_runtime_get(tidss);
+
+	spin_lock_irqsave(&tidss->wait_lock, flags);
+
+	tidss->irq_mask = DSS_IRQ_DEVICE_OCP_ERR;
+
+	for (i = 0; i < tidss->num_crtcs; ++i) {
+		struct tidss_crtc *tcrtc = to_tidss_crtc(tidss->crtcs[i]);
+
+		tidss->irq_mask |= DSS_IRQ_VP_SYNC_LOST(tcrtc->hw_videoport);
+
+		tidss->irq_mask |= DSS_IRQ_VP_FRAME_DONE(tcrtc->hw_videoport);
+	}
+
+	tidss_irq_update(tidss);
+
+	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+
+	tidss_runtime_put(tidss);
+
+	return 0;
+}
+
+void tidss_irq_uninstall(struct drm_device *ddev)
+{
+	struct tidss_device *tidss = ddev->dev_private;
+
+	tidss_runtime_get(tidss);
+	dispc_write_irqenable(tidss->dispc, 0);
+	tidss_runtime_put(tidss);
+}
diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
new file mode 100644
index 000000000000..aa92db403cca
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_IRQ_H__
+#define __TIDSS_IRQ_H__
+
+#include <linux/types.h>
+
+#include "tidss_drv.h"
+
+/*
+ * The IRQ status from various DISPC IRQ registers are packed into a single
+ * value, where the bits are defined as follows:
+ *
+ * bit group |dev|wb |mrg0|mrg1|mrg2|mrg3|plane0-3| <unused> |
+ * bit use   |D  |fou|FEOL|FEOL|FEOL|FEOL|  UUUU  |          |
+ * bit number|0  |1-3|4-7 |8-11|  12-19  | 20-23  |  24-31   |
+ *
+ * device bits:	D = OCP error
+ * WB bits:	f = frame done wb, o = wb buffer overflow,
+ *		u = wb buffer uncomplete
+ * vp bits:	F = frame done, E = vsync even, O = vsync odd, L = sync lost
+ * plane bits:	U = fifo underflow
+ */
+
+#define DSS_IRQ_DEVICE_OCP_ERR			BIT(0)
+
+#define DSS_IRQ_DEVICE_FRAMEDONEWB		BIT(1)
+#define DSS_IRQ_DEVICE_WBBUFFEROVERFLOW		BIT(2)
+#define DSS_IRQ_DEVICE_WBUNCOMPLETEERROR	BIT(3)
+#define DSS_IRQ_DEVICE_WB_MASK			GENMASK(3, 1)
+
+#define DSS_IRQ_VP_BIT_N(ch, bit)	(4 + 4 * (ch) + (bit))
+#define DSS_IRQ_PLANE_BIT_N(plane, bit) \
+	(DSS_IRQ_VP_BIT_N(TIDSS_MAX_PORTS, 0) + 1 * (plane) + (bit))
+
+#define DSS_IRQ_VP_BIT(ch, bit)	BIT(DSS_IRQ_VP_BIT_N((ch), (bit)))
+#define DSS_IRQ_PLANE_BIT(plane, bit) \
+	BIT(DSS_IRQ_PLANE_BIT_N((plane), (bit)))
+
+static inline dispc_irq_t DSS_IRQ_VP_MASK(u32 ch)
+{
+	return GENMASK(DSS_IRQ_VP_BIT_N((ch), 3), DSS_IRQ_VP_BIT_N((ch), 0));
+}
+
+static inline dispc_irq_t DSS_IRQ_PLANE_MASK(u32 plane)
+{
+	return GENMASK(DSS_IRQ_PLANE_BIT_N((plane), 0),
+		       DSS_IRQ_PLANE_BIT_N((plane), 0));
+}
+
+#define DSS_IRQ_VP_FRAME_DONE(ch)	DSS_IRQ_VP_BIT((ch), 0)
+#define DSS_IRQ_VP_VSYNC_EVEN(ch)	DSS_IRQ_VP_BIT((ch), 1)
+#define DSS_IRQ_VP_VSYNC_ODD(ch)	DSS_IRQ_VP_BIT((ch), 2)
+#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 3)
+
+#define DSS_IRQ_PLANE_FIFO_UNDERFLOW(plane)	DSS_IRQ_PLANE_BIT((plane), 0)
+
+struct drm_crtc;
+struct drm_device;
+
+struct tidss_device;
+
+void tidss_irq_enable_vblank(struct drm_crtc *crtc);
+void tidss_irq_disable_vblank(struct drm_crtc *crtc);
+
+void tidss_irq_preinstall(struct drm_device *ddev);
+int tidss_irq_postinstall(struct drm_device *ddev);
+void tidss_irq_uninstall(struct drm_device *ddev);
+irqreturn_t tidss_irq_handler(int irq, void *arg);
+
+void tidss_irq_resume(struct tidss_device *tidss);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
new file mode 100644
index 000000000000..5311e0f1c551
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_vblank.h>
+
+#include "tidss_crtc.h"
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_encoder.h"
+#include "tidss_kms.h"
+#include "tidss_plane.h"
+
+static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct drm_device *ddev = old_state->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	tidss_runtime_get(tidss);
+
+	drm_atomic_helper_commit_modeset_disables(ddev, old_state);
+	drm_atomic_helper_commit_planes(ddev, old_state, 0);
+	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
+
+	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_wait_for_flip_done(ddev, old_state);
+
+	drm_atomic_helper_cleanup_planes(ddev, old_state);
+
+	tidss_runtime_put(tidss);
+}
+
+static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
+	.atomic_commit_tail = tidss_atomic_commit_tail,
+};
+
+static const struct drm_mode_config_funcs mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int tidss_dispc_modeset_init(struct tidss_device *tidss)
+{
+	struct device *dev = tidss->dev;
+	unsigned int fourccs_len;
+	const u32 *fourccs = dispc_plane_formats(tidss->dispc, &fourccs_len);
+	unsigned int i;
+
+	struct pipe {
+		u32 hw_videoport;
+		struct drm_bridge *bridge;
+		u32 enc_type;
+	};
+
+	const struct dispc_features *feat = tidss->feat;
+	u32 max_vps = feat->num_vps;
+	u32 max_planes = feat->num_planes;
+
+	struct pipe pipes[TIDSS_MAX_PORTS];
+	u32 num_pipes = 0;
+	u32 crtc_mask;
+
+	/* first find all the connected panels & bridges */
+
+	for (i = 0; i < max_vps; i++) {
+		struct drm_panel *panel;
+		struct drm_bridge *bridge;
+		u32 enc_type = DRM_MODE_ENCODER_NONE;
+		int ret;
+
+		ret = drm_of_find_panel_or_bridge(dev->of_node, i, 0,
+						  &panel, &bridge);
+		if (ret == -ENODEV) {
+			dev_dbg(dev, "no panel/bridge for port %d\n", i);
+			continue;
+		} else if (ret) {
+			dev_dbg(dev, "port %d probe returned %d\n", i, ret);
+			return ret;
+		}
+
+		if (panel) {
+			u32 conn_type;
+
+			dev_dbg(dev, "Setting up panel for port %d\n", i);
+
+			switch (feat->vp_bus_type[i]) {
+			case DISPC_VP_OLDI:
+				enc_type = DRM_MODE_ENCODER_LVDS;
+				conn_type = DRM_MODE_CONNECTOR_LVDS;
+				break;
+			case DISPC_VP_DPI:
+				enc_type = DRM_MODE_ENCODER_DPI;
+				conn_type = DRM_MODE_CONNECTOR_LVDS;
+				break;
+			default:
+				WARN_ON(1);
+				return -EINVAL;
+			}
+
+			if (panel->connector_type != conn_type) {
+				dev_err(dev,
+					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
+					 __func__, dev_name(panel->dev), i,
+					 panel->connector_type, conn_type);
+				return -EINVAL;
+			}
+
+			bridge = devm_drm_panel_bridge_add(dev, panel);
+			if (IS_ERR(bridge)) {
+				dev_err(dev,
+					"failed to set up panel bridge for port %d\n",
+					i);
+				return PTR_ERR(bridge);
+			}
+		}
+
+		pipes[num_pipes].hw_videoport = i;
+		pipes[num_pipes].bridge = bridge;
+		pipes[num_pipes].enc_type = enc_type;
+		num_pipes++;
+	}
+
+	/* all planes can be on any crtc */
+	crtc_mask = (1 << num_pipes) - 1;
+
+	/* then create a plane, a crtc and an encoder for each panel/bridge */
+
+	for (i = 0; i < num_pipes; ++i) {
+		struct tidss_plane *tplane;
+		struct tidss_crtc *tcrtc;
+		struct drm_encoder *enc;
+		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
+		int ret;
+
+		tplane = tidss_plane_create(tidss, hw_plane_id,
+					    DRM_PLANE_TYPE_PRIMARY, crtc_mask,
+					    fourccs, fourccs_len);
+		if (IS_ERR(tplane)) {
+			dev_err(tidss->dev, "plane create failed\n");
+			return PTR_ERR(tplane);
+		}
+
+		tidss->planes[tidss->num_planes++] = &tplane->plane;
+
+		tcrtc = tidss_crtc_create(tidss, pipes[i].hw_videoport,
+					  &tplane->plane);
+		if (IS_ERR(tcrtc)) {
+			dev_err(tidss->dev, "crtc create failed\n");
+			return PTR_ERR(tcrtc);
+		}
+
+		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
+
+		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
+					   1 << tcrtc->crtc.index);
+		if (IS_ERR(enc)) {
+			dev_err(tidss->dev, "encoder create failed\n");
+			return PTR_ERR(enc);
+		}
+
+		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL);
+		if (ret) {
+			dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/* create overlay planes of the leftover planes */
+
+	while (tidss->num_planes < max_planes) {
+		struct tidss_plane *tplane;
+		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
+
+		tplane = tidss_plane_create(tidss, hw_plane_id,
+					    DRM_PLANE_TYPE_OVERLAY, crtc_mask,
+					    fourccs, fourccs_len);
+
+		if (IS_ERR(tplane)) {
+			dev_err(tidss->dev, "plane create failed\n");
+			return PTR_ERR(tplane);
+		}
+
+		tidss->planes[tidss->num_planes++] = &tplane->plane;
+	}
+
+	return 0;
+}
+
+int tidss_modeset_init(struct tidss_device *tidss)
+{
+	struct drm_device *ddev = &tidss->ddev;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(tidss->dev, "%s\n", __func__);
+
+	drm_mode_config_init(ddev);
+
+	ddev->mode_config.min_width = 8;
+	ddev->mode_config.min_height = 8;
+	ddev->mode_config.max_width = 8096;
+	ddev->mode_config.max_height = 8096;
+	ddev->mode_config.normalize_zpos = true;
+	ddev->mode_config.funcs = &mode_config_funcs;
+	ddev->mode_config.helper_private = &mode_config_helper_funcs;
+
+	ret = tidss_dispc_modeset_init(tidss);
+	if (ret)
+		goto err_mode_config_cleanup;
+
+	ret = drm_vblank_init(ddev, tidss->num_crtcs);
+	if (ret)
+		goto err_mode_config_cleanup;
+
+	/* Start with vertical blanking interrupt reporting disabled. */
+	for (i = 0; i < tidss->num_crtcs; ++i)
+		drm_crtc_vblank_reset(tidss->crtcs[i]);
+
+	drm_mode_config_reset(ddev);
+
+	dev_dbg(tidss->dev, "%s done\n", __func__);
+
+	return 0;
+
+err_mode_config_cleanup:
+	drm_mode_config_cleanup(ddev);
+	return ret;
+}
+
+void tidss_modeset_cleanup(struct tidss_device *tidss)
+{
+	struct drm_device *ddev = &tidss->ddev;
+
+	drm_mode_config_cleanup(ddev);
+}
diff --git a/drivers/gpu/drm/tidss/tidss_kms.h b/drivers/gpu/drm/tidss/tidss_kms.h
new file mode 100644
index 000000000000..dda5625d0128
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_kms.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_KMS_H__
+#define __TIDSS_KMS_H__
+
+struct tidss_device;
+
+int tidss_modeset_init(struct tidss_device *tidss);
+void tidss_modeset_cleanup(struct tidss_device *tidss);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
new file mode 100644
index 000000000000..ff99b2dd4a17
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_fb_cma_helper.h>
+
+#include "tidss_crtc.h"
+#include "tidss_dispc.h"
+#include "tidss_drv.h"
+#include "tidss_plane.h"
+
+/* drm_plane_helper_funcs */
+
+static int tidss_plane_atomic_check(struct drm_plane *plane,
+				    struct drm_plane_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+	const struct drm_format_info *finfo;
+	struct drm_crtc_state *crtc_state;
+	u32 hw_plane = tplane->hw_plane_id;
+	u32 hw_videoport;
+	int ret;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	if (!state->crtc) {
+		/*
+		 * The visible field is not reset by the DRM core but only
+		 * updated by drm_plane_helper_check_state(), set it manually.
+		 */
+		state->visible = false;
+		return 0;
+	}
+
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
+						  INT_MAX, true, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The HW is only able to start drawing at subpixel boundary
+	 * (the two first checks bellow). At the end of a row the HW
+	 * can only jump integer number of subpixels forward to the
+	 * beginning of the next row. So we can only show picture with
+	 * integer subpixel width (the third check). However, after
+	 * reaching the end of the drawn picture the drawing starts
+	 * again at the absolute memory address where top left corner
+	 * position of the drawn picture is (so there is no need to
+	 * check for odd height).
+	 */
+
+	finfo = drm_format_info(state->fb->format->format);
+
+	if ((state->src_x >> 16) % finfo->hsub != 0) {
+		dev_dbg(ddev->dev,
+			"%s: x-position %u not divisible subpixel size %u\n",
+			__func__, (state->src_x >> 16), finfo->hsub);
+		return -EINVAL;
+	}
+
+	if ((state->src_y >> 16) % finfo->vsub != 0) {
+		dev_dbg(ddev->dev,
+			"%s: y-position %u not divisible subpixel size %u\n",
+			__func__, (state->src_y >> 16), finfo->vsub);
+		return -EINVAL;
+	}
+
+	if ((state->src_w >> 16) % finfo->hsub != 0) {
+		dev_dbg(ddev->dev,
+			"%s: src width %u not divisible by subpixel size %u\n",
+			 __func__, (state->src_w >> 16), finfo->hsub);
+		return -EINVAL;
+	}
+
+	if (!state->visible)
+		return 0;
+
+	hw_videoport = to_tidss_crtc(state->crtc)->hw_videoport;
+
+	ret = dispc_plane_check(tidss->dispc, hw_plane, state, hw_videoport);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void tidss_plane_atomic_update(struct drm_plane *plane,
+				      struct drm_plane_state *old_state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+	struct drm_plane_state *state = plane->state;
+	u32 hw_videoport;
+	int ret;
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	if (!state->visible) {
+		dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
+		return;
+	}
+
+	hw_videoport = to_tidss_crtc(state->crtc)->hw_videoport;
+
+	ret = dispc_plane_setup(tidss->dispc, tplane->hw_plane_id,
+				state, hw_videoport);
+
+	if (ret) {
+		dev_err(plane->dev->dev, "%s: Failed to setup plane %d\n",
+			__func__, tplane->hw_plane_id);
+		dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
+		return;
+	}
+
+	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, true);
+}
+
+static void tidss_plane_atomic_disable(struct drm_plane *plane,
+				       struct drm_plane_state *old_state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = ddev->dev_private;
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
+
+	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
+}
+
+static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
+	.atomic_check = tidss_plane_atomic_check,
+	.atomic_update = tidss_plane_atomic_update,
+	.atomic_disable = tidss_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs tidss_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = drm_atomic_helper_plane_reset,
+	.destroy = drm_plane_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
+				       u32 hw_plane_id, u32 plane_type,
+				       u32 crtc_mask, const u32 *formats,
+				       u32 num_formats)
+{
+	struct tidss_plane *tplane;
+	enum drm_plane_type type;
+	u32 possible_crtcs;
+	u32 num_planes = tidss->feat->num_planes;
+	u32 color_encodings = (BIT(DRM_COLOR_YCBCR_BT601) |
+			       BIT(DRM_COLOR_YCBCR_BT709));
+	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
+			    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE));
+	u32 default_encoding = DRM_COLOR_YCBCR_BT601;
+	u32 default_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	u32 blend_modes = (BIT(DRM_MODE_BLEND_PREMULTI) |
+			   BIT(DRM_MODE_BLEND_COVERAGE));
+	int ret;
+
+	tplane = devm_kzalloc(tidss->dev, sizeof(*tplane), GFP_KERNEL);
+	if (!tplane)
+		return ERR_PTR(-ENOMEM);
+
+	tplane->hw_plane_id = hw_plane_id;
+
+	possible_crtcs = crtc_mask;
+	type = plane_type;
+
+	ret = drm_universal_plane_init(&tidss->ddev, &tplane->plane,
+				       possible_crtcs,
+				       &tidss_plane_funcs,
+				       formats, num_formats,
+				       NULL, type, NULL);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
+
+	drm_plane_create_zpos_property(&tplane->plane, hw_plane_id, 0,
+				       num_planes - 1);
+
+	ret = drm_plane_create_color_properties(&tplane->plane,
+						color_encodings,
+						color_ranges,
+						default_encoding,
+						default_range);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_plane_create_alpha_property(&tplane->plane);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_plane_create_blend_mode_property(&tplane->plane, blend_modes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return tplane;
+}
diff --git a/drivers/gpu/drm/tidss/tidss_plane.h b/drivers/gpu/drm/tidss/tidss_plane.h
new file mode 100644
index 000000000000..80ff1c5a2535
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_plane.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#ifndef __TIDSS_PLANE_H__
+#define __TIDSS_PLANE_H__
+
+#define to_tidss_plane(p) container_of((p), struct tidss_plane, plane)
+
+struct tidss_device;
+
+struct tidss_plane {
+	struct drm_plane plane;
+
+	u32 hw_plane_id;
+};
+
+struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
+				       u32 hw_plane_id, u32 plane_type,
+				       u32 crtc_mask, const u32 *formats,
+				       u32 num_formats);
+
+#endif
diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.c b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
new file mode 100644
index 000000000000..5ec68389cc68
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+
+#include "tidss_scale_coefs.h"
+
+/*
+ * These are interpolated with a custom python script from DSS5
+ * (drivers/gpu/drm/omapdrm/dss/dispc_coef.c) coefficients.
+ */
+static const struct tidss_scale_coefs coef5_m32 = {
+	.c2 = { 28, 34, 40, 46, 52, 58, 64, 70, 0, 2, 4, 8, 12, 16, 20, 24, },
+	.c1 = { 132, 138, 144, 150, 156, 162, 168, 174, 76, 84, 92, 98, 104, 110, 116, 124, },
+	.c0 = { 192, 192, 192, 190, 188, 186, 184, 182, 180, },
+};
+
+static const struct tidss_scale_coefs coef5_m26 = {
+	.c2 = { 24, 28, 32, 38, 44, 50, 56, 64, 0, 2, 4, 6, 8, 12, 16, 20, },
+	.c1 = { 132, 138, 144, 152, 160, 166, 172, 178, 72, 80, 88, 94, 100, 108, 116, 124, },
+	.c0 = { 200, 202, 204, 202, 200, 196, 192, 188, 184, },
+};
+
+static const struct tidss_scale_coefs coef5_m22 = {
+	.c2 = { 16, 20, 24, 30, 36, 42, 48, 56, 0, 0, 0, 2, 4, 8, 12, 14, },
+	.c1 = { 132, 140, 148, 156, 164, 172, 180, 186, 64, 72, 80, 88, 96, 104, 112, 122, },
+	.c0 = { 216, 216, 216, 214, 212, 208, 204, 198, 192, },
+};
+
+static const struct tidss_scale_coefs coef5_m19 = {
+	.c2 = { 12, 14, 16, 22, 28, 34, 40, 48, 0, 0, 0, 2, 4, 4, 4, 8, },
+	.c1 = { 128, 140, 152, 160, 168, 176, 184, 192, 56, 64, 72, 82, 92, 100, 108, 118, },
+	.c0 = { 232, 232, 232, 226, 220, 218, 216, 208, 200, },
+};
+
+static const struct tidss_scale_coefs coef5_m16 = {
+	.c2 = { 0, 2, 4, 8, 12, 18, 24, 32, 0, 0, 0, -2, -4, -4, -4, -2, },
+	.c1 = { 124, 138, 152, 164, 176, 186, 196, 206, 40, 48, 56, 68, 80, 90, 100, 112, },
+	.c0 = { 264, 262, 260, 254, 248, 242, 236, 226, 216, },
+};
+
+static const struct tidss_scale_coefs coef5_m14 = {
+	.c2 = { -8, -6, -4, -2, 0, 6, 12, 18, 0, -2, -4, -6, -8, -8, -8, -8, },
+	.c1 = { 120, 134, 148, 164, 180, 194, 208, 220, 24, 32, 40, 52, 64, 78, 92, 106, },
+	.c0 = { 288, 286, 284, 280, 276, 266, 256, 244, 232, },
+};
+
+static const struct tidss_scale_coefs coef5_m13 = {
+	.c2 = { -12, -12, -12, -10, -8, -4, 0, 6, 0, -2, -4, -6, -8, -10, -12, -12, },
+	.c1 = { 112, 130, 148, 164, 180, 196, 212, 228, 12, 22, 32, 44, 56, 70, 84, 98, },
+	.c0 = { 312, 308, 304, 298, 292, 282, 272, 258, 244, },
+};
+
+static const struct tidss_scale_coefs coef5_m12 = {
+	.c2 = { -16, -18, -20, -18, -16, -14, -12, -6, 0, -2, -4, -6, -8, -10, -12, -14, },
+	.c1 = { 104, 124, 144, 164, 184, 202, 220, 238, 0, 10, 20, 30, 40, 56, 72, 88, },
+	.c0 = { 336, 332, 328, 320, 312, 300, 288, 272, 256, },
+};
+
+static const struct tidss_scale_coefs coef5_m11 = {
+	.c2 = { -20, -22, -24, -24, -24, -24, -24, -20, 0, -2, -4, -6, -8, -10, -12, -16, },
+	.c1 = { 92, 114, 136, 158, 180, 204, 228, 250, -16, -8, 0, 12, 24, 38, 52, 72, },
+	.c0 = { 368, 364, 360, 350, 340, 326, 312, 292, 272, },
+};
+
+static const struct tidss_scale_coefs coef5_m10 = {
+	.c2 = { -16, -20, -24, -28, -32, -34, -36, -34, 0, 0, 0, -2, -4, -8, -12, -14, },
+	.c1 = { 72, 96, 120, 148, 176, 204, 232, 260, -32, -26, -20, -10, 0, 16, 32, 52, },
+	.c0 = { 400, 398, 396, 384, 372, 354, 336, 312, 288, },
+};
+
+static const struct tidss_scale_coefs coef5_m9 = {
+	.c2 = { -12, -18, -24, -28, -32, -38, -44, -46, 0, 2, 4, 2, 0, -2, -4, -8, },
+	.c1 = { 40, 68, 96, 128, 160, 196, 232, 268, -48, -46, -44, -36, -28, -14, 0, 20, },
+	.c0 = { 456, 450, 444, 428, 412, 388, 364, 334, 304, },
+};
+
+static const struct tidss_scale_coefs coef5_m8 = {
+	.c2 = { 0, -4, -8, -16, -24, -32, -40, -48, 0, 2, 4, 6, 8, 6, 4, 2, },
+	.c1 = { 0, 28, 56, 94, 132, 176, 220, 266, -56, -60, -64, -62, -60, -50, -40, -20, },
+	.c0 = { 512, 506, 500, 478, 456, 424, 392, 352, 312, },
+};
+
+static const struct tidss_scale_coefs coef3_m32 = {
+	.c1 = { 108, 92, 76, 62, 48, 36, 24, 140, 256, 236, 216, 198, 180, 162, 144, 126, },
+	.c0 = { 296, 294, 292, 288, 284, 278, 272, 136, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m26 = {
+	.c1 = { 104, 90, 76, 60, 44, 32, 20, 138, 256, 236, 216, 198, 180, 160, 140, 122, },
+	.c0 = { 304, 300, 296, 292, 288, 282, 276, 138, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m22 = {
+	.c1 = { 100, 84, 68, 54, 40, 30, 20, 138, 256, 236, 216, 196, 176, 156, 136, 118, },
+	.c0 = { 312, 310, 308, 302, 296, 286, 276, 138, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m19 = {
+	.c1 = { 96, 80, 64, 50, 36, 26, 16, 136, 256, 236, 216, 194, 172, 152, 132, 114, },
+	.c0 = { 320, 318, 316, 310, 304, 292, 280, 140, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m16 = {
+	.c1 = { 88, 72, 56, 44, 32, 22, 12, 134, 256, 234, 212, 190, 168, 148, 128, 108, },
+	.c0 = { 336, 332, 328, 320, 312, 300, 288, 144, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m14 = {
+	.c1 = { 80, 64, 48, 36, 24, 16, 8, 132, 256, 232, 208, 186, 164, 142, 120, 100, },
+	.c0 = { 352, 348, 344, 334, 324, 310, 296, 148, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m13 = {
+	.c1 = { 72, 56, 40, 30, 20, 12, 4, 130, 256, 232, 208, 184, 160, 136, 112, 92, },
+	.c0 = { 368, 364, 360, 346, 332, 316, 300, 150, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m12 = {
+	.c1 = { 64, 50, 36, 26, 16, 10, 4, 130, 256, 230, 204, 178, 152, 128, 104, 84, },
+	.c0 = { 384, 378, 372, 358, 344, 324, 304, 152, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m11 = {
+	.c1 = { 56, 40, 24, 16, 8, 4, 0, 128, 256, 228, 200, 172, 144, 120, 96, 76, },
+	.c0 = { 400, 396, 392, 376, 360, 336, 312, 156, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m10 = {
+	.c1 = { 40, 26, 12, 6, 0, -2, -4, 126, 256, 226, 196, 166, 136, 110, 84, 62, },
+	.c0 = { 432, 424, 416, 396, 376, 348, 320, 160, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m9 = {
+	.c1 = { 24, 12, 0, -4, -8, -8, -8, 124, 256, 222, 188, 154, 120, 92, 64, 44, },
+	.c0 = { 464, 456, 448, 424, 400, 366, 332, 166, 256, },
+};
+
+static const struct tidss_scale_coefs coef3_m8 = {
+	.c1 = { 0, -8, -16, -16, -16, -12, -8, 124, 256, 214, 172, 134, 96, 66, 36, 18, },
+	.c0 = { 512, 502, 492, 462, 432, 390, 348, 174, 256, },
+};
+
+const struct tidss_scale_coefs *tidss_get_scale_coefs(struct device *dev,
+						      u32 firinc,
+						      bool five_taps)
+{
+	int i;
+	int inc;
+	static const struct {
+		int mmin;
+		int mmax;
+		const struct tidss_scale_coefs *coef3;
+		const struct tidss_scale_coefs *coef5;
+		const char *name;
+	} coefs[] = {
+		{ 27, 32, &coef3_m32, &coef5_m32, "M32" },
+		{ 23, 26, &coef3_m26, &coef5_m26, "M26" },
+		{ 20, 22, &coef3_m22, &coef5_m22, "M22" },
+		{ 17, 19, &coef3_m19, &coef5_m19, "M19" },
+		{ 15, 16, &coef3_m16, &coef5_m16, "M16" },
+		{ 14, 14, &coef3_m14, &coef5_m14, "M14" },
+		{ 13, 13, &coef3_m13, &coef5_m13, "M13" },
+		{ 12, 12, &coef3_m12, &coef5_m12, "M12" },
+		{ 11, 11, &coef3_m11, &coef5_m11, "M11" },
+		{ 10, 10, &coef3_m10, &coef5_m10, "M10" },
+		{  9,  9, &coef3_m9, &coef5_m9, "M9" },
+		{  4,  8, &coef3_m8, &coef5_m8, "M8" },
+		/*
+		 * When upscaling more than two times, blockiness and outlines
+		 * around the image are observed when M8 tables are used. M11,
+		 * M16 and M19 tables are used to prevent this.
+		 */
+		{  3,  3, &coef3_m11, &coef5_m11, "M11" },
+		{  2,  2, &coef3_m16, &coef5_m16, "M16" },
+		{  0,  1, &coef3_m19, &coef5_m19, "M19" },
+	};
+
+	/*
+	 * inc is result of 0x200000 * in_size / out_size. This dividing
+	 * by 0x40000 scales it down to 8 * in_size / out_size. After
+	 * division the actual scaling factor is 8/inc.
+	 */
+	inc = firinc / 0x40000;
+	for (i = 0; i < ARRAY_SIZE(coefs); ++i) {
+		if (inc >= coefs[i].mmin && inc <= coefs[i].mmax) {
+			if (five_taps)
+				return coefs[i].coef5;
+			else
+				return coefs[i].coef3;
+		}
+	}
+
+	dev_err(dev, "%s: Coefficients not found for firinc 0x%08x, inc %d\n",
+		__func__, firinc, inc);
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.h b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
new file mode 100644
index 000000000000..64b5af5b5361
--- /dev/null
+++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#ifndef __TIDSS_DISPC_COEF_H__
+#define __TIDSS_DISPC_COEF_H__
+
+#include <linux/types.h>
+
+struct tidss_scale_coefs {
+	s16 c2[16];
+	s16 c1[16];
+	u16 c0[9];
+};
+
+const struct tidss_scale_coefs *tidss_get_scale_coefs(struct device *dev,
+						      u32 firinc,
+						      bool five_taps);
+
+#endif
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

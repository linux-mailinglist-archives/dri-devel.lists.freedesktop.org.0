Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DF8562387
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3A312AEFA;
	Thu, 30 Jun 2022 19:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EB812AEF7;
 Thu, 30 Jun 2022 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656618691; x=1688154691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z5a64W/7uVTT7Blz0yagzbdPsQZAOyJIDcFtikED3Sw=;
 b=i82wk7PdJwCKIox4HUSVaxDZhhZ0Lgc8X9dYLipEH7e5Z8gu16Z+ESB1
 oRFOVBsQMm6+/BjxXe+7sfVD/M4zXRolEN7A6/i/QtxlFekkHpu0n+MTo
 jzu7yGtOTprt1X3+1RDDWPFWGPqkia8pe260J+6fMbGfihQTMx9nZyVAp
 QR81F7EJtcOMt3M42v9S1noRDK7Nk9dS0x0TRLeu9j7aTRrw0ZhxmyXrg
 0idM5ZJR/Ysz8RwO1fVgYBXQn17+DqVtXePySVpcftff+zW0s9fJsDbvP
 3OqekX8Jk0ncaiuNnLwHzmGq0uFCjABrk4udJeaa5Uk42T6L2f+jYgc9Z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="262853381"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="262853381"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 12:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="595943006"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by fmsmga007.fm.intel.com with SMTP; 30 Jun 2022 12:51:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Jun 2022 22:51:28 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm: Remove linux/i2c.h from drm_crtc.h
Date: Thu, 30 Jun 2022 22:51:14 +0300
Message-Id: <20220630195114.17407-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630195114.17407-1-ville.syrjala@linux.intel.com>
References: <20220630195114.17407-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h has no need for linux/i2c.h, so don't include it.
Avoids useless rebuilds of the entire universe when
touching linux/i2c.h.

Quite a few placs do currently depend on linux/i2c.h without
actually including it directly. All of those need to be
fixed up.

v2: imx and mcde need linux/io.h for readl()/etc.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c            | 1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 1 +
 drivers/gpu/drm/exynos/exynos_dp.c                  | 1 +
 drivers/gpu/drm/i2c/tda998x_drv.c                   | 1 +
 drivers/gpu/drm/mcde/mcde_clk_div.c                 | 1 +
 drivers/gpu/drm/panel/panel-simple.c                | 1 +
 drivers/gpu/drm/sti/sti_hdmi.c                      | 1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c              | 1 +
 include/drm/drm_crtc.h                              | 1 -
 include/drm/drm_encoder_slave.h                     | 2 ++
 13 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 486f405c2e16..ba060277c3fd 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 682ae0c73722..503bd8db8afe 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -7,6 +7,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 585506eae10c..8a60e83482a0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 310b3b194491..fdf12d4c6416 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -6,6 +6,7 @@
 
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3e1be9894ed1..25a60eb4d67c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hdmi.h>
+#include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 27664f663c5a..4e3d3d5f6866 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index b7ec6c374fbd..7c4455541dbb 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -7,6 +7,7 @@
 #include <linux/component.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hdmi.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/platform_data/tda9950.h>
 #include <linux/irq.h>
diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 038821d2ef80..3056ac566473 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/regulator/consumer.h>
 
 #include "mcde_drm.h"
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ee35f3065f4a..04f28372c9b7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -23,6 +23,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index b3fbee7eac11..61a034a01764 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/hdmi.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index d8b71710e8f6..c0df5e892fa7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index a583669eb443..ffc1cde331d3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -25,7 +25,6 @@
 #ifndef __DRM_CRTC_H__
 #define __DRM_CRTC_H__
 
-#include <linux/i2c.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <drm/drm_modeset_lock.h>
diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
index a09864f6d684..7214101fd731 100644
--- a/include/drm/drm_encoder_slave.h
+++ b/include/drm/drm_encoder_slave.h
@@ -27,6 +27,8 @@
 #ifndef __DRM_ENCODER_SLAVE_H__
 #define __DRM_ENCODER_SLAVE_H__
 
+#include <linux/i2c.h>
+
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 
-- 
2.35.1


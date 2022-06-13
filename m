Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58631549E54
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B1E10F7B8;
	Mon, 13 Jun 2022 20:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A4410F7B4;
 Mon, 13 Jun 2022 20:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150627; x=1686686627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hjTiprY00PTrxqmuVNA+TRQHfk8S11lDggV1OhotFqQ=;
 b=dFflUMitAfwkApwoKHp5JTnvmXAfsn1RTgL5eCcd0WfyUvfh72IhxRb7
 QPLydX8hc25wHZbC+zg73Bi2PlhZBc36RbiSnLldbODNSCrzTBDMSRvrw
 Mu5hb2o0+eIbLKYaLAZm1+kyDt47SBHefpaEkO86eTuDeBE7dh3Z5XSIN
 rlmOKa48GI0Q8ILvKOugO0dLgfpifI9TFpUxBmAFKAMKe0wofFR1U+BzM
 IyAoqFxuuZS+lEj0gP40N06667nLZXcEePwvGq/y74bomhaS2C3z3xSq1
 I/MVG3doYj5SBQOtkSuNj2nTNuU+xSYM8Z3kTQqrIXsyM4yUpoEI0gshb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342367685"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="342367685"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="569094481"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga002.jf.intel.com with SMTP; 13 Jun 2022 13:03:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm: Remove linux/i2c.h from drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:17 +0300
Message-Id: <20220613200317.11305-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h has no need for linux/i2c.h, so don't include it.
Avoids useless rebuilds of the entire universe when
touching linux/i2c.h.

Quite a few placs do currently depend on linux/i2c.h without
actually including it directly. All of those need to be
fixed up.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c   | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 1 +
 drivers/gpu/drm/exynos/exynos_dp.c         | 1 +
 drivers/gpu/drm/i2c/tda998x_drv.c          | 1 +
 drivers/gpu/drm/panel/panel-simple.c       | 1 +
 drivers/gpu/drm/sti/sti_hdmi.c             | 1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c     | 1 +
 include/drm/drm_crtc.h                     | 1 -
 include/drm/drm_encoder_slave.h            | 2 ++
 11 files changed, 11 insertions(+), 1 deletion(-)

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
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 27a8894ef5c9..7e09b11e4acf 100644
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4DB4C5B3C
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 13:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D5910E8EB;
	Sun, 27 Feb 2022 12:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92710E542
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 1BCA88005C;
 Sun, 27 Feb 2022 13:47:40 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/5] drm/modes: Add of_get_drm_panel_display_mode()
Date: Sun, 27 Feb 2022 13:47:11 +0100
Message-Id: <20220227124713.39766-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220227124713.39766-1-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Adef4UfG c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8
 a=OiiWZbHGcwXQR5KGP08A:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to get a drm_display_mode from a panel-timing
device tree subnode.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_modes.c | 49 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_modes.h     |  8 ++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 77a4c8dd0bb8..3f819c7a021b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -35,6 +35,7 @@
 #include <linux/list_sort.h>
 #include <linux/export.h>
 
+#include <video/of_display_timing.h>
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
@@ -727,6 +728,54 @@ int of_get_drm_display_mode(struct device_node *np,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_get_drm_display_mode);
+
+/**
+ * of_get_drm_panel_display_mode - get a panel-timing drm_display_mode from devicetree
+ * @np: device_node with the panel-timing specification
+ * @dmode: will be set to the return value
+ * @bus_flags: information about pixelclk, sync and DE polarity
+ *
+ * The Device Tree properties width-mm and height-mm will be read and set on
+ * the display mode if they are present.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int of_get_drm_panel_display_mode(struct device_node *np,
+				  struct drm_display_mode *dmode, u32 *bus_flags)
+{
+	u32 width_mm = 0, height_mm = 0;
+	struct display_timing timing;
+	struct videomode vm;
+	int ret;
+
+	ret = of_get_display_timing(np, "panel-timing", &timing);
+	if (ret)
+		return ret;
+
+	videomode_from_timing(&timing, &vm);
+
+	memset(dmode, 0, sizeof(*dmode));
+	drm_display_mode_from_videomode(&vm, dmode);
+	if (bus_flags)
+		drm_bus_flags_from_videomode(&vm, bus_flags);
+
+	ret = of_property_read_u32(np, "width-mm", &width_mm);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = of_property_read_u32(np, "height-mm", &height_mm);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	dmode->width_mm = width_mm;
+	dmode->height_mm = height_mm;
+
+	drm_mode_debug_printmodeline(dmode);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_get_drm_panel_display_mode);
 #endif /* CONFIG_OF */
 #endif /* CONFIG_VIDEOMODE_HELPERS */
 
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 29ba4adf0c53..2fa6b2c33b3f 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -466,6 +466,8 @@ void drm_bus_flags_from_videomode(const struct videomode *vm, u32 *bus_flags);
 int of_get_drm_display_mode(struct device_node *np,
 			    struct drm_display_mode *dmode, u32 *bus_flags,
 			    int index);
+int of_get_drm_panel_display_mode(struct device_node *np,
+				  struct drm_display_mode *dmode, u32 *bus_flags);
 #else
 static inline int of_get_drm_display_mode(struct device_node *np,
 					  struct drm_display_mode *dmode,
@@ -473,6 +475,12 @@ static inline int of_get_drm_display_mode(struct device_node *np,
 {
 	return -EINVAL;
 }
+
+static inline int of_get_drm_panel_display_mode(struct device_node *np,
+						struct drm_display_mode *dmode, u32 *bus_flags)
+{
+	return -EINVAL;
+}
 #endif
 
 void drm_mode_set_name(struct drm_display_mode *mode);
-- 
2.33.0


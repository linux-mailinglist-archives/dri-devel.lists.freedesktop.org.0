Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBC2E2B06
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FC489C69;
	Fri, 25 Dec 2020 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208B8980C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:19:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D1g0Y3ZYhz1qqks;
 Thu, 24 Dec 2020 07:19:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D1g0Y2Qw6z1tYVt;
 Thu, 24 Dec 2020 07:19:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3hBYjND5iaps; Thu, 24 Dec 2020 07:19:55 +0100 (CET)
X-Auth-Info: 3YDqOjtSvF9jAv8p5c+B3993x37JRkuXYbPYpagnaSY=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Dec 2020 07:19:55 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2] drm/stm: Fix bus_flags handling
Date: Thu, 24 Dec 2020 07:19:53 +0100
Message-Id: <20201224061953.92229-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no
matter what polarity the next bridge or display might require, these flags
are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set,
and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and
DISPLAY_FLAGS_DE_HIGH were always set.

The fix for this problem is taken almost verbatim from MXSFB driver. In
case there is a bridge attached to the LTDC, the bridge might have extra
polarity requirements, so extract bus_flags from the bridge and use them
for LTDC configuration. Otherwise, extract bus_flags from the connector,
which is the display.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
V2: Check if ldev->bridge->timings is non-NULL before accessing it
---
 drivers/gpu/drm/stm/ltdc.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/stm/ltdc.h |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 1c9f18b4adfc..22c7e9fa5ab7 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -546,11 +546,17 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_device *ddev = crtc->dev;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct videomode vm;
+	u32 bus_flags = 0;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
 	u32 val;
 	int ret;
 
+	if (ldev->bridge && ldev->bridge->timings)
+		bus_flags = ldev->bridge->timings->input_bus_flags;
+	else if (ldev->connector)
+		bus_flags = ldev->connector->display_info.bus_flags;
+
 	if (!pm_runtime_active(ddev->dev)) {
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
@@ -586,10 +592,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
 		val |= GCR_DEPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
 	reg_update_bits(ldev->regs, LTDC_GCR,
@@ -1098,6 +1104,8 @@ static const struct drm_encoder_helper_funcs ltdc_encoder_helper_funcs = {
 
 static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 {
+	struct ltdc_device *ldev = ddev->dev_private;
+	struct drm_connector_list_iter iter;
 	struct drm_encoder *encoder;
 	int ret;
 
@@ -1119,6 +1127,16 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 		return -EINVAL;
 	}
 
+	ldev->bridge = bridge;
+
+	/*
+	 * Get hold of the connector. This is a bit of a hack, until the bridge
+	 * API gives us bus flags and formats.
+	 */
+	drm_connector_list_iter_begin(ddev, &iter);
+	ldev->connector = drm_connector_list_iter_next(&iter);
+	drm_connector_list_iter_end(&iter);
+
 	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
 
 	return 0;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index f153b908c70e..d0d2c81de29a 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -38,6 +38,8 @@ struct ltdc_device {
 	u32 irq_status;
 	struct fps_info plane_fpsi[LTDC_MAX_LAYER];
 	struct drm_atomic_state *suspend_state;
+	struct drm_bridge *bridge;
+	struct drm_connector *connector;
 };
 
 int ltdc_load(struct drm_device *ddev);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

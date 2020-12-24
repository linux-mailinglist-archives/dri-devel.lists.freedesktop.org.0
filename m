Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65952E2AE1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243989C46;
	Fri, 25 Dec 2020 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D398980C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:20:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D1g1L0l2wz1qqks;
 Thu, 24 Dec 2020 07:20:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D1g1K6j0Xz1tYVt;
 Thu, 24 Dec 2020 07:20:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KxoH787ltFJm; Thu, 24 Dec 2020 07:20:36 +0100 (CET)
X-Auth-Info: ORK9oLktcXHLC9hqsQ9QSD3MF1oInVUvtHDcxcxZuJ4=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 24 Dec 2020 07:20:36 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/stm: Remove usage of drm_display_mode_to_videomode()
Date: Thu, 24 Dec 2020 07:20:30 +0100
Message-Id: <20201224062030.92287-1-marex@denx.de>
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

There is not much value in the extra conversion step, the calculations
required for the LTDC IP are different than what is used in the
drm_display_mode_to_videomode(), so just do the right ones in the LTDC
driver right away.

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
 drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 22c7e9fa5ab7..e8fc8fc50d94 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -545,7 +545,6 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	struct drm_device *ddev = crtc->dev;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	struct videomode vm;
 	u32 bus_flags = 0;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
@@ -565,31 +564,33 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		}
 	}
 
-	drm_display_mode_to_videomode(mode, &vm);
-
 	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
-	DRM_DEBUG_DRIVER("Video mode: %dx%d", vm.hactive, vm.vactive);
+	DRM_DEBUG_DRIVER("Video mode: %dx%d", mode->hdisplay, mode->vdisplay);
 	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
-			 vm.hfront_porch, vm.hback_porch, vm.hsync_len,
-			 vm.vfront_porch, vm.vback_porch, vm.vsync_len);
+			 mode->hsync_start - mode->hdisplay,
+			 mode->htotal - mode->hsync_end,
+			 mode->hsync_end - mode->hsync_start,
+			 mode->vsync_start - mode->vdisplay,
+			 mode->vtotal - mode->vsync_end,
+			 mode->vsync_end - mode->vsync_start);
 
 	/* Convert video timings to ltdc timings */
-	hsync = vm.hsync_len - 1;
-	vsync = vm.vsync_len - 1;
-	accum_hbp = hsync + vm.hback_porch;
-	accum_vbp = vsync + vm.vback_porch;
-	accum_act_w = accum_hbp + vm.hactive;
-	accum_act_h = accum_vbp + vm.vactive;
-	total_width = accum_act_w + vm.hfront_porch;
-	total_height = accum_act_h + vm.vfront_porch;
+	hsync = mode->hsync_end - mode->hsync_start - 1;
+	vsync = mode->vsync_end - mode->vsync_start - 1;
+	accum_hbp = mode->htotal - mode->hsync_start - 1;
+	accum_vbp = mode->vtotal - mode->vsync_start - 1;
+	accum_act_w = accum_hbp + mode->hdisplay;
+	accum_act_h = accum_vbp + mode->vdisplay;
+	total_width = mode->htotal - 1;
+	total_height = mode->vtotal - 1;
 
 	/* Configures the HS, VS, DE and PC polarities. Default Active Low */
 	val = 0;
 
-	if (vm.flags & DISPLAY_FLAGS_HSYNC_HIGH)
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		val |= GCR_HSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		val |= GCR_VSPOL;
 
 	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

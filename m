Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B063537C50F
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5186EC42;
	Wed, 12 May 2021 15:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71616EC42
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:37:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB08261D31;
 Wed, 12 May 2021 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620833835;
 bh=SqHKVOcB2t8M2LUNQeBYvZre3GVWIg2YxGHxGq3Qvck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MIddzbOHa0qRGjIDfQ6R5Xbhkg81Ppye5JOuiqu+oDNyvi8E1dhMr54Lc0iPGDI5b
 Lf87dMLSrj+GKRRPY5XExSOgHtyLd3sWVbKs7ND3V72AHRiSrtiTwYGb9YePNJlpfJ
 FjDNg7PhubLUA+V4Tah/09N874kFG5tQ3S3fnBjA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5.11 308/601] drm/stm: Fix bus_flags handling
Date: Wed, 12 May 2021 16:46:25 +0200
Message-Id: <20210512144837.958339508@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512144827.811958675@linuxfoundation.org>
References: <20210512144827.811958675@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@st.com>, stable@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

[ Upstream commit 99e360442f223dd40fc23ae07c7a263836fd27e6 ]

The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no
matter what polarity the next bridge or display might require, these flags
are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set
and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and
DISPLAY_FLAGS_DE_HIGH were always set.

The fix for this problem is taken almost verbatim from MXSFB driver. In
case there is a bridge attached to the LTDC, the bridge might have extra
polarity requirements, so extract bus_flags from the bridge and use them
for LTDC configuration. Otherwise, extract bus_flags from the connector,
which is the display.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
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
Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210127110756.125570-1-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 3980677435cb..949511a0a24f 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -525,13 +525,42 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	struct drm_device *ddev = crtc->dev;
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector = NULL;
+	struct drm_encoder *encoder = NULL;
+	struct drm_bridge *bridge = NULL;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct videomode vm;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
+	u32 bus_flags = 0;
 	u32 val;
 	int ret;
 
+	/* get encoder from crtc */
+	drm_for_each_encoder(encoder, ddev)
+		if (encoder->crtc == crtc)
+			break;
+
+	if (encoder) {
+		/* get bridge from encoder */
+		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
+			if (bridge->encoder == encoder)
+				break;
+
+		/* Get the connector from encoder */
+		drm_connector_list_iter_begin(ddev, &iter);
+		drm_for_each_connector_iter(connector, &iter)
+			if (connector->encoder == encoder)
+				break;
+		drm_connector_list_iter_end(&iter);
+	}
+
+	if (bridge && bridge->timings)
+		bus_flags = bridge->timings->input_bus_flags;
+	else if (connector)
+		bus_flags = connector->display_info.bus_flags;
+
 	if (!pm_runtime_active(ddev->dev)) {
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
@@ -567,10 +596,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
 		val |= GCR_DEPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
 	reg_update_bits(ldev->regs, LTDC_GCR,
-- 
2.30.2




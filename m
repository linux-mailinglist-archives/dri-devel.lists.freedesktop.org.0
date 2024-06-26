Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A426391848A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A5E10E309;
	Wed, 26 Jun 2024 14:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E499110E309
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:40:41 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sMTp9-0007iB-KM; Wed, 26 Jun 2024 16:40:39 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 26 Jun 2024 16:40:39 +0200
Subject: [PATCH 2/2] drm/panel: ilitek-ili9881c: Report subpixel order
 according to rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240626-drm-panel-ili9881c-rotation-v1-2-e0ff54173e32@pengutronix.de>
References: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
In-Reply-To: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Assume a default RGB subpixel order and flip it around if 180° rotation
is configured via address mode. Report subpixel order to userspace.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index b4565ff1a0de..28cd7560e5db 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1471,6 +1471,10 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
+	if (ctx->address_mode == 0x3)
+		connector->display_info.subpixel_order = SubPixelHorizontalBGR;
+	else
+		connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 
 	/*
 	 * TODO: Remove once all drm drivers call

-- 
2.39.2


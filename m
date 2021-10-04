Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1DB4206A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 09:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4576E926;
	Mon,  4 Oct 2021 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF396E926
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 07:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 50CCBFB02;
 Mon,  4 Oct 2021 09:28:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYVkJr4AioKx; Mon,  4 Oct 2021 09:28:14 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] drm: mxsfb: Set proper default bus format when using a
 bridge
Date: Mon,  4 Oct 2021 09:27:38 +0200
Message-Id: <15afbcb04dea432867bb9f8b0e47205decd4bd6e.1633332399.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1633332399.git.agx@sigxcpu.org>
References: <cover.1633332399.git.agx@sigxcpu.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a bridge doesn't do any bus format handling MEDIA_BUS_FMT_FIXED is
returned. Fallback to a reasonable default (MEDIA_BUS_FMT_RGB888_1X24) in
that case.

This unbreaks e.g. using mxsfb with the nwl bridge and mipi panels.

Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")

Reported-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d6abd2077114..e3fbb8b58d5d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -369,6 +369,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 			drm_atomic_get_new_bridge_state(state,
 							mxsfb->bridge);
 		bus_format = bridge_state->input_bus_cfg.format;
+		if (bus_format == MEDIA_BUS_FMT_FIXED) {
+			dev_warn_once(drm->dev,
+				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		}
 	}
 
 	/* If there is no bridge, use bus format from connector */
-- 
2.33.0


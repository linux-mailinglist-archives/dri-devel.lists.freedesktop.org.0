Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216359FAC8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2310EAA8;
	Wed, 24 Aug 2022 13:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808910E66F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:00:54 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1D55592;
 Wed, 24 Aug 2022 15:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661346052;
 bh=qd2zwmFtWKzt3wNOwGSiPpn0zrJLLpoC1FlvscOYJWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i1PHfpn0swXSUjWiVrVJll9g2IZkf4T/vZKpiJOTrfnqzx+/uAy1YxXMxIUI7mUPI
 JcC06UvAY553nXc+EwM0WY5Da9pZl2BRvlG93YYFJFEoFYXvow+Lll5pKKVXzYyyOR
 8vj9Ke9GFzFDeBshUwGTIHw1R/LsmUlrGvx2fBpk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too large
 blanking
Date: Wed, 24 Aug 2022 16:00:32 +0300
Message-Id: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The blanking related registers are 8 bits, so reject any modes
with larger blanking periods.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ba84215c1511..f085a037ff5b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 594000)
 		return MODE_CLOCK_HIGH;
 
+	/*
+	 * The blanking related registers are 8 bits, so reject any modes
+	 * with larger blanking periods.
+	 */
+
+	if ((mode->hsync_start - mode->hdisplay) > 0xff)
+		return MODE_HBLANK_WIDE;
+
+	if ((mode->vsync_start - mode->vdisplay) > 0xff)
+		return MODE_VBLANK_WIDE;
+
+	if ((mode->hsync_end - mode->hsync_start) > 0xff)
+		return MODE_HSYNC_WIDE;
+
+	if ((mode->vsync_end - mode->vsync_start) > 0xff)
+		return MODE_VSYNC_WIDE;
+
+	if ((mode->htotal - mode->hsync_end) > 0xff)
+		return MODE_HBLANK_WIDE;
+
+	if ((mode->vtotal - mode->vsync_end) > 0xff)
+		return MODE_VBLANK_WIDE;
+
 	return MODE_OK;
 }
 
-- 
2.34.1


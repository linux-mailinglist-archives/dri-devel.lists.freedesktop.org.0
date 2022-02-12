Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B538F4B3606
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 16:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BE10E648;
	Sat, 12 Feb 2022 15:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [85.215.255.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FAE10E4CC
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644681058;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=76+TPRGf0MB6hHRwPaUxmX8Eixo5outKfV374UIYYws=;
 b=LvEEe3IC5nz76IfJV1W88t/7Ocuh9kCtYx3c14vnXvIqBDw1b3N9u9eac8nJO5T2eK
 WVeiSE0Rs4qBACVGAxqtZQdLgPTKVXI/yrZ++qB/GOwevgN9wHOPQJrI+PjnN30oN+RI
 jV67BzU0HYNLY6pyYToaIcSPMMXTbpfQVX8XaaCnznPRDNi4wEbiKaTEAnPge8DBeoE8
 bqXm0NSvTavqMRwy05iEVsJs+HKIVk9EoSjfDEOcv6H3H//oW7vcRLr4yxqtxxiJb75H
 FuwOurb6X3lXTpJez67EGCcQoeBZvxPmKEudc4Fn0w3TA03iAOKv5bNjf66/FYW3u9M0
 AMIA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVblcdY="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1CFovswr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 12 Feb 2022 16:50:57 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>, Harry Wentland <harry.wentland@amd.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v15 4/7] drm/bridge: dw-hdmi: repair interworking with
 hdmi-connector for jz4780
Date: Sat, 12 Feb 2022 16:50:52 +0100
Message-Id: <d4d08582c49ec089095dd0ede4cdf2752f9d1eb8.1644681054.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1644681054.git.hns@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")

introduced a new mechanism to negotiate bus formats between hdmi connector
and the synopsys hdmi driver inside the jz4780.

By this, the dw-hdmi is no longer the only bridge and sets up a list
of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().

This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780 but only
produces a black screen.

This fix is based on the observation that max_bpc = 0 when running this
function while info->bpc = 8. Since the formats checks before this always test
for max_bpc >= info->pbc indirectly my assumption is that we must check it
here as well.

Adding the proposed patch makes the CI20/jz4780 panel work again in
MEDIA_BUS_FMT_RGB888_1X24 mode.

Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b0d8110dd412c..826a055a7a273 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2620,10 +2620,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
-- 
2.33.0


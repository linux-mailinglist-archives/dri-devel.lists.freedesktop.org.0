Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79514D3192
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 16:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8719410E596;
	Wed,  9 Mar 2022 15:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E81A10E51A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 15:16:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,167,1643641200"; d="scan'208";a="113853373"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2022 00:11:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id B7B1B400D0E2;
 Thu, 10 Mar 2022 00:11:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/bridge: adv7533: Add option to disable lane switching
Date: Wed,  9 Mar 2022 15:11:09 +0000
Message-Id: <20220309151109.20957-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Sia Jee Heng <jee.heng.sia@intel.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
lower frequencies causes display instability. On such platforms, it
is better to avoid switching lanes from 4 to 3 as it needs different
set of PLL parameter constraints to make the display stable with 3
lanes.

This patch adds an option to disable lane switching if
'adi,disable-lanes-override' property is present in DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 592ecfcf00ca..7505601f10fb 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -368,6 +368,7 @@ struct adv7511 {
 	struct mipi_dsi_device *dsi;
 	u8 num_dsi_lanes;
 	bool use_timing_gen;
+	bool override_lanes;
 
 	enum adv7511_type type;
 	struct platform_device *audio_pdev;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index eb7579dec40a..7f6a8e95d70e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -108,7 +108,7 @@ void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
 	if (adv->num_dsi_lanes != 4)
 		return;
 
-	if (mode->clock > 80000)
+	if (!adv->override_lanes || mode->clock > 80000)
 		lanes = 4;
 	else
 		lanes = 3;
@@ -195,6 +195,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
+	adv->override_lanes = !of_property_read_bool(np,
+						"adi,disable-lanes-override");
+
 	/* TODO: Check if these need to be parsed by DT or not */
 	adv->rgb = true;
 	adv->embedded_sync = false;
-- 
2.17.1


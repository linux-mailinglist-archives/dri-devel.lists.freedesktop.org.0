Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887C7846F0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7DD10E3A4;
	Tue, 22 Aug 2023 16:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690E10E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:05 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED89A396B;
 Tue, 22 Aug 2023 18:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721126;
 bh=i2HNd7b6c0+SS31D7H33sfozItm4ogRGGiR+cHco6Pg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VbguhQGhGkUMoaJ+sEYUqA+oppNqRChCPSMblBcPV2MrMr1SeErdLtueixF+CKmcK
 ZzZZQFYc/ASVhIAU6hKVP4Z3AQOWd2cIw5wiLRZJWP6Kf4K72YCgFNOm4a+c9uS/t+
 8G+ff5AnxpC0oqYeHXQ6JZXcd3qH9QQ85UNd3kJE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:36 +0300
Subject: [PATCH v3 03/12] drm/bridge: tc358768: Default to positive h/v syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-3-c82405dac0c1@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
In-Reply-To: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=i2HNd7b6c0+SS31D7H33sfozItm4ogRGGiR+cHco6Pg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OArZOTa0MBh6DjLpQLuLnOI1/+Vn3Ue5STCL
 09Qm45WL/OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgKwAKCRD6PaqMvJYe
 9cgeD/9LznZrNM/mPS/mWfeakHjq0U8b74PtV13c2KaVaph/y22CM55QSHh4AjIfSupvk4xzbq5
 fTSVn/6zjB+en39eP/JmNPV9AafqEeyXOBBfoMoAwPSX+1/M/EQMIVDR/Q5c544fdKqhQL5QTqa
 QQGyp6wRJzWJ+pX6Gg6+OQgkIO0QYv4DQAZEq/OfHXysRPZl16aCTQjeDzsh8Q97Jb+k3Sp5tFH
 xAj80sgJ/Iyz6am6JYl+fwTrGTx5S4O0vsmTw82CNO/WIpUD3Y8r7dH4Ut8WB8Y3/GXsPY3//E4
 bzNtCFzBaRrQL1U+nGXcdycLlmPJ+DKSAQtNgIO5mxLHWY0PpvdRYNP5HfLnCKb0wQSwo2T86iw
 5BF047ZNmR0Ppu0IAOXrB551/StUy7/0uivZpecuNkp8w23DuOxcaqyaDiBZ+v/1Jx8jMYnPYL9
 GZgVnv2FWMBzOP7ng7/6IOBJ17acSfrm7DNw+daEPKJpErPeyf1QdwOVQka97HY84dPlnhmu8uS
 Oc1tE+mY8buN5xX7p9R7CpvYdgwsG+INaQwUlsgL3qtFvXujsuXX3nxnN2cjEpWIjbKIaeMwlPJ
 QhsaPxF89YSo5qqGHvQBCGCuqYTI2CHIrQNHkECj7B1bjvC4l5Fvtfjpm2FcHZsMhnmkMIU+Gby
 7tEFyQd+3P286WA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the TC358768 is a DPI to DSI bridge, the DSI side does not need to
define h/v sync polarities. This means that sometimes we have a mode
without defined sync polarities, which does not work on the DPI side.

Add a mode_fixup hook to default to positive sync polarities.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index bc97a837955b..963ac550509b 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -963,9 +963,27 @@ tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static bool tc358768_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	/* Default to positive sync */
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PHSYNC;
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	return true;
+}
+
 static const struct drm_bridge_funcs tc358768_bridge_funcs = {
 	.attach = tc358768_bridge_attach,
 	.mode_valid = tc358768_bridge_mode_valid,
+	.mode_fixup = tc358768_mode_fixup,
 	.pre_enable = tc358768_bridge_pre_enable,
 	.enable = tc358768_bridge_enable,
 	.disable = tc358768_bridge_disable,

-- 
2.34.1


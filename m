Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1976FED4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97FB10E6C9;
	Fri,  4 Aug 2023 10:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2368810E6C9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:48:31 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 419C112E4;
 Fri,  4 Aug 2023 12:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146045;
 bh=WPn1AxdTbVK2rBt8KyZ5pLuKTboKnk0kbLICj2/CxXg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eZPgyRl4fhOR+GjfERv8LQ4n8rOr3iNptbLXIhIQn8p9LFWyICnMy95ykPXVxiygY
 HOPTHnB0hKxAmsNHrLl5HkvnmMwUnVsKZ+ZCqLfP1uOC0Bxhr6IXt1FWhqQUWfn2fO
 +Ivmo+m828wLDo5bb1YGVb7xhfTuj73DF+R0g9N4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:48:10 +0300
Subject: [PATCH 1/4] drm/bridge: lt8912b: Fix bridge_detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-lt8912b-v1-1-c542692c6a2f@ideasonboard.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
To: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WPn1AxdTbVK2rBt8KyZ5pLuKTboKnk0kbLICj2/CxXg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNd6CzQGoXs4vpPoOgcUqTbWmS76ZzxcS1XCy
 my0BlS41TaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzXegAKCRD6PaqMvJYe
 9To5D/96c/eG+8WqJSaQP/PFgeAK5pwqit3+cPaRGEwlYyyG66X1ZsQsfn8Dv0hTEyvTFi4bajt
 kylDxWgIMMg83AsbK15AgglIlbs4C6EQPQEDBdnawhQTG6VIr3RQ052k4nJi37NRs6enTbPOFfp
 6lhf9RsXD5BXEjMk0hHUyV7wxbKvHMMcyoGU3/iRjsTmMPGlhfY9eJEBrFX1I96g+jqwYEjgHb0
 4mmlfHL2V5O/Fss0b2K8DbND/7rJmUiICpfpUX/+FlTNjTx/UkUwW7ppA/y69U4kbe9GNSa5Nny
 vQ33WcfItsgYwSgTAeRs5FCCvYWe1TrM3dTPxjV7g31q3fvGF9t0+IG1mTPc98o3wRknlogBQ+D
 T0Az2AGczXGERLuHrfOk7k6PTk+OsJui5ES0ve/mk3nkQz3sbNgatiXAi3PxX/ItbJJN4UVuIFn
 Uk386nTJv2ZVyUqCVw6sbm47dCbTi9o7j55i/YoqoVVLY2RW8ey7w5tCnkoSZr+Fwgr2dZV6H+5
 OV60X0aJeR7ze7zSh5GtfIEqQ9FKMKV4EfpaAM1gHXzOqWHnRfRA4fMgvuR84UZ9pJKPXV6lYbc
 cuOk3nZZh1hiotPRwqBkN1taHArTlGl2wjetqh3du9cxUkcDOZAP2beOI7gAoXkQO/CtEZtGk8a
 o2chkjn15jPTDDQ==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver calls lt8912_bridge_detach() from its lt8912_remove()
function. As the DRM core detaches bridges automatically, this leads to
calling lt8912_bridge_detach() twice. The code probably has tried to
manage the double-call with the 'is_attached' variable, but the driver
never sets the variable to false, so its of no help.

Fix the issue by dropping the call to lt8912_bridge_detach() from
lt8912_remove(), as the DRM core will handle the detach call for us,
and also drop the useless is_attached field.

Fixes: 88abfc2b9e61 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 4eaea67fb71c..0e581f6e3c88 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -45,7 +45,6 @@ struct lt8912 {
 
 	u8 data_lanes;
 	bool is_power_on;
-	bool is_attached;
 };
 
 static int lt8912_write_init_config(struct lt8912 *lt)
@@ -575,8 +574,6 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		goto error;
 
-	lt->is_attached = true;
-
 	return 0;
 
 error:
@@ -588,15 +585,13 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
-	if (lt->is_attached) {
-		lt8912_hard_power_off(lt);
+	lt8912_hard_power_off(lt);
 
-		if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
-			drm_bridge_hpd_disable(lt->hdmi_port);
+	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(lt->hdmi_port);
 
-		drm_connector_unregister(&lt->connector);
-		drm_connector_cleanup(&lt->connector);
-	}
+	drm_connector_unregister(&lt->connector);
+	drm_connector_cleanup(&lt->connector);
 }
 
 static enum drm_connector_status
@@ -750,7 +745,6 @@ static void lt8912_remove(struct i2c_client *client)
 {
 	struct lt8912 *lt = i2c_get_clientdata(client);
 
-	lt8912_bridge_detach(&lt->bridge);
 	drm_bridge_remove(&lt->bridge);
 	lt8912_free_i2c(lt);
 	lt8912_put_dt(lt);

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E97E557D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 12:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EE210E5D1;
	Wed,  8 Nov 2023 11:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828FE10E54B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 11:27:46 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 066549CE;
 Wed,  8 Nov 2023 12:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699442843;
 bh=ESi3QXvdrPJPsDVjF/DwgziokaGysmi+TxRwxWKYcvA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D+Xaz5WZpjygggABWtHRATjCGOIKaQlvpFkhDqm8UQ/lbiLixV1lWqaUrQ3y1aZcD
 Jyo6c/d7WReV95RelMYO5vcT1DbMN5vvZDzKOogCoRlobJdnJW6EmzneU1OErfDD7u
 gbOLAhBnfj8Og4eoQgj1taV9iFR1iNEg7Ya7YePk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 08 Nov 2023 13:27:22 +0200
Subject: [PATCH v2 1/2] drm/bridge: tc358767: Add format negotiation hooks
 for DPI/DSI to (e)DP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-tc358767-v2-1-25c5f70a2159@ideasonboard.com>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
In-Reply-To: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=gkFUqK8asRdZuuVJEG+fN5qn9GJatIx4noljnC3chp4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlS3CuLgqoikq+hWg6V5khUb5Ojwo90U8sA01A1
 iUh/4KfgdmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUtwrgAKCRD6PaqMvJYe
 9aLoD/9meoqcfs9iA+kgzrfNwUKIHwGaT13TI34RTVIXqGuvbpwrmJ8Bviv0blv6QS2XMi9Aa3g
 swB2CrD9C82RLglU2rftNoAeKoirQwGhbv7eH2SWhbyCRy4MWayGwsjJrMs6N2Vq8BU73aqdhnY
 a6z3Adm+5MLE4kPwcsNR2K2g/RuNcWxlGrGrz+Brvzo34UHmBK2GYc4XEODtZUM40ZKzc7NBalR
 RqSWHISfOoWyuSduu5Wn12HSNE+3ppqgDXcrEc7bAgbBqC29oOJfyVwJYJW5d6rKcgWmlFvOeZq
 wgmYvJb7Y46HgIBynQ20WJyF3k3GotL+H4IIgQ8BTy8E0ob8/qk6ffjVDe6GVGdkHC0DECeZLX9
 JX7uIUAuKYn0GCeYi4TnsG6Ikv7/GjhQq0itedvfh8TeyH5ZVpCUQwd/5+R8H1/A6T0xo4ivNHr
 ti7Qmc7JisZEeaFNRPFa8+WmVBGdEONJHKZP+BygbuqtJxjh5GlFRM39WvYJ56wgcE8HTf33w6v
 D6GtRZ2EQ0gipcbYyP4mtb+azT56sap9pV4LNZkNA8aWVBReOhSEA+cxXJc/Q8vm9gwFssLliIe
 WbA/azbMHmpnnnxrb9zSdMcWSXX0My56F6t/kT/+wzHNgQZK+ofW8MFyBLI6OpwDEmsdxvgtzOL
 ZZTiKd6y0n44TCQ==
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

With new connector model, tc358767 will not create the connector, when
DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and display-controller driver will
rely on format negotiation to setup the encoder format.

Add the missing bus format negotiation hooks in the
drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.

Output format, for DPI/DSI to DP, is selected to
MEDIA_BUS_FMT_RGB888_1X24 as default, keeping in mind what the older
model used to support.

Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Closes: https://lore.kernel.org/all/24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com/
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ef2e373606ba..89a0d804270a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1726,6 +1726,7 @@ static void tc_edp_bridge_detach(struct drm_bridge *bridge)
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
+#define MAX_OUTPUT_SEL_FORMATS	1
 
 static u32 *
 tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
@@ -1751,6 +1752,28 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static u32 *
+tc_edp_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state,
+				  unsigned int *num_output_fmts)
+{
+	u32 *output_fmts;
+
+	*num_output_fmts = 0;
+
+	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	output_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_output_fmts = 1;
+
+	return output_fmts;
+}
+
 static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
 	.attach = tc_dpi_bridge_attach,
 	.mode_valid = tc_dpi_mode_valid,
@@ -1777,6 +1800,8 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_output_bus_fmts = tc_edp_atomic_get_output_bus_fmts,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)

-- 
2.34.1


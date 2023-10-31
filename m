Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E887DCDCA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E48E10E4CA;
	Tue, 31 Oct 2023 13:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA110E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:27:15 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13F3B4A9;
 Tue, 31 Oct 2023 14:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698758817;
 bh=+uIN4a7j7jvqB/Afca9rRMkdlKKkK6ohIxcjZmyHfgI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cuo7+oiO2aGu04b0wMxGP24+NwnwT4oOYmLulFS704RgfIg+VVYZyezOkBNYVs7Ok
 K+ULaHhucpyI4hWrAvJxLAET4sSaWZfpQRtlSIWlqxn4BGxS0TYd4brTdnCoGZC1+B
 LNfWwudfUeEJwIDmANU47FqKlP+KUnqlJskGxT2A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 31 Oct 2023 15:26:55 +0200
Subject: [PATCH 1/2] drm/bridge: tc358767: Support input format negotiation
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-tc358767-v1-1-392081ad9f4b@ideasonboard.com>
References: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
In-Reply-To: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jVTPWrjgsKMW/qtR79Ku6kUwvIkxeLjstze2bG/t+Zs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQQCulYmrm50A7iJtLSCIwC/v2Uy7SATRXLOL2
 oXXTD6gFa2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUEArgAKCRD6PaqMvJYe
 9dKJD/488dgCjJfaiAcyg1qblGtN3jxO0ln8nf7xMyTESsJdrmALTblQzobmVQwGFNEiI1famTt
 luQiMCHmnhLAZgtEPtmONXHAZMTb1QWuinKdN21YR8jQOD4LpaDHNlOq7S6TP2qQwYMK4CqW0a4
 68EGkDVRTwR+4ixsIORadKvQ9+7Ho46n9teDOXNZ6RgCShsJZLfvhE7OXf6lO3vRJm8XAteKVHV
 IKKvXMDzHzFCJMFnfjrGbmcT//5O8jzLEU6kKOGvtMS+inhlPrd+GcsFDJh6om5vQB+au9COSAS
 rMK89+lWCSGwF8blJPHzrmVgogTAghzrWFYRTs9Z/Z7ePVIqh6ApPMwkcSjDioCu9G+iT5Y6fpR
 bTcYh7mSvofLdu6UmtlldTADBLCDsfyvrdefoFj6GJJ74XzvlfG284zAMTo7g6HiNVj+0QiW+Zy
 ofLvIAgYEXsgd0bjzQ36IIqunrNG+XUcrGzsWhw9do124K0iRM+YN7qyMdccicJNzxO54k+E06z
 n9e0Lc+Imr8iLfIwWgOtCfV2Dy8Sc57tsX92sr4jTgyXttP1XW9QncR+B7fwgQzSEUpkxLRqF7D
 IhetFhNGhMNv04KD8qIpaG6f6cw1I3omcDoZP+308F60pK/FuFJABk3+y+7RDvP5TWgZwkasWgp
 kQM+9RulM7xpOQg==
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

Add the missing input-format negotiation hook in the
drm_bridge_funcs to complete DRM_BRIDGE_ATTACH_NO_CONNECTOR support.

Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
the case with older model.

Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Closes: https://lore.kernel.org/all/24282420-b4dd-45b3-bb1c-fc37fe4a8205@siemens.com/
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ef2e373606ba..0affcefdeb1c 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1751,6 +1751,30 @@ tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static u32 *
+tc_edp_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				 struct drm_bridge_state *bridge_state,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state,
+				 u32 output_fmt,
+				 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI/DPI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
 	.attach = tc_dpi_bridge_attach,
 	.mode_valid = tc_dpi_mode_valid,
@@ -1777,6 +1801,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = tc_edp_atomic_get_input_bus_fmts,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)

-- 
2.34.1


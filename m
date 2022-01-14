Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCE48E312
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A1910EB77;
	Fri, 14 Jan 2022 03:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626CB10EB6D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:48:59 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B53B8832CD;
 Fri, 14 Jan 2022 04:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132138;
 bh=zT8H1L4LZCpyZR/FbPtx7wXhlXCjgkcZ5KnFVHy7yv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sa9xhxfSNEqjrvKWP83xd3Da8MMgOJJLe4mfe67YFE0xGtew9ujlL3EYo+Gvo4px7
 3L0trc1aqq2Kygy7JkQm0RYdcDAC036/gZKD7zIU4vadlMffOr/QoWuNYxhKTLKp2F
 NPMLSyXOPrWex0MzHmQtmnLY+hK/Ovm4pf4vx0hu/LdMO5p+3oryROHqzY//qQ0TKL
 YdeMjW+NHUDaMbg8tIu0lzRhsfMAcdtFw0ZRq3QXqDovm4zm71PEFmxbAWGcSVBK11
 g6CENgEcePURp4u37rTqNwxZWsocm74yNcv8N6+MuXr+XrgG9QgbtlZnSShSrdAIH1
 D9D7IDJyd68PA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] drm: bridge: icn6211: Implement
 atomic_get_input_bus_fmts
Date: Fri, 14 Jan 2022 04:48:28 +0100
Message-Id: <20220114034838.546267-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement .atomic_get_input_bus_fmts callback, which sets up the
input (DSI-end) format, and that format can then be used in pipeline
format negotiation between the DSI-end of this bridge and the other
component closer to the scanout engine.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index dc909e7ceb958..14d28e7356aaa 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -281,6 +281,32 @@ static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flag
 	return drm_bridge_attach(bridge->encoder, icn->panel_bridge, bridge, flags);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+chipone_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state,
+				  u32 output_fmt,
+				  unsigned int *num_input_fmts)
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
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.attach = chipone_attach,
 	.atomic_post_disable = chipone_atomic_post_disable,
@@ -289,6 +315,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = chipone_atomic_get_input_bus_fmts,
 };
 
 static int chipone_parse_dt(struct chipone *icn)
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77624DE155
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 19:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044310E75C;
	Fri, 18 Mar 2022 18:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9949D10E769
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 18:48:17 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 076A78339D;
 Fri, 18 Mar 2022 19:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647629296;
 bh=VK6ErMeBUVbrHmSB8+ONxixGcFJ/jpUtk3V2hbW2BRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W3jvKb7dSFtctJeOp0Nt5GcbaxKPShXDYDFAT4XJE0iyQ5gyJOBdMKrV6UxU4qNA/
 JpOnopSwOgvciPDYbfdcteaSV6nlrung3BiAobq/n5R1OnPg7tkbFiZQxyI0OJ5ToE
 8jZXY6HfLJ8OjE/X6DS/K7o7MOdT84bsY7/XvUH/XAHDTfHHehnQX3OFh1czh4NTIh
 TRZGrA3knXa3rF5E2SOfXp28uEeTMlEG0J359sgK8NgnVndGv+548NvZdRfhrLRska
 KpbfURE2vpEMMhEBFSqi2I/DCcOF8nzZL3y5cytj5cpUzVJ1JDLXSnUuQBGzprYuVv
 lCpc7FLp2uisg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/11] drm: bridge: icn6211: Implement
 atomic_get_input_bus_fmts
Date: Fri, 18 Mar 2022 19:47:52 +0100
Message-Id: <20220318184755.113152-9-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318184755.113152-1-marex@denx.de>
References: <20220318184755.113152-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement .atomic_get_input_bus_fmts callback, which sets up the
input (DSI-end) format, and that format can then be used in pipeline
format negotiation between the DSI-end of this bridge and the other
component closer to the scanout engine.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
V4: No change
V5: No change
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index b2faad4cb8a6d..42e3581d76521 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -383,6 +383,32 @@ static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flag
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
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
@@ -392,6 +418,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.atomic_post_disable	= chipone_atomic_post_disable,
 	.mode_set		= chipone_mode_set,
 	.attach			= chipone_attach,
+	.atomic_get_input_bus_fmts = chipone_atomic_get_input_bus_fmts,
 };
 
 static int chipone_parse_dt(struct chipone *icn)
-- 
2.35.1


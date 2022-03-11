Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1E4D69D7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B0B10E66E;
	Fri, 11 Mar 2022 21:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399EA10E66D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 21:03:08 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2B8DF837F6;
 Fri, 11 Mar 2022 22:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647032587;
 bh=lPlyUHJynMflH37n10nmz42drBwk/zGG4BnHHbz3OCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wQEo7XxxdTue/3Zw27gAlB/po6KV708q4CeoDYBI2tSuTS9Kv0f6j+/Ny2Iuy+5rg
 xbFGzgqWH8k741kYYPl+BsAklKaR8Rws6ksQptzwnjpPWXCiks+D3bqEZJDpA8UtVA
 WKhwIgn9I+OeN00gREr0uv2O8OByc7HrO+9Wx72cYddJU2uziEoRVBQGv0JCvgEah6
 Sm9E5hmoD7dqZ1jTVHvkKmAKH78tOFJYXvJclA1r6dzdixidohZRcNNHJ0obotHBW2
 tr1oYPXAGtQ7+zcf47Wnlh6N2+u1o9EFtKJQxdiXUesZnjNNHANx40M1tBeqr+sddJ
 kE89x9tU2esSA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/13] drm: bridge: icn6211: Implement
 atomic_get_input_bus_fmts
Date: Fri, 11 Mar 2022 22:02:24 +0100
Message-Id: <20220311210227.124331-11-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311210227.124331-1-marex@denx.de>
References: <20220311210227.124331-1-marex@denx.de>
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
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 9fbe9343db235..144bed4c83083 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -389,6 +389,32 @@ static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flag
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
@@ -398,6 +424,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.atomic_post_disable	= chipone_atomic_post_disable,
 	.mode_set		= chipone_mode_set,
 	.attach			= chipone_attach,
+	.atomic_get_input_bus_fmts = chipone_atomic_get_input_bus_fmts,
 };
 
 static int chipone_parse_dt(struct chipone *icn)
-- 
2.34.1


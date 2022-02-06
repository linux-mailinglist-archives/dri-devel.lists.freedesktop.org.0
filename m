Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5A4AB055
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C87310E1A9;
	Sun,  6 Feb 2022 15:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF9A10E245
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cd10382f-8763-11ec-b20b-0050568c148b;
 Sun, 06 Feb 2022 15:45:25 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3EEDE194BD0;
 Sun,  6 Feb 2022 16:44:23 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 3/9] drm: add drm_atomic_helper_bridge_dsi_input_bus_fmt
Date: Sun,  6 Feb 2022 16:43:59 +0100
Message-Id: <20220206154405.1243333-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206154405.1243333-1-sam@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a number of bridge drivers that supports a single media bus
format for DSI. Add a helper to avoid duplicating the code.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  7 +++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a7a05e1e26bb..94f313dc196f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3549,3 +3549,44 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 	return input_fmts;
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
+
+/**
+ * drm_atomic_helper_bridge_dsi_input_bus_fmt - Define one DSI output format
+ *
+ * @bridge: bridge control structure
+ * @bridge_state: new bridge state
+ * @crtc_state: new CRTC state
+ * @conn_state: new connector state
+ * @output_fmt: tested output bus format
+ * @num_input_fmts: will contain the size of the returned array
+ *
+ * This helper is an implementation of the
+ * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that supports
+ * a single DSI media bus format MEDIA_BUS_FMT_RGB888_1X24.
+ *
+ * RETURNS
+ * A format array with one entry containing MEDIA_BUS_FMT_RGB888_1X24,
+ * or NULL if the allocation failed
+ */
+u32 *
+drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   u32 output_fmt,
+					   unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11..0e81b6f637d6 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -231,4 +231,11 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
+u32 *
+drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   u32 output_fmt,
+					   unsigned int *num_input_fmts);
 #endif /* DRM_ATOMIC_HELPER_H_ */
-- 
2.32.0


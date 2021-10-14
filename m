Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74D42DE15
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7A6EB34;
	Thu, 14 Oct 2021 15:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3826EA83
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:26:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m22so20866550wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/UD6kbf9y3kSEH44o5tSIzBUQ67nK53eX5Y59IgtSs=;
 b=P34HjUhkjjM7vHhJKe0dRgGSZQwPHY3HN79wqaabHjRWRd+kHcF17ph1dTmh7ycAWH
 iZ7oVA90oPTWqC1KdA9viHiCyOhltk1TVWZvo50LTQu80LGqKdmu/CCLAJl9VJbqtfKl
 RFBJv2jedAvS0H1zJ6Nn8Lbw3C2Jn3IEFVVmXuVH7P4RDk71AibN37Vv5BYGmh7wRTzV
 Mr20QvCgR+bQO/Y3Dft+qrMhucxN82Kz5K+j/BgFW/9y99+GfgBfrcrCRU9BXzsGhdZT
 uXWgFzRAZ4TZzQI/zn21GytScKK0+erWt+Gec5iSeS2hwD4PqqRbySscZWKcLi712OQ/
 qaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/UD6kbf9y3kSEH44o5tSIzBUQ67nK53eX5Y59IgtSs=;
 b=mzqWuvvhlShE8OGWfYbDXK5Afm3UrGJm9EQGv2InNOpWQ/9CBroXmx+fPdjNqeI0uJ
 xg0PY6Yb1qFVXBuY1FcBuUq7sVG8gauQkg5iJmqiravL+Ok/JFXDkON9BxeQdF9iO6Dj
 mkf9OblyfJPNyHqcWVDdHL/7eyXgF6Wl/iunPtt3HSMZTHXdFzHbB88H1gKT9O7iViiD
 y6OTnIAWwWaQUuIpGsBQcXadZ2yyz4mYHlJDzavdHmnfPYU1vbKRzK752NRLTdiB/1Qj
 25P5fD4VAUN7tHxjXniwXF0cTN90//TcxxEc/eq1xE77USMiFjC2N9sz0qyR9QQlb+M/
 QzwA==
X-Gm-Message-State: AOAM532QcOpiEb5TFjXNoPuxQocMx+3HLplgPuqhrch9qC/5XSlg5fDE
 z4mZWNElbkHoepHbwLsFtB6sww==
X-Google-Smtp-Source: ABdhPJywinMYzalRdTjhe2vVBQGXKB18TTNLcJD2odD6MDV+5cF2gn9oPeCZXQYmsrzhWIjkyZo93w==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr7565708wrc.85.1634225173222; 
 Thu, 14 Oct 2021 08:26:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/7] drm/bridge: display-connector: implement bus fmts
 callbacks
Date: Thu, 14 Oct 2021 17:26:00 +0200
Message-Id: <20211014152606.2289528-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5079; h=from:subject;
 bh=07kqi5zzzSZI3ElecWIOO/HwkZFn9DMBCe+0pRu8cJA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEt/t/370Lg/hnQqBrBvL/wtk59MM3tbZ0rvz/5N
 eMloI7WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLfwAKCRB33NvayMhJ0UqrD/
 4v4xuQX0SlQs0w6df5xkrKK/+gkk4YbBZ86Cfd7zw4s3Iwr4XOZJmp0p73OxA7CoEnLAz1E+NBnBw4
 iD+c7wE2ll2b/naUYgoLFwgdehJsLhVIv3iM2N+vdYuM4CqO0xsP1i59FwwAaDK1dVY1l3X5SgeVKv
 B+s666HTrJYnUzsU608Qo52PD6vFsI3zz0uP8a3hNWxgYDHnJiP4Ms2o+oQTjnXjI41LfWf2ptx379
 m3btHxQqgICP0eZsDuyKxbyjiOtoe3c+Sh3ZgpQPyK9o/9cOO2olu9gcMU1d8PY7NqW2nUA5ledYbH
 kQZf6H6JRGZUP6hvDbuVJ2seoAEaBumNUVMEQU9Nq6Fq7kQ/bP2ppJmycLdtuwVN6wS4I439Zxk4JU
 rNTYocHgjs9tJV5U2fLPqzM0r9EfOuY8fHmo9kkBKlFbX0CkZ/e/cWbjI50StsiMf5U33VMefWCKmF
 IqrAGtc8z9MG6HPzfivQinyzxZKZdTB0EOFR7o4R+khNww7zAEqcIZMm8JezS1LHv6MlVqFRNQ0UAf
 z+AGRjKvZjlrUiqgqbqbrvXfvTxw+njfv3hhe3IMk9jWefaYZmj5C5pbLvjUFhR27/UrxYKuE4c9z5
 HNOpnHDAQtcXBn9xcklCTs+nGlR4AO8oQXwX4Y4U/7FPzFAF0QsIFXf3h1Og==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this bridge is tied to the connector, it acts like a passthrough,
so concerning the output & input bus formats, either pass the bus formats from the
previous bridge or return fallback data like done in the bridge function:
drm_atomic_bridge_chain_select_bus_fmts() & select_bus_fmt_recursive.

This permits avoiding skipping the negociation if the remaining bridge chain has
all the bits in place.

Without this bus fmt negociation breaks on drm/meson HDMI pipeline when attaching
dw-hdmi with DRM_BRIDGE_ATTACH_NO_CONNECTOR, because the last bridge of the
display-connector doesn't implement buf fmt callbacks and MEDIA_BUS_FMT_FIXED
is used leading to select an unsupported default bus format from dw-hdmi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 05eb759da6fc..9697ac173157 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 
 struct display_connector {
@@ -87,10 +88,97 @@ static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
 	return drm_get_edid(connector, conn->bridge.ddc);
 }
 
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the output bus formats, either pass the bus formats from the
+ * previous bridge or return fallback data like done in the bridge function:
+ * drm_atomic_bridge_chain_select_bus_fmts().
+ * This permits avoiding skipping the negociation if the bridge chain has all
+ * bits in place.
+ */
+static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_output_bus_fmts) {
+		struct drm_connector *conn = conn_state->connector;
+		u32 *out_bus_fmts;
+
+		*num_output_fmts = 1;
+		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
+		if (!out_bus_fmts)
+			return NULL;
+
+		if (conn->display_info.num_bus_formats &&
+		    conn->display_info.bus_formats)
+			out_bus_fmts[0] = conn->display_info.bus_formats[0];
+		else
+			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return out_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_output_bus_fmts(prev_bridge, prev_bridge_state,
+							      crtc_state, conn_state,
+							      num_output_fmts);
+}
+
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the input bus formats, either pass the bus formats from the
+ * previous bridge or return fallback data like done in the bridge function:
+ * select_bus_fmt_recursive() when atomic_get_input_bus_fmts is not supported.
+ * This permits avoiding skipping the negociation if the bridge chain has all
+ * bits in place.
+ */
+static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
+		u32 *in_bus_fmts;
+
+		*num_input_fmts = 1;
+		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
+		if (!in_bus_fmts)
+			return NULL;
+
+		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return in_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
+							     crtc_state, conn_state, output_fmt,
+							     num_input_fmts);
+}
+
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
 	.detect = display_connector_detect,
 	.get_edid = display_connector_get_edid,
+	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
-- 
2.25.1


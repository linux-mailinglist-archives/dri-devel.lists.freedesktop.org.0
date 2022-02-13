Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D54B38D2
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 02:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEC610E23A;
	Sun, 13 Feb 2022 01:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607A210E128
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 01:45:05 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4BBF283381;
 Sun, 13 Feb 2022 02:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644716703;
 bh=gT9xHi3jJzf4NmiU6dy/ZISvD6lZJXqFpznsv9LrPRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6urHYsmhLgkvy6iyTrvx1mF3E2TQ2aYAptsWMvRjFnNffSxLlLw1Nynad36qpKcM
 Y5OJt/zPlt8zLgMcdD717OCOurO49fdwtaJiRJSr3QW+Uw/GjPbbBbo3YzPlo9dpVB
 +HByeefMy5MbDlB5INrq4RgA1/dLCX8qFY9pB6DWIzBH2YfZOHRBGb+nrpQMr0BdC3
 +M4MQqVPxLPyWav/8B1g+9k040kgBJg9u4ZuLE9QlttAbxM1RrsQnLFjizVUFIGp0P
 tAyVIAk5yR5/3ujkesBzzK3nQbQJRsr9QBK+hqX8Fkx6YJQ2u6hgQq1PgeaGS5WRNw
 7dPXnRjX7FxyA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: lt9611: Add atomic_get_input_bus_fmts
Date: Sun, 13 Feb 2022 02:44:43 +0100
Message-Id: <20220213014443.448080-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220213014443.448080-1-marex@denx.de>
References: <20220213014443.448080-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement .atomic_get_input_bus_fmts callback, which sets up
the input (scanout-engine-end) formats, so that those formats
can then be used in pipeline format negotiation between this
bridge and the scanout engine.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b3b4df2f744f8..52f146b769543 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -922,6 +922,32 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
 	lt9611_enable_hpd_interrupts(lt9611);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
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
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -936,6 +962,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 };
 
 static int lt9611_parse_dt(struct device *dev,
-- 
2.34.1


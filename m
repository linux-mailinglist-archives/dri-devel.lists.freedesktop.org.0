Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874722F5FA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7289CB8;
	Mon, 27 Jul 2020 17:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28A389C17
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b11so9388450lfe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jcth6O3uHkbrJkiI99t/dSTp8s1YXgVnoyCvlr3F9E=;
 b=FY+G/WdpRT2C4eseHPqExJmbD2kk7uba84ijg69OvEg+5o+pJvrc4DJCJKdB5BA4RV
 U6/yS6qtyz/mKIl8P8Val7iNuAGig+by4A7CaJBHYYQM5yfKvtpJYz944Dm0RrZRvw39
 rJ2HhXNkcovjPlwI6RwC/ZPQQhJIJOKGoPas2nRj6UnXt4AaBhYfw6wPCObHBCteMPqs
 rczvv3yOjI9BQpdS6tqm1/q/jB6FNY0CtcxNqsa0S3vA/s1UkVi9kOL9tIKBJo8vA45b
 kpeudQQT7aoHY0j08FbzF/e3fMScWcarGt6N+WotOw1IfyGnFrTU4XF/AlhreYs/83UI
 d+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1jcth6O3uHkbrJkiI99t/dSTp8s1YXgVnoyCvlr3F9E=;
 b=DzKFcYq36Be0Bx9nkVsJxehVlgpsDEY1w/EPEeG/9yP+qF8/ifjqeSzjHU2DUQHXIF
 5VYKdJhy7FjoKdP2n33dDvm3HjCChRLq1Ltwh0TklvLsrV8IwwpIx0LKDstfEFNn5gTN
 WFTssRQQiNsYzV/P9Y6rzjyaHQri1Ja4slZ/HbbfzD3bzXE/R6nYcKVfYo0Zf2xz+CPW
 pSa6/uKPJkWVyXxeDhk7py+fi3m+2YVHaRgSdjXQ3iHx5q1wBisUfIWTuGDspf8wPJkj
 /7ddS6DcGN7G2xI9N4T9YTNoRTrilOMOSJ0sdyGAHDsymfIOyxrEhGswqrIzgXOtjlMb
 0Ogw==
X-Gm-Message-State: AOAM530DVobfoC8SSgPD1TWcjgH2wLgXmqRDwUVgCr9Wiv6RZ6HYyfwj
 r8rPYfRLIc41+sABBgTlHzL66EODbEs=
X-Google-Smtp-Source: ABdhPJy7jVJfTAxI3hkzvN9wCx12g+h62n5E8ley4o99HzrJKLVJLqTYn/JFUICNqW0D5Xnns/WNVQ==
X-Received: by 2002:ac2:5ded:: with SMTP id z13mr12005340lfq.213.1595869409638; 
 Mon, 27 Jul 2020 10:03:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 2/5] drm/bridge: tc358767: add get_edid bridge operation
Date: Mon, 27 Jul 2020 19:03:17 +0200
Message-Id: <20200727170320.959777-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727170320.959777-1-sam@ravnborg.org>
References: <20200727170320.959777-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for chained bridge with the addition of
get_edid support.

v2:
  - Fixed handling of edid storage (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index bde89e213882..b26c669f3e91 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -250,8 +250,6 @@ struct tc_data {
 	/* link settings */
 	struct tc_edp_link	link;
 
-	/* display edid */
-	struct edid		*edid;
 	/* current mode */
 	struct drm_display_mode	mode;
 
@@ -1335,11 +1333,19 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 	tc->mode = *mode;
 }
 
+static struct edid *tc_get_edid(struct drm_bridge *bridge,
+				struct drm_connector *connector)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	return drm_get_edid(connector, &tc->aux.ddc);
+}
+
 static int tc_connector_get_modes(struct drm_connector *connector)
 {
 	struct tc_data *tc = connector_to_tc(connector);
+	int num_modes;
 	struct edid *edid;
-	int count;
 	int ret;
 
 	ret = tc_get_display_props(tc);
@@ -1348,21 +1354,15 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	count = drm_panel_get_modes(tc->panel, connector);
-	if (count > 0)
-		return count;
-
-	edid = drm_get_edid(connector, &tc->aux.ddc);
-
-	kfree(tc->edid);
-	tc->edid = edid;
-	if (!edid)
-		return 0;
+	num_modes = drm_panel_get_modes(tc->panel, connector);
+	if (num_modes > 0)
+		return num_modes;
 
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
+	edid = tc_get_edid(&tc->bridge, connector);
+	num_modes = drm_add_edid_modes(connector, edid);
+	kfree(edid);
 
-	return count;
+	return num_modes;
 }
 
 static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
@@ -1465,6 +1465,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.post_disable = tc_bridge_post_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
+	.get_edid = tc_get_edid,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1689,6 +1690,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->bridge.funcs = &tc_bridge_funcs;
 	if (tc->hpd_pin >= 0)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
 
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

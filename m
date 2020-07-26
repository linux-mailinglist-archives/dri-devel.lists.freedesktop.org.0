Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96622E28F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5156E059;
	Sun, 26 Jul 2020 20:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE8089C55
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h8so7869038lfp.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNJtVK3LG+m8G8vjSXP3gAhWLBb6hXFVj9dGZ31MEbM=;
 b=aYjiEZjrF9OXJby0x7qt/2s450cpYPVRJz7xw1c5I/aQngZAayfW2pnzb1NN+XMfEJ
 fs3FTHACZ+ZwxMwLX04gYm6o2f+7JJzZ14bIO3IW5w0tu+5Xtj643VHyKzZ8IV4wzdXf
 ppwcUfkWXryvan9DPPc5O8aEV8GCE5GGZSeEhT6s8jCJkra23loCH3yYQ9qTH+8sQlys
 5lqCQwdoqsFZL0zMKZ0I6Fz3AqNO3BpF2ShAUZGycLubDJFsW8meEX4ifs1ilvhIVqOc
 QLaydmLoBXMUUORoPoRQTPHuVpKGBsajnaGuu40vm+gfZTQdAz6xSQ5Aq/f48yRfqEBZ
 9qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BNJtVK3LG+m8G8vjSXP3gAhWLBb6hXFVj9dGZ31MEbM=;
 b=ovmZ0ewDD6aXowW0zTivvjVdtdnX0b/PqvAb/BzBe5cZdiKEZgWh+W1Vls9bVphkcZ
 TQO8cSnrR/xnBs3WU3oHBU3/5OVewRQ914QjsmMubzRlD5PX9fVXZcjjM01JnM1PG/my
 8qF+jtemSg7c53FYfOho8c/XOSCB3H9X+XFdQDyfnZONAF8w689yszly5oKJsPQp3t+X
 4DPA/NkQwpf7b0NoN44cQNrchgCn8BXsW2k/LdfAQSWJF1sqZUkjYtLdhAxdSPQxrVuO
 Qxhb0n+6b68Zj4fY+E9mXhLhKdLQa2LRVZ4ZCp4Ch0NtRkE2dcEVzV1AVT0LAu1vjxJT
 CGwQ==
X-Gm-Message-State: AOAM532skeTaouJLZehiTtzibU49MFKc+2qqic6TId0hNkyGwAIe0ihf
 /xa/aoYWb+1RAKiU5hY4HP4Xjxc63Y0=
X-Google-Smtp-Source: ABdhPJw/S0p0MU5p7IVx/K2HIv6peC8rGQoC+jBSfcdETIxMjQWXI/LJBt78z98bfMChpJHduMOF2g==
X-Received: by 2002:a19:4345:: with SMTP id m5mr10131817lfj.60.1595795620696; 
 Sun, 26 Jul 2020 13:33:40 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:39 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 06/15] drm/bridge: tc358767: add get_edid bridge operation
Date: Sun, 26 Jul 2020 22:33:15 +0200
Message-Id: <20200726203324.3722593-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kbuild test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for chained bridge with the addition of
get_edid support.

v2:
  - Fixed handling of edid storage (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e8ba713bedac..d86d7f06bebb 100644
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

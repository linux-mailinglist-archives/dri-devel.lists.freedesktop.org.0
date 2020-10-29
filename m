Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF429E5EF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0B6E862;
	Thu, 29 Oct 2020 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8526E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 01:12:00 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id f38so988834pgm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Voj0xnKxcDAaOrJE7NzPft3y2g16towQtBv841dzko=;
 b=VY115rQKlMGYdnPZy4iOYSG2KHzFv0HDqEToMayNO7Ns6yQkc5LF1t80HaVJ1TbMxe
 U7iu12gz+vR8/8k07MOdfrIeEub4todU7pbQGE5lKJLhg0ds608RVh2CN5pVIAXVVYW3
 6aZEZ6oTNAcdvP3l7M+lvsdGXrzMy73kK+l7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Voj0xnKxcDAaOrJE7NzPft3y2g16towQtBv841dzko=;
 b=pjL5dzv6YFrEfE4cjh85cp9DyHFADLt/hGYsxWwM1N9ZySg59WAwnszxmHQOB7mUV/
 5ZBgNlm7QoCIlxx/zffQjjbTxhy6mxkr0LkMALfH0ViRzXDR0fuslRSGMO+Vd4TV76Nc
 Is2d/Um5/zZvA0we1VLHZ/0iLfDvOm3lmhv74lZR78l52DxHxbkopCirzLNfTZaQ4ovr
 mmVPMkYq6n+1oVICiRwXIBBdtjonCXEGv8ywveCvPORB6OubKJhuG2dVHrUnLjO2DqMG
 CLJn2wK3mF75uO3JnpIkNIURNpqqs1F6KnaQoXf4o/IV/GM8YxVXmtqbYtQ/yliBXi9K
 o/gg==
X-Gm-Message-State: AOAM530DsS3InyqespZ9e7fxjDr+s1CBO9+A9hU93ImYok6DB2K+5GDD
 H0imCEfs2ysM7uT9uFiwV2eb9L3K+4Vi+w==
X-Google-Smtp-Source: ABdhPJz3TCP5G+LRZi8FgG5A488khEnCSsG7ygeR7jGk8SbccDqS4c+Qhf3qKW6JX5EW4MqdCpgBQw==
X-Received: by 2002:a63:7c54:: with SMTP id l20mr1800393pgn.151.1603933919968; 
 Wed, 28 Oct 2020 18:11:59 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e6sm781769pfn.190.2020.10.28.18.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 18:11:59 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Date: Wed, 28 Oct 2020 18:11:53 -0700
Message-Id: <20201029011154.1515687-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201029011154.1515687-1-swboyd@chromium.org>
References: <20201029011154.1515687-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DDC connection to read the EDID from the eDP panel instead of
relying on the panel to tell us the modes.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8276fa50138f..6b6e98ca2881 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -119,6 +119,7 @@
  * @debugfs:      Used for managing our debugfs.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
+ * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
@@ -144,6 +145,7 @@ struct ti_sn_bridge {
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
 	struct dentry			*debugfs;
+	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
+	struct edid *edid = pdata->edid;
+	int num, ret;
+
+	if (!edid) {
+		pm_runtime_get_sync(pdata->dev);
+		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
+		pm_runtime_put(pdata->dev);
+	}
+
+	if (edid && drm_edid_is_valid(edid)) {
+		ret = drm_connector_update_edid_property(connector, edid);
+		if (!ret) {
+			num = drm_add_edid_modes(connector, edid);
+			if (num)
+				return num;
+		}
+	}
 
 	return drm_panel_get_modes(pdata->panel, connector);
 }
@@ -1245,6 +1264,7 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
+	kfree(pdata->edid);
 	ti_sn_debugfs_remove(pdata);
 
 	of_node_put(pdata->host_node);
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

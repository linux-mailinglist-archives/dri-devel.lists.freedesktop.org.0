Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FC42A3EAB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564806EC4D;
	Tue,  3 Nov 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CA06E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:11:50 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w4so1244289pgg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wmiepruc3iCJr4t5GLBvdMshT7V+umkWxaVmydO1lC4=;
 b=fVmd9hMhFPFDmgKxG8aw6065UP1hSU/+jbR6rqxTwx/DSXw79TIDaPRljmz6icQrm1
 uBRIf71eV6DvEk8ouKaza4Ltfyj22EVXwwWA2zQjQlUyW4XzOjYRXhGZGjJ6ftKq4IVW
 bXWL44Dc7D4VkY/mAwUA2eutPQ29fy5+u89qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wmiepruc3iCJr4t5GLBvdMshT7V+umkWxaVmydO1lC4=;
 b=m0ilN7bRCvzmjQtU05Hr0BzYW4xvAyhUHb/hvF2hqwIzddFtvbxZDBNq4t4r9KSIBe
 j+DlBJth5X6C2b2BbY94WzjG/wdXug0djLEczytBmqMB/yQaAPKnWOVly62V9N4hVif3
 l4FAm2fLu5ccOvHrheNOAIEkomOrS8lqO4mpkQ8U9UqG0gzV6gnNyOS1WjcZpwLCzKCq
 e4t+3hpLhuk7Nr5//6VG+vIaCcAAjPGj+ZgUzEtPvBZz/hp+t3VDv9kUmWqHDm5nV/8T
 aw9ZaVx1HipOg5PJgwCMnlr8+/RYkE/06fukxPJ5xayKqLoAf43sVUPi1Trx9vxe2s8D
 ZsIw==
X-Gm-Message-State: AOAM532x0E8ny5Y5SfSVQPm4ubsVTtXwL7QTnsvgg7v/79bEEkVjc7Bo
 /pbFamvkGU6Og5Wx1R5hBGW4JQ==
X-Google-Smtp-Source: ABdhPJwO3c4Yqrm1FRtcJ/zbXYcRSTGx9Oc3tVdBrijhZfe5jOUT/yxF5wd9HV8D0noQX6iFg1QgHw==
X-Received: by 2002:a63:a1d:: with SMTP id 29mr14072488pgk.162.1604340710699; 
 Mon, 02 Nov 2020 10:11:50 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b17sm13175640pgb.94.2020.11.02.10.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:11:50 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Date: Mon,  2 Nov 2020 10:11:43 -0800
Message-Id: <20201102181144.3469197-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201102181144.3469197-1-swboyd@chromium.org>
References: <20201102181144.3469197-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

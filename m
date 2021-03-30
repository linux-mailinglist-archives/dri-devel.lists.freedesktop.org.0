Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5434DEC9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A70F6E82E;
	Tue, 30 Mar 2021 02:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E0B6E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v23so5391212ple.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdhUcLdKGZws4bIuWNvM669I98WfYUeDRQetYvWjfOc=;
 b=LDZDXTvfo3j5zkAAyZvvJ/TwJjrnnhB8tUjrsrG4YoMmDxgEqWxtMmOOU845+GlpgF
 Y5/H79kEPuVKJcsebB97HKStI3DjVZ8RrcyJewIbVWJwaUqfsfLHVU/SFTqNsSNZJ4Yn
 QmvAj2FIF9WmWGMPOXaIO86aY+8+ydg3ggjVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdhUcLdKGZws4bIuWNvM669I98WfYUeDRQetYvWjfOc=;
 b=KH0CLF4rcXFA8oCNmuheDBqDk0VZF5LZzAuTCMXQlaG+1cZNZktDvZ0UCbYGQbGD0f
 yDARg21x+b2DgDrvTpnSS0io4L9tmvFKhF20/MwgnLcbg0y08G2igXC9rRxqH5EtBqlg
 qN4GuVq+nKCcVbirr0w61X+wPP9B0BPoVIzETJwlo0cNURMskjFXCqGuFy7ml4GYRn5A
 2gP/GmkZ9TdsN15C3k7YJLJtm0cUy68CZg33dXbOupckdfB8PVlnPrAivTbXTQtvjZ2W
 KJO9uvmL1NkpAmGyytH9Q6LuzxZlaoc8DjfHjKzOcT+LSZ5+t/EdV32UX5NIlqVQfjJg
 8QXw==
X-Gm-Message-State: AOAM532SSXOVh3pwE5wSneya/ebbYqqVOjCZCG5fW3pbOmEM2V5EkBC3
 9PEbVHU15aVFNLE1HrqsocRKEA==
X-Google-Smtp-Source: ABdhPJyRbP9Dg9rng94Tm6dgBkHfUuioCdrW0smh7o8Ei4c+MuOLyUrICxVQG1NgRYkZK5JqSBmmvg==
X-Received: by 2002:a17:902:ed84:b029:e7:1f2b:1eb4 with SMTP id
 e4-20020a170902ed84b02900e71f2b1eb4mr19897667plj.74.1617072858078; 
 Mon, 29 Mar 2021 19:54:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 10/14] drm/bridge: ti-sn65dsi86: Stop caching the EDID
 ourselves
Date: Mon, 29 Mar 2021 19:53:41 -0700
Message-Id: <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have the patch ("drm/edid: Use the cached EDID in
drm_get_edid() if eDP") we no longer need to maintain our own
cache. Drop this code.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9577ebd58c4c..c0398daaa4a6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -121,7 +121,6 @@
  * @debugfs:      Used for managing our debugfs.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
- * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
@@ -147,7 +146,6 @@ struct ti_sn_bridge {
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
 	struct dentry			*debugfs;
-	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -269,17 +267,17 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
-	struct edid *edid = pdata->edid;
-	int num;
+	struct edid *edid;
+	int num = 0;
 
-	if (!edid) {
-		pm_runtime_get_sync(pdata->dev);
-		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
-	}
+	pm_runtime_get_sync(pdata->dev);
+	edid = drm_get_edid(connector, &pdata->aux.ddc);
+	pm_runtime_put(pdata->dev);
 
-	if (edid && drm_edid_is_valid(edid)) {
-		num = drm_add_edid_modes(connector, edid);
+	if (edid) {
+		if (drm_edid_is_valid(edid))
+			num = drm_add_edid_modes(connector, edid);
+		kfree(edid);
 		if (num)
 			return num;
 	}
@@ -1308,8 +1306,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
-	kfree(pdata->edid);
-
 	ti_sn_debugfs_remove(pdata);
 
 	drm_bridge_remove(&pdata->bridge);
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

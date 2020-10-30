Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5529FFD5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA05F6ECFE;
	Fri, 30 Oct 2020 08:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BE56E948
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:17:45 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id p17so2148248pli.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ha6d4m9hNhg8mJNd9NxPkdoxY0rDbWj+549lDc0BZvA=;
 b=Ut+GsZyCxsILcxGwO7EaUgN3ZFz36AhbzS7p6bMWyVXxYXeRaWfDLmMPEdSLGl8Odu
 tM5YV8rp0fXRZo4/F+E1vpbZh3UguCR74BN+HnNDJEd7Dret+Fbjjjl6LbbUVVLW5cad
 0bdPIb3Zf0Tu5xlOsuHrN33BGerd3aYHC05S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ha6d4m9hNhg8mJNd9NxPkdoxY0rDbWj+549lDc0BZvA=;
 b=eQIl5hG/A3UK+uaaKwMI2f01fj69aLkNL0bbNedE1EBw2dSClymu0aivqSzBEnkkA6
 aBOaIP0gT9rSBH2kkruCmUXKW83CnomctDWvS1qDyhkTOpHL3Pbn+0zcv+zEIIpdOVVY
 Fx8/xZKDZtWlv7gGdnXedOyFfo5Dvdfd7a6FlV/Cxew7hVJfZc1Xn7G7mhvkQT2oL4YI
 CPMno8uiAIhtxlYcitmoCcK96XsSCDAcBUL4jO/58kDSwXwiOZqp3HMvX3WkygppA41a
 /MgNld5vHU2DhBTf0ItFzjwAPHr1G53anRcnYJSZB2HG2Y4yC8sNmcDVUpdeDB2Hw8/t
 5TBg==
X-Gm-Message-State: AOAM532iOUOdYBkaeT7qFHUBS/rsaq9r9KRhjkcqQ/EF1S3FeSN7Rquz
 /xCTnWN91QFLGWDikvoyimoArQ==
X-Google-Smtp-Source: ABdhPJytPUh5z4CQaRdmiFe7RWRR2zFupBli90bIKz8E1Hrrd7gN4yHewyUQ7ZAP+vOpstHmHVAAnA==
X-Received: by 2002:a17:902:9890:b029:d2:2f2a:584e with SMTP id
 s16-20020a1709029890b02900d22f2a584emr6729708plp.29.1604020664675; 
 Thu, 29 Oct 2020 18:17:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z26sm4477854pfq.131.2020.10.29.18.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 18:17:44 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Date: Thu, 29 Oct 2020 18:17:37 -0700
Message-Id: <20201030011738.2028313-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201030011738.2028313-1-swboyd@chromium.org>
References: <20201030011738.2028313-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c77f46a21aae..f86934fd6cc8 100644
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

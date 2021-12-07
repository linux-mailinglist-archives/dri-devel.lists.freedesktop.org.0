Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF346C6F6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 22:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E056E402;
	Tue,  7 Dec 2021 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CB56E402
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 21:52:28 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id x7so516187pjn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWWlWBGNAUNv1KS12feNK4ETJNpX4Xg6FQdVVzeu2xo=;
 b=Nm8DEfD4BkjVJuM8yaT5XZV5pFjaFUtE+3Gm3h/q/n34uOXG753dgC+aSxkBYkgV0m
 1oqaKPjIzutHgzAKMvSylxYQ/fs4BkOzPpL1yuMOxGtHf0PvyNwWZ11d9GYAO/5u63iu
 fZDh0owzBw6rmtpH1CnUNiXcHs0BLB+HqjQ5WF3GkEZmwJb+8Cdkipf/GnFOmyjdMCXt
 fw2LWQN74aKyZq9W/s+JK5guLzWs46xtOV7eA7pQbeE2IzF5Nnvn6P8HLiIh43EY0r4N
 qO7O/yQtH3DEYPf6nZ0hUkhn1/48R9g6vAb8+J/eQzOiDqgdhc72KAH+ZusJNfO3BTRA
 tKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWWlWBGNAUNv1KS12feNK4ETJNpX4Xg6FQdVVzeu2xo=;
 b=B3kcTB/PIBHZR6TpJrIn53K70giOBJ9DnZih+Yt9WBb3sQVeXEjbMA7wUq9sdrIvge
 DMUSQYF/3EOIMx176MxTOIW5CcaNhzN2kEvPZ5DM7jZuCT7qWky34ihLDZ95TXuZCDZR
 CMETKJo+thAyQarJfM91avKf1HlBdwg/WPVOJ2KzVahAdoVUBGcB0oXCCCNRkOQ0vnh0
 N4CF3mNVCJdf6cuAJp6vZFLjeF11LFnJ1ojmdFB6rO3j9adVfwdeOvZGhPRHdZdC1yjh
 LPswFFcY164Olq7cR7hviUSt5BvyDZAAzehOnNpzXHq6ru3bGckVTcBsT6nSoB9XPqWz
 EVhQ==
X-Gm-Message-State: AOAM533LqVb6tDt0vYotdungmIqa0i8i6c6zMvt8+rQuqj9zj52vwCrm
 CgbVn2AVNKRO/oZkIMrD52vSkTyrWus=
X-Google-Smtp-Source: ABdhPJy4TxAKrkAuyTggCB3UfPBVw9hJa8a9UlhxxAwhC9f/AOhv3iTYP40Y8B2LXIbBsxxvX4Gx8Q==
X-Received: by 2002:a17:90a:9a8e:: with SMTP id
 e14mr2104949pjp.231.1638913947604; 
 Tue, 07 Dec 2021 13:52:27 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id z16sm454496pgl.29.2021.12.07.13.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:52:26 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
Date: Tue,  7 Dec 2021 13:57:52 -0800
Message-Id: <20211207215753.635841-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Otherwise we don't get another shot at it if the bridge probes before
the dsi host is registered.  It seems like this is what *most* (but not
all) of the other bridges do.

It looks like this was missed in the conversion to attach dsi host at
probe time.

Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
    spot where we report the error
v3: Add \n and cull error msgs a bit further

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 02b490671f8f..c2928a6409b1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -714,16 +714,12 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 	};
 
 	host = of_find_mipi_dsi_host_by_node(pdata->host_node);
-	if (!host) {
-		DRM_ERROR("failed to find dsi host\n");
-		return -ENODEV;
-	}
+	if (!host)
+		return -EPROBE_DEFER;
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-	if (IS_ERR(dsi)) {
-		DRM_ERROR("failed to create dsi device\n");
+	if (IS_ERR(dsi))
 		return PTR_ERR(dsi);
-	}
 
 	/* TODO: setting to 4 MIPI lanes always for now */
 	dsi->lanes = 4;
@@ -740,10 +736,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 	pdata->dsi = dsi;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
-	if (ret < 0) {
-		DRM_ERROR("failed to attach dsi to host\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
@@ -1267,8 +1261,10 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-	if (ret)
+	if (ret) {
+		dev_err_probe(pdata->dev, ret, "failed to attach dsi host\n");
 		goto err_remove_bridge;
+	}
 
 	return 0;
 
-- 
2.33.1


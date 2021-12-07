Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E046C6BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 22:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EDA6E51B;
	Tue,  7 Dec 2021 21:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEB26E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 21:33:07 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v19so142126plo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCxmc2ej0Y/Ed8/aAbKAC0n9cpxkgcI673PvTj7o1sY=;
 b=pbmlkckfurvf0+NIJVyrntWM7ZMxo2fbrFyWznIZHMALZ7PBz3A9yn+/Jcm7FvMx1B
 q/iuTpDIjJMgU9PSELetS27WnKGmZJaXtawbXMWWxo9uwpKpPEqTas3CmRhHkRh84Scc
 7lU/s6IcVFKoW5wTvJ6nJZ9Ni8Nhd6pBtYS1eoxVuLju3/80NoqHVpwC779F42ebqqG/
 tVLWNsJun8oeXGElY2K+J33f2JgRh8672qupum5VgVdIkx+kidd/rjyolzlP2Jjh6tzK
 GsxDEK+44Hux1h649VcoM7gV6rAPLWmV0XLeh2Ob5iaQzQuwUbffClVeYtO1xBS5JnLk
 i5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCxmc2ej0Y/Ed8/aAbKAC0n9cpxkgcI673PvTj7o1sY=;
 b=7eqnVR/jqZlrVhBhsWoEh9yLLX2Z4eIgNVw50ozvbUpvEC75gowBdXrfkeKrTpU/+L
 w8hl/TTJtHFJbPKiLX7+AP/qoqTg18isUuTYSAAkorUku5gvbEbqFltfVWbjt2xwZil9
 PrYMPVrA1tRCyQsIa7DLSaeRgc44PM7f2Vt0N5SmZRZQ0yviFIHpSXU7j7yaRw/SC2xZ
 CPSwk3Ps2ulgCfeH31zW30UhmiI0203eXPEY1AiNiHlHodfxIz5k6V47KzHbLpiGr9HN
 foSlkPPIReTqcuQ3JdWNcNAgRBRVe8qctIF56C2pkZJW3QDjaMATmNo5aGK5Rkg67t2A
 Z8zQ==
X-Gm-Message-State: AOAM532xYP5FkpJTpjhvIz9C5vjn5jhNYbSpVG7ArwSSfL7ILrE327wl
 vU3LBQKa/7idFnmoFVk0U+SqichkBc0=
X-Google-Smtp-Source: ABdhPJxaO4/o0nOR2am6/HBVYxqg7nice2KJEduPQPwyw1KkwFkHWY3MDRx6Sm5wgSl4EUokY3ZCaw==
X-Received: by 2002:a17:902:e8d4:b0:143:88c2:e2c9 with SMTP id
 v20-20020a170902e8d400b0014388c2e2c9mr54786033plg.12.1638912786683; 
 Tue, 07 Dec 2021 13:33:06 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id f4sm699999pfg.34.2021.12.07.13.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:33:05 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: sn65dsi86: defer if there is no dsi host
Date: Tue,  7 Dec 2021 13:38:29 -0800
Message-Id: <20211207213830.625890-1-robdclark@gmail.com>
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
---
v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
    spot where we report the error

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 02b490671f8f..8f1321ca819e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -714,10 +714,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 	};
 
 	host = of_find_mipi_dsi_host_by_node(pdata->host_node);
-	if (!host) {
-		DRM_ERROR("failed to find dsi host\n");
-		return -ENODEV;
-	}
+	if (!host)
+		return -EPROBE_DEFER;
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
@@ -1267,8 +1265,10 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-	if (ret)
+	if (ret) {
+		dev_err_probe(pdata->dev, ret, "failed to attach dsi host");
 		goto err_remove_bridge;
+	}
 
 	return 0;
 
-- 
2.33.1


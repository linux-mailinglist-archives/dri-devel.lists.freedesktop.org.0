Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CC4D1235
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587C510ED46;
	Tue,  8 Mar 2022 08:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3510ED46
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:51 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id bx5so16479056pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGVvrI809fz6rllRIdV+WsX7fJSqxzfnBPmVg23DB8I=;
 b=Lluh5umcvkkBYSnUABcLhjzyiWWFNu9DCEix8dbn9xrqW2T+Hssqvnz3z5csV9+VJC
 tGzSUfdGlDcjuN8c3iCYzQTwpuFO8LT49OXdrGR0casOS6RvJ1YN2gU0qrZ0JAEogMUo
 YDG3B+uzAh2W+/yCEuNQpdfCtYIOFz6sVop2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGVvrI809fz6rllRIdV+WsX7fJSqxzfnBPmVg23DB8I=;
 b=2kEXAU4iVsEaZoY11E/XzZ4ldkXTE3lFmzjMNI0QSwAyzp7t4YQnGKZ9a52tG4sNSE
 N82MUUs1V5a25YEQbhwpDHEldgq+wbXOMKb+j9Tt2MtTepSMSY2326vh9xOfvW5nHp75
 OM+V3dftj/Kcfws05Z3k6BehJ7wbrI8PfDKHtEEupQ286U1wWRj1V3X/90MHM7sM4U6w
 MjcMi6/rPeZqXG14JSnxIqkyhsqtrx48xfy87jPFmxgP83QWIyNy2UOYW8OsixM0D4oT
 hilv8RYAqSIvgKu3ZHDzo1nMmDPFc4C3xN3Fmkkvnv6VbO9jqYPEnXRYeMRBBdjOQOs5
 neMw==
X-Gm-Message-State: AOAM532iZlf86hmLL8QN5TFcYYTDCQUb4ylb2a3g2z5YP6UerwVwux5j
 Zmz9S/SbqqBTFF0t+jDBk/lDFA==
X-Google-Smtp-Source: ABdhPJwvzG1OgnnG77chWdJUCuZz47myzInUVlt9G324Vi5+Cy8Q5mZGTbclkeU1MpIxxJ8IevMi4A==
X-Received: by 2002:a17:90b:1c05:b0:1bf:488e:cb77 with SMTP id
 oc5-20020a17090b1c0500b001bf488ecb77mr3463389pjb.1.1646728071095; 
 Tue, 08 Mar 2022 00:27:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:50 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 6/8] drm: bridge: parade-ps8622: Switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:24 +0530
Message-Id: <20220308082726.77482-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- drop panel.h
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/parade-ps8622.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 614b19f0f1b7..b58c928a05f8 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -20,7 +20,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -452,18 +451,13 @@ static int ps8622_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1


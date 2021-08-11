Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4CE3E9B5F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3656E20F;
	Wed, 11 Aug 2021 23:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B40F6E207;
 Wed, 11 Aug 2021 23:51:12 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id k2so4830917plk.13;
 Wed, 11 Aug 2021 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04WJj5s3tctrSwR8Sz6N1WyD9Un9NfxweT900BICdVM=;
 b=ne9DzUb+oQO4z6rDjwVGCE9QmlLYsujxft75FhYrqw6dKpJVnnuAf4c+a7U+3CE3Pp
 M3V3z9TSE50E4H12+sSkPYWgBiqNmOoMkuu+FNSVD/NZeWsuCd1cfMoFsyBB//ayEBs7
 CuIy1Znix+tRa6+ApM51ahJCVzMkSVP/gmo31jYDk6A/WOM973ZXwqTw/Fr27pYWm5PT
 widI0YQHAsDmBpolqOAz/YkViZfW5A82VJAQlrge7gYXZWdPJBOis8uzM20JYDlnFvBl
 2n/qcGeZfV7jPa0C87rAdjZyN98MpEVZ+U4qwM3wtDsSx52nbMtuu/9s0ffZQEHGJShG
 wmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04WJj5s3tctrSwR8Sz6N1WyD9Un9NfxweT900BICdVM=;
 b=hRGoWn/j2O9Ayzmo7XKrYEXI1orxQquicfhxqreNc5gCVdeUKY80infIOufmEf2PLz
 RLUnEBMn8ux19rQ6KaohlNORuVUNQmde/+z28YXPsuPKhZtyI3H7dzXBHgL4UsI4zgtD
 553fsnjvVM30SIFYLeDuBgeahk9syz75+A51w87162NekIhO+GC1Y601pj32PpofRND1
 dTTntkcTD1VkFcFAUZRcoI0FwJ8K94gLuEImYMSlKxTNl/p2C0RiC4+kU7U1ZKvgBYR9
 MHtqdXMx10GTaxlxScXEUs/hPysCh49sTXg0B3fRrMuqNBa93kKqyFxtzaEcI1Es/cJ9
 Z+Uw==
X-Gm-Message-State: AOAM532qN7PjvArDGDOMuf2LWG8ZtBTFx2e2Z+ZBRUiQx+8UnB9EnQRJ
 0cA6yR5VfNC5l77Pv7W8T5ZqiibKvIc9JQ==
X-Google-Smtp-Source: ABdhPJw1q2RqS/5nMBmm9zC4l9pNzGk/XZcfLbMnn089P0iE1maQfoZnavDOwU1JF/CdkIXCuGM6Xw==
X-Received: by 2002:a65:6441:: with SMTP id s1mr1164917pgv.214.1628725871203; 
 Wed, 11 Aug 2021 16:51:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j16sm727463pfi.165.2021.08.11.16.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:51:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Date: Wed, 11 Aug 2021 16:52:50 -0700
Message-Id: <20210811235253.924867-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Slightly awkward to fish out the display_info when we aren't creating
own connector.  But I don't see an obvious better way.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 38dcc49eccaf..dc8112bab3d3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = ti_sn_bridge_connector_init(pdata);
+		if (ret < 0)
+			goto err_conn_init;
+	}
 
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
@@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
-	drm_connector_cleanup(&pdata->connector);
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		drm_connector_cleanup(&pdata->connector);
 err_conn_init:
 	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
@@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
+/*
+ * Find the connector and fish out the bpc from display_info.  It would
+ * be nice if we could get this instead from drm_bridge_state, but that
+ * doesn't yet appear to be the case.
+ */
 static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
 {
-	if (pdata->connector.display_info.bpc <= 6)
+	struct drm_bridge *bridge = &pdata->bridge;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	unsigned bpc = 0;
+
+	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
+			bpc = connector->display_info.bpc;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	WARN_ON(bpc == 0);
+
+	if (bpc <= 6)
 		return 18;
 	else
 		return 24;
-- 
2.31.1


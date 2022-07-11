Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC556D6F4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B610B10F9AA;
	Mon, 11 Jul 2022 07:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEF510F953
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:37:38 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a10so3370480ljj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Jx23BXNRzAtXr/Cw0BJqhbbh1daaSzoYbxG/gLxa+A=;
 b=f70NiVYS+umzzkFh0P+3FRA5lsihIzIG2s+Bbx03NvVLIdOfsogs+ynwYUi0QDd3Z+
 vgp1+J1PNIXaWpyPj1AWC82fsb7//9cFe9SdPWHm8c6jYxr7JTWgQx74TDSLGivKEYWh
 bvU/gmOtgIOEZNNnlXEQ3txidNGEWUqTjVJsNTa/58uDy46olnLtXJy9NLmcvARQNbz+
 hULXcVxxUOL+9wDQsGOKl/WEY6+u9mGG2klfCPoPEDthEIxjIJEGx1BXusmH7jRIgj+M
 cHZgNQK+x3X190XNGykgOvjCRkoSNpBDHoK5ahZDgnMDox4EYnfHBWr4GSCx4waGvGEz
 lOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Jx23BXNRzAtXr/Cw0BJqhbbh1daaSzoYbxG/gLxa+A=;
 b=lDJoaNfBzUCDAD3RwhQyxYIlXXDAZaAI5wgvHJATUbWx9kv16YaVb1c4VbPX7bhgxg
 +wVVK2VaSOXrnpBTnRGwO9v2ix0KGbBMVlWS/M8TZQZnEduUUpkRIZtz9OLVyUzYPfcU
 U19jg6HFznygPpN25nW+CfQSAnvcMK39Q0sctQ3VLlqjWZqQlcWjSk3kPge1h7e7LbQr
 64gfTlKOhQtOnFds1TyWyIMg85YkyF177a3ULtoEPr8+/UolKsD/e2CHEzQ9SxBfQ90A
 /ArqaJvWHK7/AyzaE+ej/6X2BqeLlKQ6XxlaGZ5mXVpnm2JIV8LdDCJvfNPYySRNqdo3
 iaYA==
X-Gm-Message-State: AJIora8RBARIJclJy4WC/wB3BqsqbTzWrjbzY6o+etBOEqRARxW48EJv
 ud1LVvO9hf1IKduonGTGuWO/9g==
X-Google-Smtp-Source: AGRyM1uVbP0YaIMvlcxxyU8gdoKylutO21bCoQu+nYctBpbujHbs/JgX0FJ2rgQ0imTEcjAeHM8SgQ==
X-Received: by 2002:a2e:9355:0:b0:25a:9192:6c47 with SMTP id
 m21-20020a2e9355000000b0025a91926c47mr9366670ljh.190.1657525056628; 
 Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH v2 2/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 11 Jul 2022 10:37:33 +0300
Message-Id: <20220711073733.312266-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
References: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as the driver does not depend on pdata->connector, add support for
attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b1b6ed3a8acc..314a814da6cc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -710,15 +705,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/*
+	 * Attach the next bridge.
+	 * We never want the next bridge to *also* create a connector.
+	 */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
-- 
2.35.1


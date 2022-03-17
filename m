Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA34DCD15
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1A310E6FB;
	Thu, 17 Mar 2022 17:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A080210E6E3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:59:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so5399028wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sh7ajWZOEvGP7QGaACeQjOdADbKbBQm2vBjS6fPkwu8=;
 b=O2EWkjBkFX0RVZ4CHcgJ2DN31cS4P3BF6pgRry0OacsqxdAemG9tYwNlAFpFtvsJAA
 ZFoNz0FvTEVXIAi/O6QEUzAcpolAXDAdIklouW6y0IDytbh8NVM0YgRWheUxK/FN6sF2
 vbqLGakIfH5rBFfoQeXX1VnCp1pZuO+PdwNp0CbF4Ol0mgNTYhZAWKkBMI+5EaoNYg/g
 SVzNEyNmQxrJuElmBSxQi98UXMMxogM6CHdCj5+2gIj1Z4qpMZmAXYxF6JPUT3Va+X6s
 kPmnESJQH9nCLjIXyUIS4C/UR1HBGT16vQDjBLkVhZcHDGz661IEXrv57QX/O4JfftXI
 C/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sh7ajWZOEvGP7QGaACeQjOdADbKbBQm2vBjS6fPkwu8=;
 b=0O8/9EwwToBtcyp6h8Fgu/Ar33pmkJiQq+yEHMeaSo70A49eV1ZAW2oIchJl80nkXH
 ZZEuPNnx7di+S0qgt2YHpUJQn6fl093H6hzQJVuCK8AyPVDJA9EubOvLrEV8LZBk6wK+
 W8fPAcRyl/GhkMQSuQA7cBKi0wAlImsTsa/fSuGFJyQaeb2PHtFm3iVMoy1L/tdTzxuv
 rgRs84a1XlomnHgyfcq6rklVvlwKAwN0LaQ1Rw7a+4NUZEs7/+QLyE2heuWQKFsQ/CNK
 c9KQlcmXP3NfeuMGxNStzQXwjxr3n1ZR0JCJFcB1eu3ctql4k6z6bhWal+U9cH609RE5
 pvig==
X-Gm-Message-State: AOAM530t9XRBvBNRi2hm79Sj2wWFlTpXwCfSCFxnA4UDJnkXUoLxlQC/
 h1y7ZjT+rbgYfdxu2UQ2U1k=
X-Google-Smtp-Source: ABdhPJyHh9W6kvftdNRFbnkqJ6vyR9K3NBs4FFINPpETIazOXmmQSWJqwd8wLqHxxWwPFMeLyTAIVg==
X-Received: by 2002:a05:600c:3016:b0:38c:8786:d3b6 with SMTP id
 j22-20020a05600c301600b0038c8786d3b6mr522228wmh.135.1647539943049; 
 Thu, 17 Mar 2022 10:59:03 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 n188-20020a1ca4c5000000b00389c692a3b5sm8035468wme.42.2022.03.17.10.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 10:59:02 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: victor.liu@oss.nxp.com
Subject: [PATCH v2] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
Date: Thu, 17 Mar 2022 18:58:52 +0100
Message-Id: <20220317175852.799432-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2: (Thanks to Liu Ying)

 - Rebase on top of drm-misc-next
 - Remove drm_of_panel_bridge_remove
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index e34fb09b90b9..de62e3fc6a59 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -912,19 +912,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &panel_bridge);
-	if (ret)
-		return ret;
 
-	if (panel) {
-		panel_bridge = drm_panel_bridge_add(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
-	}
+	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
+					      1, 0);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
 	if (!panel_bridge)
 		return -EPROBE_DEFER;
@@ -932,12 +924,6 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
 
-static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
-{	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
-
-	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
-}
-
 static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 						 struct drm_bridge_state *bridge_state,
 						 struct drm_crtc_state *crtc_state,
@@ -983,7 +969,6 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
 	.mode_set		= nwl_dsi_bridge_mode_set,
 	.mode_valid		= nwl_dsi_bridge_mode_valid,
 	.attach			= nwl_dsi_bridge_attach,
-	.detach			= nwl_dsi_bridge_detach,
 };
 
 static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
-- 
2.25.1


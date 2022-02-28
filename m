Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F074C77F7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562FB10E3FA;
	Mon, 28 Feb 2022 18:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DD410E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:37:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d17so16841266wrc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlcmLpC9MBKD3947PIF9JBPxwRTyA5/sqH+s1PuwUHA=;
 b=S5++n9QxaQfiFhgQFs96jfErSI/ww1y7RpotfHjiJEWLsph0ZM/igU4VDtQfolrv7z
 jUOFYtkgyTZDnHbFp+D185jf2GxZa4+rpL6Pkrcuws8veJn7YEwjBQFuL1CKU7VT0+QE
 UeCpiTSDs3iIHb70piAFIZygkYVrN51zrxA1VO1108x5+WQpnpNfkHQaGil6eg8IgErG
 E95mQRsHwvyCdnrsdonlQZjnRtLF3UJxJ3YFAtzGy7sqHQsn84H5ZfGh9Q/gDDf3CAFe
 wemf6FQ6pAsU8L5DgJMEmQk4ypOFFeyG6BLRYdQU/fmN0N5l3/GkP+7LeSOagPMWsG3i
 ndJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlcmLpC9MBKD3947PIF9JBPxwRTyA5/sqH+s1PuwUHA=;
 b=YOTvuRLoetNIxZaaPNXwXUEgVO2GfZ0+bKY4F/DrZEqtTwhHtk0eRVXbuvJCpbWAvZ
 yY1/Z27DrDO+wHeaudBJPaRSgsktPd6m/PjPTL+eVQM7cwYxVhSSveDxwt2s0NeJX8Uf
 HGbH49DG8oMYHl88akzadVQyPvZFx6PJPrQ34SAwMCSNbTi/XvnQPvRJexm+y/vwrShH
 Qj9Ym1RTyzPOeVLibZUa3473tfSRWppdqxBvf8Ca9kqq6AyTT65LrBQzOhqq0/gYFInW
 HeGK7IKDM0hJeX1iBO14xmagWIs/hx5Wx8sS5VYbQZboEl9WW6QX7TAO7JyYIo99JFqE
 +gdA==
X-Gm-Message-State: AOAM5305VUrMMGZtFMtLxcvjRjv5MyZ6EmlZCOjQUbowCJow6lzrwaBg
 xcf+RBA0lWkCd2j+6WgLCUw=
X-Google-Smtp-Source: ABdhPJzdPnTmp+jt9Q6auFBhuceMuV3NSfET7n29J8hcSME3Pn3qZnJsDTxIqxll+743o4mXZnt2Og==
X-Received: by 2002:adf:bbcd:0:b0:1ed:b9a6:c66d with SMTP id
 z13-20020adfbbcd000000b001edb9a6c66dmr16931748wrg.455.1646073448611; 
 Mon, 28 Feb 2022 10:37:28 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d4ec3000000b001ea95eba44dsm11118198wrv.109.2022.02.28.10.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:37:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: ti-sn65dsi83: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:37:24 +0100
Message-Id: <20220228183724.25030-1-jose.exposito89@gmail.com>
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
 Laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 945f08de45f1..91cc00b66d3c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -552,8 +552,6 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
 	struct device_node *endpoint;
-	struct drm_panel *panel;
-	int ret;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
 	ctx->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
@@ -588,14 +586,9 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		}
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, &panel_bridge);
-	if (ret < 0)
-		return ret;
-	if (panel) {
-		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
-	}
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
 	ctx->panel_bridge = panel_bridge;
 
-- 
2.25.1


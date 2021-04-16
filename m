Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E524B362B44
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7926E11C;
	Fri, 16 Apr 2021 22:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FDC6E185
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:40:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id p67so14325405pfp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2616N/QYdtGiJ2WPqXN32z+9F37dE5BQ+AbPSzAlWM=;
 b=Kvygd9Jv3cSdtacrk08etIwGlvbXGIrpJZ3Kbi2fof0pagVnuMUHM5nHqm4TWmIu0l
 NbsEdW2P2kh3xjBHWDqpfg/e1gPhpozUNag0jYXbTdhTM22I3Dcjy9L9b7GQIOjRcYgp
 J65JqAvMF89YzAQdk9fBdrswX5VeBIl87nLqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2616N/QYdtGiJ2WPqXN32z+9F37dE5BQ+AbPSzAlWM=;
 b=eH2bEFMI6/zLMQlb82kM3WWpK0izEdgqh6W3m0ytVQn1AJGVlueMmi3rP0RiNRJWhn
 xkN0+5YM4K3QiEL5+ftcIAxDdKyEivKV4dw4NJo/nVQzhko2Sd1brtywBEh3VALWmYvY
 3geiWQHWPcOFWFhUAyAejf6MoLU6+tKGs/7gkSWHhmGq6nIu2UaXsk6q9jjuHf40NscU
 gikk3izLFR77FuRdI/siQu+erACWm56YGPOkm4mFCm2Lj5hxNTHU+cjDwJZ3moP+/Wwd
 yhRnTVUzIg//5iBx1DkeJOFZ2zq7lDQ5IJXT6k3jJDj42PW8Qps2bzUL3xnntMl2RkOM
 13oA==
X-Gm-Message-State: AOAM533EfO8JEtxYfMxOtuIJ5w9tx1Bl/L4lFHE+H5HmTYZ+cNzuHeTk
 GCNav6VnoD2u5QsAgUtIzJ5HxQ==
X-Google-Smtp-Source: ABdhPJx+++sgm6QScJKVRhLGDYDXTsoYpzMGpZIuovPKocdK2x9/8MdnhVgChFQiH8GmypmxYux8VA==
X-Received: by 2002:a63:514d:: with SMTP id r13mr1079777pgl.322.1618612855514; 
 Fri, 16 Apr 2021 15:40:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:40:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 02/27] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Date: Fri, 16 Apr 2021 15:39:25 -0700
Message-Id: <20210416153909.v4.2.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clock framework makes it simple to deal with an optional clock.
You can call clk_get_optional() and if the clock isn't specified it'll
just return NULL without complaint. It's valid to pass NULL to
enable/disable/prepare/unprepare. Let's make use of this to simplify
things a tiny bit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v2)

Changes in v2:
- Removed 2nd paragraph in commit message.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 88df4dd0f39d..96fe8f2c0ea9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1275,14 +1275,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
-	if (IS_ERR(pdata->refclk)) {
-		ret = PTR_ERR(pdata->refclk);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		DRM_DEBUG_KMS("refclk not found\n");
-		pdata->refclk = NULL;
-	}
+	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	if (IS_ERR(pdata->refclk))
+		return PTR_ERR(pdata->refclk);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

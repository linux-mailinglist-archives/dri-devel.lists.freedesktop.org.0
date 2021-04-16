Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA0362B48
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988A76ECE4;
	Fri, 16 Apr 2021 22:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E21F6E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:40:59 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a12so19258154pfc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcJHDcYMV/GNRvkYvCP6Y5GlcN4y2gUoiu2dtS69kIs=;
 b=ZsInv2JReTrfjCgB8cC2jbctayfltBqBr0jOg/kNzrP6rbjJRuDO2ZT50ZjSe7P511
 6Eiktjk1IJ+Z76JPjdunMQ7+1SGN9m+uWcMd0FXecfowEx7VHM5M9vo76px1rEqZTcAA
 UF90B3xobn+6xQeKqzuNgiZBP9MVJxrOytsJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcJHDcYMV/GNRvkYvCP6Y5GlcN4y2gUoiu2dtS69kIs=;
 b=NXtQDuuxwSY4BMjn8Hs+662+BStRp2R11rkD66ZtYtaweI0qLMMObJMX9ba3hlbmTp
 8zVhbC2u/jO/VgTo3zhtTW3K2czvKy46grRA2+/dULeT403qll1K71TuFLlTLaxHcqyx
 e6SczbzHDrhHn41qYHdncXHA4xPqN9PbBzfDWBRHp1CalzOMSy9DfMKx6PKOIH7zsVLe
 NQKPEZ/b//saMgbJ++03OE/5EYKR0oWPv0FLOhmpZvzJUEZ3lFgm8ohAg4R49cgX2NpS
 5lSBkXZUclKdA717j3fR+5RjrGq/cUqeyboZH+n7IBJ1wVagTD65EVD/2bZhMU1SiigB
 4V6Q==
X-Gm-Message-State: AOAM532K4sEvV0tssGvwlOQl1Ekh/l6NvgWYxBt0YYvZKXHmu+q/erP1
 zxP7Kk3RFBP3QwnarZEni/mN6Q==
X-Google-Smtp-Source: ABdhPJxsoX7eKSMm+cKUoiLIrtgFQTzsLXBKF76NDygdyZY1gzqdrBnHowzCGvB55KXccagYFL6tdQ==
X-Received: by 2002:aa7:8608:0:b029:258:838a:23bb with SMTP id
 p8-20020aa786080000b0290258838a23bbmr7797618pfn.37.1618612858730; 
 Fri, 16 Apr 2021 15:40:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:40:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 05/27] drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare()
 to post_disable()
Date: Fri, 16 Apr 2021 15:39:28 -0700
Message-Id: <20210416153909.v4.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
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
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We prepared the panel in pre_enable() so we should unprepare it in
post_disable() to match.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v4:
- Reword commit mesage slightly.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c006678c9921..e30460002c48 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -452,8 +452,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
-
-	drm_panel_unprepare(pdata->panel);
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
@@ -869,6 +867,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	drm_panel_unprepare(pdata->panel);
+
 	clk_disable_unprepare(pdata->refclk);
 
 	pm_runtime_put_sync(pdata->dev);
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0F3A47B3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC186F386;
	Fri, 11 Jun 2021 17:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5676F39E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:18:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so415671pjq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FnRhgbzvrNrBAhrrpm4mRSS8nZ4/48rxijSMAVgSnU=;
 b=RrKdUaTvEIdAnFdjJL5/eAsIpXtRpVQnIVM1mIgMX/UCDsQf/TfZZGOF1MYRqs2uRc
 rNDgCsnrNMq7PTmj/Z1KJDoj/Azhm1X0fetF0y9O2EsinynWGsGRM1JYEx42CZ8ONTZL
 o+81bbV0j0mFOtqvlKrO8xn7wEXnFwwhY3bcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FnRhgbzvrNrBAhrrpm4mRSS8nZ4/48rxijSMAVgSnU=;
 b=AAiLzEEwCe5AehHT05DQMdd3u07igBMoTudD44Pns4QY99N0IvOaIrSJbjuJmgC+2m
 cYhNZMPbEAqTrfHt552nWmDn+bNRPjPFbLJ2aabBTY6UOvlyOeZ5Ol07J588e6JvOsc+
 +339/+U5ezpPUdBmAMjRdDRYHhxMS5SeiWc7pME2C7rcdPcHFUDqEb56lwkQHa+H92sN
 Yw4PNrjfQO6h491/27jXLD7kXmOI9ZXtNsqQmFJAqCoM6tizHUg0bSnAvSdTT+avPx50
 dGfGgeRwHkC9QNiP4jojY57WDiAWs5HN2iXTFWqfienHI9rtvqUIAZSv/Y9EhzQw4Z3S
 PRew==
X-Gm-Message-State: AOAM531ryRqLpPAwLpsqE72N4x7jSMwiZP+jC4eD7hUSYDV0PUoO0hAM
 RFOwO99IIlI0qeqUYxO0TOOm8Q==
X-Google-Smtp-Source: ABdhPJzZBrXiXq6lBifXIxC1zOkFuo04PFe24xgvIvwOJp1SAjHXiSP+FoqTnalGVZC4w00lsIVz5w==
X-Received: by 2002:a17:90a:8589:: with SMTP id
 m9mr9913846pjn.168.1623431901584; 
 Fri, 11 Jun 2021 10:18:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4128:5428:5cd0:cfa5])
 by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:18:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 10/11] drm/bridge: ti-sn65dsi86: Improve probe errors with
 dev_err_probe()
Date: Fri, 11 Jun 2021 10:17:46 -0700
Message-Id: <20210611101711.v10.10.I24bba069e63b1eea84443eef0c8535fd032a6311@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <treding@nvidia.com>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As I was testing to make sure that the DEFER path worked well with my
patch series, I got tired of seeing this scary message in my logs just
because the panel needed to defer:
  [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node

Let's use dev_err_probe() which nicely quiets this error and also
simplifies the code a tiny bit. We'll also update other places in the
file which can use dev_err_probe().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- ("Improve probe errors") patch new for v9.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 +++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b544cbce7fdd..5d712c8c3c3b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1305,10 +1305,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&adev->dev, ret,
+				     "could not find any panel node\n");
 
 	ti_sn_bridge_parse_lanes(pdata, np);
 
@@ -1456,27 +1455,23 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	pdata->regmap = devm_regmap_init_i2c(client,
 					     &ti_sn65dsi86_regmap_config);
-	if (IS_ERR(pdata->regmap)) {
-		DRM_ERROR("regmap i2c init failed\n");
-		return PTR_ERR(pdata->regmap);
-	}
+	if (IS_ERR(pdata->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdata->regmap),
+				     "regmap i2c init failed\n");
 
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(pdata->enable_gpio)) {
-		DRM_ERROR("failed to get enable gpio from DT\n");
-		ret = PTR_ERR(pdata->enable_gpio);
-		return ret;
-	}
+	if (IS_ERR(pdata->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(pdata->enable_gpio),
+				     "failed to get enable gpio from DT\n");
 
 	ret = ti_sn65dsi86_parse_regulators(pdata);
-	if (ret) {
-		DRM_ERROR("failed to parse regulators\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse regulators\n");
 
 	pdata->refclk = devm_clk_get_optional(dev, "refclk");
 	if (IS_ERR(pdata->refclk))
-		return PTR_ERR(pdata->refclk);
+		return dev_err_probe(dev, PTR_ERR(pdata->refclk),
+				     "failed to get reference clock\n");
 
 	pm_runtime_enable(dev);
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
-- 
2.32.0.272.g935e593368-goog


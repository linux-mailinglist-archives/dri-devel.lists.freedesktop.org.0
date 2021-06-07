Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9E39E4D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1A6E94F;
	Mon,  7 Jun 2021 17:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838876E94F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:29 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r1so14295970pgk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmqJKJaio2UDvF9xWIYCt9beN4jtSVXClXFJ93Ass0A=;
 b=MJdW8d4EwaL+R83An/5pzeXye/1/jXAwqOAFbdqpc35JCNHPRpC52nlqeRia99DSPi
 mmTVuQicx/skRC356CF6cLgaKYvKhfeR3yxrai8kYSBhBkbtQqzwg5RCwaiuduMr1z2y
 3UKADJKUlio1j791HLEQwcaE2ianIo07Ciliw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmqJKJaio2UDvF9xWIYCt9beN4jtSVXClXFJ93Ass0A=;
 b=iE19erQWUjiwaRMNUezLuT1tf0ZCiXdUhZsrGY5BxRJYu773ab3abZWn+/vT2viFsn
 9vF3m/UZAbNrfOV/Pv/DTDFWGDiAgUBjV109PmC9/JVZBiNLuEv5+pKEF1A7j98NezXx
 XN9pH6zrONnwCakIeWj+8VP+b5BIIVYy9RnDZNACifND9mUX9vbTzw2nlsrdHKf2ZXd6
 tYdX1oG1BMEub7CDHYlIts+JsE7HWbRdz+M7WNc5w68sORlNJrFI3uVrpemnoEFAq4q7
 +JBN9VCG3ttCJkPQkpUo0oSNu3hEQgmcwrJ+JSpirCCRq1SLSZww80Ox8MqnkpzWOcDH
 0q8w==
X-Gm-Message-State: AOAM5309Kk4sZlUIxrQIjhA8CXx/BicBvDFR0htppvToVKVwV0Du42Ub
 WaqiU8BoWK1MLaIgSOdNXOl+8w==
X-Google-Smtp-Source: ABdhPJxWm5zAogtb/40ohfpKI3yOwMuv5/+I42ZxgoktT3GJWrGbX9nIiWib55xdRXhF5wGOpNebrg==
X-Received: by 2002:aa7:9537:0:b029:2ea:2312:d2cb with SMTP id
 c23-20020aa795370000b02902ea2312d2cbmr17629610pfp.27.1623085589204; 
 Mon, 07 Jun 2021 10:06:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 10/11] drm/bridge: ti-sn65dsi86: Improve probe errors with
 dev_err_probe()
Date: Mon,  7 Jun 2021 10:05:54 -0700
Message-Id: <20210607100234.v9.10.I24bba069e63b1eea84443eef0c8535fd032a6311@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
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
---

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
2.32.0.rc1.229.g3e70b5a671-goog


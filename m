Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C079B3697AE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105C6EC12;
	Fri, 23 Apr 2021 16:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA386EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:49 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso1507542pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaR/egwiLTXMp/V4QlaRuOrtKs7oGBmyLwSo5ArZpK0=;
 b=aZPFRpeDad0DFJAa59kkFQtZwo7+BNKMT+alJcwybBsazT/Cnig/UduYNqNWE2aBwO
 Q5PbmhrZ+J8XFHjO5n/Wyi1f8hpsSXqw0GsxA0UWOYdcClq24UozbEsrvtKwd+wRDL8Q
 wnDLDB7nDJGm8ffl4hj74tWRBHMeHj+m+sJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaR/egwiLTXMp/V4QlaRuOrtKs7oGBmyLwSo5ArZpK0=;
 b=PRCSdTDBHseWabKk8MhE7ESivnovWgrXujjkPCbUuBVYTcy7xVa7BNlA3nOq95N+Eu
 zHxrf9QX/qzKCaIiorcIMHliETEQvrEkUCYP9wMOfQmn17KG93PhG80oFPFrs16O+lGP
 wfqgI0lYWAoo85ah+iLUj+BTlnnPR6gaBAYZsBtc+5zMpbLiEM4Kjo5ca4IT9BhWmlFD
 eXJVRKRtbDlHvVU6YWWhRs9wCz/d7VmEuQdiMvvtIiXcmkRL3ZVwF8t28dznRofNDbjO
 CYj9lmNsIwgZ3zb0qs89WykoLtd+JA3V6wykpx+66T7ebwgTxT9F5x3enKTEKlp8D6iU
 95ZQ==
X-Gm-Message-State: AOAM531lc66M3UpRRioo2FgEdz5x7KLekgQrMEu8VYxc9+VYdUKaS32G
 2b/RaPZXmBYNMquPxllMH6ggCg==
X-Google-Smtp-Source: ABdhPJyl4eJ4vKH9OKx0CWgwPTyFJfbmpRq+PZblaJpQI/rjjJLT30UQw8KAqa8Vh6G/JI+s3NBHfw==
X-Received: by 2002:a17:902:e289:b029:eb:29e7:beda with SMTP id
 o9-20020a170902e289b02900eb29e7bedamr4950923plc.78.1619197189070; 
 Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 08/20] drm/bridge: ti-sn65dsi86: Move all the chip-related
 init to the start
Date: Fri, 23 Apr 2021 09:58:54 -0700
Message-Id: <20210423095743.v5.8.Ide8ba40feb2e43bc98a11edbb08d696d62dcd83e@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just code motion of the probe routine to move all the things
that are for the "whole chip" (instead of the GPIO parts or the
MIPI-to-eDP parts) together at the start of probe. This is in
preparation for breaking the driver into sub-drivers.

Since we're using devm for all of the "whole chip" stuff this is
actually quite easy now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 75a41198993f..68673f736b23 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1254,12 +1254,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
-
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
@@ -1267,8 +1261,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
-
 	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
@@ -1279,12 +1271,22 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
-	ret = ti_sn_bridge_parse_dsi_host(pdata);
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
+	ti_sn65dsi86_debugfs_init(pdata);
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
+	if (ret) {
+		DRM_ERROR("could not find any panel node\n");
+		return ret;
+	}
+
+	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
+
+	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
 		return ret;
 
@@ -1302,8 +1304,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ti_sn65dsi86_debugfs_init(pdata);
-
 	return 0;
 }
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

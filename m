Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B393F34DEC3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9026E826;
	Tue, 30 Mar 2021 02:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5A96E821
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso8696095pji.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QPcvkA/+dPL4qhz8ZVLSjs9HCv03yetPJyqdMPURwCo=;
 b=B6I0RdTPrj/Kd0yWPFWFp7fM6GGADE1pQB4GI4+cT4PpmL1jrqfnU23r9DZsNA9cCC
 8B1Ncdn4LITdp9OXNRxjzZloCU/Tn+MJYiz+ZIXz2YvablWJWfTCgytCaBnoaU4z2oMG
 kydPHSSVE+8fV1KAWnE3ApTeoCFWh5pu82DL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPcvkA/+dPL4qhz8ZVLSjs9HCv03yetPJyqdMPURwCo=;
 b=rWI4fSwTGpixGAfgESPhN6TZMtetfZvD+wkRd5P6DLEpqA6sxwaVCi1Lo/RS7U8ptc
 hC2feJmkG6vDyjDjkNB0Uq3ZYybVOxn+4N/25BtdHbORqumzqQxedn1ycZ7hqxyoYc3m
 1l+981Vkctd6w1artD9yUwsGvrOuO6ZildaPtdY1fp9lcnvbakfPyJh750m+0g4qy0lb
 gX2Pr0RtVSB+/jY2GkzPbhutH/iA4yPDpjXleXM7UEFDwMNYDu+8yWLtbbORXQZ08Rtw
 mU8SCkwmaeQDpECvQR0FF5JAY4mgFhn1iRK8BdpjDgWDLwZLRxUfccd1TYUg72CZ3+iC
 WNyw==
X-Gm-Message-State: AOAM530QceeclGl0fuFkC+FNXJqqDV+hzny5ddpiYXbIyTMQuPee26eA
 J8y59IqA+W79wWVdMIoQSicn3A==
X-Google-Smtp-Source: ABdhPJxuu4EYsqmrXz954R1Z5YP+cOJ4Ifd+QvOTnbBflnQYIsWzLuv5y6G5f6GnwB1lH22aCko55w==
X-Received: by 2002:a17:90a:9385:: with SMTP id
 q5mr2098018pjo.121.1617072851012; 
 Mon, 29 Mar 2021 19:54:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 06/14] drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare()
 to post_disable()
Date: Mon, 29 Mar 2021 19:53:37 -0700
Message-Id: <20210329195255.v2.6.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We prepared the panel in pre_enable() so we should unprepare it in
post_disable() to match.

This becomes important once we start using pre_enable() and
post_disable() to make sure things are powered on (and then off again)
when reading the EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e8e523b3a16b..50a52af8e39f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -460,8 +460,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
-
-	drm_panel_unprepare(pdata->panel);
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
@@ -877,6 +875,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	drm_panel_unprepare(pdata->panel);
+
 	clk_disable_unprepare(pdata->refclk);
 
 	pm_runtime_put_sync(pdata->dev);
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

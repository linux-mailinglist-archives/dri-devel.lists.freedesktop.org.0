Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD335310D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87A96F39E;
	Fri,  2 Apr 2021 22:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94436F39D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:32 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w11so3059276ply.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wJ6M1bGIwRFPnVY3IaI+9jJdO1aYMpIT1iEsleX6Es=;
 b=ePUgktHW5kXZRuCKf0O/J58zQqgVweIOh+yyjfO9NbSrepDLjup46dgomfaobMeofj
 zFcaxBHZQokhH7cWG0hD+zIm2epwgUJawcrSxBtwmoKoFI/t49+gZKnr4jTfOAz8NCsH
 RDzKBedY9tSMoPzPTOad+bNjiXb7I/S3x7g2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wJ6M1bGIwRFPnVY3IaI+9jJdO1aYMpIT1iEsleX6Es=;
 b=f4yj7TdQ+OrdsgfZHyntVL4e4gY4EyonQPaQZaH98/OVwTVWNjTE3biMaoIFBVEk5e
 DyKizGhh1GJbjsDjQ42lZa03vy5e7vM6MGU85J5C0kXKSeXjpK5YpUdfV3C5bKx5v7g8
 VbGsjVPbLByAW5sJQiGbZngFElQ4oLjR9bYWuiD7JNSNO+iSLan8mss7HzlSew/LW2N3
 eNrE8UC3EP8aJJWzzlwHSpc5XO1eMddlaow5tUOnedNYAurpeITpiqoxSm79STjNQUZ3
 /95PaTfxh8P2g6NVMwYrmfw6vsLYv7Rnm9252f+QdH8ebU7WHGGs7GtRJKsmxoSabAUs
 EBGQ==
X-Gm-Message-State: AOAM531icqC4PwMGle0+BwopQ7zKgjnRJXUpvG8LIm99icfH8ldznE1A
 xLpnd3hudTBrkbcbjOzdekJ75Q==
X-Google-Smtp-Source: ABdhPJxsjTz8h7xHUz2mmZKKY+Ac8x0Kwl9t3r7hiHvG5cMx0anZAHyd8M6rX41TxpSme+MUXcqqaA==
X-Received: by 2002:a17:902:8e83:b029:e8:c8bd:f65b with SMTP id
 bg3-20020a1709028e83b02900e8c8bdf65bmr3192394plb.4.1617402572240; 
 Fri, 02 Apr 2021 15:29:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 05/12] drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare()
 to post_disable()
Date: Fri,  2 Apr 2021 15:28:39 -0700
Message-Id: <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
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
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

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
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631334DEC6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AFA6E829;
	Tue, 30 Mar 2021 02:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FB36E82D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:20 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id s21so6996736pjq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAIxLRBaavWcAcK9SSbll47MTaBI4ukNSin+ics3K28=;
 b=al+6PytDBZ2jbp7v2fVxXLPHoZdiwhHJtJHRMEn4787KijhZrKruMEs3D2NL9JnRVY
 +RT/KeOGEVqPY4nECULrGBkmmyDt8T/xSfiTy1izZson6ZGCZxAQqAGa+rQAUhsBhXCm
 HGy0YLGpp7Bap63ecOQ/LYjXZIYA47UvFYZxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAIxLRBaavWcAcK9SSbll47MTaBI4ukNSin+ics3K28=;
 b=RuRDSFppkBcf7vha2B+BiKkKaWTYpvtlMHofE4dMf741kGaDmkHE5KYGhMFqfSQH6W
 E6VpWSYCXf6RwR5j2IDqV49WAxdRCyPeAS+RZFRGShUJmmb6VcK9mLwupb1hNbCVGakR
 iEK62FI/yFMxS+9QQTUTlk0tjh5OeIeZTNrZm+s4u/yXrGmCQgLrNqlUxmktUloymW1G
 oNXANBHqZ3JiCvv8lIMu62axwpKfWUdKBOPAbufNVC1DgvudOnSE3HEnvhdacWAM2Fl3
 0eLhj2UO0+Z+JXr0BTaeqaEm82+8NeenbxlURWvKi573StiaulCg55Yx7Y9mkQwZMLpE
 NMiQ==
X-Gm-Message-State: AOAM530xJMmNbIB8piOL/dox/R5ojU04BJXaSgEn1jGrFHPvYLjtnmdQ
 sozHvuP/5iPRjIs3FQzZ3iRLdQ==
X-Google-Smtp-Source: ABdhPJxTC0xfEa3OIjJ6J8E3qWj+ePa35e+igWNb4t2QmRZmmmta+5oUiZgXYVhSNZvV/6N3FWSh0A==
X-Received: by 2002:a17:902:56c:b029:e7:1052:a7c6 with SMTP id
 99-20020a170902056cb02900e71052a7c6mr30855319plf.75.1617072859762; 
 Mon, 29 Mar 2021 19:54:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things properly for
 reading the EDID
Date: Mon, 29 Mar 2021 19:53:42 -0700
Message-Id: <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
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

eDP panels won't provide their EDID unless they're powered on. Let's
chain a power-on before we read the EDID. This roughly matches what
was done in 'parade-ps8640.c'.

NOTE: The old code attempted to call pm_runtime_get_sync() before
reading the EDID. While that was enough to power the bridge chip on,
it wasn't enough to talk to the panel for two reasons:
1. Since we never ran the bridge chip's pre-enable then we never set
   the bit to ignore HPD. This meant the bridge chip didn't even _try_
   to go out on the bus and communicate with the panel.
2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
   if the panel wasn't on.

One thing that's a bit odd here is taking advantage of the EDID that
the core might have cached for us. See the patch ("drm/edid: Use the
cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
by:
- Instantly failing aux transfers if we're not powered.
- If the first read of the EDID fails we try again after powering.

Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Depending on what people think of the other patches in this series,
some of this could change.
- If everyone loves the "runtime PM" in the panel driver then we
  could, in theory, put the pre-enable chaining straight in the "aux
  transfer" function.
- If everyone hates the EDID cache moving to the core then we can
  avoid some of the awkward flow of things and keep the EDID cache in
  the sn65dsi86 driver.

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 +++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c0398daaa4a6..673c9f1c2d8e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -128,6 +128,7 @@
  * @dp_lanes:     Count of dp_lanes we're using.
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
+ * @pre_enabled:  If true then pre_enable() has run.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -155,6 +156,7 @@ struct ti_sn_bridge {
 	int				dp_lanes;
 	u8				ln_assign;
 	u8				ln_polrs;
+	bool				pre_enabled;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -268,11 +270,33 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid;
+	bool was_enabled;
 	int num = 0;
 
-	pm_runtime_get_sync(pdata->dev);
+	/*
+	 * Try to get the EDID first without anything special. There are
+	 * three things that could happen with this call.
+	 * a) It might just return from its cache.
+	 * b) It might try to initiate an AUX transfer which might work.
+	 * c) It might try to initiate an AUX transfer which might fail because
+	 *    we're not powered up.
+	 *
+	 * If we get a failure we'll assume case c) and try again. NOTE: we
+	 * don't want to power up every time because that's slow and we don't
+	 * have visibility into whether the data has already been cached.
+	 */
 	edid = drm_get_edid(connector, &pdata->aux.ddc);
-	pm_runtime_put(pdata->dev);
+	if (!edid) {
+		was_enabled = pdata->pre_enabled;
+
+		if (!was_enabled)
+			drm_bridge_chain_pre_enable(&pdata->bridge);
+
+		edid = drm_get_edid(connector, &pdata->aux.ddc);
+
+		if (!was_enabled)
+			drm_bridge_chain_post_disable(&pdata->bridge);
+	}
 
 	if (edid) {
 		if (drm_edid_is_valid(edid))
@@ -852,12 +876,16 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 			   HPD_DISABLE);
 
 	drm_panel_prepare(pdata->panel);
+
+	pdata->pre_enabled = true;
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	pdata->pre_enabled = false;
+
 	drm_panel_unprepare(pdata->panel);
 
 	clk_disable_unprepare(pdata->refclk);
@@ -891,6 +919,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
 
+	/*
+	 * Things just won't work if the panel isn't powered. Return failure
+	 * right away.
+	 */
+	if (!pdata->pre_enabled)
+		return -EIO;
+
 	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
 		return -EINVAL;
 
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16245353110
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02F6F3A0;
	Fri,  2 Apr 2021 22:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41B66F3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:35 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so3144678pjv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4Ez8ElepMTV+MvClEGu3tQsRyt96EN/+CswsXajnuI=;
 b=P8fcZHl4ImlsURal5ihPb9+EUw8hnU1p0T9V9nhAhLqrQ9Tv9ZmFPNcCw71g926VSw
 hDLJeiwcvUlcatrIpw8ioIZC6OPLSin3euGxphNrBRE/RLS3b4ARCv9hoQ2FRtMy+AzB
 2BTg8WGu6zx/2u3g8eMThiHr6b56/Ihtyim9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4Ez8ElepMTV+MvClEGu3tQsRyt96EN/+CswsXajnuI=;
 b=SPmKR3L91NtJ6x4HlZWrg1nqfxb96Xyqi+pewiuPuB7o8b3btSOHZYNBMvqh07XCfZ
 jl7m/z9Z3BK84iWS3XZ2IHXN7w/VNghZ9ZbqmlbE7OYsRvcJWVqIZ6amAGokDft7e5qn
 8MLp6yaySGgQ4ctMjQAfevlcoF1YMpmpUr1usWa/IsfTWgze8uAjZvAkdhilViD/ztQG
 BWZprAGvyx44D1QmUHiBfj4jIT9ugsTGDAaOL/Cs5jlLlqRgcbhGdNpXVj/Ncz3xYKpP
 KSMbUq2Upj74XPXq6WppYUplX9XqK6b0DKaqhZJNFrbaTymG+CfKk7GGgVLFO4rfIm9z
 qKJw==
X-Gm-Message-State: AOAM532KVbLEWNv7qO+n6ZIFrdAW/n/vQQvGLDNymi2Mx2KkcrP2CseL
 EmozgXQ68HzPARzsPYB4kjz0pg==
X-Google-Smtp-Source: ABdhPJwqMvePBtECYQE0aZVwdf49bgZJbb46tTVxAwzEB7ocaDZqVJ0i94UhCf6xtSJelKW1maLpvg==
X-Received: by 2002:a17:902:ecce:b029:e8:b810:1c1a with SMTP id
 a14-20020a170902ecceb02900e8b8101c1amr5836469plh.51.1617402575494; 
 Fri, 02 Apr 2021 15:29:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 08/12] drm/bridge: ti-sn65dsi86: Power things properly for
 reading the EDID
Date: Fri,  2 Apr 2021 15:28:42 -0700
Message-Id: <20210402152701.v3.8.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
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

ALSO NOTE: Without the future patch ("drm/panel: panel-simple: Use
runtime pm to avoid excessive unprepare / prepare") there will be boot
speed implications here. Specifically we'll power the panel on to read
the EDID, then fully off. Then we'll likely have to wait the minimum
time between power off and power on.

Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Rebased now that we're not moving EDID caching to the core.
- Separating out patch to block AUX channel when not powered.
- Added note about boot speed implications.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6390bc58f29a..543590801a8e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -129,6 +129,7 @@
  * @dp_lanes:     Count of dp_lanes we're using.
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
+ * @pre_enabled:  If true then pre_enable() has run.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
@@ -157,6 +158,7 @@ struct ti_sn_bridge {
 	int				dp_lanes;
 	u8				ln_assign;
 	u8				ln_polrs;
+	bool				pre_enabled;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -270,12 +272,17 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid = pdata->edid;
+	bool was_enabled;
 	int num;
 
 	if (!edid) {
-		pm_runtime_get_sync(pdata->dev);
+		was_enabled = pdata->pre_enabled;
+
+		if (!was_enabled)
+			drm_bridge_chain_pre_enable(&pdata->bridge);
 		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
+		if (!was_enabled)
+			drm_bridge_chain_post_disable(&pdata->bridge);
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
@@ -846,12 +853,16 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
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
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

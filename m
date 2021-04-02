Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698E353112
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5D76F3A3;
	Fri,  2 Apr 2021 22:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1D06F3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:38 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id p12so304322pgj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtJPrWnxvy9nNmxs8bKL7DfV5E8REgE/CuweSYK12YI=;
 b=ADz4iZI0UBUy5Wgf7Wwt/rhv7XZcSPwsjZ/BiPy3B3JDfBcLDHbctBQwLTNBbC1pz6
 g4k+0i88k6d2fc8sNquHG/uIfTy/gd27MVhfmMN9ZddZa1EAbaRGkghaDmTziNgPp1Ro
 8IXzOvLZDfwIo5UUfhzQmhgws3B/vfTnq9H90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtJPrWnxvy9nNmxs8bKL7DfV5E8REgE/CuweSYK12YI=;
 b=CNcpqOSL39VU6vJ684aGkettrh46UhQx9+49/tecZ8rmykSxJ0Tj5J+Tiy15gXxWwc
 Tn7/Stavwx2ItM8zf3CEcPJQmsQIVtmkM6SL5hdMZkMx1Ay5vfS6EP8oodeunN0KGpqA
 vrWtzHFuUAsPB94yPnsePY8MSJHFwnJzfe58fTPhpOVxqLoRRO5g2OmAVM+Tp8HIfXn1
 DYT37pkWD5+5P32Z+j9MZQiobZxD/+UT7mAKRAifX8pMxqM+OTfTgKsqdif12lMkxo1l
 N1cIhGfN4F3Ehau95fnHSx3aa9vA19shLuFlYhKgUGScbhuL9mYG0pR7URa1sD0imCph
 ds5A==
X-Gm-Message-State: AOAM533PJSTUoyuJJ3hYjoo0Aqr33HTPw+ylkC1WDEcEt4vZoBsPD4Mu
 o1IpPCukKFwIupnx0z2HJ7YXbQ==
X-Google-Smtp-Source: ABdhPJxgA9idcvNYzBZWn5xNFxDlF2IAIYBIQdD07MjVFFMOqyHn9gYAPHAYrsH14tOnDwgGEQcmBw==
X-Received: by 2002:a63:4415:: with SMTP id r21mr13635650pga.222.1617402577644; 
 Fri, 02 Apr 2021 15:29:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 10/12] drm/bridge: ti-sn65dsi86: Read the EDID only if
 refclk was provided
Date: Fri,  2 Apr 2021 15:28:44 -0700
Message-Id: <20210402152701.v3.10.I7a8708139ae993f30f51eec7d065a1906c31a4bc@changeid>
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

Though I don't have access to any hardware that uses ti-sn65dsi86 and
_doesn't_ provide a "refclk", I believe that we'll have trouble
reading the EDID at bootup in that case. Specifically I believe that
if there's no "refclk" we need the MIPI source clock to be active
before we can successfully read the EDID. My evidence here is that, in
testing, I couldn't read the EDID until I turned on the DPPLL in the
bridge chip and that the DPPLL needs the input clock to be active.

Since this is hard to support, let's punt trying to read the EDID if
there's no "refclk".

I don't believe there are any users of the ti-sn65dsi86 bridge chip
that _don't_ use "refclk". The bridge chip is _very_ inflexible in
that mode. The only time I've seen that mode used was for some really
early prototype hardware that was thrown in the e-waste bin years ago
when we realized how inflexible it was.

Even if someone is using the bridge chip without the "refclk" they're
in no worse shape than they were before the (fairly recent) commit
58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a76cac93cb46..fb50f9f95b0f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -275,6 +275,18 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	bool was_enabled;
 	int num;
 
+	/*
+	 * Don't try to read the EDID if no refclk. In theory it is possible
+	 * to make this work but it's tricky. I believe that we need to get
+	 * our upstream MIPI source to provide a pixel clock before we can
+	 * do AUX transations but we need to be able to read the EDID before
+	 * we've picked a display mode. The bridge is already super limited
+	 * if you try to use it without a refclk so presumably limiting to
+	 * the fixed modes our downstream panel reports is fine.
+	 */
+	if (!pdata->refclk)
+		goto exit;
+
 	if (!edid) {
 		was_enabled = pdata->pre_enabled;
 
@@ -291,6 +303,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 			return num;
 	}
 
+exit:
 	return drm_panel_get_modes(pdata->panel, connector);
 }
 
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

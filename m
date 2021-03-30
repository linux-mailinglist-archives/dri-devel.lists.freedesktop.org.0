Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA434DECA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC08F6E82F;
	Tue, 30 Mar 2021 02:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C626F6E829
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:21 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so6910357pjg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OznxYj+eRPVb4um1OhPEH9Y2bcONmP2iXcQsa3vKzmU=;
 b=UJOk7rBZBFF9I7lwYBJmw01yx2yHeWcw5z0zsYmSrIAxjHV4hx3YLLroFJWN0TA7m2
 kx7hnYCBA3g6fJWfnrNU46vi6abv2rwjis0Lq4iRzRXn4GgWfff5PwW9SbAfzzAZg5oI
 p6jjD0bmPxC/qMblO48yxz/gnwV4iUqORCAwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OznxYj+eRPVb4um1OhPEH9Y2bcONmP2iXcQsa3vKzmU=;
 b=LwwWOjGAFLL+nsog4o2OXfLDiCBSAz+v+8rip+JPphzto9L5E8Zmuym1CeDuYdWfSZ
 DFK0bkN2cgjFs/i7WUGkTe6QQZFB4wuz+annSd3yoPUEPMtobp12mx2kKN0nKMRjOmQv
 lScXzUbg9F2aFXxXcRAq6ZC3keUJmK6I5ohHg8pShwSy3Q5oChKgvy7ZHSyB8byo4ZNr
 IFBesxEOm/PO18ud0HmwOWiRq0r53bAicxCio140/5tP3IKXUHV+pPRqgiHzlf3npXDJ
 ve+FbiHSwzQfbNv7aptmke6suzjC2dAbygFoWQr4Xpb3H4iX5ZaJyosQJKtaqNP+w/xm
 U9zQ==
X-Gm-Message-State: AOAM5338GfnL5Mn3G/qdfgGtc30e60Ew9KyQYq2Ofa2asfNcKGaqEVL2
 QqZsht6JyoGzX+oYb6XeE9D3AA==
X-Google-Smtp-Source: ABdhPJwdMyAMlvJ4erQw/GS0vAMriU7o2o3SCbSml2tS9OvV/G56Q2R8aTmlnqks8jfOmrfPN47vwQ==
X-Received: by 2002:a17:902:bd45:b029:e7:1490:9db5 with SMTP id
 b5-20020a170902bd45b02900e714909db5mr25817051plx.45.1617072861413; 
 Mon, 29 Mar 2021 19:54:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 12/14] drm/bridge: ti-sn65dsi86: Read the EDID only if
 refclk was provided
Date: Mon, 29 Mar 2021 19:53:43 -0700
Message-Id: <20210329195255.v2.12.I7a8708139ae993f30f51eec7d065a1906c31a4bc@changeid>
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
index 673c9f1c2d8e..92498900c58d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -273,6 +273,18 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	bool was_enabled;
 	int num = 0;
 
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
 	/*
 	 * Try to get the EDID first without anything special. There are
 	 * three things that could happen with this call.
@@ -306,6 +318,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 			return num;
 	}
 
+exit:
 	return drm_panel_get_modes(pdata->panel, connector);
 }
 
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

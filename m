Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4011EEAD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC6B6EE14;
	Fri, 13 Dec 2019 23:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87DF6EE14
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:46:06 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h14so392117pfe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v42ANoCuRY5G1cXjAYLdlEBR2ZujMsVzXKVd9Z2k9zQ=;
 b=Zfwx5vED1oy7srYtFqQ98xI3trRNrk3KnWek5G+uWhLJFKHfBWowS8Uk8GBeCndIlx
 51t5PCZVERnprYytis2tlVyQErvo4XmMiRqZjsOB1ARRTfgvEDw6DxTQPze1LluuhKeH
 zsHlrh5F9GD5AOddAGkkM5afZF29WbsfvhgZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v42ANoCuRY5G1cXjAYLdlEBR2ZujMsVzXKVd9Z2k9zQ=;
 b=bb1OD2UR4Vq1c707zi9C/+3yzQ+aXXPH7ct4M36plideYlorqCOlEWJ7u3koSylDzH
 /+k/G2nlDlglVC31EnkHumPK02UnlmyCl2Q9g2QGKaHL4SGJoRe/8w4vbJmUdEvpIlfW
 EPxpDYB7owRh01Hagz6SWuw3CWPtM9erHdTLWY6A6zf94dK1pRPIM5+GKcw1EzeJYaQW
 IlERzo82678/HrnhsdAvgTfYPAj2JUdtzvkSsCLyR6o8X+cNzXDxJIkxdrI+hF3wO/9k
 7GhYc1CiNNxEYY5j8+Rq3+N6cAr3HI2byrsvowz85FSEPT367E1kWIEFIReohgYWFCIP
 qe7Q==
X-Gm-Message-State: APjAAAUqeNVBDyoAC1pqwX/gXdZ/EIwsh+RjKxDIS1FiuDT6sGXpIDOQ
 wcMPwsB4p9QI7qSTnOw9TRSL+g==
X-Google-Smtp-Source: APXvYqwo4oDTxwhrjmCGC4SiPRl6kxhXhBokEQbPLjWUECdkHzPw90RxjJe3RC9pthW8P/MpeN9FYg==
X-Received: by 2002:aa7:968b:: with SMTP id f11mr2396374pfk.209.1576280766339; 
 Fri, 13 Dec 2019 15:46:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:46:05 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than an
 unsigned int
Date: Fri, 13 Dec 2019 15:45:23 -0800
Message-Id: <20191213154448.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 seanpaul@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

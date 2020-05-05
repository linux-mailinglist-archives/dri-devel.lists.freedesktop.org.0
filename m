Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26E1C4D50
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 06:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573B56E045;
	Tue,  5 May 2020 04:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717BD6E045
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 04:32:38 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t7so326468plr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 21:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGLmPxsShIHn4CHHbn8Pe8eVKKsfBl2KpXHBFAlksI8=;
 b=btGoVaOqEwDh281RyzGWWpVCibotYTf5Q5OZiRkLjKUSde0ATaySojqpvzC60y/oCY
 LJyDkuQcisPIKzP+b1dgIQe8h/fyUo5uDW32lSNQSGFw/rvCwQ28Kh1Daiv/5BaDtQgG
 BXISZfHmzwspCJZ+ZsuW6xjf5lZyTP06U8EVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGLmPxsShIHn4CHHbn8Pe8eVKKsfBl2KpXHBFAlksI8=;
 b=nh9c8dHIxmMrngACZUNWeUHqx9JNgMgQPPar/9KumSrML185sx113emcHSEqWDo4tC
 x92Brpfi7b23UYsefikOMSpqc4YKGdcdirGG/Q5KjyM2qCCr0gEMDHoPIpGfC2kY78Cm
 jpGn1U6WlSq9Hsf54LEQjjzQXuJ7XIwFjBPWkoEAlPBHn9aqldy3zo24g8dSJuL3F5Ou
 S7uY1atUpKqNB9WmQx1RIhRmgAVU6B/swmGNymKO5Ll5zP+Yi5Cm0o++y/WdmyB+CGHb
 cJYK/a9kVU4ZSGxySSO1mSciKLXxulw+j5KnpJnFfNOFOoDn/iB81DdiDQCo6gJI4/Rf
 iBew==
X-Gm-Message-State: AGi0Pua7GR6ixNMh39Eg3E8pbTlJJ/a6FfRLKmnRljmgvYsaPGoNNw5H
 QyvTApHgta7hWSMcS4W8hzoVXA==
X-Google-Smtp-Source: APiQypJRhfyblghgHdLN4pfxYjK2JQv0NLCq3d5jMQ6MWWmHOgq57l9LIwfyXHf0s/iviGLG8+DN3A==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id
 iq14mr608631pjb.146.1588653158036; 
 Mon, 04 May 2020 21:32:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id w11sm545075pjy.11.2020.05.04.21.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 21:32:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock choice
Date: Mon,  4 May 2020 21:32:29 -0700
Message-Id: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
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
 dri-devel@lists.freedesktop.org, Sandeep Panda <spanda@codeaurora.org>,
 seanpaul@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the rate in our table is _equal_ to the rate we want then it's OK
to pick it.  It doesn't need to be greater than the one we want.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..be000b0ca56b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -475,7 +475,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 				   1000 * pdata->dp_lanes * DP_CLK_FUDGE_DEN);
 
 	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
-		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
+		if (ti_sn_bridge_dp_rate_lut[i] >= dp_rate_mhz)
 			break;
 
 	return i;
-- 
2.26.2.526.g744177e7f7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

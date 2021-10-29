Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF94405E2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 01:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CC16EA92;
	Fri, 29 Oct 2021 23:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274F16EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 23:51:11 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id in13so5861086pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sxU1ftYobtEORyRdUf7h2tFOilrdKEVZj9kWoFnHU+A=;
 b=Cek8Pqoa3kTBzEvCHlQK6g03pKWiPdMuEbSIR2DvbOZhcYorZe4pfArMvrdOh2EPx+
 VhME9N4YnvU6d2mW9PKjgaC7hbL5HfB3FLqPX6clmSQDQZ7QovPgPbHdWHI+1x2LGble
 A1oBZf3NITgwgO1DEqHtoM4VF6WdNFm+kntGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sxU1ftYobtEORyRdUf7h2tFOilrdKEVZj9kWoFnHU+A=;
 b=e9lRI0nQsJ7HIKXUJ08UZi8/zWN7DDWvHSe8hdno8kFaRIBnHaYxOkKES4u4N27jZP
 ggtCw1mkWOQlhSBhW5vomxLA7SKi3DawpvexNYj2M+tzU4OTQb9Zpps8kSc+e7EUSJn8
 Sr7n2d37WCTHv037UrvVJPyosezdWAmO65Dv5n1gvimbtd7xH/B+RPeeo55CdhT9Y6Dk
 WSCrgpqtdxJOTXhXOA5H3qU/L1W6oW4L5lgOvwXgG5hxdwLWGZw+9Z8ferMkuMUag+Tn
 cV5IEulnkilMPdi/vtrVEw/lbixPbpg2n0j1bq56rX7aJQ0jRJbNduIbs4UsrRThi3dh
 4rgg==
X-Gm-Message-State: AOAM531R4VQ3fX5vvdq9xIzB+p7v/BWCQgW/WbH0G2HHQS7JXF5yLOSx
 09pJviFiu+8H82zIaq/uX4zT2A==
X-Google-Smtp-Source: ABdhPJw0BHR3PlSBXHziL290QIkCCOk3K2QATXZjWeBEI1Xs4J0qJGO+UQ/1pRQz91xOG39y0atcnA==
X-Received: by 2002:a17:90b:3793:: with SMTP id
 mz19mr23238207pjb.6.1635551470729; 
 Fri, 29 Oct 2021 16:51:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:be89:1308:1b03:6bc4])
 by smtp.gmail.com with UTF8SMTPSA id a15sm8507398pfv.64.2021.10.29.16.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:51:10 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Brian Norris <briannorris@chromium.org>, stable@vger.kernel.org,
 Zain Wang <wzz@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2] drm/bridge: analogix_dp: Make PSR-exit block less
Date: Fri, 29 Oct 2021 16:50:55 -0700
Message-Id: <20211029165044.v2.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
"PSR exit" used non-blocking analogix_dp_send_psr_spd(). The refactor
started using the blocking variant, for a variety of reasons -- quoting
Sean Paul's potentially-faulty memory:

"""
 - To avoid racing a subsequent PSR entry (if exit takes a long time)
 - To avoid racing disable/modeset
 - We're not displaying new content while exiting PSR anyways, so there
   is minimal utility in allowing frames to be submitted
 - We're lying to userspace telling them frames are on the screen when
   we're just dropping them on the floor
"""

However, I'm finding that this blocking transition is causing upwards of
60+ ms of unneeded latency on PSR-exit, to the point that initial cursor
movements when leaving PSR are unbearably jumpy.

It turns out that we need to meet in the middle somewhere: Sean is right
that we were "lying to userspace" with a non-blocking PSR-exit, but the
new blocking behavior is also waiting too long:

According to the eDP specification, the sink device must support PSR
entry transitions from both state 4 (ACTIVE_RESYNC) and state 0
(INACTIVE). It also states that in ACTIVE_RESYNC, "the Sink device must
display the incoming active frames from the Source device with no
visible glitches and/or artifacts."

Thus, for our purposes, we only need to wait for ACTIVE_RESYNC before
moving on; we are ready to display video, and subsequent PSR-entry is
safe.

Tested on a Samsung Chromebook Plus (i.e., Rockchip RK3399 Gru Kevin),
where this saves about 60ms of latency, for PSR-exit that used to
take about 80ms.

Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
Cc: <stable@vger.kernel.org>
Cc: Zain Wang <wzz@rock-chips.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
CC list is partially constructed from the commit message of the Fixed
commit

Changes in v2:
 - retitled subject (previous: "drm/bridge: analogix_dp: Make
   PSR-disable non-blocking")
 - instead of completely non-blocking, make this "less"-blocking
 - more background (thanks Sean!)
 - more specification details

 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index cab6c8b92efd..f8e119e84ae2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -998,11 +998,21 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
 	if (!blocking)
 		return 0;
 
+	/*
+	 * db[1]==0: entering PSR, wait for fully active remote frame buffer.
+	 * db[1]!=0: exiting PSR, wait for either
+	 *  (a) ACTIVE_RESYNC - the sink "must display the
+	 *      incoming active frames from the Source device with no visible
+	 *      glitches and/or artifacts", even though timings may still be
+	 *      re-synchronizing; or
+	 *  (b) INACTIVE - the transition is fully complete.
+	 */
 	ret = readx_poll_timeout(analogix_dp_get_psr_status, dp, psr_status,
 		psr_status >= 0 &&
 		((vsc->db[1] && psr_status == DP_PSR_SINK_ACTIVE_RFB) ||
-		(!vsc->db[1] && psr_status == DP_PSR_SINK_INACTIVE)), 1500,
-		DP_TIMEOUT_PSR_LOOP_MS * 1000);
+		(!vsc->db[1] && (psr_status == DP_PSR_SINK_ACTIVE_RESYNC ||
+				 psr_status == DP_PSR_SINK_INACTIVE))),
+		1500, DP_TIMEOUT_PSR_LOOP_MS * 1000);
 	if (ret) {
 		dev_warn(dp->dev, "Failed to apply PSR %d\n", ret);
 		return ret;
-- 
2.33.1.1089.g2158813163f-goog


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30C11EEB3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9066EE1D;
	Fri, 13 Dec 2019 23:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033226EE1B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:46:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k20so1868716pll.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1nojBCf3ACYVJFHPBZYBQ+QHefLuYc3mwl23M5Q8q4=;
 b=BwlFP2VxN5yIyheYiGfVUJDfU02ljIiH8mEkR9nkR5v18xNCedwkH/CezJqGykuC9c
 LpqfFJp+xSSFXkx2L//F4YDu2OhATsHjtx8aiyg+i4ZtyJJrODmjKdlxIdClOPZ/zxiz
 FWh/LlyZTdHKgzBKwjnn2Ya7tcAj053CW7/IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1nojBCf3ACYVJFHPBZYBQ+QHefLuYc3mwl23M5Q8q4=;
 b=DOnwwAoypUR3ir+AUrbpPrq6mSF9ieHh9BMeP3oA4qsTV3CR1pt6D791ElCCP5II1r
 irDrAUhW3hFCfq5fb/3vF42h6RCHuoXzTiYUHE6c6yov10sUhP0ih2WnjTSY2i9JA9JX
 HYMylxjE6xOYHwm+xCZK7hEy2ka5cnsswDMXN8NOyw5bRbZEM5NkTLX43YtAtuLaSnQe
 42g0EUGP6+DwksYxioNcYguQr6Pqa3emi1j5pYe+MeaU1asGRaBy7Mj3cDxLEfbCbDqA
 zlSWof4/tu9tCG9VEaGdvLsPnj7MY5hGSCFsSMYZdpvpuoOuPnt1uKMAX3aF8TTxXuK3
 C+QA==
X-Gm-Message-State: APjAAAUyPuQayzN5rtRJsGmhBB2n6IaNi2maXwQJZ/dHZ8JjznNZxf2v
 vNz2u0VQB2f2VbAR79i3Gzf1sw==
X-Google-Smtp-Source: APXvYqzgVQQVXnj76kvMizRTtrW7NoC5P57JSnvWfTjS9YLSZhqDVTeudipaBSu8eFK5QpmKbFVNag==
X-Received: by 2002:a17:902:541:: with SMTP id
 59mr2278359plf.190.1576280774444; 
 Fri, 13 Dec 2019 15:46:14 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:46:14 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
Date: Fri, 13 Dec 2019 15:45:30 -0800
Message-Id: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
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

The bridge chip supports these DP rates according to TI's spec:
* 1.62 Gbps (RBR)
* 2.16 Gbps
* 2.43 Gbps
* 2.7 Gbps (HBR)
* 3.24 Gbps
* 4.32 Gbps
* 5.4 Gbps (HBR2)

As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
If other rates work then I believe it's because the sink has allowed
bending the spec a little bit.

I hoped that we could tell which rates would work and which rates
didn't work based on whether link training passed or not.
Unfortunately this wasn't so good on at least one panel hooked up to
the bridge (AUO B116XAK01).  On that panel with 24 bpp configured:
* 1.62: too small for 69500 kHz at 24 bpp
* 2.16: link training failed
* 2.43: link training passed, but garbage on screen
* 2.7:  joy and happiness

Let's bypass all non-standard rates, which makes this panel happy
working.  I'll still keep the code organized in such a way where it
_could_ try the other rates, though, on the assumption that eventually
someone will find a way to make use of them.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index cc8bef172f69..cb774ee536cd 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,6 +454,15 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
+/**
+ * A table indicating which of the rates in ti_sn_bridge_dp_rate_lut
+ * is as per the DP spec (AKA a standard) as opposed to an intermediate
+ * rate.
+ */
+static const bool ti_sn_bridge_dp_rate_standard[] = {
+	false, true, false, false, true, false, false, true
+};
+
 static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
@@ -660,6 +669,18 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
 	     dp_rate_idx <= max_dp_rate_idx;
 	     dp_rate_idx++) {
+		/*
+		 * To be on the safe side, we'll skip all non-standard
+		 * rates and move up to the next standard one.  This is
+		 * because some panels will pass link training with a non-
+		 * standard rate but just show garbage.  If the non-standard
+		 * rates are useful we should figure out how to enable them
+		 * through querying the panel, having a per-panel whitelist,
+		 * or adding a DT property.
+		 */
+		if (!ti_sn_bridge_dp_rate_standard[dp_rate_idx])
+			continue;
+
 		ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
 		if (!ret)
 			break;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

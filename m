Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85456F3BAC
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D836210E107;
	Tue,  2 May 2023 01:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4970910E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:14 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-76937f5f9c5so44394139f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989693; x=1685581693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhrMWjFte7goMFkthyl+3kO5kW7x7TcIvC2UAKwMf6E=;
 b=ID1JuvXXaLMCf95WTEkk2TJJKto2G0IwIyP5dukwdxsKvv6+k9wvTf0ZW/8rB6Iq9G
 Zr9cdfS0Zm+DAwfcYuSXj3csRRYTcq+dqgwfOOiWevPX6vSU8C8yq8DhL6Mn2SwZ5k5m
 6Gx+4MXd56NJr9DFfDZ3Wm0SsfSgXsUDx1sNzDzfAcWZ/0G9P7CtwcwnBPAG2kUe/fV+
 Q+t++OufgZxqNj1XmNls0xVCt/cYMiFq9CPQQv6tKwAnU1EdD4xWF+TPj+sSLixJZmH6
 cYS+sGVy/YHVhOYzIx2a1YkrWkqPdWwquZmf0cUr4AGdwbap/KgrtTcXTnJ947vaX1Jy
 UZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989693; x=1685581693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhrMWjFte7goMFkthyl+3kO5kW7x7TcIvC2UAKwMf6E=;
 b=NIlP5AJwBZEa7lzB/p8PP6recD1sh4DvuA6UcInksr6FvZYx4sWDJTLY/QGlLHwYWk
 DiBBLh6YAdCkZr2Pkh3PTrbwreT5GFZpBwYPFDnoSxHBVBO5mgkOvFG5Jh3eg9S6A9bI
 xhIxN8ur8ysYnsStqkYsxNueVnbCrKIapk0JcraKd/kED2xRAGzRHq+63WVMiFpyngWU
 5PICdZ3pz6z2cOOlf3Wd4rJqZVL0NSuy+eNOnR0EO+FU/uA3EgoX3nQh8J2aW8Zj6gwF
 AcSjUrBYniPIqOONWJX0y54at78y8PJEdgTvItrYU9Oa7Old23Mnq1/ZoTzojTFzVrhM
 8Dvw==
X-Gm-Message-State: AC+VfDz42V8tvgpgunYo7e57MJX49PThDvwcMUgvI7WFzUtsBnmdWwF7
 9vmDJsBANMncN0Jp9hhArkgBRjW1zB0=
X-Google-Smtp-Source: ACHHUZ6jgYXGX6mtJyfGHfUHNtSJtYe7P86rVbqtcMJ4m+zA6lQ0bmX9P7E+oHlh4NkdFCZqHx4ikA==
X-Received: by 2002:a6b:f007:0:b0:766:41fa:e26c with SMTP id
 w7-20020a6bf007000000b0076641fae26cmr11441794ioc.10.1682989692703; 
 Mon, 01 May 2023 18:08:12 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:12 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Mon,  1 May 2023 20:07:55 -0500
Message-Id: <20230502010759.17282-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the pll-clock-frequency optional.  If it's present, use it
to maintain backwards compatibility with existing hardware.  If it
is absent, read clock rate of "sclk_mipi" to determine the rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bf4b33d2de76..2dc02a9e37c0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
+	struct clk *pll_clk;
 	int ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
+
+	/* If it doesn't exist, read it from the clock instead of failing */
+	if (ret < 0) {
+		pll_clk = devm_clk_get(dev, "sclk_mipi");
+		if (!IS_ERR(pll_clk))
+			dsi->pll_clk_rate = clk_get_rate(pll_clk);
+		else
+			return PTR_ERR(pll_clk);
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				       &dsi->burst_clk_rate);
-- 
2.39.2


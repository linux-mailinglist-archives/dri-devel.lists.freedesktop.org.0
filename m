Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2499B00A24
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3913210E945;
	Thu, 10 Jul 2025 17:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eMuuApWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9807710E940
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
 b=eMuuApWwfavrto/Bkqtd16nHUbfZe3kF7xFXVJV4fv3M1Ldz2BnAXBcJxLiSzwcT3wtk3d
 inPTNcAaNLeKv492jzph53X/z5XRmkO4xk1zewDKmhS9X3quJvTL4xhYQh+r+eGI7hGVNU
 7BMQ0wspagCVzuIORs4ocBNBxH+jjcM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-BEZi_qexOiylplQnFbbspA-1; Thu, 10 Jul 2025 13:43:28 -0400
X-MC-Unique: BEZi_qexOiylplQnFbbspA-1
X-Mimecast-MFC-AGG-ID: BEZi_qexOiylplQnFbbspA_1752169407
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fb5720eb48so38806506d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169407; x=1752774207;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
 b=hRUoJqPNeLMpUumtkBnj6qGcfss71CkfxB4xdOOzteCFxVyA94ssGFR56ifahDms2Y
 dGr9SDpv36aZIkXBPJSh0TYcCvq+6TPs7808hV4zd/6B3kRfFXO+XzhawMGUDPghS6pg
 XpD+V83hmJDtBQzmMY2ioElduMwqOAViWXwoVX5qp7+RFsTeSamT5ki21/60R7bKlDJj
 n/vUTQPSQQdoPKEoNzqzuzE0k1hd2kl0Ie1eSjGH3HQcx2m1e7kHKCO7j/x8oRtNjovK
 rWPuDgKBQh1cbCAK1F3mv8Lg+VKMUxStGR3yuZtxqB0tU3JDI2GoiSysBK8YzwhbMXra
 IMYQ==
X-Gm-Message-State: AOJu0YwzOFRzriN9hzbe8SExmfebjlfUGAdrTdpOYFlV9W9ZiUm1kir7
 BB4AXdBKVk+WOX2SKTSiI5Ri6+89VUEkVf4jgHbGhh+xWximQi1QGz/dWojCBH3ctiH6BtZYECt
 lofXGW0VbmlzDHxFaZX+aDkFjcweRQL+XrdFvOCpscRr8cnXrPYAW+ziaKs71tf1Df9tCy7rs2o
 w5rksA
X-Gm-Gg: ASbGncsL/YYhWK2xveCOaZjprNr8UkOMdc++miWiMBzVimU/k+e6aEL234BoQoRiFqk
 x0q/JpKT3IiE3F2OHQof3/P+IK6oWjR2uPsWiK33rx3g9Qx1dgy5FNezhkwM2veaUzAi5DtY+ze
 kqXiYgoFZQqPawlm9LQY9NKFl/B+LSQNQ98oT9ODx645fsIJZxABTopRRLHwbo2p6G7MZzy7Shi
 SsoajfpiZMqffLaKOblrm2uQLHmtozu32Wp2FoTPNOAtqC231Q5iqn47ARcgOi7l6pvvuICo1bM
 uXVIBZDSlPqUOJJiFGzsZ1d0ZD7E6tssTMK1vffaIgAF8f1pzNtJQYzs44dM
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id
 6a1803df08f44-704a3f6fd62mr2495816d6.14.1752169406559; 
 Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id
 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197; 
 Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
Subject: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KsHbBEA7pZQNfVQsvHaXeWCi9deKimHsBKKVDwO022s_1752169407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.0


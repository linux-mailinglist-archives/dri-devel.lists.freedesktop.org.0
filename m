Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97DB2067E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479E10E43A;
	Mon, 11 Aug 2025 10:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XUvkGGxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65C310E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
 b=XUvkGGxEe+h1WmIbg/eyl2fCDWGsH82NDvxo0Pd+C72IHlKf56j9dvQz/tlJs1YK+Vn5N6
 77LGXvnSvCT46SKgtftFqcYRB0rx7gnbKGCHkD8qb7R/BQ6YLSHF+Z29uoDT1WucT2ESoK
 TCIF087SsfZw9+R3BIB3tSGGeoJUZqo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-pMgTTI5wNbuHqXpou80mWg-1; Mon, 11 Aug 2025 06:56:29 -0400
X-MC-Unique: pMgTTI5wNbuHqXpou80mWg-1
X-Mimecast-MFC-AGG-ID: pMgTTI5wNbuHqXpou80mWg_1754909789
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e8072f828cso419676385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909789; x=1755514589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
 b=tCEwleWjjzA/FHcZLV0RWx/MYhReneB4Dxa7Wz39dKnS5/5Kkzmeqf/ITYm+SHl8Uu
 2n3oIVb6IBspwiGVZmv6x6lz8ufJiWKSj6RdFEuFQazWqbcyCWxd1KqigGbPCSEgjvzr
 YyHuo2eh6PNzUC7b+cF3h810ssJI3LqWGlzHsiPSAOrSklv2+HTKyFwYurYQOdhAp4l5
 vnGXTLXIgNl8W6Z3Zy+MSkLt71RrNxuIMoI9Pn1mRWkZRy+hb2XVt+FzVjApIH/YETlg
 73tDN+B1+gfJfV0Pj0x8zjcPon9l0nPJ2UyY36U9rSGiqVuOyufbABFSM6T2JeoJQLOX
 twKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzo3TPMq7+TaiEJZ6vk57cGqC7G7CFO9nxHFPH370ubJRf7vCiHapQkzzmD/A869t/WDjMsa9efw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcDefdd8zOiHcMrY9mluXubLGxKoTEGpAfe1KWzPHjgDXV7Oon
 v0puylwzUyBZ0myrqqz7XRYA1EpuJx3aEHpjTIzIueyIpyJA1Ridj4JQMGYrqbDiKqTa82Ag9dd
 nb77Z0FKLFPSIWfGeiiT+eU9myHUnSY4qQXyZaaJ+SenP95Zcwao3Nu+ppni/nCrTf4BlAQ==
X-Gm-Gg: ASbGncvleoKUpwye5pHapg48NrJveZQx1QKr/DmiAvB6PcYQHaetvaxkYCkm1Zj5V+Z
 n+CpsrV4TGNiVr094dwLhFU4O3eJjAdCAX8lcdyJzzusC5KhOV4cugZ5vGwITX4IcFMXKodgedL
 1A0onPNmNQd563qmeNca7Y/ufvxBcjZDfEuw/IJyWjBSC2bvqEZ5o465ftOc+UByftGI8artrIB
 SnXV6HKrBtBmf8fwjzZLOmoHCLSV88S4ZYjWCJ8Usslq+QUon62uxR4QRSZoLCQbYh6dVzuKuZk
 ZitM/3BKh1T5U1+4MsCtELa0RTU1xUVf1+QEp4TwYinnWY7l51y2cpZvJPNozY7N/q0paqmT7b2
 6Dd0=
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id
 af79cd13be357-7e84fefc2camr275376585a.45.1754909788890; 
 Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc+TLWI2xokcRtB+yecJngyy21noRPTcC3sO0sgVUYXnKnFuXDagMBjiVXOuloOtpZxIcGpQ==
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id
 af79cd13be357-7e84fefc2camr275371485a.45.1754909788147; 
 Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:05 -0400
Subject: [PATCH v2 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
 b=6DBm6LwfY0nfMA421HhZNkFETdBD0OvYJlukZJUarU0DQPM5TzD76GN5AVvolZqrFAvmrp1nP
 jvbNFGe7dHWC4XgQV+dlyA/bvSpVN7ZZvyR5/1pWXfn+rHkgHaXmtum
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E7XNFifnbyOQRJDzTHk7u6snQyyoLK_pdfSDCUdYO3c_1754909789
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
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.1


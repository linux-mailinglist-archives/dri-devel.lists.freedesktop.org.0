Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC4B2068E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10310E443;
	Mon, 11 Aug 2025 10:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JxyH2NLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55D610E444
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fe1/zFdrNglpQdcc7DcZ0ub2lnvduP/lEo2aekbxLh4=;
 b=JxyH2NLM6rCFUYRYUd0H/na4W/KeEI81Z9a/ypUPJ4oM9nR8OOx5FanmE8tsbDgy6K8rPD
 b/ExwlOjIo5xFGVvIOv6O8DJ7J2wScHaIPio42FF0sySFdqJn8z+pxcs0rd/wJ8RFkpI3e
 QRI+XyXJvHWUaKjGACfgnqSi2hwbV2s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-O_f3wBtfPBmyVImSTEh0sQ-1; Mon, 11 Aug 2025 06:56:45 -0400
X-MC-Unique: O_f3wBtfPBmyVImSTEh0sQ-1
X-Mimecast-MFC-AGG-ID: O_f3wBtfPBmyVImSTEh0sQ_1754909805
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b0ca325530so9737071cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909805; x=1755514605;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fe1/zFdrNglpQdcc7DcZ0ub2lnvduP/lEo2aekbxLh4=;
 b=LKexsdN7WXi9HGSzumVv1Pv/YEQGieON7ynmkT+ALsYdi47geAW0bzHS9ta/BuLMYI
 c3apwzu6CJJ/3MzMLtnWboK4L2WKbwhegbL7zDHSZ33Rj7w7knAYq2I9rW6IZnCtZylL
 GiV4Tg1O2yVxXJtRyDNNqj6pryTL6cF795R8zBPXrLd6Lhx2ZOdrfWgCigca5X7BB3o7
 129l0V4/jKZvXM8r62diotFpwKhVTISZPwzaNxXwTqEBk6tT487q2OSvSbM281RF7aDP
 dhTPT/YsxAxtZFEqoHc/jynYGDXqGWesVeCTg4GHr50T5H6LdO2SqLalM3dGgip/wPO+
 mwbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWab8aYUzQxN7BGpT456TcrHOsxjaMj/8rJfOz57yjcIqPxy6G7I7Iw63QCIR9DBGZOu/yqIWgan8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfEMXkUyXWwH6p82ELBonDwDt2ruTPLFT0rp7dQA+L0QNW0YCu
 Jxz4kc1HsIYkcwx46C4lFq/12Cc0kYcc93w0++YLyBxGkoLrZGLKmPyeT6Z3PPRoHm3aUW/PKco
 T21ldWFCuI0Gj013av6VtVHIJyc6sHzhht2nl+ZM5Q01fp+4IZF1xJzDi3/ppTN7ycffmEA==
X-Gm-Gg: ASbGncvr+Et74tox3vNN6AT0T80DTTZe9/kbWzNLF2PcS24K9vjIC9nbMpfA4Nv7nrS
 x9FMvB8TMLE8sfltOTEJPC9Q+3ELN/giXMrECliL4YTkaZb/OeEZaY67NMhnSzElqGvI8QAORyA
 W39aeoX4rzw1W93rQe7l9mWHbJvHRpKEwWrAz219PFtvjjJ206o35z2P2wd3MLMowkGjD0BDeKF
 hi7w8HtHQ26BA42OV6v/+uQHDTH75oSPyeWmiycMd1QFFkP3n+XXpXx2EMn36XzHktJGjaTNJZh
 EnyGMu3sc/K5xStGeTLu9sbgGRCAx7D4uTuSaA9GPI8xJJMr00SC3QMO0WNbj8Ut0YyGcfQZTaZ
 jG8M=
X-Received: by 2002:a05:622a:164b:b0:4ab:81c7:b992 with SMTP id
 d75a77b69052e-4b0aee0416fmr177626461cf.41.1754909805228; 
 Mon, 11 Aug 2025 03:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH84pkBd6GJf8XCR9+s0wYsjRXbW3CjMG1+xiMebELRnnC0y+m6C0KXWBUqdNOSAQDFJQ+q/g==
X-Received: by 2002:a05:622a:164b:b0:4ab:81c7:b992 with SMTP id
 d75a77b69052e-4b0aee0416fmr177626021cf.41.1754909804709; 
 Mon, 11 Aug 2025 03:56:44 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:10 -0400
Subject: [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2470;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TQX7y0WLJPoT2FXW3ljOONLbYB3hMMDCH4wBpr8HvE4=;
 b=lgrz8b1APu4kFbIpIygfaPAMyZa9PSq0qCqlA9d2JnXNchMfPplzKOoa7IYJs93TVO9unUYBZ
 Y9qrAO5hmIoCqBBrlG0p/QgoeneH78eck1EdJ9ad2HPr3tup0+0Nd5I
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JqHh25DyZhEdvNlDCQa9S-6fuJVDwb6a7-GbE-B7uBc_1754909805
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

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.1


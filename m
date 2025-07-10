Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BEB00A38
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123910E94B;
	Thu, 10 Jul 2025 17:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C1NKOcA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8EF10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
 b=C1NKOcA9WOjno+qVJncqzTsNd6tK1OAbQ/UwBy4EBdMnt4Xsye00ti/gS9SWSzC72f3Qme
 7/4nj1LECVyixuEcNUN0nPDlCSFLDGPZNcQ9nKJJXF3v7bGm4gP1VEyNxbQNKMyEYFUU2b
 VY73g0YPuvBXipL1Hqt2qlcEP3OjR1U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-V5YwbrhhPgiow9SN48Uh5A-1; Thu, 10 Jul 2025 13:43:46 -0400
X-MC-Unique: V5YwbrhhPgiow9SN48Uh5A-1
X-Mimecast-MFC-AGG-ID: V5YwbrhhPgiow9SN48Uh5A_1752169426
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6face45b58dso19844296d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169426; x=1752774226;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
 b=YVFH6MXO80USF1rQHkjvE8mKL8wExZHqSFPmymm+my9l5TA+j4PrZsSdgVaksMxkmD
 4ycnW4Gvm6yB4x7AvX/38G+42gkpJ44B+9A0Tdo4rBgxrhj7Kr1Jc12qGdtkaM1Go2Lc
 OOwgAZF/8PIwn05VF+wsLjkHoIQQ34F55mNBtrbaMtqxhNRoHYE05vL3+wZN+TfhPl2v
 i2YTQYafhhHqs7tyL0zz0vZ4eLwhlr3KsYI/Z3BF9ofs70huK6aRSUZGs0LdDZiJoqOU
 3AvnLoGH3rDReHYf1WIkny7IEAl4cAAg4fCBWzciAGHY9/xoovZidZ1M6bL4S4hqvNPB
 Tabw==
X-Gm-Message-State: AOJu0YwXgISaXZQroTRZV7f+x0SxzKjjU6TAANYt/Epc6frFf+dyWrL1
 F10syadNDjajo6ROyVfqpAt5Ag8boHF+HTkkFUgLkp1D+id/znnV0aOsWS65ixEa711ZiJdUlFw
 x9VXOVTIrsNurXFqw65S053ldMOA7WBNtrSOtufYg0iRNb8KFzO2euDW6C6siCjs9i6Ei1A==
X-Gm-Gg: ASbGncs1OQWXH2k3011s08hARWZa/+X6GaUbnvMX2sVmJGS81v18OPlumeo0l5I9OSj
 Ju6cLEfF3x/XtPW9aC52ci14AU/8k48XhxtWwS6gikWzndavGGv4Whg3vSbU2+QTxTpPnFne92a
 aNRhNcyvz9Elt8C/iKxvropcNQL8i+zGXl/IgWHA+dDp9lCErmWr2mVqPcmv9OICmWiErogtkUa
 cADk+zMeXWJfkB9ep1HWKgBLg6Qw112+soqSf1IpWoSW6RJXd1idi+C9iy2FIJ0OSvCa+jbvdQo
 ts6o6iFHFb59WqtCtKorOm0aJu5GQ7VDj4MU13F/j/9UBCJR7Uk5v4mSH2wE
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id
 6a1803df08f44-704a4083bcemr2613836d6.7.1752169425801; 
 Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxO+/+2HUAUPTiUYztt/lC4Yi0Q22OZoIfFBMZk64H2H2sqirYgZh1L3qOGgIkQVmmCaX6kA==
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id
 6a1803df08f44-704a4083bcemr2613296d6.7.1752169425386; 
 Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:10 -0400
Subject: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2262;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
 b=l1P9iwEOFZ7iseMUGqrDwyTv1j/GS/74kLm+7ZgYbXOn1R2j8JwTxirCensojfrRCiquhbnNY
 RQW74FdbQM8B7MkeQZA7rAthmyuLBvNMin91wee7+2bXtn9fga4VsSS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q9lPpS1oV2bK6l_ik1i97Tc9PuE7UaxinTUiB07Pt20_1752169426
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
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf726d5d5440343519c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64) req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.0


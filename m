Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5BB00A30
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1690A10E93E;
	Thu, 10 Jul 2025 17:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LX+x9Dos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCE410E942
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
 b=LX+x9Dos9RdrCe1Oke4Zc21wLGtm4y0Rg73OC3WEL+JH3cN9yiOx2LeTztfZ8eUddqHdzp
 7KKkifqT13onpo7PfqoafoP0gpaSwA5lcsiScrStxJxB+S6LSHy0CnMT1WQ790Gl55CVca
 MP+r9VUNH5MNADYlFwdeBF2xZB4l+Ko=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-y-nwoS4mOAeJ0s0cY1dGeQ-1; Thu, 10 Jul 2025 13:43:33 -0400
X-MC-Unique: y-nwoS4mOAeJ0s0cY1dGeQ-1
X-Mimecast-MFC-AGG-ID: y-nwoS4mOAeJ0s0cY1dGeQ_1752169413
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb50d92061so18250326d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169413; x=1752774213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
 b=W1u5FaNvWm2+BPA+DSXYk5k1XA/PXUGU10ctnC9u6z/1YseXCld/ghgmJlkra4qSno
 vLDfVxriM6z38uG5UZD42jdz0aIHpde/bS05ZB0Llu3u4vTRwpNKe+Gp2hJB/cN48/jD
 kMm044H+8YFTr0Ni0kjgmyKhYiSvNxR4us41VarQHA/2Koh3UciGxgQ4uqHUqDwA4P5M
 9IJ8rX3J3lrQKkjZpG2zEPmq3lLdCHM8dseczkWXpwHO4gasq+2ANodqw0hI3PF15o2u
 mQhPhFo7TS+pL+deo5G9QAAbVV6LTtJIw90EtoQb1VzZfOSKtF6iSMNdfF1aJSEYZtIY
 ygFQ==
X-Gm-Message-State: AOJu0YwAk+XcTbcqRcAtLHD9Pf920ExwgqtoBwUXs/5aNbG4fAlGKA5i
 y52WI+P6NdOI0oH8INk4anqWSKO1R01iwWvSuGqHgdmnfT5OhUDPcJO6TZOXEq2jllcW5mJHyq+
 ILn6sd/JB168CM/ZdFfJkjNz1wSZnzuIX2CdE/0NFyzHWo/SMMi5xf3k/knYAgq3vOiPwvg==
X-Gm-Gg: ASbGncuLWdhO42Md5Xy/AAtEiC5mGq3u9dE+E3NGSSuplUoB8lMDpDa7q3FMcLQq5Bh
 dKWAKkId87m9m2pKSgVNJz3cJLXnLhcmtFU99lIJs+i8KQFIwZQ+wwsSyWHIgW6K//K/4F0WqgV
 8HCP4KGyjt4vAD37gbJ2Ijw+qyYIjS1YK0STgBwQeI0WsgXH0246XYbrl3ORd+8bXAcIrdYxcP9
 Tp9qCmBcMzIQ0hxw7XtVyoZTZc/i2NIybVN3wbgnxHq7MSfpB96nIwQADqfFEV1hKROuKS7vdDe
 9lqeoA/YtN03P2EJxxPo7g4h83+DrWC8xV32yhGkOv10daB5Qllge7CApykd
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id
 6a1803df08f44-704a3a4449cmr3580836d6.38.1752169412780; 
 Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpu8L3YGRW12uiQDpOxMNgeR30Y84ZsZlrx/wXIc8LbcnhH9LwZm0nYnuoy1dfBl7P78vOQw==
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id
 6a1803df08f44-704a3a4449cmr3580236d6.38.1752169412340; 
 Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:06 -0400
Subject: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1663;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
 b=0pYUMWvjxgx4WfuoWRCVGEVL5ZYYPMN0neD5N8OcfZKIHag1vghAK3SLtnfFRHjfYafmDTVi+
 fTHFTPespiOCXPSLsOLNifbUMGk0HbP0Ww4Oh/+lSRoq6wnUOICkRwy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: peaXneo2k_iVmyL2StF_NZWPkwwopuP8unN0o6hBtxs_1752169413
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
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.0


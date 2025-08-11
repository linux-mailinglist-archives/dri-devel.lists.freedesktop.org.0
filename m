Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA58B2067F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D4410E43C;
	Mon, 11 Aug 2025 10:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vlbpd4d1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0532010E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=Vlbpd4d1GWLigeSUtZRUv6DKjNBdXibb4g9JbYbVitRrPiFoji9hYKRStDLadmK5tBebGE
 O8pfANZy2JB4mvj9zgRNWtcrWGCIF4PAp5CDs9jbUW2m0xzVyPlEO/n0D/CWyW+5FVEsWZ
 +c3yXwS/mQYrfBi/vxjzhSLMtzshwp4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-gCdt5x4ePL6TXV7SqWE5GA-1; Mon, 11 Aug 2025 06:56:33 -0400
X-MC-Unique: gCdt5x4ePL6TXV7SqWE5GA-1
X-Mimecast-MFC-AGG-ID: gCdt5x4ePL6TXV7SqWE5GA_1754909792
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e696444d0cso1003466285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909792; x=1755514592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=oAgZWZR8tyRDKCaoKLb5bee8XS2TZ5SSjmSFfw6T7s19C9udoXEVyHAkKxg4SgKq1u
 xxhGoXa7eMuHs9q0rNAvvgfH7032N1bJXF4F9H3Cj44UUeo6rbcerkZVG5i3wLCWqdEx
 ejkofiVWsqACcHwgi+99p29yPf7PaBo6tHSJonozcBUiv+BS3ISOf//qXkMRmvWvzb1d
 wkcxHLuurXvjBcZwWR50s7IDMfemsrP3WAXB/bxgnnvuKnnBaxVnJMFocVIqK5fvFw7n
 aub/4zHo3eq6cGNTHVBNUJlesTa9eLvFN+nmsaEJ9zcQmEGGl7LeE8vLi0POaGtvT7+6
 XQJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHAU67QnsLthm6Ek/C13omsLC9pCsCMW83aySXqlNdcOGxkEssRCMKxCtakym447yOV7JSphZcLq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlsb8vSxpiIS2+yv/+Jd5hAEANSeL0JRTzBPTZCeuaaVOyxrKi
 oXzXnnGZacK5GyF2y+3mUiAJL6UE7Q+wQcccUQTXoRNC0PlBAL/J2R3Zvy179a6+yOwrUIDsyfx
 NXf2I7iKAMCtIICe3ustsSdthT8rtyHRjyL1lL1DCgCxp2Kark4GX0P8oxRVbpS3g4tmKPg==
X-Gm-Gg: ASbGncvCULUAo4+4uY9AId90VnNZJ7xkmn1bOdrXE5DzDJ6bT+DofEazyBGAMjcyV4b
 pi9GhWcDsNJXmcDGl6vuZOSGUvYMEyljEN7RZhluGfMgZkDEzTKtaQDywuQ885Hy0GgEBcVvswc
 AWPqs9eiS54O2g0UtHajknOPwDvlcwBPcwEjA3U8KGhBw5w+JrdLXMDHkvqte2+Hla36LcF42Cl
 mnEjguQga6HvCcqI7tLtkYl5fNSpreV8Xq8FkZRiuntkh0NaADu9ZQgALPPD0cVEEpoBCM5EVye
 57uG07oJc/YS0kLPfdDPykZb+LcYpSX4dZ0s+IxQJIHiYoZl1yL0V2ksAPWESbHMXawoxh7lPUc
 gnKU=
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843254685a.16.1754909792427; 
 Mon, 11 Aug 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgW8gZJYQbVSn9A8dMelBcES9raZpoqJep5i7D+EdYN7YXUJOpmuR1qZ1AM51jM57roxoq8Q==
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843249285a.16.1754909791988; 
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:06 -0400
Subject: [PATCH v2 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-2-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1730;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9BXAN9WaQXGACsWVgeakYqAdywyzgmh/IMziqVvQDEg=;
 b=ylupjg1fmCNBXXxO3X3BdCWItZxz3hbcUzYzU1GUNiNNWUiYrAb17RJCYD00k/EMPQMfWhWKC
 RXc0CDE9VnwCgzocNA8sHN+o4QXxCM6UpLGynPKDC6JbO0dbhiFFntj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -LWrLyBO0KSM6HuJGpgUHUZ-4D9LmQM7_98IqN0j3ko_1754909792
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.1


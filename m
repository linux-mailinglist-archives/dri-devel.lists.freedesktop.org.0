Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF704B00890
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B8310E932;
	Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HB2poYSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBCE10E933
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
 b=HB2poYSO96xC0Jt+FfNhuQl/gFV6qK7oTv0NUgdocv7D+HJacJYKDEfbctTYzzRgSXWsYh
 Mc5FmVeAnyGrnF9m8vM3iFN3rVspcl8vJYaBQgueNo6lIxcWgEIoAuMtN7tUVYiRhds4vw
 DjY+aKb0IHdOXbbNrvlbfGU1dEhngp8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-TVdyNOaTPwyXHzgdFDcUpQ-1; Thu, 10 Jul 2025 12:27:55 -0400
X-MC-Unique: TVdyNOaTPwyXHzgdFDcUpQ-1
X-Mimecast-MFC-AGG-ID: TVdyNOaTPwyXHzgdFDcUpQ_1752164875
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c790dc38b4so227263285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164875; x=1752769675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
 b=lh4IC7rn5CjkJDXdtejbGTYZwz+KJjQo3EgryqaziA8s9N3RhICtQje/u6nRARU8x9
 YW+z7sY2c2TA1cLK+r+vy2KwzK4A14aJrImph3YIKYY1bHIBcWv/da/1GcxdZaoaXMyu
 NDTPdX3feYg/9UrTWfaHsAdcLRRXuUKAeLejdVe+PHGw1iCpImpBG03bVe4iAZiHix8g
 Sg5wNcd3dcnCmJ6qZmFxp8zr+YQsbSa0he3h3qbSuDoh13Ki9KVt192XkfN0ZOaZHico
 5ZRDSgwM7DeD8HZbEnqgWE4SSlQO1AshDytEBBp989mhC3gUOu1gBfNOpwOpD4mVJKR6
 Tt/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu5JjPGLnF6eELn/i0W4toIz1fMtHXinZSt7zl3VuIA4KgcGLJ2UEkO3kXN4WQSaxApTHNSxgUjR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyY/yVsYUuxUwEZqFXKxYGNTso33WceK8xKJqm1DMXKWa+UEAp
 NoMyBoaf0l7jBmOmqvfUXqjmka9HHOSGkS2enZ9lvz6i8TEk3CPqxi7FeURjv7Km4v8EXThqtbg
 jzpJZU2DtJzVeLRaaUooTnFdlpxvFr0JNNSbo9p6iVkY9pivTAduDQt6ZV6TLiql32oqARA==
X-Gm-Gg: ASbGncsYRI91TLuRGPGLLOw7UszVyvYP/T3FrR00frfs54OWDjeH6Etsjs60bmHUOi/
 79Or9PpuaNvyxyHe3NWyPSn9LbQBgCd/+MP0+KNRdbih0ZeMSASINjGA0+gVhZE+oCgXpXMi2ZT
 pxEeFyl3VGUttWFxnn0InhIJmjJ8Z/Sy8j//2/eJbJfWYPu5rRPG9Lj+hTLpk5TVSIOnVrKXyrQ
 OvDxtoAvmNRWS/79JVfpUD276Srh6ENkIYoeOBzgMJz3f9ANEo7X8UCAC40Pgrsg1EmHWtZb2VL
 6BYVxEgngD4ahFuz9sBuiDq7Vi9CjxHxzpiiJzWBHyOdLl06d5aAB9U5Gwvo
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id
 af79cd13be357-7dc99c97b06mr637918085a.13.1752164874729; 
 Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0LILioTmsFFFim3P7vjwaGEN2yDghNBYxo2rYKbBHf33eWtihemHAGlXYjN5wVdu8ijbLNA==
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id
 af79cd13be357-7dc99c97b06mr637913285a.13.1752164874254; 
 Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:29 -0400
Subject: [PATCH 3/7] drm/msm/dsi_phy_28nm_8960: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-3-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3065;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=LuIdTqZOB0IRg3CTS/bE+68lhiU63BV6cIYBbNqOn1E=;
 b=f34Vu5Am3Epc8RhAvgL3lZpMgFt7lkFGSFFJPkt5Aq5xZNEfkcTpI3h6rM13pyuzPIwSSvM1F
 NgAw7WN4IMXByyDaw/F9whWSiB6hkeMO9L2CsMqwBUVASiJ/wkk3IUg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k9_q0RmqRm1AbA_Isdqckwu9M3bNF64ydRbS6-MUk8U_1752164875
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 +++++++++++++------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8d234685c1aa3d4579e3dc766c000de1909f87f6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +296,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
 		return 8;
 }
 
-static long clk_bytediv_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_bytediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	unsigned long best_parent;
 	unsigned int factor;
 
-	factor = get_vco_mul_factor(rate);
+	factor = get_vco_mul_factor(req->rate);
+
+	best_parent = req->rate * factor;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
-	best_parent = rate * factor;
-	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	req->rate = req->best_parent_rate / factor;
 
-	return *prate / factor;
+	return 0;
 }
 
 static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -328,7 +330,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B16B1FCE7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A0710E2C3;
	Sun, 10 Aug 2025 22:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="STG8J45A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBC910E2C3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
 b=STG8J45AD+ceA/9DBiKAsNZN1OqegcradKjcfVE0DRCgCspIbnwAdb8Kyr/hxi0ER1SG/S
 uW1ttb4V3YZXQ8XGtuLhUzcIRbPSS1DoS4mOdY4u+/JNfZxfChiOGHjIXssWbytEhs/BBp
 I6Em4q/5zIMBQQgSoUPGS4DwFy9QFwE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-96ijZHmyNDi5MfwUwhvXdw-1; Sun, 10 Aug 2025 18:57:52 -0400
X-MC-Unique: 96ijZHmyNDi5MfwUwhvXdw-1
X-Mimecast-MFC-AGG-ID: 96ijZHmyNDi5MfwUwhvXdw_1754866672
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e696444d0cso928097385a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866672; x=1755471472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
 b=bJLosnhijWoLkgzuZi9yPbov1PxqmZJIk4TS3yO4gd3AXcTIspLvcjuGzEFZXmVToe
 XioMgUytY9ll95w5nnGMjIy+fvwMcVAv/qFIoSrmUN+RB5Givby/lZpEm6iBOw30ufkJ
 7wRrVm54NynLTDWDWtXvnbwON85+t2/4V0GOaFwevFFQzo35GWj5CYuAKMSZvwfT9YWj
 f2FT8CoXLLwCmhUVPrbzjnMHFRTZuM9ZoG7rYUOBxGi3Pbd6IJAXZQaviV1KQRVNJ7uN
 +7Steuc92Cvr/t4FRjizGJL2IJmvh+VQpxwGzfQUwA7qjPW4M8gBXorkdh68H6SJi46L
 L52g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX73j8fpb3bw0tOv06sO2peb0Vj2pvC/4N9B7/NkUDld+9tlJhr9bFIsNTlSTyeRsdnGBuxOoYY3uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrtCn/JM/bSez6MHoI+umnN5LhW3P2U3SFt/zPpQsO5UCjuP9g
 1EFGxMWzMjCEfrpMmT23QKMlXDA6LhJv55GosEN+XB0NF6uTDFJs6lQBgOXa57poI1U6oQKmVO2
 b4spa5KPBYlZaR7tm1Id8Q+a9UO30ch9k9qlcYQuzbXmIZZeGUJZ/CG3cANH09SqBN2pviQ==
X-Gm-Gg: ASbGnctSpLPwesi8WXcDdP9PHw9KTgEpBbdVKhJ6XlE/KwOHt9Zj3fbBqy48rqTacNV
 1IWbSKqzlAMfZn5JhIdchbC/7zSJbf/BKOMn9pruHTSmHGMH83LW/Di7M+I4dEm/CN/pOV5dehx
 ogN94MsywCRKJ+QsVYLWrgkTDKDKLHD9ktmsjYRh9m1gOpYAEjHDA0SplfGHbkPgHV0/qvMVFtN
 xHKOwtDs2a8uoTIePozEY14+zhRpnuN+V/K3tAe9gVakiRWxb/3R33GWPWUFhwYl53yComxM8BU
 zqcDCd5oeqV6jExu6TVgUPw2Ot3++BsQX1t/95EBg4PqZmkZ4HMzHj6hx0wsLmzy7KfjKEE2N0c
 hNHDZPw==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id
 6a1803df08f44-7099a19aad2mr137563016d6.5.1754866671703; 
 Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8jqqdlU+xWojFno54cfUqsUBZEN8YO23eSx1vJ00mPnhAbDT9uCqATLlZeCwNyroK4P6n/g==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id
 6a1803df08f44-7099a19aad2mr137562776d6.5.1754866671327; 
 Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:27 -0400
Subject: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3029;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=S1ThvUuOJst13Y/YlkE34LQrjuUVO54/oWHL+6E9CBo=;
 b=4rVxfvm9gI5nV5UAVPsesymzsnSyxITGfXVS5e8nQ7ETrG0DkGZDJjcM2GeRttJ1xTdECTbGI
 s8fyPCx6Vs0B/8HLHCZbs2HwuxniL7G5vx63VQcoWh5nqmwlomL+2OO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RPlZebzc4qpK9NW_0h2k2_kq4hiO6_z9Y4Nc6F8HfmI_1754866672
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
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8dcce9581dc38730ab725e0e435ab93a04c527ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,19 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_28nm->phy->cfg->min_pll_rate, pll_28nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +294,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
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
@@ -328,7 +328,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.1


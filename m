Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D4B0088B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B2D10E927;
	Thu, 10 Jul 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GYMo8y91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5A110E927
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
 b=GYMo8y91X/8JpzsTHmBwXm3AAAUEFIe4zgxNZJ0/K0mZvIjHH5t9lvvdzwgQyUCt656for
 1lMcyaLcj1VkgoNEYYW+0HfIRhQI86A369eCBZxVpapOl8EWx4c9EzVYiG6q4FhVRgz2Sx
 Wg+xTX0GULfXk0971vqT9W55rQ4oCj4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-DNV64qDOPJmdxVjtPQBmlw-1; Thu, 10 Jul 2025 12:27:52 -0400
X-MC-Unique: DNV64qDOPJmdxVjtPQBmlw-1
X-Mimecast-MFC-AGG-ID: DNV64qDOPJmdxVjtPQBmlw_1752164871
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d399065d55so146016485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164871; x=1752769671;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
 b=pUiUI603xw/7/lReoq5C30U9Coso7HbVcAP8Ql4csaeCW+sDS9pSGNMfYzipe4uiyo
 pM+3zZ6YNNJT6j+R4gS8nghkcPxPDMQJrVcH9bzAS2CYs3xZ4fRMajzPkQi0ux9V0oAN
 wJMUekiDuxsH1CpionBs11Jw2CJQVfpBJErLSGaDwtxohQaImQlMWRM9I4bcudZ3SVmn
 GHj0UsXIdz7mHoWBLuS4bTkJoFnAM21IdNzOHxLDjF65bnswV5gn9s5iV2ZpjyOa2ZKF
 9GFQsKn3GMfUM2e8g9Ab0sKy8YvZoBXmOFcGwNGaO9es0Lkx6e52lh8Z9hISkfaG0bED
 YuZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSlATbySGXaWhf+KIsZrjOj06f9r5OLL8YF1wxq25kLH3XpYsD6TsdkLIvjzYg5UR9UX/kBoTzVZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJLsS9J00h7AEBTZzItZ1DaKBgvnVz25iMRdl4Azm+bS9hy/Rm
 VMJcv7KKzA7T05iyMO0oVYTULLdYeT+cD63BKIe0G0mIgEGfw8seVBEblgUfuYpmDTdpyB/I9pL
 GF3j34r0HRQqhOi4u87ibxW2vBVuglePOSTSFkuCjBXUzAZ00BcnHs1MNxF8huBniBILy7w==
X-Gm-Gg: ASbGncvGSgX8NRavSgCjqLQZS7kehnWrvxOKvjsAcU73uLY3Hdi6q4TzMyV5aHucqSt
 CVyFZC48gNKhqZVp9Vr0vW+QQ0nvJEY9ov2FY5AAfguGwpeXZY2R3BH295hYZHWlcP5/1StxNwU
 o0dmuZZqBQvPRdnakR7fVd4xu6MbXRp1b7iaA+uEZXac7HzCJvNJaD1UAhlf/x/gqQgg/O8M/N+
 lQFzSBwf+DX83zw/rfFHIyZVfIdqjHQOI2ra7m+bUaNJohdsEBZk4ZH3+YNuSMFyv2TksCYLTp3
 dl72hzSCMnl7rCuADys/HfrYfhjtGx/PJfsLU1KF+VIWlZjCLAKKHRs/D9Zk
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7dded1f16b8mr20791985a.43.1752164871201; 
 Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOyyYlCkE/VGPozckcGjQXSedTTbkLOtyXFJPCLzGJ2sRyA8bY8gLQAjWSxObzTseQLmP6BQ==
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7dded1f16b8mr20785785a.43.1752164870612; 
 Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:28 -0400
Subject: [PATCH 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-2-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3196;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nqAod6ptbkqWsY1ReyritvzpOhyiZE8UL5uK1TlylSY=;
 b=OoNhhsZUbmAMdwPUtra7QULaHqehIf0/38bmAqXxUkaMeC3doTAw/V/9TIJKb+x9w7DYvOig4
 Gf4oVrvhKVRAcfxi2pcc58T03+pEYH6XMrMX4bp1bgSK7BzZMg4R1Tf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KJSjauVdZrna1bTkb9mpAs6e8r-KJOGmo_dpwXhdo_4_1752164871
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 36 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..4bc9b7e44ce775f676fc89cf4565adeb309f0177 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,21 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	pll_14nm->phy->pll_on = false;
 }
 
-static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
 
-	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
-		return  pll_14nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
-		return  pll_14nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_14nm->phy->cfg->min_pll_rate)
+		req->rate = pll_14nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_14nm->phy->cfg->max_pll_rate)
+		req->rate = pll_14nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +622,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 				   postdiv->flags, width);
 }
 
-static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	return divider_round_rate(hw, rate, prate, NULL,
-				  postdiv->width,
-				  postdiv->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       postdiv->width,
+				       postdiv->flags);
+
+	return 0;
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -680,7 +682,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.0


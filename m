Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D144B1FCE4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BDC10E36B;
	Sun, 10 Aug 2025 22:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BHHfrfUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2218710E367
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
 b=BHHfrfUBzolgUbq/K8ygy+h/KTXAXJJj0IJFH5VoRwcEnnSQUJodA5BxoPfPvJpVvNZAWY
 fyW7XjiQKgpdj1mSS/qvj5DYNV0CgC3ksEg55Weap2Gipog3zNqYBpfFbVR3L4ft028uFD
 bIIWtrwUDKr0zYnOimX99c7bvjhh5lo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-uY5EMrVWMDeLczsS1rRCWQ-1; Sun, 10 Aug 2025 18:57:48 -0400
X-MC-Unique: uY5EMrVWMDeLczsS1rRCWQ-1
X-Mimecast-MFC-AGG-ID: uY5EMrVWMDeLczsS1rRCWQ_1754866667
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b0add6d192so55698511cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866667; x=1755471467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
 b=TeDuHqpb5dauJ1UPHGbxp41bJQuMOGJaQG/qv/75QWEPcnrgfOpsy72ZF3srcGufj+
 X8WhaDKpLm5crNvRtXkNaQUMAnuS8nHQrNPf7Zp6roh5IQQt+aUm0V5LVsxyRhm+I4gk
 gJEma8c5PuMXVrlOQ0hjl3UDxFiXVGS2FsMZ3X293Mnr0Ll/FGrcVAJpHwoUb8YhNtEG
 DHUarRzWJ++aK6EIBN2StOx7WT7olI2M+oioXfSih0MUyOmgKKk0yZ+mqlkoR9nP92LP
 zmBrwlmGg4SlG5vrBufC9UHmyq/8nwcs91tp10WNWdaIHwcRL+kZA6W+SyT/dkoKe+/z
 E4LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxsZd5/6YzFHbsidKnkkd/XEkns2r91zaF3a3zpuYMIdbQ6o8xSHRhCVOdSV671P3GNwFrZuKsg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjUz0nbiQn8oPwGzDul5tRL/gOAEHP9e2Q33k9bCkjWoZSN+bJ
 eENSdpUz8hA6WdIEn9aTQ0i0MLV2dd6zv3pcbGw3FI4ORptgS95f0TaWsWteRVYQGNECkIOU4Wo
 vaPMBmboMW7aNQIUXgCK2vTiavr9SLEmRb5fS7+ehIGZoH1AJPiY9U8KE32ol5Us16CxytQ==
X-Gm-Gg: ASbGncvhmMm0O0oV3xPclYkRLMWk6TSjYJadlpN1fMfAJz6eL0qxcEZnvgL5U3s2u+b
 d8E0pVztESoV0hP8nUM851jkZxMYiCdjAd0ptbUCMtWNgosoYjroyjv9gbJ1e59z+PDuAy5v0cB
 RNDxFe45nTuh1zr7kYf6uRk9iDCR9tMizFLf5khMb/maD7oBMyMiFZGl3nZ4CbXMVvKzvwu9I9S
 sEsP/CbwvlwYcLtCRt2+nRHd4mhK1by4KTOJ0BZXzcz5YBO3JAb9rZv2YRDpPqiABhFviZ3lowq
 Ik4Q0+PJ3lo+KuRFJvvSL/A8CStH+nQLTyMEvz3wqhtO1E9x7DWes7a4jmQ5yiFbBZmuCErBuLf
 P6qckNw==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id
 6a1803df08f44-7099a199543mr177311396d6.10.1754866667575; 
 Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmz3g1MbcKxpKoE+L/OvCm0G94lPBEhAXAtzenne1OaexYFo15GBJiT3E87eJ0e4mZmWm1MQ==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id
 6a1803df08f44-7099a199543mr177311176d6.10.1754866667214; 
 Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:26 -0400
Subject: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3160;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
 b=g/OyIxfyVmL0j+PhW5RWDXbEs2uOlzP1vLM9nzajU+5emPdyje17xtKS5Qd4HfejxqWdsQWeZ
 8ROBSPZGhvzDt9b3VBZA5OUUGLIt5EVJPoH+qM81ctxrdXWei/umj9J
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RURbWxQYG-fLP0cpZUkhquIsVsEtE59CH1bQmqu5aMc_1754866667
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..fdefcbd9c2848a1c76414a41b811b29e5fed9ddc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,19 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_14nm->phy->cfg->min_pll_rate, pll_14nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +620,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
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
@@ -680,7 +680,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.1


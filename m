Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B1B1FCEE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65FE10E36F;
	Sun, 10 Aug 2025 22:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RjTmiGNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369E10E370
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
 b=RjTmiGNL2tjpiJzMXUy9oCYJ0aLb3y2RWfg/bbkUHb++BM9eO6h+IMwwhbDrFwaqLc4lUJ
 ENh11W+/GmLhEvd7WEf39j4Ke9cFhCGaAcALSdqQX4NC5/wvOngKisFysRgXf/khw/X3SO
 d9hC6S5C5WOwC++nfIQwpBAT4E8Jp+U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-87eXv6O8PZShBPUTYNfKiQ-1; Sun, 10 Aug 2025 18:58:03 -0400
X-MC-Unique: 87eXv6O8PZShBPUTYNfKiQ-1
X-Mimecast-MFC-AGG-ID: 87eXv6O8PZShBPUTYNfKiQ_1754866683
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073cd24febso38312406d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866683; x=1755471483;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
 b=phfL/VFZJTifl+xBFeo/QFNug3TZYf8zzrLMW2r90d9LZih4lQBUMRQVCcq9zLniJ9
 HGf7f9/clSByImc2Xulma5jSRvMdhMY7RsaNZwd0KHp4JFqeCPe/YQd2f79iydBju3sN
 SZ2xIcO1FyiX56SX9lCD7tWB/+d0Whv4plSZi+nTpb7Wuljf/95I6y9aIFg+lKwh9CUv
 Gw0+x/DlyZli9b7oVUpSKB4+Rx2Uxew6QRn3d6/E2/JOXUstz6nVu2eNK6Js7x0ZHklV
 8zzrp6tC2l76XxWCISvI7yl6buzskoggZh9n1T9urnR3+qAh45MEucF1jjGxxSgILJM2
 nEHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBXeY16HeRXb4hIaj67J9GAbWxVjP0DRNZlXnvo6DFcO9rDw6vpCfEPANfU/73RKbCwdUPfEBnCbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpcB6I0oMf5qLsBwJ/CWiyC1A7dDTcWTgsS3JZQzuQx8LUSt3b
 3cJlQcptL3UJnnScQml6G9v0I5SUaGfpRh7r77dluEAlEKK7j/SnjfDCGKqf+GfsoxFB4qYHU1f
 A97LBqSr0eh0cLG6SrWeH0UafkZustyGhxCaBfzMdOg6g57CrSlbpPaBNQy0cm/3gcIizdA==
X-Gm-Gg: ASbGncvPalmm9HyCVpBcAaJe5ld2Oxsg+Ava0N/A5gd92zqJ4QpmbW2z6NsxROFRLRL
 BDGCPyuCFtWneMelpjHOKn0APXbSiCSQvWDdo8//V6hFuz5zJSliLcF5huCaccEDt3r7ZhzQjRN
 d7r66EQe/bMlgFbDY1EWtfP2ZpZNxZqdfSqqqAMSSmXik+HexEsFbiD5yAE18KAnzY+goTJO77O
 kL2Fnp9XycqGwla0SPEaW8Ccwt8OfFtDKZSJWqycfJQBnFu4lLuvkiOxO8oSptfP0+xprlxNCst
 fUuoofyC5x+pP8swbdUyLYOcyC2FMpttVbg32G9CvukeBGWCPR8tQnllj7ck3WKpG9Ar+r7ZTHe
 gdc7IiQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id
 6a1803df08f44-709ade97506mr71682756d6.43.1754866683150; 
 Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkOu59xQUnrcN/f1twSlF1BrFwL5WoLAQ12FYDXq2PWIP1hHCC8VcITCPbW5zGS+dtgeykrQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id
 6a1803df08f44-709ade97506mr71682586d6.43.1754866682705; 
 Sun, 10 Aug 2025 15:58:02 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:29 -0400
Subject: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
 b=hYrBk5VBcqe8AFaw5M0JbEMNQ/+5/EqgXMuDpqvpMtHJTmo1+Ev+Hog1C/ZssRnCSzPfMgO4W
 91f5Z5fMemWBs805qoxKufqYrIgn1TJu66F/ixECjawgTEoSUzz+mJo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ELA-q-PAmD5kmT8GYM1Gk6ax5gF3kfyxmKYaTk1Mm4E_1754866683
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..c3bd3f89434eb7d3d0f3bb9455d22aa00915e797 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,19 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_7nm_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
-		return  pll_7nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
-		return  pll_7nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_7nm->phy->cfg->min_pll_rate, pll_7nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
-	.round_rate = dsi_pll_7nm_clk_round_rate,
+	.determine_rate = dsi_pll_7nm_clk_determine_rate,
 	.set_rate = dsi_pll_7nm_vco_set_rate,
 	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
 	.prepare = dsi_pll_7nm_vco_prepare,

-- 
2.50.1


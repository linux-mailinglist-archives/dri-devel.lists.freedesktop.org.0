Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10AB00891
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06E10E937;
	Thu, 10 Jul 2025 16:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="be/4nUMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233D10E935
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
 b=be/4nUMHCoBVsEj0KxvnaLVX843731dWhm/RKWi7fWyZTrqmqoXaJH0l7xpLymQtB/jX4x
 wFuyFpxjFGbcrw826DMkou7DSEWCCoA5tPUfwMddmAnLEZrzQ5jQpqa7szj8dj5FViuqZb
 E4t3POVGlFz8UjuXPTuQJF5Pfc+YEWY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-RJidpi6iOrO17AYGYrpJnQ-1; Thu, 10 Jul 2025 12:28:02 -0400
X-MC-Unique: RJidpi6iOrO17AYGYrpJnQ-1
X-Mimecast-MFC-AGG-ID: RJidpi6iOrO17AYGYrpJnQ_1752164882
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d38fe2eff2so165187285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164882; x=1752769682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
 b=BMZmxLqnkMR59FlgCDikxFambpnAiVOxSyPht8CztcuqMn6bzDVlBUQYomOF1R/OrE
 X0lWFNBE75gnA3hrLlltWdZx8ThvzEJCiItpz6b0EAbWO/CERMs/DzLFbsM1BGyp3Dxs
 4qCDtVo5nBfYgCMqdjLPcT3NALXz+ABU/GKHM/IQF4iLpkTmd+4joQXHN12Q3FYUA5Ey
 UuJg8I1CIo09GvTzlq1VgZGNzMS1sl4NvSx9WzxPsdjaUze1SCjvK6sRpUIB27sDyC96
 ksaCy1oI9c/sLI85d40JS5baJ4W74KOp5FbAx9Z+721ZiyMe4XTdGyJ1ytl3ND2nVDc4
 Ubyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUemr0qXFVkHa+ZVOETAh5rDhI1KATzOjQ0Xxbmkd3MxQ/DEaAD5RE0IstXsqjaWqPxuAPlG2W00DY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNZ+6LJvex12gUIKi1gzxEifr/8sDNIpqHk3LWkNd7W0LNqUaX
 nH1bNhFink4da8JHHnmKq6vbE432PyeOwD/75afRu+o1EJfk0Usikj6HF2lynla6aPbKbikCmJ6
 6bIYKHYfoynjPm2dIR9GNJ80nbiZ5hBViaqqYDLQat+al5oo/emptiuSwWCuHmgX9rvmidw==
X-Gm-Gg: ASbGnct578YU6LN3Pg4G4ZGfCFM1MrvmCdpsg2pHn0LoqpPKTHAky8zBrByy8nQIuPE
 uT6wiWN19TLaGvtB/Y3p+O0+DwSIPPgfoJwlpVyk/r+tiosW/JMwtxVsR/dta+HJiKMv4ff547h
 edXfUuvn+2HOq/sKytsgSMxbFepDl3AWwn400k1VgDojIRDpBd57XbOKFoNedjI9ygOPegN5RGm
 MPBCi4IAvwNFjqPro7AtMYSalUlubOS3Abj5GkvAkkHdB4gl2d+delvVpswrUeYiQhFLAhjotLq
 GweC8jnsA4CIyRKGHkfWmaqyC0uFp5f/rPeCd2IdwDWlEn1BnIO65+DsXl1i
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id
 af79cd13be357-7ddebc935b0mr21980085a.28.1752164882025; 
 Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8nqAlSCWoWvORjsOIeWDgtSIE42hyDBJ1u6hirl8cdDrojUMZfEO6FEu3YLQazTijxe6XZw==
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id
 af79cd13be357-7ddebc935b0mr21974285a.28.1752164881473; 
 Thu, 10 Jul 2025 09:28:01 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:28:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:32 -0400
Subject: [PATCH 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-6-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1782;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9JfaJTYaWcQgtLDo8JR9Ya1ZG9LJ7XkHyQnaRl1pFYQ=;
 b=VQSi2rvdK2y8CpHnP8Kq87P2EN9sLMIAXn3sz8naTxS61uqPmjG5VbCcKXFPae1OucSiF/EyS
 rtenvdJm/WaADJl4nH/jtBQrvVWU5LOG7EEpXIABxQ7+T5Ia3BPM/cU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rSJ4FplFOB3fq86nPCsP96iFWmgyKe4m4HIky38XSIs_1752164882
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..dd59b2ed7fa3f53b6a70d20925e4f9cbd5d0573c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,15 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8996_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	if (req->rate < HDMI_PCLK_MIN_FREQ)
+		req->rate = HDMI_PCLK_MIN_FREQ;
+	else if (req->rate > HDMI_PCLK_MAX_FREQ)
+		req->rate = HDMI_PCLK_MAX_FREQ;
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +683,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.0


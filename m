Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60635B00897
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113910E925;
	Thu, 10 Jul 2025 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h4paDYuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5E10E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
 b=h4paDYuSUGip6ZT8Rdb/DeLw5S5TpctczzxGAU+z7WmyIZGvAqVuGlZkPaOLIS3vbTgyr/
 E1aS1xGbuye4aIEsuxqFghENdtzNIvCnxE6tFC1w4mrsTUPlXZiKP2Eoxl+8JFVS4/5jdF
 XXJp7zkzYGn75gmGvhviUWn3ZTrGrg8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Z_ueK3C0P9GVAuBweYmF5A-1; Thu, 10 Jul 2025 12:28:05 -0400
X-MC-Unique: Z_ueK3C0P9GVAuBweYmF5A-1
X-Mimecast-MFC-AGG-ID: Z_ueK3C0P9GVAuBweYmF5A_1752164885
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7da0850c9e5so198676185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164885; x=1752769685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
 b=SPHtVY8d3sWP/1a0d9nSq34qee4dQelBe0Att+0z5VEfUXPcHys57Bpr2Ipe9zI9zI
 aP9Mrt4aHXyTvNYV6SNswk/hlmzQNKBLl/MMPLKjmbbjhW0miIcJyFYAVb79S+lHUsjp
 n/QOmRGGi0DmkRxxnZ8sxY7CR3ZRQVddmilnx1xu0X02XeB3A+/PpTAK/k7RElNFCLKJ
 t8LJc9f8+QsSfwKMzr1f4c1jUtR6/TCfLyQXNud0qxRLTNBKavrMxXJRuY/lAERVuJs1
 VsUnAelNsgiW/Sgwsr5vKEIhPH5SiEWkX2QQL5zug2PRiI32mgcxXKKi3aG/5lhO/dFf
 QN/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6DUt2G+WehV9bQEtwkmTTKyOylmH9ASNENU1AXfStVGcof6mKeai5DJcaMX84HtYgGVfL0IR3bhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSAXWO0r7FoulKGNiTiVS8W7rDCY+EpGF3nRLtDrRIHdHNSbOL
 5SUCuagQiiXIihjoMC2uk4pz+VScE/2iraEYnIoOh2d8zaF/QPVlhHcRrumxgKJiQLV1qq+XAuf
 kjNomPRXEr4azlicRTGXq9qS0GXCmSiotzgaFEy5nWOE0TfpCLpPw7QP/Vr46sRHyKT7d2w==
X-Gm-Gg: ASbGnctKCoEAZYp/mhK/EkU8fFfhGOw79IqhOsbmMpTTf+Pp/Azvrpq10O4R6kC6vBv
 mugIdcNIcWR62Y/e5dCr1lhfKqPQCNydu79XK1Q9RM1Qo+NWkyyn8oQ1d6JNTXn9eCqO5FTo17L
 O5J4XXGuekI5GjHqf/fGbuEd8C4/VOU5K5Tv5A6yS6aZTzL8MXj6SdNeFcRozqz5gMhzMeu7zru
 3GBA5C7uONMk49j4/tsZLscOmy9aocmL+KxvoM5DLHpQCPIulsroy4hn5MEcLhR7eC9cGy/jKHl
 Ae3VlXRa2EPLYJauHUvtI6x4+TwKk1FKOG6nSb+j8uxX9VYC7ZzGZ30voL8M
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7dde99531bcmr30407685a.8.1752164884667; 
 Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELaboKc3+hjD+wF+4ZlA27Ur9xvHDNgGpesankgXOM9I1Jmb0Ok1BCSCTBE3suBwc7QsxRkg==
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7dde99531bcmr30403485a.8.1752164884325; 
 Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:33 -0400
Subject: [PATCH 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-7-364b1d9ee3f8@redhat.com>
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
 bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
 b=TGLhjj+IbzrNkeyKAWH/BPgTzIXuHRUMwL4erGFA0ZAfeBxyeP21kE2dmaW8XV4SrlkFC/vcy
 qZPJbO/GVg3D/lDY67azp4PfWKp8qH7F1AEDRFbNeKNdzHsxXleu+Nf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 31k0Vy-bTR9i-XzQg6QpI7fWfd3B8AkUAQM3YFoBgHo_1752164885
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..7d6381553eb8cb5b18b898a734d928d34f98ebb0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,15 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
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
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +687,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.0


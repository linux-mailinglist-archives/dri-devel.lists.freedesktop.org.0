Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2FB1FCF4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F01110E371;
	Sun, 10 Aug 2025 22:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D2kM4GYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8910E374
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
 b=D2kM4GYtpy3MRtgGqEIc73oaruJOEH5xA+MD5zSi2oR3aKMcCc9+MdOSLk12qiBL8v5MuB
 NeMIMe4KNmxCPrAGR3TjljxLmpM5GmAmMhj8DTCFuc+TMxy2IUgeTpRCyYzUvKVyx8vBG4
 HNclJAcJUJtyp7KcEl/1RqDeocrY4+s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-kwuCGkkrOKqDAAY0I_lhxw-1; Sun, 10 Aug 2025 18:58:11 -0400
X-MC-Unique: kwuCGkkrOKqDAAY0I_lhxw-1
X-Mimecast-MFC-AGG-ID: kwuCGkkrOKqDAAY0I_lhxw_1754866690
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70744318bdfso110822886d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866690; x=1755471490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
 b=F2+6yYrY7cUtxD0AcFTtCr6h2EHf+Zvvpopx6sz/1MunQ6pI9jcU14e089m+8K1mn2
 zKtQDY2FN2SCc203tlA93F3GaAhRk7fjvLUOpiCJXYBGO8oIssZ+NghpYpXABylIATra
 hev2pFMQPZOFwAChhpOidm+HD0Qdjg6DhwAnbF00qPKnaQ5L0GwXkurWbjTPGZFg7K7e
 +WhufDEIV1VKNfbxibLnxiY3SAPYTpkV6OS3H1GKfJUWUlDUEzjJWnK62TTgQxF1TRo+
 FzfovYnedlSy929YS/alWjliH5dsJsCQzPJ7k4hY91oqX5eNfJHPoHgKAudmXERsnu8R
 4UYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRp9uAbt6l/x/qQjRZimfUpopsLiQm74owbEZbLTDLrVV2TT7tdoYA/pmbOVLd/LWlvth/5BCToEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ9+H73KbCL+cfO5YySXuT/tKqIf9mY9pUJCRuJgzGclQqvlHb
 iTuKADN/DYf68xoJVN4AlhSp+kQ/thL9D/z1enJcB2CdJnMEKVpZe3BUn07jpZMFnT525EgH0MX
 bCCGALvXlN8VHq5goo5+xoBIdvveAcNRxN1/BUD9eZBN3jNiyWyUk5PjOTUqyd2dIqT5rBg==
X-Gm-Gg: ASbGncsS/KkWFh5YPvnXCfbudlSNfuu6auC3w6zSbyZYNdeCB88yopRQ/iWB5TNVJba
 izECw7hgEyLqRWCAM8ejTz1YxIiT5jg/QAqsgETYY/gPF80MSi3YgLEn0tY7WEMKlNXeMJnc5mz
 amFG/6/AVn9WdJ7FI1JRecPtJpXffK/0iQqwNRr2EZzZTRyPrn2NZ//CrmserxhGjwfQlWGrumJ
 3kukdmZE91t0MwtAn7mo13cHmL0tbM8WlE2Y4NpJo2WvI8utOOtCWKc/53nqXspouaq692Rx6fB
 fYEmu321gKYfx/He7A4vx58VW2ZvKLtOmn3H8JM4e0wwGNIeRGlW4+wNoDTQKeItGET2XjcAvtU
 V+40gsw==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id
 6a1803df08f44-7099a51356fmr150862526d6.48.1754866690659; 
 Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUGt1AwSBne/o9+rNR3LtSm/WoA2RbHO8v9LNVgg4wnAMJx+OP+IR27C+Pk0SSrEVzMCAAA==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id
 6a1803df08f44-7099a51356fmr150862326d6.48.1754866690271; 
 Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:31 -0400
Subject: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
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
 bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
 b=bPI+bgndtQjl8U/B8CPlCWIm4ICh/KSI/9pQqEc+JGzlNlWdm7ffMObXa6FktebNdwMw2IQ7l
 yRXvUD2K69rChwg8WTjpcfmYgZ91P/5xMLfzNQFm4R78kNC3NkqT/fj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uOm5D11Hu0U8rHHR2-uA78ct2MH0R6b1AFCqlEmsMwA_1754866690
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..a86ff370636972168124da19e114f0acab2249d2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,12 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +684,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC78B1FCF1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DC610E373;
	Sun, 10 Aug 2025 22:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zqz+NHMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9CC10E370
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
 b=Zqz+NHMQMlAMLdtcFzqxnidA6dCBb/wXSZS25bH+/2m+EM8oiUY2kvPWvs6KyB7U5mjoYJ
 71prUimDXUxFaNSz6ShgTzVsSCnkhG53R1eYOXVMijYolCUv2yKG+nczJn5QOgBn99wzsz
 IriGlQadQUToPNq9QeNKoLUlWvuQ+UM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-MGI3XoBMPKurzS4VuLgyYQ-1; Sun, 10 Aug 2025 18:58:07 -0400
X-MC-Unique: MGI3XoBMPKurzS4VuLgyYQ-1
X-Mimecast-MFC-AGG-ID: MGI3XoBMPKurzS4VuLgyYQ_1754866687
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70771983a52so83237056d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866687; x=1755471487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
 b=t/qYoLHSql7nqa9j4Wg9pzlnlSwp5bt0JGUSD/ynNMxd5nJ5h5wgznBwV3WXIRs+k0
 qlQYqX7m9MjWyprs7h+2CxxfQ6ehFEXfaDscr26OkUmwpQ3pkIN/D2NWSsaUwInBEYNc
 w6iqb7Q7N7Cq/E6vdxSE/OlSRJsgI1UuSJAx1Zr2UtNvFaIsCM8FMp96m2P5vWmu0UX4
 hYFCea5td6RHkUtSMeFovrpVHpjbZE53CSicMC28XG1vtmWbF+UYrGpqM264nUGHaDjx
 Ca2AP86mZXCVwTW3yBQMeA4QcdQZh2gepeHgi7H+mqIBikw8mpenkaT854e639SPtNhi
 9JvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAkG9ssP1bumWmulGqb3q5lIdyTJCMtXJjFmzDnzZTT2stmjFf8Z4OHio5JvGqJMCNYbvkh1ROgnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLiG3ysRZQHSdhu3SKX8MVkkvQ7kr0MTGs5d9tFgXNVAl62wDD
 7qTZtYe2LhJHcHt6Vi5ZFO6jYjgRkvlrG2AnRNZSUxPsk7BJzFPKMlPpeF+LiGdJNiowv8SZ0+Q
 P4E3p+VxWnV00GvKibOYx2ZepAkZqlAsTMfoiLjtiYzhyOYyXSQ/53Rlsp1ntfS6DXKEM0g==
X-Gm-Gg: ASbGncvs5HmfwDBPs/FSB9500E1RqKcdqPhX901j7VYrspI/J7T2mqfLdfs2PuExrUf
 nrRju8rHdMKlhVpveCs1NqbxwC6HSYf+sLi2tjNNomEo770LX5r0N7y0v/IFAcp/deiislxyUdb
 EKesrZfVTHljW74qvNpH08VBb8DxPyNHW9rqkEax/lpj/24LkHdYwWHdVr4zhopBJqkODpfS4Hu
 43HawWqSyw9YMYfQtoZaRJsRZVVnRzQ9l9RAr/UIXig5dLEIDl6zwjnQJGwwkAYMMWw20Rz2cl5
 khLN4zN+9lSq2Zk2HmPq/Pafvqay5nT3yG9oceGv1fIPhnz7Y7KTtv6MpU/nJi2AL0inLBOrWXB
 eljHBMw==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id
 6a1803df08f44-7099a283fc6mr144909926d6.9.1754866686906; 
 Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GPlWVCW9ekKhJg+4g3e28+6oQCiHZCjU/hLom4Wlvy0t+z7ug+DcZyM9qyvldH93bCaBnw==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id
 6a1803df08f44-7099a283fc6mr144909686d6.9.1754866686533; 
 Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:30 -0400
Subject: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
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
 bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
 b=Ltcr7gblllRTjthopo3qUDdfH31xXqXg3Eunr1kVSjwIRzMGT80F8gmAILsYimdJaEURAIIXT
 DQUfMhrW4ldDGWChbsCXStaOBBf3jn9wUuWO/HCkvaN+TS3qKQngYao
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vNn6HtC4nLWNqO_4_D3NdKiNui825evDsKVziKvzmd0_1754866687
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..36e928b0fd5a319b6a12b9be52705c067d51c20b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,12 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +680,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.1


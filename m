Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FBB00892
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4033510E936;
	Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h18WQlFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D7210E933
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
 b=h18WQlFe5UUL/UN9iSZPBMR2TMCNDRfczaZPj4jAe9HLabWcLAS4UFl7TMmCMuzpVhoBVN
 cfnK0VtDATeG6z3MefBANIqwZvsY4LjEeOFvccwRJamVE4Ax+9StTNCC4P/GHx6nMEzH4a
 BC7U64JhjBhj7w8Emi5B1xIj7R6N5FA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-avJ0iPMfNOeJ6C_tmHAOaw-1; Thu, 10 Jul 2025 12:27:59 -0400
X-MC-Unique: avJ0iPMfNOeJ6C_tmHAOaw-1
X-Mimecast-MFC-AGG-ID: avJ0iPMfNOeJ6C_tmHAOaw_1752164879
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d460764849so394324185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164879; x=1752769679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
 b=vf0SBK0MbCDpQt8WvriPKSmKZZ/2qqu9RLSjn1m5VzNUHfOkg/l14MDoSkLuu8y5aR
 OXUaERqRNTY6VotY1vOzCXN7DUZ+KkuPTZy6FKtNvBhP3pYFhsu4KV4Gw6USd3Za+Eso
 6FIMRo75Z7Ho/od75MtjlA+SUAPD2hIC6MihtWmwX8xE8hiUSNFakT4CNlwRUQgJyPtF
 /jvYy0eu9AfTE7vRLk9TXi3rlKmE5TD92DRX5Ad7FZ7deOWl3N7ZVcwfrM6LJubP1YX6
 7fsEP6CE80ACnbD+3NBouZZ36bLwCQ35tqrHghfSEjQpzdml97iq4C9oE2AuPiTzfoZM
 F6DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8YIccYuM/cHFCMT9DdeKRJWwCy29GEH62CU52oCTVmVUZ8mIbg2ZlSa1odQmiqe0Scg4SZ5M7sEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfB1eUFF9SzjlMYxgaWGOLr32ozGCep6+b3cAucbPDMp+wwRtw
 s2yvmJfULjZ45TXBEa7NW8OukICIlFciO0NMJ1+c6onISA+tO7PSU2pAfNoMu6tkO0kxTqwgupa
 uSIEJ3aflX70hqGgBqDjKlz9/2j2eMd7AWMxxiCGiP5N8Xlr2ssevD9gpHiyS0gS8T5eYyg==
X-Gm-Gg: ASbGncsHsJjl/3EkHfMnKNw/dg3sRauEWdmsk6QMcKk7zCttDziIUjAr6dusOoo2JVk
 jdvsTkpWH5lj7RL9JCE94Y6feJY0fYHDu+60EQTsTDMyR2hPTf9jVuSGodtIpE5mps0V18Qs5QP
 9pXnxolb1WO81gztyXPBsETcV1OPw/Ie01Or+vjci2R/d3A38qgYEfhAxN+YgOO+tia5hJg68Vk
 RUhepwu2XzuHktVIieFsL8kmjqQJnRqRgv6ZBaXtawSe84EZflSBl5ATlROXCMZeR/DFvaHRl48
 9txW96tc5kz9g1nPkY0pEFdh6tBfvoKR83QoOtBa0LSsA5PkadThzBh624Ui
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7dc998bae5cmr548838085a.21.1752164879323; 
 Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhR4yI/meVA7B4yGGlSkWsy9sNAiu5N3YSBwGR+IQy1ADhUxQ0QJAqnJLJknz5+tK3xy+vA==
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7dc998bae5cmr548832785a.21.1752164878821; 
 Thu, 10 Jul 2025 09:27:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:31 -0400
Subject: [PATCH 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-5-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1798;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
 b=+3BZqcT2g8BzgtT08Ofg1fLcRnpWlgjhSzHJ0bgUn4yuktzceZYntu7KHdODtXiXiNcU928l7
 zP16Ptox34vCfs3DTh/Se8N38Ou8pARiNhSmor1jXf2v9OU+tuAkQxY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hnzk59ARrQi4Ixxjb-8ly5b66OW-actlrVZTorXuZqA_1752164879
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..eecc4e2ed51547709f9643c52eb2468f17966de8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,21 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
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
+	if (req->rate < pll_7nm->phy->cfg->min_pll_rate)
+		req->rate = pll_7nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_7nm->phy->cfg->max_pll_rate)
+		req->rate = pll_7nm->phy->cfg->max_pll_rate;
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
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8AB0081C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C8C10E91A;
	Thu, 10 Jul 2025 16:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="THYZ3RwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C72310E240
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBVtIjzgSdM7j9vfNKuudokyDuXNQpoH5us+QUAZFLc=;
 b=THYZ3RwHxe/VvEHtUxQDMcu9KCw04uYXcGsFi4K3yZ+mHDlTnJ+gAlmj5tssCPSCIdMIcL
 N7p3/a3qrJMDHH04E5Z6S2y+YWn0y5kcVfKjtCbJbNjzJbq3HEfStBQBAcOlnnbeu+ahC9
 5lce4G2//j9mF98R8WXutXTdwuY9VnM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-CwE3L1slOim570qBmhH7Bw-1; Thu, 10 Jul 2025 12:08:12 -0400
X-MC-Unique: CwE3L1slOim570qBmhH7Bw-1
X-Mimecast-MFC-AGG-ID: CwE3L1slOim570qBmhH7Bw_1752163691
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fd0a3f15daso35562226d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163691; x=1752768491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBVtIjzgSdM7j9vfNKuudokyDuXNQpoH5us+QUAZFLc=;
 b=PLTK7alDfUPChqLGcYbnJvPKTXyxTKocYagFFLk1mf3LPpePwzPbNUKddhJChVyklY
 uprKjEJWOysiv23hkht/2sMNYluWw/AWMq4rDpnIeHjJ7/XcaNcdiBxvIS/SaViWaIVo
 AKjyUEiNuDmCnw8r4BNgGH+hEkwXnK/VOuLB3vtKNAtrLCstrAFpRwvrDYGM2HwMb2hl
 Ychxpi8LIVRM6vR3gWq7G9cQdHHRLprfNTad4kU7Tbp5c6uD30W9zPhVvyKx5pns4xf5
 +D7Zy9JZkDf6cZix0tNqac3doO4MqbEblmxmtk4MFLPpBpdd38fv8qkZIucKzDhyHLcp
 JGqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMLG8Md33RZa8DjlvFUSsmLUMG0EzZ/D0hEykA9AXCLWqZQFi8ea8CyLnhfOSA33RGCmbTWmC9cow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx1+kRt7nVK8+O5pa7iAkR1M+BIm2/Kv0wCo5MHCLLpDSGMITV
 yzicntNVA9rze3zlB0GvmxxLCSYS6Sr2ZvOWd6e7MkIUGYqxPs/WXMaAOl2T0O5wGFmO5PAIeDY
 a+fMCSB4JucXZKhYfRQ+h1phZUbv9hZ03oH+loHIX5PWzjqfLxV6JMhHVKOck4HtgT75QQQ==
X-Gm-Gg: ASbGncsRhRZdv0C0GN+qOeHPNTGKC6kVRNhjY8hq3w2a4pE/OrinF4tOgi6f/YVbry0
 SebHdKd0kD8iguOoaFULpqPDE1AHGdDOAyQXu50+UMnJcykDVmKWSbIcSq3bqC2liD4D+suPEHP
 7L9awiRlDjsF88SO4jqsr8H2RBkl48UFL0fbgTjzZZ/xrrXJi7mA9M/vuCVth72fsTd9QnmTsho
 ZmXTvYH8RhetNtFsQvl4CjNESYyTdZs5ivy2uUltZa4HyVV3JghgUAquAJAH+fAXvrw7q9CWlcE
 kFdNuEEztfnNg7OcyhwSq9sIfN/wq6skN++0PaucH2GhGGkvRrk5u+ZOTD36
X-Received: by 2002:a05:6214:29ee:b0:702:d7e2:88b7 with SMTP id
 6a1803df08f44-70494e7190bmr52729356d6.6.1752163691418; 
 Thu, 10 Jul 2025 09:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6DKE/B6Jz/oJiRJgLwGjr9+CDT2KUQYMq69PGQL2Cpo9Zo4B0GowYF0QAn7rhBvA9uVWDKQ==
X-Received: by 2002:a05:6214:29ee:b0:702:d7e2:88b7 with SMTP id
 6a1803df08f44-70494e7190bmr52728706d6.6.1752163690776; 
 Thu, 10 Jul 2025 09:08:10 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:08:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:11 -0400
Subject: [PATCH 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-1-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1978;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fKrbnjnqlbXKGKlsruK+qB8Kg9daZJZ+BBb5bsrBbyI=;
 b=KjDWEK+2W/Nntn7kgVA1LXI5UW998Hy2QzJ7T12w24jbptJPTQ20Hu1na1UrDrlq2m/ybtKHR
 1nSX6rsyHP1DjtYMF4VJcw2r9wmw7SB7c7PmH5QSepXY2pM+05ltjYv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yX9pc559o6MQnXDSdR_hXgPmqeFg8NHq5WxOAt1eQS8_1752163691
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
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.50.0


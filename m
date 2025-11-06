Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE81C3DD2E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB510EA0D;
	Thu,  6 Nov 2025 23:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DmBJuQk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D38610EA0A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762471598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
 b=DmBJuQk8XXh3rCQtpM7qeMXdBZaotgT0c+Jfvi1JskjKac7Qas0t16iLHizmCslNsemZ34
 YLgIVVUowzMWA6adjm5nNrncZgVQVx+E6ojjvsiEeK1oJwelX0g+myTJhV0fKIBJypO69e
 0HlwFs4wk8uPxSk4pq9Aixx7/fuRYHI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-t-4b_NL0PvWhXPl7T68DEw-1; Thu, 06 Nov 2025 18:26:36 -0500
X-MC-Unique: t-4b_NL0PvWhXPl7T68DEw-1
X-Mimecast-MFC-AGG-ID: t-4b_NL0PvWhXPl7T68DEw_1762471596
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-880281dc4d9so5419026d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762471596; x=1763076396;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
 b=cBxiPF0osd/8jhf1+ivw9nJ/GWy0NJIh4QzzYI9J21KoCPrl5CI3ydFmd387u54ZOK
 g4+rvNVc4jDw530eoH8SVeF9pJJ2eF3gTv2eXBJYFIvqBPdmRMo99TvUCE4YBBtFQt67
 RDlX2V9x6/fSRi1Uff+5unBoGZJdMXen79HL872EcYPUuflXiePk2rBID7XLkSPVQTID
 B7yibSW/VCT43ZhuH6Vxc11FHDboOU+OhqGYl4GcapsjtdN+VroHFP8yCMrE4VT9L9T7
 VEnKcCDn5mJrBwJhRuejNB7Y9lpVtcG8OCWah9QCHCX4HesSibshBv2DHlkPctSMH++I
 2NMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOfInuK1sgcDlO9+1OAmnkYTWqdrwmUMFZ1oH7X0kp4+osAMeO8RE4HK6yLV0DgjOJ9k8BIrbsRj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeev2Qv2ltwm6R0qRjg/XGbPB11VhUcCPOnDjoqTL57woAFEBB
 kXtf2Oec/+TEBGiD/IhpukHRkc2LY0A4jkdfelZXy9KKesaYLIjAKlXH8grUSlHn6S6mcVms0YH
 BeBmI56FYPPPg/qN6d+NKOmGAoz4p0FW8sKgoMKSV9t8jeQdZ98gvG+X96eS5jWyV0G/qGA==
X-Gm-Gg: ASbGncuIrTXwnjJFBCtO6aJuwpvzEcM3dZVPyLWYCiyn8b+ZoIuMZjBajehG3bpZt4p
 77WkOqm4O+GMTue5IWXepAoLYBUsFjVdllte0S84j5WAuH4TjJjGKtKBH9s39WT9TJj/S4F3fFM
 TpPPhYX3tyzfyQLm4ilIZR82NA+TG0fxkRDiG9TE0E8LyLuaipSVn+6gDVswAKHxiQP9BgZvLUH
 +amfpO3oLmauKiSxpsyw3/WUlEirBwscpF0rjXexLiSYi3+JcM5OcAzOmvGqY2Gb072e3G/c1Qs
 527SSwdN93U8iuKY78PWOPuenAnBQsYG3rXFnCT1hX3K7TNI3IrrkIvtANdysEQyY9ESkNeCepS
 VmyrIyDSGdIlvRv+eDAqFZzZ4ceGvXQEOgUl2gqWiFg==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id
 6a1803df08f44-88167b1b487mr14732306d6.27.1762471596127; 
 Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwsDTQJb9qqBYb9v62fMP1IlTO5wvFmMfSLsEpd/QskmRbsWz9CRa2AbIiAewvIcXXmKGXjw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id
 6a1803df08f44-88167b1b487mr14732096d6.27.1762471595757; 
 Thu, 06 Nov 2025 15:26:35 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 15:26:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:47 -0500
Subject: [PATCH v2 RESEND 1/9] phy: freescale: phy-fsl-samsung-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-1-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tPB5NIPC9Tahtwhg+nx3O+ru7wuSB+giCQQ8ld+ZnPc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZ8qZ1y68Ds1+V38qKsPZ31ou/Hv9tT5Oq986XlN
 sMCmfTQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZir8XI8K3jqEHi251Sx7c/
 Yjraoi5f92KzyTYZ7+2Xkg/s6jMsmcHwP/jWullLg5MdIhTUAyNY/z+5IpspNzcipfx2v2sub7g
 DAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ANqRhke11aV8XXHwn-vRGJJg6PrvCXyzWzh09k4_Q8Q_1762471596
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
2.51.0


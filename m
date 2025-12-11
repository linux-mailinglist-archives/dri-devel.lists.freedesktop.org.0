Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C675CB758A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8151810E6DA;
	Thu, 11 Dec 2025 23:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CMXKNPif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F7110E6DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765495010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
 b=CMXKNPifcTJ3eNhvLgL9I54WyuBhv8Eejb1Vkf6cEQ5yVakL7HZaPF86exGHioRaYJbgeo
 2jnFRabPAYnX/VZlF6PRDucW/0QzQ74jvLLokFPX6Bbs3jbK2fu9XKvrzzoGUblJekSyFD
 1MeaWAGVvdWcGjjHTxJEyRcfDjySU9w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-OJfKHEnaM96DtVPa8WIJog-1; Thu, 11 Dec 2025 18:16:49 -0500
X-MC-Unique: OJfKHEnaM96DtVPa8WIJog-1
X-Mimecast-MFC-AGG-ID: OJfKHEnaM96DtVPa8WIJog_1765495009
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b1d8f56e24so147559385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765495009; x=1766099809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
 b=mYmUCUeK37soZH4f8vHAHDBa972eOBS4ZRuawhEzhbbDPbvL7avt6T/CTh1tiOmWyX
 Ox7YDzelSIMzx8GbYvw1ZQ8VLpp0atXbHgcOIvLb3PnGnUZ/R6P6xXCpcQmBG7Cw1vJd
 pwUjBev6+Tzw8rud5R/tF8BIPRWMn9sndooJ9RcTn4PFnCFGkAZcyliLHuCAevQHP8ra
 LJc0Hg+OiCwhDd3icsInLdkgQnP8CasRrqS7hn5nYXT3/MKDmRlI2dvFjX3kq+IAe50V
 rlvhihu5jllUkOtuc3eQQRB3IltaBzmQoIDhEAJRJBrnjMeBTwiYhfWJXp5sc+ZVnZCb
 XC1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfT0bjCr7SGMj+/jZeXg4w3Pvxt7g0bhtAlwaa73wUxWuCG7vHHkNwg3Fs/4m9k9fd7ZZgfCvBhZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCVOTHAER0i0Yzlz/8LLsom7kHcwV6nzitRNhREJ1lDBDscLod
 SVRYq/koRH96o5JsVXCJBUXBreJiw2aEXthgxSa6tlSieVFi3UuMNTDHTFa7Kc6M6/t83ObzS2N
 yU4CBd+5HCqqJ4Wn9Lk4OS31/4XqJbu0y5lmdthtelPdTfCvjHeKgytqzEe8YzW6f+23f5w==
X-Gm-Gg: AY/fxX6es9VUGL6AnWl4TCXGwUA5kebtQWPwUuv5sMf+l8dT9YGq2dNd9Y4C/lRSOLR
 Ev7mbZNzIlMES5FlHsFCOdVK1swMKhFKWeTu/EZF5Lhzyd99rNIEv5BXh3I2cwTUm8g+zo8r4UM
 tEfpXUBwDNVBSJYmGfiNjM5/qBYk5Sc69+VxFvl2oS3L5RaPlAByEsCEkFnJH5dtlXyScBcVMNS
 u/ZDneOQnAGPzZW8MvpDu3XeYaTUaJ0eyenb3dKWR8vdBrPGkMPfCh00KFbUh7v8crNhkRDqzJy
 lF2Mh7QmxX1ADIUirpTi+lXtnhb78ynT+UsjrVGqYFwggjw+I10ruuwyNGHQGD3toZeuq9S+BQh
 ZOia6yIcLToWTdemXZh4wmUJ5yeFbpFF17COETx4ZBscbtO9ytLCYUA==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id
 af79cd13be357-8bb3a3888famr34766985a.61.1765495009123; 
 Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzGfyg51QMkMX0nb0URo4omcvNBrodsNtcYzQ6shcsy/VZXilk5dO3Eb+B70Ty3ot1LOtMJA==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id
 af79cd13be357-8bb3a3888famr34762785a.61.1765495008710; 
 Thu, 11 Dec 2025 15:16:48 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:16:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:19 +0900
Subject: [PATCH v3 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-1-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uyarQyJgmaEeLScoBV74B9PZPRT2iTzM/dIYFjpbgc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5OubvRVPFUzMfglqvZrm7+AqavlWs+rWrUvSgqu
 cN+ieikjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyTYKR4YrlqZuHA698WfRY
 zW9m18O8n8eYZ8/9E/SH62Giq+E3XgFGhj3SJ5lOVnSoTmeLZfR5ljSpR+/PukrH6l/eIWKHHy3
 JZAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N7L7-poja8Q478bRnLsyoJhld8c39IvZgo75VfFlnHI_1765495009
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
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1AB00A1B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD3B10E939;
	Thu, 10 Jul 2025 17:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IdeP9z59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CE510E939
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
 b=IdeP9z59Mn3OgGRoZbhieLj2FnqngFyTrM/WD/a4I8HRtu84LX2CmBkFsYeVwMp2aJZRmI
 +luLJMSBS7/4fC+29zTjGNBd7Km4ITjd8Nxu+ZII+98TOVtxCv1D+VcPNdvX3DCY9IUfkR
 Hqz6LfYcE2KJbsW+DgrHmRxoqHE1qhM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-GG2FLugpNuSm_g8seSPHOA-1; Thu, 10 Jul 2025 13:43:21 -0400
X-MC-Unique: GG2FLugpNuSm_g8seSPHOA-1
X-Mimecast-MFC-AGG-ID: GG2FLugpNuSm_g8seSPHOA_1752169401
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d15c975968so189963485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169401; x=1752774201;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
 b=hjAP/Wkgi3NFOnYFq5f1CMpYHNPg1b4EiObZ1n68T01oSb6QCrukZ8Zx1k+QjzrBR7
 mtVA+wrHxwg74Fbdhcf9Vk76mVfV6enZ39bHhoYsjTJpxKqCzbMO2VW/HnuSbOVGVWvd
 Le5FpP9iYusIlyqJfz9PPSzj660DM9UNZ1XBEEse2Y3voT0uqSHHCP4A+kOymGI0sowc
 fB1zZ/sHAyev8dTBT3h6dzIy/+ZYFMiPCN4pcxxmWs1hu6x+E7HV612UgBTGZU40pbgB
 SRyfnfqi8fGIcSv/OCxVGoAns/LLnCsfCAysA8rBG7dYwTkPGZH7FgEE6vC0Rl3DWb6i
 csYw==
X-Gm-Message-State: AOJu0YwbyKH9JHUjGIWkaz+Pm7RQIE9zFI4VxuCdjB56w/WTFNGck5Z6
 43RAsrR/PSiXNFBE1mpnltxKwwmeftOe77mmdEUAoZh3gv465ExDphdGgEPYhsGazhYYJ6Acv25
 XgyNgYqGxc6vxru2jh5lvXYfDpjepbC5bY25VMiBVi2Y2aZw0NDDQum5vWoaCQcj0qzMU5w==
X-Gm-Gg: ASbGnctBgQhTaqIE8uT1z18NLPBdvx2YlK4L9XKmiEUuLXjYZf+PsH0Gr+DZrMFPd0q
 eiGeVw5Z96pCmWJq+/xdAQIZOY8cI9FCPFO7hhbcjYEBTSZmbVucTejJ0rR5P6YItdnLvdZEpHH
 0XzEggwStM7aQu4F+QBJzKzmUuKJ20TmATBdMd4mnNiPv/daNeWDBf4aMqVyL1oE82Ph/9QRmEr
 fOe3tfx6UvA5E6WDJQkxEyQvgpHXHEEFJ8rpQnp6nH9yKitBNYxwis9lQGQXEk3xw6WeelTON49
 K7hM5KEzKyUlRaN+TkgBZo/YoIuKVAkGc+Jf38LdnLYXfIAGVTQWzLgMHWZg
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id
 6a1803df08f44-704a40f3f86mr2464866d6.16.1752169400869; 
 Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneFeZHD+R2IlA/RJ8povEc4F9IjcKH8Fgp0p4dCYgtfr/rKSizrHDLTlvLp9E8FfSRTeZdQ==
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id
 6a1803df08f44-704a40f3f86mr2464046d6.16.1752169400264; 
 Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:02 -0400
Subject: [PATCH 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-1-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
 b=2cWi9RxWr4DG/uT+Adfe1rLsJLWqf/HsK4V1CHvsD1HqS0tzYLionTpIhnP/uRurPd7gfFmll
 2lm+LwJba1xA78TVoaKVn+hJWZX7dEn9fhckaPz4uGeZs+gsOpWRugK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qLqbh0e2xz5P7Mnoo1QyuDzt7YADWIQCXQCrJRq4onw_1752169401
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
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.0


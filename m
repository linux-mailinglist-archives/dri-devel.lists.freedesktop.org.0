Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30AB00A35
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2084B10E957;
	Thu, 10 Jul 2025 17:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FNh7qlXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A35310E949
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
 b=FNh7qlXD6m2QLcZ3QRT4K5kIxg92JTM+rUjeJk25DvzaNoB/evf4izVsHdYE8cqlmUJqOq
 yiRnOq67x67x4T2EwgevrqcJJHL56py6c0HPE9dmZBN21DAgRpOBHaW2qTO/4ta4i+gN4K
 dlNe6TpPpmEbjjMS2z/n9CJsbSfV2lU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-Phlre-o5MTqPRD6rAvSqjQ-1; Thu, 10 Jul 2025 13:43:43 -0400
X-MC-Unique: Phlre-o5MTqPRD6rAvSqjQ-1
X-Mimecast-MFC-AGG-ID: Phlre-o5MTqPRD6rAvSqjQ_1752169423
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so20704346d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169423; x=1752774223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
 b=uqA03GjPfwMELgZhW1jS+tCTSfG5UUnXsTbUc5zKy+zzUr9DMco5e8UyGkuKdmEQx9
 lCt74n3ohkYfJvtgza3fUI3Q7SAkNJTgkkjL1/rpaNtjS5N+MTB36+N0tqrEe1ONchhI
 alnonR9Tuo96uGodjU/fXEc60w0UAPEyA6A6eoZxfptZUv6k+deeaA7adalijqBKaMLk
 +15BWDLHu1AONSkD/PHiUkcCbhbsw0qZ8azX5dFGk8HoaeWQbIuVc+xLy0l6m9SzjvE0
 Mrfw1juSkX8KmiY4mHNP6Fv9sccHsPNwoZDDnVAz4YlRZQ3cwIABkYFO4J3x5luZNYuv
 lKxA==
X-Gm-Message-State: AOJu0YzO1uqCom2wdMw83Ho01/gtupsih2k1J+lRFGtPswqrN1N2VrOr
 ZRcU7kpqNgxIMtGszSoGMLcnQgtTNXt+OpD0ZfoyzHsU3S3SeJ6qnbxiyJBqMyuf2O5IZ8HfSEm
 PVEiLbqp9vLc90pOZbTeS6qEBmjEhiC8/sCKc6LF/FW6sp86twxB0FbLZdpe7UXFFuiuO0Q==
X-Gm-Gg: ASbGncv1fa0uvH5Gp6CDCW0MVbOeFdihXMBgpazjKLYoFag9+CsNO6r22bNSjRL/f0s
 9ZlecVoKrsHb/qePHqT+xIjAvMedFdK8VZmkvISKiYTgJzhH1zVEl0glUY8646/t8zUv6feo4AG
 6w5tPgqtmTyT47JMnGSJhGvEPj6rxM+DL/EFJWIJPNlhp99AhObZV7GGw0XhrmcfH6AxYd/XWm6
 BcO9f5XKNhZg8R040+Qny1t6fKmj3+5efHpVwUgFktNB14dTkxWfKnws+D84CgggybxP81qF3ee
 cBTwXb0VkNl0MzP+ghI8LLOHf0Rvqe0LHRCGsyFdBLLBETHYlaXLJefsL2RR
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id
 6a1803df08f44-704a4325359mr1692606d6.32.1752169422740; 
 Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE946PzHD0RXk4GY5dDiYIFHgj5udxSitTpswAFFe0EalaGRnpP5sdgmvG0/oOdFa+px1bfeQ==
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id
 6a1803df08f44-704a4325359mr1692226d6.32.1752169422349; 
 Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:09 -0400
Subject: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1647;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
 b=ho7GtAWEeFJp5Ux6aTEtHmHkJKzsUOAKpGEfNDI+F7l5XbF1qK2v1eRvTIse1y82RTcxYpTS9
 vSPNZAJFAqpDDKhg/zIW7SbizIxqSMy8J+QnCYzoa0xmplhJw/HPvrO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8DzEDqR97HDfC5QaicZ2CFLVaZafMlD84W9O_fosc1M_1752169423
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.0


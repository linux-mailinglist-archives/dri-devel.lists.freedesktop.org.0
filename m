Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E37A4726E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EAD10EA0F;
	Thu, 27 Feb 2025 02:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kV+u69lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCEB10EA0F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:25 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5485646441cso422912e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623124; x=1741227924; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4ouKK+P8Bp77QlLVV+lTMqGiv9R+6akFjSocFKtf2Jk=;
 b=kV+u69lz7f8PteSFEc8XBMhe7aGVZJSS0CEDWDZA2fL3OC0NFUeTFFQL5MQbg675vm
 7l2y+uE+hU3SC7V0Da2pFfSOsKPmdVSMTQOVlBbxhac/nhoGJ0+rjfa+WO+vmoZtg9GQ
 XUJiAZJJGFRH22oWGxvKpFrsV489leKtgAyKALgEC0HiWppEjDPPQ5W+3qaMJmocfL5D
 dcArbMQJ5UYUhiz77GSrS6k41L3++ZztX1oQjS/hilpbfI3W6MzBsqbeTMNJuH7cNeuZ
 52kGdlceVFY9yHYkPNWXGsqz6/y16nT6+VSWjJJCe11o5lbkAbuGeN7I4y4XleejgP9/
 heBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623124; x=1741227924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ouKK+P8Bp77QlLVV+lTMqGiv9R+6akFjSocFKtf2Jk=;
 b=DonGvjNGVP3SiDlGXyhCJqR55e83GqWmv5sIlkPIVnrAn5nTkbEGfQ0npEylloQiJi
 PatfTgvwyhmdp3v5NVWs85aVulh8w4Rc93H3tbQtOY5omo2gBnmD13kPdP9nrZeO5yAn
 PmYsfyM4Ty7/0UYuK7vTSIxq6cKYQWThyIilXYRhBRUwmPOpYQxMpwa1Di6f6qc1+B2p
 El7GhicykcWxVe/pn0Vgsm0TRqGIz+4P+Cf8qRWkaGQL4m0bS6OpKxXw2GxWnv2qn2WH
 +7sL2t5z2iHZZJvm194D+q6fQFkA42RUZxN4PJvkvu5AZxBu1USk/+soq820kU2uyceD
 KW7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNpZc+Le3PmT7/3Ku78wxrM94frK2gAokGNSFpeSo9mK2WMQC8+YeKMA2328GgAZqp6YIsaXV51fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfx3JPrQrjk3R9Yqa4TRnZH3fG+Geqo6FFGOy+Qs90tlRXHy7R
 FkD+XP/SHflda8u6p2dFplH/bqDtnJrjrX7TnmQD5LaqWPUp7cuUdi/+C0/eM2saTukJPc+ht1c
 nvAEh2Q==
X-Gm-Gg: ASbGncvrFOb/8mHnqj1smYB3+uZwe3q1PVgLFz7z2wg+oJEzFa/VjUVWUkPpdT6T17m
 CVmy2n5xiRsglVVX55VhRxlApWurFmIeQ4NzsmhtixTowMQvaIvqcKWda9UBXvrPHBxN0tA2NLz
 qojYg4iHA8QWjtnExOlNS6KkaIYw4O5PMCekCXg9JFALjDsu+MK2PSG0LTIjud5+3WiJWTqTQQo
 QtUexAVgwDHI9SvrrgEmwoTtsPerzF2Yfdy8bjncPIFUS0xvzdeaAmEvjh6O5+qtLwmfcZAAKTo
 tWwgQK2Jw6NKGzz5LiZryljRHydEmGxgRg==
X-Google-Smtp-Source: AGHT+IGw8901cx7jCW8IdagRI7moWHr/MMfNM5yDe+5tE18iV9njnk83dC4KRsquOX1KAt/AJwgQyg==
X-Received: by 2002:a05:6512:3053:b0:546:2f44:ee99 with SMTP id
 2adb3069b0e04-548510d68fbmr6201726e87.17.1740623123953; 
 Wed, 26 Feb 2025 18:25:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:12 +0200
Subject: [PATCH v3 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RyZRLS8pZm8hoJDU+OVp+AAZeLhFhiibO05/Oz7CvDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80HC1H31A21mg4pym4gsBNuP+Y0XPTOg2WqT
 WP81odVunCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBwAKCRCLPIo+Aiko
 1bN2B/4+9AgpU9l9qzAXAQxbcg+hLFdSjQXilior66+rMZDVFalCW9/W3knGRJVNzfacf2hDInD
 j9l325E0ZCZR1eVT0PXx9CaGTuKokn/6FTCRGnk/YYWG407FY+wlntoX9fObr7ED8+WHRcafZtx
 k9gjzwnEDAym1/FoHs1XpDh4a/856niPt8lgRzoxEu6bA95Z3ko8DD9iomDdDT2itq++sevwF0N
 1QhipfDTUGvODMu/xumMe54Yup2nSs/dwosAzUGm2krQthWKpXy4RH01jIMhXOSXu81lVlQ4wPg
 VAHGB8kgtUGZ5IVJY7DzCQfDdvTTRU6ydn3L9tQNfMO2Tla4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT in addition to using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index cbd154c72e44c848fa65fe01d848879b9f6735fb..a99bf482ba2c02e27a76341ae454930a13c8dd92 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC280201C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884110E252;
	Sun,  3 Dec 2023 00:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B968C10E24F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bc8a9503fso4587403e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563528; x=1702168328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUi6QKN0qZ859wsIOcquZfetN1GsdPLuB9ODzPF+Xac=;
 b=Ts9tdMKGYjAQFBL4DhdTpzYPbGT+WODUFgRve36IpKHfYbQztyWjd4+34/TlNBp611
 /PtkdrLBevl1Z/994PAAAExNllXXmCkliK/qjLbEpe9TQPLjD1doDz/knoRmA8+J3TjL
 ctwlNC4yMpzjVSwrWu71MEHI+/IWNeCRIuOxEDwDAJAmRrroYDg0bNA4eJc9e5CLr46H
 g6TDnJTeZkmwjyA19c9jK+LQ+4Sod7sc0tIydc+zbsxTJzx5CfQL0iTZGDVc3YBS2/kq
 n7bV5rVjRufOCv5UvFvSIsi13RbEuRCVhucvHXy88Yqd0t2CxPLjKHxWOq8Ta88CW0pM
 Voiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563528; x=1702168328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUi6QKN0qZ859wsIOcquZfetN1GsdPLuB9ODzPF+Xac=;
 b=FMz92OiKL31MHacxPxR4yEJrbhiSJpT9tt2S3iW48EkLsP4IVwk5RfbK93nzoE9KJ1
 0xntEbwhOwpftZZxWiQAAMcKBu7KbBF4GieADNJ//KjmBRpZVy7ehbt5NszFQ92sohWZ
 hfMFpx+6V76Isi8Fy2NoUgSPf8hNuWYWE+hTvboXbSjn5PAXrKZkW6ftRjUwotZ4eDhq
 MfKaeSbJhAvhGcU5Z7yAg+tzJIC4vcNqYhX0UwwK5jqjsKQDZThnsNYN3NWN+Wnfj8vq
 8v4ihXQliU2lBWykSbGkJpUpMjbd+kwLA+0trpSF+iqy+2kcTgsIE+qSRxumLFdX8vmN
 hKRQ==
X-Gm-Message-State: AOJu0Yy4VL5i13MQ4FH/Q4ogM8i7CKaAac8nc7Qy6SN3z3Fmho5mRYA7
 znO/vw3zxIBTmuOw0zd63huxBQ==
X-Google-Smtp-Source: AGHT+IH4cg6wWyl23jyswquCXROqmqiFTtHeAnCuqWAXJ5nyGZhx7Jin+V/SbzHLIknUTdUjGeImvA==
X-Received: by 2002:a05:6512:3109:b0:50b:f113:2cf8 with SMTP id
 n9-20020a056512310900b0050bf1132cf8mr116309lfb.118.1701563528124; 
 Sat, 02 Dec 2023 16:32:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFT PATCH v2 4/4] drm/msm/dpu: enable writeback on SM6350
Date: Sun,  3 Dec 2023 03:32:03 +0300
Message-Id: <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 62db84bd15f2..3c179a73c030 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -146,6 +147,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 1920,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -219,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.dsc = sm6350_dsc,
 	.pingpong_count = ARRAY_SIZE(sm6350_pp),
 	.pingpong = sm6350_pp,
+	.wb_count = ARRAY_SIZE(sm6350_wb),
+	.wb = sm6350_wb,
 	.intf_count = ARRAY_SIZE(sm6350_intf),
 	.intf = sm6350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


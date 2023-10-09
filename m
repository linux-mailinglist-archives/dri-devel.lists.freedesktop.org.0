Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943117BE774
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07B310E29A;
	Mon,  9 Oct 2023 17:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E43910E294
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:11:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50308217223so5923475e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871473; x=1697476273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=odaHH8HRWc/OWn81iArLzhiK7HKZi0DYnLBmf+zh6T8=;
 b=moghkUDa/L5y+dlQbBJf+1rpto//Sh9ILLZ3kvTRoAG/Z0YcmbipejMc6YbkMTUkWo
 eR1bMmjVnVmo7pGWwqGpDXqAlp9AMBr5Q7wGOt3yDXo3FH6bnH7DWYWcRo0nxSzOQ6VI
 8/Q5UYls6b7lcPuU9Gq5OLOfHsZ26FBa3TcA0X/ykZSWUeDLx98x9OVSJFVI5h7dCcux
 olFtvvOGWtX1knqLZ4rVO0XN93T6FRelLTTR9dC18uKI+ASxiYRuFBn+n2ZlWjuJGPZQ
 /Rhw51ZGqVHW44XVskhnrh9QxdNsDX87f3JIxtVZqNhCi094S3seuQz2vo/075ZhODZ1
 khKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871473; x=1697476273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=odaHH8HRWc/OWn81iArLzhiK7HKZi0DYnLBmf+zh6T8=;
 b=jRameEzYTXqqEsyjjjfbNMNx9Yz0Y5C4SQRXIPPvsHYuiMfgOm0zBU8+ISbgk9N3Fy
 iE5AB3lxpGidDUJxImeGv+m6Cm+qRs5wsSGIKpkUxYhw0ZHIjSQGL9Z1WjyG+c61LFFX
 TqDgGWtFXVjWQPwSG2X3Tl8wzeve0NkF/vSi32Pb1MwjEEScWXJYMkw8W+w0AR/4P/y/
 +Vw6grhW4LGvsxfyEAF7TiqFZsbavv76SG4Mkq50iwRmyc4S4rQ7QJr+ReL9BhMvfP/6
 cGL3WpBX6RB4WGh8CCosyccAaFgrlsUNWma0JDacXrTFqwmACTq8O1+KxCxyOCJTSmUf
 zQpg==
X-Gm-Message-State: AOJu0YxfyqiG+B3WCuwk6vy9CRK6hctV73UlEpXhiNX3Gq7pQVDHAF2B
 CRBti14iNDX76ezHLq0mNwLu8A==
X-Google-Smtp-Source: AGHT+IGeXW8xdsBULCu4mHfATtR355O0BFzXB/YgybW5EN9w2hzH/wQNVH3mdwftqYZcXO6Ib8LHcQ==
X-Received: by 2002:a05:6512:3050:b0:503:653:5711 with SMTP id
 b16-20020a056512305000b0050306535711mr15653664lfb.9.1696871473112; 
 Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/3] drm/msm/dpu: enable writeback on SM8350
Date: Mon,  9 Oct 2023 20:11:09 +0300
Message-Id: <20231009171110.2691115-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8cfb1058e3cb..b2896018e05f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -31,6 +31,7 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -304,6 +305,21 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -401,6 +417,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8350_wb),
+	.wb = sm8350_wb,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


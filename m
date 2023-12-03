Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF4802006
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C4B10E248;
	Sun,  3 Dec 2023 00:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D28010E24A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:27:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so1820104e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563266; x=1702168066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcsWzLItkO5cQT9Vqg2MEcHTqh82Y2+iUzXQkakeWHg=;
 b=LiLFhPspz910nRDoYORTTxbVAOEduldNEO8LduCw35Ecy+TnLqAz8ohPj0RLTIOBwY
 VY+oALZikh0dUdkXvrV0KuamBXsQJSvD5XLsFIBbz1x28PK7flZuyLrGufQtR2ukULqZ
 0zVCR5+xwmwro9LbtwtI+ah0SuLEFgYjwbYHuKUc0y1anaCdO03WE/DDhmmcmeGxteEQ
 6B5eCrVpCLq0EWJ/zVNbXF/1rDIyubVuBdCBCrabfGZQTrvG96VEZL3QrD6ouzgTBb4D
 yCiIf3wyB942dnJz4lik0TBmTILjIQmWU+F2dgK41YXDFjD3oR4154kLO04eXUie27wj
 TYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563266; x=1702168066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcsWzLItkO5cQT9Vqg2MEcHTqh82Y2+iUzXQkakeWHg=;
 b=tfnYTmOMgoAd7om1y1BqyaVgM2QVKlN676q3T333e4lzyUZ/AiRXc3tHfg8Fat0OK+
 4pTuNMSQlQoSSr0M7YDFZHhrEularSgA81ScjQt8ed3Kv3kNj+4MkVX6AjONqbWySTcv
 8EwfZSwN8z5e6eJAdrjnR9dLdtyzmyAINQ483/Hw7cLU7fv+bVv0rEhbo9+MXzoEAXR4
 +CgHS31oQpG2j7wnHe6ZnPQ1A7wfZo9fe6G+n90/QC5Xtaq6K5j3/BL/6AZMShmMI34k
 lPAd1JxCwc4p9WhPxiMU2h6xyNwxyJz5jMURXlPVznlaon2sNrcMzZR29YZ3wqvMxLRu
 Y5ww==
X-Gm-Message-State: AOJu0YwtrRl57Mnoj9Eo364scitp8cDuo/TWyX41bmWSz7efJpUQ+FUE
 0+mFTzZZpxgE53KtzZS3Kv4aMw==
X-Google-Smtp-Source: AGHT+IFYl9m3752RVhCXOWzVpJdaN/NW5nt9DYjIu0aN2Y0wd3cIdElvNkNtz4a0Q60SoCknw99cCA==
X-Received: by 2002:a05:6512:488f:b0:50b:efbe:bfc4 with SMTP id
 eq15-20020a056512488f00b0050befbebfc4mr240891lfb.133.1701563266636; 
 Sat, 02 Dec 2023 16:27:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/3] drm/msm/dpu: enable writeback on SM8350
Date: Sun,  3 Dec 2023 03:27:42 +0300
Message-Id: <20231203002743.1291956-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
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
index 5aaa24281906..610984d89a9a 100644
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
@@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
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
@@ -393,6 +409,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
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


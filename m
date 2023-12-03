Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5982F80200A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386B210E24B;
	Sun,  3 Dec 2023 00:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC0210E24C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:27:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso12912e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563267; x=1702168067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heUF+a7HiOKx2XIYX+afSxGWRxKmOfUpqPHFcQ7qMuk=;
 b=g9I9+WjuQc1cEE8kP2ebCaDW3FZxj1H9dqum0EMa+V662dfLg5c2bAhMn+9TTHpjNP
 LnAybpOISQHyIQB3TmZeWDCw/t5WkifEQc2fpzM491k7KokslcRly+cdMnsA4taWcfh6
 +Crw5PoAoMXoPHgjs4IimYTd6N55eMJO56kG+AAgY5W6YEELYsZvOAsKf9ASHX4l+eaS
 OowONdxb+oy1EwGgD8x/b0QWQ3PUbvfomOaQ6okQmJ0BsRBsxpn1eiq4uqzmoka21WB0
 VCo6068HDBo4cfsJxFuC0StV1ZNXKuLpwzt4Uz5w42VhmphAwz4QgG/E/YhTU7wDD6MP
 qCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563267; x=1702168067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heUF+a7HiOKx2XIYX+afSxGWRxKmOfUpqPHFcQ7qMuk=;
 b=IWjkCuv3D1mp3vIye+KXcNnqbwzmNEd6INOAdLD5KmGtNgY+0HMqeNDqTDTSDrkFtz
 ns8Jw13U0z6iPoXmSuNh/ojHnal9j3PXm+LOs0hY5fiwNMeROw+Rc1R6FJpzSaYxMt7k
 AYcjfDYryLPnO3WSjjSoJDwpQLm7WztRUqt1Kzh9mMZNZC4xv8lO8cxpwjaZ/CIgcVpD
 xWeU9hYS3bzNJdCC892XJ2TA9MqsUFapl8EFd7o4KZG7nYTmwvt0GmdGHOHEQMnvPr1P
 HcYkT0vNrLE4IVY7/zx8U9w8StYrFYQ6TYzgIbk4WG4dEnymAtACxp5cGzgAFq7YWHvi
 pfjA==
X-Gm-Message-State: AOJu0YybnQ1rmBmCYMwg+B1c6pakKgtQBrB9rxXXX3jVAsgaxxDv8O2z
 PyMe2DmON8/GufJOlw/eYBNPoA==
X-Google-Smtp-Source: AGHT+IHi/rdRGHaEWr+BG4yKRNfKQ+Sj/CUnz2fF+hUvMf0vGSjuTU9KsGIzTFv+bZdWpU8b96CLWw==
X-Received: by 2002:ac2:529c:0:b0:50b:d582:52f3 with SMTP id
 q28-20020ac2529c000000b0050bd58252f3mr1702952lfm.20.1701563267459; 
 Sat, 02 Dec 2023 16:27:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/3] drm/msm/dpu: enable writeback on SM8450
Date: Sun,  3 Dec 2023 03:27:43 +0300
Message-Id: <20231203002743.1291956-4-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d18145c226da..413c0b1f4ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -316,6 +317,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
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
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


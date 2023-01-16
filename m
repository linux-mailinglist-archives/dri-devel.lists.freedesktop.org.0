Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D562766B781
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 07:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023D10E1D6;
	Mon, 16 Jan 2023 06:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734C010E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 06:33:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d30so36413652lfv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 22:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVKjiJvmV+NOcerZIE1W27VmJhIU+stEQA9DXvjanHI=;
 b=Pgw8YE6uR1rGfRslMLNQlmh8YGA3NN61Y+MVmiodt/VF54IbfnQDjSPxShXFVpCt/G
 q5ePtlLzwl3j/8nuJw75GpGz7RyuqJyMXZqq7jpQAHetoHMo/IRUh3/esiPmcHHnKSwA
 oE6hWrap5jmFBqi4BSP06w/MyUli6w8wSBoYm/aN+lp+6Io99B8u/1siBcJU3SvBIOoo
 BF2afIVNFrkd7JW7jAN0Xzc2OxHYWaR4f+VJbiJck319gV79fpft9oO0qCP7cYiWDQ4j
 vjnX9BDEPxg5F6xNTKU9Am+s0iL7Kpoz9ZCuecWzLzcWLjct4705tQPG7REOE7RYn6qb
 ZEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVKjiJvmV+NOcerZIE1W27VmJhIU+stEQA9DXvjanHI=;
 b=DOzt+RVWuL15xCVhMbv6LV8KsLk2Z8gev4/YuZsGkJJXu7HtcK/MjyXnBFZtB5p3eA
 U6lngm+9m37L4LQ+73PV93WhkNthOuq5f0RHu6GCkwQyUUD8Smnod85gMo2mxp0sZ8sG
 O+UlaQA72l20fJGGfufplMc0rc8CgDbC8jntEUtnwRcBVthjIH4hW7LY6kdvQ/Hw8s1W
 qoAjlVhzQoZxML2ujDTDJvCycOMGmTSn+a/VkMWgJx5SAL4OcRIRHQMSl8am6GngsdxP
 g1l9jVahJcQ9/3TYtyIFDMzOijJIhsv30ygoQypDPEtFXfm3P+z7ZWugfHktNyfyFEEm
 6WNA==
X-Gm-Message-State: AFqh2kp0CoTxO07fo3eQSCDQamgrQ1xIRGUol81BRU1/WQOEKPBa8bRN
 Asoy8oNgKC75W4VD5GhUTbtHwMfs9YVPEp9sOOQqnQ==
X-Google-Smtp-Source: AMrXdXt5iPjokhTqcorFeBNh8fS1o/wfAfdO+thHEQsu5ZfvA//79BI3yZYzPySimcBI103JjS0CjA==
X-Received: by 2002:a19:f614:0:b0:4cc:9de0:c251 with SMTP id
 x20-20020a19f614000000b004cc9de0c251mr4879273lfe.40.1673850798829; 
 Sun, 15 Jan 2023 22:33:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512348200b004b572ad14b2sm4912304lfr.251.2023.01.15.22.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 22:33:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dpu: simplify ctl_setup_blendstage calculation
Date: Mon, 16 Jan 2023 08:33:15 +0200
Message-Id: <20230116063316.728496-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
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

Extract the common expression in the dpu_hw_ctl_setup_blendstage()
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f4fdf537616c..4d70dcd46c9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -383,7 +383,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
+	u32 mix, ext, mix_ext;
+	u32 mixercfg = 0, mixercfg_ext = 0;
 	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
 	u32 mixercfg_ext4 = 0;
 	int i, j;
@@ -409,6 +410,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 		/* overflow to ext register if 'i + 1 > 7' */
 		mix = (i + 1) & 0x7;
 		ext = i >= 7;
+		mix_ext = (i + 1) & 0xf;
 
 		for (j = 0 ; j < pipes_per_stage; j++) {
 			enum dpu_sspp_multirect_index rect_index =
@@ -417,7 +419,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 			switch (stage_cfg->stage[i][j]) {
 			case SSPP_VIG0:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= ((i + 1) & 0xF) << 0;
+					mixercfg_ext3 |= mix_ext << 0;
 				} else {
 					mixercfg |= mix << 0;
 					mixercfg_ext |= ext << 0;
@@ -425,7 +427,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_VIG1:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= ((i + 1) & 0xF) << 4;
+					mixercfg_ext3 |= mix_ext << 4;
 				} else {
 					mixercfg |= mix << 3;
 					mixercfg_ext |= ext << 2;
@@ -433,7 +435,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_VIG2:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= ((i + 1) & 0xF) << 8;
+					mixercfg_ext3 |= mix_ext << 8;
 				} else {
 					mixercfg |= mix << 6;
 					mixercfg_ext |= ext << 4;
@@ -441,7 +443,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_VIG3:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext3 |= ((i + 1) & 0xF) << 12;
+					mixercfg_ext3 |= mix_ext << 12;
 				} else {
 					mixercfg |= mix << 26;
 					mixercfg_ext |= ext << 6;
@@ -465,7 +467,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_DMA0:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= ((i + 1) & 0xF) << 8;
+					mixercfg_ext2 |= mix_ext << 8;
 				} else {
 					mixercfg |= mix << 18;
 					mixercfg_ext |= ext << 16;
@@ -473,7 +475,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_DMA1:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= ((i + 1) & 0xF) << 12;
+					mixercfg_ext2 |= mix_ext << 12;
 				} else {
 					mixercfg |= mix << 21;
 					mixercfg_ext |= ext << 18;
@@ -481,39 +483,37 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 				break;
 			case SSPP_DMA2:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= ((i + 1) & 0xF) << 16;
+					mixercfg_ext2 |= mix_ext << 16;
 				} else {
-					mix |= (i + 1) & 0xF;
-					mixercfg_ext2 |= mix << 0;
+					mixercfg_ext2 |= mix_ext << 0;
 				}
 				break;
 			case SSPP_DMA3:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext2 |= ((i + 1) & 0xF) << 20;
+					mixercfg_ext2 |= mix_ext << 20;
 				} else {
-					mix |= (i + 1) & 0xF;
-					mixercfg_ext2 |= mix << 4;
+					mixercfg_ext2 |= mix_ext << 4;
 				}
 				break;
 			case SSPP_DMA4:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
+					mixercfg_ext4 |= mix_ext << 8;
 				} else {
-					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
+					mixercfg_ext4 |= mix_ext << 0;
 				}
 				break;
 			case SSPP_DMA5:
 				if (rect_index == DPU_SSPP_RECT_1) {
-					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
+					mixercfg_ext4 |= mix_ext << 12;
 				} else {
-					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
+					mixercfg_ext4 |= mix_ext << 4;
 				}
 				break;
 			case SSPP_CURSOR0:
-				mixercfg_ext |= ((i + 1) & 0xF) << 20;
+				mixercfg_ext |= mix_ext << 20;
 				break;
 			case SSPP_CURSOR1:
-				mixercfg_ext |= ((i + 1) & 0xF) << 26;
+				mixercfg_ext |= mix_ext << 26;
 				break;
 			default:
 				break;
-- 
2.39.0


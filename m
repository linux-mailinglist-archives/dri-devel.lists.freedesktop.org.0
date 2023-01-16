Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64F66B77F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 07:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CF410E1CC;
	Mon, 16 Jan 2023 06:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A5D10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 06:33:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp15so41308202lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qnc3VjmJt0l7uQ9FOV895mn3eK0O49EcwHK3zAPxAr8=;
 b=dGn2vcisff3ilMyiCeXZLDbmeNPTLVX0iS7dmmUZxNOwziDeA2nRxN1GdW70i56/Kq
 LK7LPCjoPT1+/vLEL/u2hDuanbgjvhVAZ88Bg2q5e1Ytz7FeA3zzTamoSfkb58SZ+ZIt
 58ODEGv6NPXrnnxjpj0upyIYew9K1RFNGiQqqXy3dP+EhrpfpS7OTE7FDqopo8NNpgUM
 4uVABampG8wn5YQVHUaLaS8TLF0LPKaFLQtzzSmiTAjxZ9LOrSw1UkhUXCg6bUUrvho5
 3UInh6A8RcbjUx8KdnJFUu+dRfHWvUl3sMXvmv/ilSz8Oi2M3UsPJnj0WFa7b1vl09MC
 t4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnc3VjmJt0l7uQ9FOV895mn3eK0O49EcwHK3zAPxAr8=;
 b=BNw8WUw8KIBqAWd04RwsIOl3V4fi4q9BlAr+moXAR4xrCAKUOelkFkNXRunLvn/qli
 55U6mcEXEFKRUHrj0MKIPoNbt/e0uddR7u9awXXdMbgibWMRW4zspsH2bQvizS30tLs9
 YYTsX7w54M5n1kxOkxcCSMKe9TIO+WNMzpHGJxzgYvep3gV2UreLW/uIkdk7aYUGTQI3
 +14pSoOSd60mIHjbb+4XYCtoglC2r6miYQrt7nkJjn7ChugIxAB1O2+ebE7X7opyyKlC
 hlHSjtxMHArtg+k2VWkGIRTw5/RvjN9HkBWTVClNRC5n7gmbw0yznRP/+FFSsrhSX0ZK
 8NlA==
X-Gm-Message-State: AFqh2koAwEop7lguSnfqW1LLFkQVg12ULSO3jQp7OVh/6m0TOcKmzk2m
 Obp9I84sM/q7HKkME0XsziMsVg==
X-Google-Smtp-Source: AMrXdXtCxGKbGTQQf9OHoTemFIhDvqqAlBNy2pzYBJVciLCpjCjY6JRzwZTEO9GWA6IuPyQOj+LCzA==
X-Received: by 2002:ac2:5976:0:b0:4cc:84da:44bd with SMTP id
 h22-20020ac25976000000b004cc84da44bdmr7507689lfp.39.1673850798108; 
 Sun, 15 Jan 2023 22:33:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512348200b004b572ad14b2sm4912304lfr.251.2023.01.15.22.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 22:33:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
Date: Mon, 16 Jan 2023 08:33:14 +0200
Message-Id: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8550 uses new register to map SSPP_DMA4 and SSPP_DMA5 units to blend
stages. Add proper support for this register to allow using these two
planes for image processing.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 +++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 835d6d2c4115..504a22c76412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -67,6 +67,9 @@
 #define CTL_SC7280_MASK \
 	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
 
+#define CTL_SM8550_MASK \
+	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
+
 #define MERGE_3D_SM8150_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
@@ -999,37 +1002,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x290,
-	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x290,
-	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x19000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a1f18d53db6d..d152fef438f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -199,6 +199,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_MAX
  */
 enum {
@@ -206,6 +207,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index a35ecb6676c8..f4fdf537616c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -17,6 +17,8 @@
 	(0x70 + (((lm) - LM_0) * 0x004))
 #define   CTL_LAYER_EXT3(lm)             \
 	(0xA0 + (((lm) - LM_0) * 0x004))
+#define CTL_LAYER_EXT4(lm)             \
+        (0xB8 + (((lm) - LM_0) * 0x004))
 #define   CTL_TOP                       0x014
 #define   CTL_FLUSH                     0x018
 #define   CTL_START                     0x01C
@@ -383,6 +385,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
 	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
+	u32 mixercfg_ext4 = 0;
 	int i, j;
 	int stages;
 	int pipes_per_stage;
@@ -492,6 +495,20 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 					mixercfg_ext2 |= mix << 4;
 				}
 				break;
+			case SSPP_DMA4:
+				if (rect_index == DPU_SSPP_RECT_1) {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
+				} else {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
+				}
+				break;
+			case SSPP_DMA5:
+				if (rect_index == DPU_SSPP_RECT_1) {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
+				} else {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
+				}
+				break;
 			case SSPP_CURSOR0:
 				mixercfg_ext |= ((i + 1) & 0xF) << 20;
 				break;
@@ -509,6 +526,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
+	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
 }
 
 
-- 
2.39.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C465E3C9913
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DB36E56D;
	Thu, 15 Jul 2021 06:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146E06E53E;
 Thu, 15 Jul 2021 06:52:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 839CB61380;
 Thu, 15 Jul 2021 06:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626331970;
 bh=bCxEk+MSo9wujPwvoctDXKBvPOMJR+fDgZGHLTgZliA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JAR8u0I6PYix53OhysU4g/dwkST+Tq4JYtiutIRlgVc4ilqNolMW3X+dr2gIExya5
 shb4eAQr29HREq+qj+UuvlYY99eih965xB1V0MXHJ/OYoLCS5mmjNPqhhan7roqHZs
 ytNvI9mH0LO/tFAJNsMjHlOcIho7HL6/cBUd9wnwXfFJMoQYwh5Mkjf6hVMXhH6kKI
 pTvQ3LVtlDcFBGqV5UCOTvyut43PfjqY728U/yfFRrnqbMED0hUEVOZWoRtaPmzI/p
 neiGEfK/Ng3h2vn/N6Vlr8TC+uJpa990jySKzXOy6Trqm8hL8+3Fpo0Up6xBiia6Cq
 uxTI2BBbCnlEA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 05/11] drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
Date: Thu, 15 Jul 2021 12:21:57 +0530
Message-Id: <20210715065203.709914-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add SDM845 DSC blocks into hw_catalog

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since RFC:
 - use BIT values from MASK

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b569030a0847..b45a08303c99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -40,6 +40,8 @@
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
+#define DSC_SDM845_MASK BIT(1)
+
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
@@ -751,6 +753,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
 };
+
+/*************************************************************
+ * DSC sub blocks config
+ *************************************************************/
+#define DSC_BLK(_name, _id, _base) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0x140, \
+	.features = DSC_SDM845_MASK, \
+	}
+
+static struct dpu_dsc_cfg sdm845_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000),
+	DSC_BLK("dsc_1", DSC_1, 0x80400),
+	DSC_BLK("dsc_2", DSC_2, 0x80800),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -1053,6 +1073,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mixer = sdm845_lm,
 		.pingpong_count = ARRAY_SIZE(sdm845_pp),
 		.pingpong = sdm845_pp,
+		.dsc_count = ARRAY_SIZE(sdm845_dsc),
+		.dsc = sdm845_dsc,
 		.intf_count = ARRAY_SIZE(sdm845_intf),
 		.intf = sdm845_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.31.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F36EFD3C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB46110E51E;
	Wed, 26 Apr 2023 22:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2461410E0E1;
 Wed, 26 Apr 2023 22:37:22 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DA6ED201EE;
 Thu, 27 Apr 2023 00:37:17 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Apr 2023 00:37:16 +0200
Subject: [PATCH v4 02/22] drm/msm/dpu: Remove TE2 block and feature from
 DPU >= 5.0.0 hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No hardware beyond kona (sm8250, DPU 6.0.0) defines the TE2 PINGPONG
sub-block offset downstream, and according to insiders no DPU >= 5.0.0
hardware has support for it either.  Especially since neither downstream
nor upstream utilize these registers in any way, remove the erroneous
specification from SM8150, SC8180X, SM8250, SC7180, SM8350, SC8280XP and
SM8450 to prevent confusion.

Note that downstream enables the PPSPLIT (split-FIFO) topology (single
LM for 2 PP and 2 INTF) based on the presence of a TE2 block.

Fixes: 386fced3f76f ("drm/msm/dpu: add SM8150 to hw catalog")
Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  4 ++--
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  4 ++--
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 +++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 282d410269ff6..42b0e58624d00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -128,10 +128,10 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f288..e3bdfe7b30f1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -116,10 +116,10 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 };
 
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2c40229ea5159..ed130582873c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -129,10 +129,10 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8250_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8799ed7571190..a46b11730a4d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -80,8 +80,8 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk, -1, -1),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ca107ca8de462..41ef0c8fc993f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -127,10 +127,10 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44d..f3d935f346b20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -121,18 +121,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
-	PP_BLK_TE("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
-	PP_BLK_TE("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
-	PP_BLK_TE("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
-	PP_BLK_TE("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk_te,
-		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b4268..e409c119b0a2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -128,10 +128,10 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 };
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,

-- 
2.40.1


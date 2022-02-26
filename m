Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23994C57DE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 20:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC3210E329;
	Sat, 26 Feb 2022 19:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BC310E32A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 19:46:49 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 648BE3F40D;
 Sat, 26 Feb 2022 20:46:46 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Use indexed array initializer to prevent
 mismatches
Date: Sat, 26 Feb 2022 20:46:32 +0100
Message-Id: <20220226194633.204501-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While there's a comment pointing from dpu_intr_set to dpu_hw_intr_reg
and vice-versa, an array initializer using indices makes it so that the
indices between the enum and array cannot possibly get out of sync even
if they're accidentially ordered wrongly.  It is still useful to keep
the comment to be made aware where the register offset mapping resides
while looking at dpu_hw_intr_reg.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index c515b7cf922c..c61b5b283f08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -54,87 +54,87 @@ struct dpu_intr_reg {
  * When making changes be sure to sync with dpu_hw_intr_reg
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
-	{
+	[MDP_SSPP_TOP0_INTR] = {
 		MDP_SSPP_TOP0_OFF+INTR_CLEAR,
 		MDP_SSPP_TOP0_OFF+INTR_EN,
 		MDP_SSPP_TOP0_OFF+INTR_STATUS
 	},
-	{
+	[MDP_SSPP_TOP0_INTR2] = {
 		MDP_SSPP_TOP0_OFF+INTR2_CLEAR,
 		MDP_SSPP_TOP0_OFF+INTR2_EN,
 		MDP_SSPP_TOP0_OFF+INTR2_STATUS
 	},
-	{
+	[MDP_SSPP_TOP0_HIST_INTR] = {
 		MDP_SSPP_TOP0_OFF+HIST_INTR_CLEAR,
 		MDP_SSPP_TOP0_OFF+HIST_INTR_EN,
 		MDP_SSPP_TOP0_OFF+HIST_INTR_STATUS
 	},
-	{
+	[MDP_INTF0_INTR] = {
 		MDP_INTF_0_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_0_OFF+INTF_INTR_EN,
 		MDP_INTF_0_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF1_INTR] = {
 		MDP_INTF_1_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_1_OFF+INTF_INTR_EN,
 		MDP_INTF_1_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF2_INTR] = {
 		MDP_INTF_2_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_2_OFF+INTF_INTR_EN,
 		MDP_INTF_2_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF3_INTR] = {
 		MDP_INTF_3_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_3_OFF+INTF_INTR_EN,
 		MDP_INTF_3_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF4_INTR] = {
 		MDP_INTF_4_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF5_INTR] = {
 		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
 		MDP_INTF_5_OFF+INTF_INTR_EN,
 		MDP_INTF_5_OFF+INTF_INTR_STATUS
 	},
-	{
+	[MDP_AD4_0_INTR] = {
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_STATUS_OFF,
 	},
-	{
+	[MDP_AD4_1_INTR] = {
 		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
 		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
 	},
-	{
+	[MDP_INTF0_7xxx_INTR] = {
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF1_7xxx_INTR] = {
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF2_7xxx_INTR] = {
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF3_7xxx_INTR] = {
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF4_7xxx_INTR] = {
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
 	},
-	{
+	[MDP_INTF5_7xxx_INTR] = {
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
 		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS

base-commit: 06aeb1495c39c86ccfaf1adadc1d2200179f16eb
-- 
2.35.1


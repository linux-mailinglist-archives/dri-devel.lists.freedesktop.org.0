Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B6354CDC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2016E7D9;
	Tue,  6 Apr 2021 06:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852F89F71;
 Tue,  6 Apr 2021 06:02:04 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:04 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 23:02:02 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:40 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id A9E2C21B31; Tue,  6 Apr 2021 11:31:39 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm/msm/disp/dpu1: increase the range of interrupts in
 dpu_irq_map
Date: Tue,  6 Apr 2021 11:31:33 +0530
Message-Id: <1617688895-26275-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
References: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, each register in the dpu interrupt set is allowed
to have a maximum of 32 interrupts. With the introduction
of INTF_5_VSYNC and INTF_5_UNDERRUN irqs for EDP panel,
the total number of interrupts under INTR_STATUS register
in dpu_irq_map will exceed 32. Increase the range of each
interrupt register to 64 to handle this.

This patch has dependency on the below series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=461193

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 755 +++++++++++++++++++---
 1 file changed, 661 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5c521de..72cdaf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -308,24 +308,56 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
-
-	/* BEGIN MAP_RANGE: 32-64, INTR2 */
-	/* irq_idx: 32-35 */
+	/* irq_idx:32-63 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
+	/* BEGIN MAP_RANGE: 64-95, INTR2 */
+	/* irq_idx: 64-67 */
 	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 36-39 */
+	/* irq_idx: 68-71 */
 	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_WR_PTR, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 40 */
+	/* irq_idx: 72 */
 	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_RD_PTR, 1},
-	/* irq_idx: 41-45 */
+	/* irq_idx: 73-77 */
 	{ DPU_IRQ_TYPE_CTL_START, CTL_0,
 		DPU_INTR_CTL_0_START, 1},
 	{ DPU_IRQ_TYPE_CTL_START, CTL_1,
@@ -336,10 +368,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_CTL_3_START, 1},
 	{ DPU_IRQ_TYPE_CTL_START, CTL_4,
 		DPU_INTR_CTL_4_START, 1},
-	/* irq_idx: 46-47 */
+	/* irq_idx: 78-79 */
 	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_2, DPU_INTR_CWB_2_OVERFLOW, 1},
 	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_3, DPU_INTR_CWB_3_OVERFLOW, 1},
-	/* irq_idx: 48-51 */
+	/* irq_idx: 80-83 */
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_0,
 		DPU_INTR_PING_PONG_0_TEAR_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_1,
@@ -348,13 +380,13 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_PING_PONG_2_TEAR_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_TEAR_DETECTED, 1},
-	/* irq_idx: 52-55 */
+	/* irq_idx: 84-87 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TEAR_DETECTED, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 56-59 */
+	/* irq_idx: 88-91 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_0,
 		DPU_INTR_PING_PONG_0_TE_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_1,
@@ -363,65 +395,129 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_PING_PONG_2_TE_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_TE_DETECTED, 1},
-	/* irq_idx: 60-63 */
+	/* irq_idx: 92-95 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TE_DETECTED, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-
-	/* BEGIN MAP_RANGE: 64-95 HIST */
-	/* irq_idx: 64-67 */
+	/* irq_idx: 96-127 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	/* BEGIN MAP_RANGE: 128-159 HIST */
+	/* irq_idx: 128-131 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG0, DPU_INTR_HIST_VIG_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG0,
 		DPU_INTR_HIST_VIG_0_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 68-71 */
+	/* irq_idx: 132-135 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG1, DPU_INTR_HIST_VIG_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG1,
 		DPU_INTR_HIST_VIG_1_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 72-75 */
+	/* irq_idx: 136-139 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG2, DPU_INTR_HIST_VIG_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG2,
 		DPU_INTR_HIST_VIG_2_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG3, DPU_INTR_HIST_VIG_3_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG3,
 		DPU_INTR_HIST_VIG_3_RSTSEQ_DONE, 2},
-	/* irq_idx: 76-79 */
+	/* irq_idx: 140-143 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_0, DPU_INTR_HIST_DSPP_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_0,
 		DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 80-83 */
+	/* irq_idx: 144-147 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_1, DPU_INTR_HIST_DSPP_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_1,
 		DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 84-87 */
+	/* irq_idx: 148-151 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_2, DPU_INTR_HIST_DSPP_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_2,
 		DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_3, DPU_INTR_HIST_DSPP_3_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_3,
 		DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE, 2},
-	/* irq_idx: 88-91 */
+	/* irq_idx: 152-155 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 92-95 */
+	/* irq_idx: 156-159 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-
-	/* BEGIN MAP_RANGE: 96-127 INTF_0_INTR */
-	/* irq_idx: 96-99 */
+	/* irq_idx: 160-191 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
+	/* BEGIN MAP_RANGE: 192-255 INTF_0_INTR */
+	/* irq_idx: 192-195 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
 		DPU_INTR_VIDEO_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
@@ -430,7 +526,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 3},
-	/* irq_idx: 100-103 */
+	/* irq_idx: 196-199 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
@@ -439,39 +535,71 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 3},
-	/* irq_idx: 104-107 */
+	/* irq_idx: 200-203 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 108-111 */
+	/* irq_idx: 204-207 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 112-115 */
+	/* irq_idx: 208-211 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 116-119 */
+	/* irq_idx: 212-215 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 120-123 */
+	/* irq_idx: 216-219 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 124-127 */
+	/* irq_idx: 220-223 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-
-	/* BEGIN MAP_RANGE: 128-159 INTF_1_INTR */
-	/* irq_idx: 128-131 */
+	/* irq_idx: 224-255 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
+	/* BEGIN MAP_RANGE: 256-319 INTF_1_INTR */
+	/* irq_idx: 256-259 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
 		DPU_INTR_VIDEO_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
@@ -480,7 +608,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 4},
-	/* irq_idx: 132-135 */
+	/* irq_idx: 260-263 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
@@ -489,39 +617,71 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 4},
-	/* irq_idx: 136-139 */
+	/* irq_idx: 264-267 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 140-143 */
+	/* irq_idx: 268-271 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 144-147 */
+	/* irq_idx: 272-275 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 148-151 */
+	/* irq_idx: 276-279 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 152-155 */
+	/* irq_idx: 280-283 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 156-159 */
+	/* irq_idx: 284-287 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-
-	/* BEGIN MAP_RANGE: 160-191 INTF_2_INTR */
-	/* irq_idx: 160-163 */
+	/* irq_idx: 288-319 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
+	/* BEGIN MAP_RANGE: 320-383 INTF_2_INTR */
+	/* irq_idx: 320-323 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_2,
 		DPU_INTR_VIDEO_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_2,
@@ -530,7 +690,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_2,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 5},
-	/* irq_idx: 164-167 */
+	/* irq_idx: 324-327 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_2,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_2,
@@ -539,39 +699,71 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_2,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 5},
-	/* irq_idx: 168-171 */
+	/* irq_idx: 328-331 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_2, DPU_INTR_PROG_LINE, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 172-175 */
+	/* irq_idx: 332-335 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 176-179 */
+	/* irq_idx: 336-339 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 180-183 */
+	/* irq_idx: 340-343 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 184-187 */
+	/* irq_idx: 344-347 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 188-191 */
+	/* irq_idx: 348-351 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-
-	/* BEGIN MAP_RANGE: 192-223 INTF_3_INTR */
-	/* irq_idx: 192-195 */
+	/* irq_idx: 352-383 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
+	/* BEGIN MAP_RANGE: 384-447 INTF_3_INTR */
+	/* irq_idx: 384-387 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_3,
 		DPU_INTR_VIDEO_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_3,
@@ -580,7 +772,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_3,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 6},
-	/* irq_idx: 196-199 */
+	/* irq_idx: 388-391 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_3,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_3,
@@ -589,39 +781,71 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_3,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 6},
-	/* irq_idx: 200-203 */
+	/* irq_idx: 392-395 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_3, DPU_INTR_PROG_LINE, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 204-207 */
+	/* irq_idx: 396-399 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 208-211 */
+	/* irq_idx: 400-403 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 212-215 */
+	/* irq_idx: 404-407 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 216-219 */
+	/* irq_idx: 408-411 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 220-223 */
+	/* irq_idx: 412-415 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-
-	/* BEGIN MAP_RANGE: 224-255 INTF_4_INTR */
-	/* irq_idx: 224-227 */
+	/* irq_idx: 416-447*/
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
+	/* BEGIN MAP_RANGE: 448-511 INTF_4_INTR */
+	/* irq_idx: 448-451 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_4,
 		DPU_INTR_VIDEO_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_4,
@@ -630,7 +854,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_4,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 7},
-	/* irq_idx: 228-231 */
+	/* irq_idx: 452-455 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_4,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_4,
@@ -639,120 +863,463 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_4,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 7},
-	/* irq_idx: 232-235 */
+	/* irq_idx: 456-459 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_4, DPU_INTR_PROG_LINE, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 236-239 */
+	/* irq_idx: 460-463 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 240-243 */
+	/* irq_idx: 464-467 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 244-247 */
+	/* irq_idx: 468-471 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 248-251 */
+	/* irq_idx: 472-475 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 252-255 */
+	/* irq_idx: 476-479 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-
-	/* BEGIN MAP_RANGE: 256-287 AD4_0_INTR */
-	/* irq_idx: 256-259 */
+	/* irq_idx: 480-511 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
+	/* BEGIN MAP_RANGE: 512-575 AD4_0_INTR */
+	/* irq_idx: 512-515 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_0, DPU_INTR_BACKLIGHT_UPDATED, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 260-263 */
+	/* irq_idx: 516-519 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 264-267 */
+	/* irq_idx: 520-523 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 268-271 */
+	/* irq_idx: 524-527 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 272-275 */
+	/* irq_idx: 528-531 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 276-279 */
+	/* irq_idx: 532-535 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 280-283 */
+	/* irq_idx: 536-539 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 284-287 */
+	/* irq_idx: 540-543 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-
-	/* BEGIN MAP_RANGE: 288-319 AD4_1_INTR */
-	/* irq_idx: 288-291 */
+	/* irq_idx: 544-575*/
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
+	/* BEGIN MAP_RANGE: 576-639 AD4_1_INTR */
+	/* irq_idx: 576-579 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_1, DPU_INTR_BACKLIGHT_UPDATED, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 292-295 */
+	/* irq_idx: 580-583 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 584-587 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 296-299 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 588-591 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 300-303 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 592-595 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 304-307 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 596-599 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 308-311 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 600-603 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 312-315 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 604-607 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 315-319 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* irq_idx: 608-639 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
+	/* BEGIN MAP_RANGE: 640-703 INTF_0_SC7280_INTR */
+	/* irq_idx: 640-643 */
+	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
+		DPU_INTR_VIDEO_INTO_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
+		DPU_INTR_VIDEO_OUTOF_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_0,
+		DPU_INTR_DSICMD_0_INTO_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
+		DPU_INTR_DSICMD_0_OUTOF_STATIC, 10},
+	/* irq_idx: 644-647 */
+	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
+		DPU_INTR_DSICMD_1_INTO_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
+		DPU_INTR_DSICMD_1_OUTOF_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_0,
+		DPU_INTR_DSICMD_2_INTO_STATIC, 10},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
+		DPU_INTR_DSICMD_2_OUTOF_STATIC, 10},
+	/* irq_idx: 648-651 */
+	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 652-655 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 656-659 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 660-663 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 664-667 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 668-671 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* irq_idx: 672-703 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
+	/* BEGIN MAP_RANGE: 704-767 INTF_1_SC7280_INTR */
+	/* irq_idx: 704-707 */
+	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
+		DPU_INTR_VIDEO_INTO_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
+		DPU_INTR_VIDEO_OUTOF_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_1,
+		DPU_INTR_DSICMD_0_INTO_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
+		DPU_INTR_DSICMD_0_OUTOF_STATIC, 11},
+	/* irq_idx: 708-711 */
+	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
+		DPU_INTR_DSICMD_1_INTO_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
+		DPU_INTR_DSICMD_1_OUTOF_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_1,
+		DPU_INTR_DSICMD_2_INTO_STATIC, 11},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
+		DPU_INTR_DSICMD_2_OUTOF_STATIC, 11},
+	/* irq_idx: 712-715 */
+	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 716-719 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 720-723 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 724-727 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 728-731 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 732-735 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* irq_idx: 736-767 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
+	/* BEGIN MAP_RANGE: 768-831 INTF_5_SC7280_INTR */
+	/* irq_idx: 768-771 */
+	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_5,
+		DPU_INTR_VIDEO_INTO_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_5,
+		DPU_INTR_VIDEO_OUTOF_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_IN, INTF_5,
+		DPU_INTR_DSICMD_0_INTO_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_5,
+		DPU_INTR_DSICMD_0_OUTOF_STATIC, 12},
+	/* irq_idx: 772-775 */
+	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_5,
+		DPU_INTR_DSICMD_1_INTO_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_5,
+		DPU_INTR_DSICMD_1_OUTOF_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_IN, INTF_5,
+		DPU_INTR_DSICMD_2_INTO_STATIC, 12},
+	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_5,
+		DPU_INTR_DSICMD_2_OUTOF_STATIC, 12},
+	/* irq_idx: 776-779 */
+	{ DPU_IRQ_TYPE_PROG_LINE, INTF_5, DPU_INTR_PROG_LINE, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 780-783 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 784-787 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 788-791 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 792-795 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 796-799 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	/* irq_idx: 800-831 */
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
+	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
 };
 
 static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
@@ -795,11 +1362,11 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		irq_status = intr->save_irq_status[reg_idx];
 
 		/*
-		 * Each Interrupt register has a range of 32 indexes, and
+		 * Each Interrupt register has a range of 64 indexes, and
 		 * that is static for dpu_irq_map.
 		 */
-		start_idx = reg_idx * 32;
-		end_idx = start_idx + 32;
+		start_idx = reg_idx * 64;
+		end_idx = start_idx + 64;
 
 		if (!test_bit(reg_idx, &intr->irq_mask) ||
 			start_idx >= ARRAY_SIZE(dpu_irq_map))
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

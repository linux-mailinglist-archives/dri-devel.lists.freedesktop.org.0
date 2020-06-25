Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3720AD54
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1AA6E44B;
	Fri, 26 Jun 2020 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4696EBCB;
 Thu, 25 Jun 2020 12:46:23 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Jun 2020 05:46:23 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Jun 2020 05:46:21 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 25 Jun 2020 18:15:55 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id EE3B23A43; Thu, 25 Jun 2020 18:15:54 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/dpu: enumerate second cursor pipe for external interface
Date: Thu, 25 Jun 2020 18:15:53 +0530
Message-Id: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: mkrishn@codeaurora.org, travitej@codeaurora.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org,
 swboyd@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup an RGB HW pipe as cursor which can be used on
secondary interface.

For SC7180 2 HW pipes are enumerated as cursors
1 - primary interface
2 - secondary interface

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8f2357d..23061fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -117,10 +117,10 @@
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
-		.reg_off = 0x2BC, .bit_off = 8},
+		.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
 
@@ -272,10 +272,10 @@
 		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
 /*************************************************************
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

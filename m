Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101B452A90
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 07:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDA56ED64;
	Tue, 16 Nov 2021 06:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AF26ED9D;
 Tue, 16 Nov 2021 06:23:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 757936115B;
 Tue, 16 Nov 2021 06:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637043838;
 bh=fElGn9Ik84lBDayR/MYhHLK/K1CaX6s6acUo7on5lyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cFIOEsciCj+AUKKqzriLHLyGfIPSxeL/7QNt3hsTKwo436Ph1+7GPW6PV01mNwq4+
 mXwZypyzDDl46bi5FMoghMWaVOwmH5Sf2+oWJ1UXCAk05dinaT5xxUHJpVfnHqJPyW
 DuCbaBudv4Tm1u1W+41chBifIyPxw+KAzhdKmvR1AXNf51flw1Ld4VaQFXslsjINLP
 US/o3fIvzOFo6Lb55d7d8pliXyG46H8Noc+XvVCrf/BqGY9p+U18sibWtOoBmQzyao
 p2aJ0J6ZBaExdFAQiWUk7YKrs54LR3BHwW50dHY+ZI9AJwtc0XjHQeFQlUoDBpLMQX
 5zrSc5K8sA0Mw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 09/13] drm/msm/disp/dpu1: Add support for DSC in topology
Date: Tue, 16 Nov 2021 11:52:52 +0530
Message-Id: <20211116062256.2417186-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
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

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions up to 4k. For more resolutions like 8k this won't
work.

Also, it is better to use 2 LMs and DSC instances as half width results
in lesser power consumption as compared to single LM, DSC at full width.

The panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f2ff8a504918..12f58de88ac7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -533,6 +533,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv;
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -567,8 +569,24 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
+	drm_enc = &dpu_enc->base;
+	priv = drm_enc->dev->dev_private;
+	if (priv && priv->dsc) {
+		/* In case of Display Stream Compression DSC, we would use
+		 * 2 encoders, 2 line mixers and 1 interface
+		 * this is power optimal and can drive up to (including) 4k
+		 * screens
+		 */
+		topology.num_enc = 2;
+		topology.num_dsc = 2;
+		topology.num_intf = 1;
+		topology.num_lm = 2;
+		priv->dsc->dsc_mask = BIT(0) | BIT(1);
+	}
+
 	return topology;
 }
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c4a588ad226e..d6b25d77700e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -103,12 +103,14 @@ enum msm_event_wait {
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
 	u32 num_enc;
 	u32 num_intf;
 	u32 num_dspp;
+	u32 num_dsc;
 };
 
 /**
-- 
2.31.1


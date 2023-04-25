Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33A6EEAB4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 01:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109810E851;
	Tue, 25 Apr 2023 23:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64210E83C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:06:16 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EE0121F88B;
 Wed, 26 Apr 2023 01:06:14 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 26 Apr 2023 01:06:08 +0200
Subject: [PATCH v3 17/21] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v3-17-693b17fe6500@somainline.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
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

All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
the PINGPONG block and into the INTF block.  Wire up the IRQ register
masks in the interrupt table for enabling, reading and clearing them.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 52 +++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index e116993b2f8f7..5e2d68ebb113e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -17,18 +17,26 @@
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. the MDP base
  */
-#define MDP_INTF_OFF(intf)			(0x6A000 + 0x800 * (intf))
-#define MDP_INTF_INTR_EN(intf)			(MDP_INTF_OFF(intf) + 0x1c0)
-#define MDP_INTF_INTR_STATUS(intf)		(MDP_INTF_OFF(intf) + 0x1c4)
-#define MDP_INTF_INTR_CLEAR(intf)		(MDP_INTF_OFF(intf) + 0x1c8)
-#define MDP_AD4_OFF(ad4)			(0x7C000 + 0x1000 * (ad4))
-#define MDP_AD4_INTR_EN_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x41c)
-#define MDP_AD4_INTR_CLEAR_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x424)
-#define MDP_AD4_INTR_STATUS_OFF(ad4)		(MDP_AD4_OFF(ad4) + 0x420)
-#define MDP_INTF_REV_7xxx_OFF(intf)		(0x34000 + 0x1000 * (intf))
-#define MDP_INTF_REV_7xxx_INTR_EN(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
-#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
-#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)	(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
+#define MDP_INTF_OFF(intf)				(0x6A000 + 0x800 * (intf))
+#define MDP_INTF_INTR_EN(intf)				(MDP_INTF_OFF(intf) + 0x1c0)
+#define MDP_INTF_INTR_STATUS(intf)			(MDP_INTF_OFF(intf) + 0x1c4)
+#define MDP_INTF_INTR_CLEAR(intf)			(MDP_INTF_OFF(intf) + 0x1c8)
+#define MDP_INTF_TEAR_OFF(intf)				(0x6D700 + 0x100 * (intf))
+#define MDP_INTF_INTR_TEAR_EN(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_INTR_TEAR_STATUS(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_INTR_TEAR_CLEAR(intf)			(MDP_INTF_TEAR_OFF(intf) + 0x008)
+#define MDP_AD4_OFF(ad4)				(0x7C000 + 0x1000 * (ad4))
+#define MDP_AD4_INTR_EN_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x41c)
+#define MDP_AD4_INTR_CLEAR_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x424)
+#define MDP_AD4_INTR_STATUS_OFF(ad4)			(MDP_AD4_OFF(ad4) + 0x420)
+#define MDP_INTF_REV_7xxx_OFF(intf)			(0x34000 + 0x1000 * (intf))
+#define MDP_INTF_REV_7xxx_INTR_EN(intf)			(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_7xxx_INTR_STATUS(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_7xxx_INTR_CLEAR(intf)		(MDP_INTF_REV_7xxx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_7xxx_TEAR_OFF(intf)		(0x34800 + 0x1000 * (intf))
+#define MDP_INTF_REV_7xxx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
 /**
  * struct dpu_intr_reg - array of DPU register sets
@@ -93,6 +101,16 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_INTR_EN(5),
 		MDP_INTF_INTR_STATUS(5)
 	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_INTR_TEAR_CLEAR(1),
+		MDP_INTF_INTR_TEAR_EN(1),
+		MDP_INTF_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_INTR_TEAR_CLEAR(2),
+		MDP_INTF_INTR_TEAR_EN(2),
+		MDP_INTF_INTR_TEAR_STATUS(2)
+	},
 	[MDP_AD4_0_INTR] = {
 		MDP_AD4_INTR_CLEAR_OFF(0),
 		MDP_AD4_INTR_EN_OFF(0),
@@ -113,11 +131,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_REV_7xxx_INTR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_STATUS(1)
 	},
+	[MDP_INTF1_7xxx_TEAR_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
+	},
 	[MDP_INTF2_7xxx_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_STATUS(2)
 	},
+	[MDP_INTF2_7xxx_TEAR_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
+	},
 	[MDP_INTF3_7xxx_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
 		MDP_INTF_REV_7xxx_INTR_EN(3),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 425465011c807..fda7f8c9caece 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -23,11 +23,15 @@ enum dpu_hw_intr_reg {
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
 	MDP_INTF5_INTR,
+	MDP_INTF1_TEAR_INTR,
+	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
 	MDP_INTF1_7xxx_INTR,
+	MDP_INTF1_7xxx_TEAR_INTR,
 	MDP_INTF2_7xxx_INTR,
+	MDP_INTF2_7xxx_TEAR_INTR,
 	MDP_INTF3_7xxx_INTR,
 	MDP_INTF4_7xxx_INTR,
 	MDP_INTF5_7xxx_INTR,

-- 
2.40.1


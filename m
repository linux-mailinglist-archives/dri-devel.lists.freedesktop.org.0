Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F9452A7D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 07:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD6F6E1DE;
	Tue, 16 Nov 2021 06:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887756E1DE;
 Tue, 16 Nov 2021 06:23:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9B3A61BE6;
 Tue, 16 Nov 2021 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637043808;
 bh=WDoD2IWuN+dSHlVHH7SgTftB5cke0BrFUNUt4U6trWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c8clWwin9FWPvifXqb/MWST9N8BFXjhHHSMft88a+B9DUu8m07b4r0rsGa5J+7Zp0
 MCxb/iRPaQ8zLdr12yGGQ+sWGLH6+ONRBJlmOiS/YSBoSBxPBx6VdZ3KbtpfvOxyOt
 NTJ1fH5OwXhQPEYMIi+DmqmYazCPN10penNAP7ZTVfGdMer7IALi8iogpO5aQTSvV6
 2KM0Ft+DAXsqvYAvVBoTZSl5/K+kk+jro2MgNAP55Y8+UQjROOcd+90nQ1a+7xEAtL
 pnpaARFXDg0gWL+lnhiu8QyfH18kKxoaLDiYrPT3fcqZBMMwHVrWW5m6Vdz/iRJfOc
 wl0WZCsq/kwgg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 03/13] drm/msm/disp/dpu1: Add support for DSC in pingpong
 block
Date: Tue, 16 Nov 2021 11:52:46 +0530
Message-Id: <20211116062256.2417186-4-vkoul@kernel.org>
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

In SDM845, DSC can be enabled by writing to pingpong block registers, so
add support for DSC in hw_pp

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 55766c97c4c8..47c6ab6caf95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -28,6 +28,9 @@
 #define PP_FBC_MODE                     0x034
 #define PP_FBC_BUDGET_CTL               0x038
 #define PP_FBC_LOSSY_MODE               0x03C
+#define PP_DSC_MODE                     0x0a0
+#define PP_DCE_DATA_IN_SWAP             0x0ac
+#define PP_DCE_DATA_OUT_SWAP            0x0c8
 
 #define PP_DITHER_EN			0x000
 #define PP_DITHER_BITDEPTH		0x004
@@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 	return line;
 }
 
+static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *c = &pp->hw;
+
+	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
+	return 0;
+}
+
+static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *c = &pp->hw;
+
+	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
+}
+
+static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
+{
+	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
+	int data;
+
+	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
+	data |= BIT(18); /* endian flip */
+	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
+	return 0;
+}
+
 static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 				unsigned long features)
 {
@@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
+	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
 
 	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 89d08a715c16..12758468d9ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
 	 */
 	void (*setup_dither)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_dither_cfg *cfg);
+	/**
+	 * Enable DSC
+	 */
+	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
+
+	/**
+	 * Disable DSC
+	 */
+	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
+
+	/**
+	 * Setup DSC
+	 */
+	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
 };
 
 struct dpu_hw_merge_3d;
-- 
2.31.1


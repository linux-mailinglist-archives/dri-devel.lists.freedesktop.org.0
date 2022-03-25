Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BB4E71D7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 12:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE82C10E9BC;
	Fri, 25 Mar 2022 11:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1A310E9BC;
 Fri, 25 Mar 2022 11:06:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E0766177A;
 Fri, 25 Mar 2022 11:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333AEC340F3;
 Fri, 25 Mar 2022 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648206386;
 bh=RpvkJ8U0VEvDlnAfPxDQLxtSZdt5YWgvrhTLE0lWbvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpN0hTbGElTuyapO9dEZXifSJ9NkfuXd+rJPCgTz6L+cV6nrRxLkkOE3uH+iPzLMW
 B15t+JRWlHS2Pa+EjWGhGlAI66e3Xchv7MBFJ/drEvsl2ZX+yZv6MYyrbcwAzKPnZP
 0A7B+RtJS+Z39ZjK4PmlIRQF48R16mDwuSmB6qKR2s5AqEbGMxwae4SE+EIw57Uk3l
 CgBo926uQXiqrzGLkb4O7XZWXYahKzCC2NYxEZNFf0H3aYF3/j/nacFikL7H81hqZa
 Qh2NgBPA77mtTG8hu9XJybaqcOGPUU6I9xd6Z5aObfXE+yuI3SpFtKXEIXul/d3Ha6
 8fjxgWu1JW8Yg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v5 04/13] drm/msm/disp/dpu1: Add support for DSC in pingpong
 block
Date: Fri, 25 Mar 2022 16:35:47 +0530
Message-Id: <20220325110556.275490-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325110556.275490-1-vkoul@kernel.org>
References: <20220325110556.275490-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In SDM845, DSC can be enabled by writing to pingpong block registers, so
add support for DSC in hw_pp

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
2.34.1

